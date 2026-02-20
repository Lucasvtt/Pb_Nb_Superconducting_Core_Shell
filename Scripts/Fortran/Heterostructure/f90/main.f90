program TDGL_2D ! Solve the TDGL equations in 2D for an infinite superconductior 
                ! in the presence of an applied external current
  use allocatable_arrays
  use shared_variables
  use defect_function_calculation
  use finite_difference_constants
  use initial_conditions
  use TDGL_solver
  use test_convergence
  use save_output
  use save_data_files
  implicit none

  call cpu_time(time_initial)

  ! Create convergence.dat file to store the convergence of the order parameter
  call create_data_file('convergence.dat')

  ! Create execution_time.dat file to store the time for each field value 
  call create_data_file('execution_time.dat')

  ! Create iterations.dat file to store the number of iterations for each current value
  call create_data_file('iterations.dat')

  ! Create matrix data file d4.dat
  call create_data_file('d4.dat')

  ! Create IV.dat file to store the averaged voltage
  call create_data_file('IV.dat')

  ! Read input file
  open(unit = 10, file = 'input.dat', status = 'unknown')
  ! Read input file
  open(unit = 10, file = 'input.dat', status = 'unknown')
    read(10,*) Lx, Ly             ! dimensions of the system
    read(10,*) kappa, T           ! kappa, temperature
    read(10,*) J_a_i, J_a_f, dJ_a ! initial, final and step for applied current
    read(10,*) dx, dy             ! grid
    read(10,*) gama               ! gamma constant
    read(10,*) u, sigma, dtFact   ! u, sigma, reduction factor for dtmax
    read(10,*) iVT                ! every vaule of iVT, wrtites the value of V(t) on the V_t.dat data file
    read(10,*) iTest, itMax, eps  ! every iTest tests convergence
                                  ! stops when eps is reached
    read(10,*) istart             ! istart = 0 => starts from the begining
                                  ! istart = 1 => re-starts
  close(10)
													  
  ! Calculate the number of unit cells in x and y directions 
  Nx = nint(Lx / dx) ! number of unit cells in the x direction
  Ny = nint(Ly / dy) ! number of unit cells in the y direction

  ! Allocate memory for arrays used in the computation
  allocate(psi(1:Nx+1,1:Ny+1))
  allocate(psi_old(1:Nx+1,1:Ny+1))
  allocate(delP(1:Nx+1,1:Ny+1))
  allocate(phix(1:Nx,1:Ny+1))
  allocate(phiy(1:Nx+1,1:Ny))
  allocate(thetax(1:Nx,1:Ny+1))
  allocate(thetay(1:Nx+1,1:Ny))
  allocate(Ux(1:Nx,1:Ny+1))
  allocate(Uy(1:Nx+1,1:Ny))
  allocate(hz(1:Nx,1:Ny))
  allocate(hz_old(1:Nx,1:Ny))
  allocate(Qx(1:Nx,1:Ny+1))
  allocate(Qy(1:Nx+1,1:Ny))
  allocate(Jsx(1:Nx+1,1:Ny+1))
  allocate(Jsy(1:Nx+1,1:Ny+1))
  allocate(phase(1:Nx+1,1:Ny+1))
  allocate(densityOld(1:Nx+1,1:Ny+1))
  allocate(densityNew(1:Nx+1,1:Ny+1))
  allocate(densityNew2(1:Nx+1,1:Ny+1))
  allocate(Tc(1:Nx+1,1:Ny+1))
  allocate(ag(1:Nx+1,1:Ny+1))
  allocate(af(1:Nx+1,1:Ny+1))
  allocate(d4(1:Nx+1,1:Ny+1))
  
  allocate(V_t(1:Nx+1,1:Ny))
  allocate(U_t(1:Nx+1))

  ! Read the local phenomenological constants
  open(unit=10, file='Tc.dat', status='old', action='read')
    do j = 1, Ny+1
      read(10,*) (Tc(i,j), i = 1, Nx+1)
    end do
  close(10)
  open(unit=10, file='ag.dat', status='old', action='read')
  do j = 1, Ny+1
    read(10,*)(ag(i,j), i= 1, Nx+1)
  end do
  close(10)
  open(unit=10, file='af.dat', status='old', action='read')
  do j = 1, Ny+1
    read(10,*)(af(i,j), i = 1, Nx+1)
  end do
  close(10)

  call defect_function() ! Calculate the defect function at he bordes
  call write_to_file('d4.dat', d4, Nx+1, Ny+1)

  call TDGL_constants() ! Calcuate all the constants to solve TDGL equations and others

  ! Initialize the initial conditions
  if (istart == 0) then
    call init_conditions()
  else
    open(unit=100, file='restart.dat', status='old', form='unformatted')
      read(100) psi_old, Ux, Uy, thetax, thetay, hz, J_a_i
    close(100)
    psi = psi_old
    densityOld = cdabs(psi_old)
    hz_old = hz
  end if

  J_a = J_a_i ! Initialize the applid external magnetic field

  do while (J_a <= J_a_f)

    ! Create restart.dat file to store the reinitialization information
    call create_data_file('restart.dat')
    open(unit = 100, file = 'restart.dat', status = 'unknown', form = 'unformatted')
    write(100) psi_old, Ux, Uy, thetax, thetay, hz, J_a ! Write for reinitialization

    ! Directories' names to store data files for each current J_a
    write(1,'(F8.5)') J_a
    rewind(1)
    read(1,*) J_a_string
    rewind(1)
    dir_names(1) = 'psi/'//J_a_string
    dir_names(2) = 'phase/'//J_a_string
    dir_names(3) = 'hz/'//J_a_string
    dir_names(4) = 'J/'//J_a_string
    dir_names(5) = 'J/'//J_a_string
    dir_names(6) = 'Time_Voltage/'//J_a_string
    dir_names(7) = 'restart/'//J_a_string

    ! Create directories to store data files for each current J_a
    call create_directories(dir_names, 7)

    time = 0.0d0 ! Initialize the time iteractions for each applied field for null value

    iCountV = 0 ! Counter to store the time-averaged voltage V(t)

    avgPotOld  = 0.0d0 ! Initial value of the time-averaged voltage V(t)
    avgPotOld2 = 0.0d0
    iOsc = 0 ! Initialize the number of oscilation of the time-averaged voltage V(t)
    iOsc_old = 0
    jV_med = 0
    V_med = 0.0d0 ! Initialize the total the time-averaged voltage V(t)
    U_med_old = 0.0d0 ! Initialize the initial value of the averaged voltage = (\int_0^T V(t) dt) / T
    error = 1.0d0 ! Initialize the error for the value of U_med

    ! Create V_t.dat file to store the time-averaged voltage
    call create_data_file('V_t.dat')

    do n = 1, itMax ! External loop time

      call TDGL_equations() ! Update the order parameter, the vector potential 
			    ! and the local field for each time step

      ! Convergence test. If converged, it will stop
      call convergence()
      if ((diffPsi <= eps).and.(diffH <= eps)) then
	open(unit = 10, file = 'convergence.dat', status = 'old', position = 'append')
	  write(10, *) '-------------------- Convergence was reached --------------------'
	close(10)
	exit
      else if (((J_a > 0.0d0 ).and.(error <= eps)).and.(iOsc >= 22)) then
	open(unit = 10, file = 'convergence.dat', status = 'old', position = 'append')
	  write(10, *) '-------------------- Convergence was reached --------------------'
	close(10)
	exit
      end if

      if (iOsc >= 4) then

	write(15,*) n
	rewind(15)
	read(15,*) n_string
	rewind(15)			

	psi_w = 'psi.'//n_string
	call create_data_file(psi_w)
	call write_to_file(psi_w, cdabs(psi), Nx+1, Ny+1)
	phase_w = 'phase.'//n_string
	call create_data_file(phase_w)
	call write_to_file(phase_w, dimag(cdlog(psi)), Nx+1, Ny+1)	
	hz_w = 'hz.'//n_string
	call create_data_file(hz_w)
	call write_to_file(hz_w, hz, Nx, Ny)
	file_names(1) = psi_w
	file_names(2) = phase_w
	file_names(3) = hz_w
	file_names(4) = Jsx_w
	file_names(5) = Jsy_w
	call move_files_to_directories(file_names, dir_names, 5)

      end if

    end do ! External loop time

    close(100) ! Close restart.dat file
    call output_files() ! Save psi, hz, J, phase, V_t and restart

    if ( n >= itMax) then
      open(unit = 10, file = 'convergence.dat', status = 'old', position = 'append')
	write(10, *) '------------------ Convergence was not reached ------------------'
      close(10)
    end if

    call cpu_time(time_final)
    total_time   = time_final-time_initial
    time_initial = time_final
    
    call data_files()
		
    psi2Max = maxval(cdabs(psi))		
    if (psi2Max < eps) then 
      exit
    end if	

    J_a = J_a + dJ_a

  end do

end program tdgl_2D
