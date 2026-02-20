module TDGL_solver 

contains

  subroutine TDGL_equations()
    use allocatable_arrays
    use shared_variables
    implicit none

    !$acc data copy(psi_old(:,:), psi(:,:))  &
    !$acc copy(Qx(:,:), Qy(:,:))             &
    !$acc copy(Ux(:,:), Uy(:,:))             &
    !$acc copy(thetax(:,:), thetay(:,:))     &
    !$acc copy(phix(:,:), phiy(:,:))         &
    !$acc copy(Jsx(:,:), Jsy(:,:))           &
    !$acc copy(hz(:,:), delP(:,:))           &
    !$acc copy(V_t(:,:), U_t(:),d4(:,:))     &
    !$acc copy(Tc(:,:), af(:,:), ag(:,:))	

    do m = 1, iTest ! internal loop time

      time = time + dt

      !!!!!!!!!!!!!!!!!!!!!!!!
      ! Recurrence relations !
      !!!!!!!!!!!!!!!!!!!!!!!!

      ! first TDGL equation
      !$acc kernels loop present(delP, psi_old, Ux, Uy, af, ag, d4)
      do j = 2, Ny 
	do  i = 2, Nx

	  delP(i,j) =   rx * (Ux(i,j) * psi_old(i+1,j) - 2.0d0 * psi_old(i,j) + dconjg(Ux(i-1,j)) * psi_old(i-1,j)) &
		      + ry * (Uy(i,j) * psi_old(i,j+1) - 2.0d0 * psi_old(i,j) + dconjg(Uy(i,j-1)) * psi_old(i,j-1)) &
		      + c * psi_old(i,j) * (af(i,j) * (d4(i,j)) - ag(i,j) * cdabs(psi_old(i,j))**2)

	end do
      end do
				
      !!!!!!!!!!!!!!!!

      ! first TDGL equation
      !$acc kernels loop present(psi_old, psi, delP)
      do j = 2, Ny
	do i = 2, Nx

	  psi(i,j) = psi_old(i,j) + dsqrt(1.0d0 + gama2 * cdabs(psi_old(i,j))**2) * delP(i,j) &
				  - gama2 * psi_old(i,j) * dreal(dconjg(psi_old(i,j)) * delP(i,j)) / dsqrt(1.0d0 + gama2 * cdabs(psi_old(i,j))**2)
	end do
      end do

      ! periodic boundary conditions
      !$acc kernels loop present(psi)
      do i = 2, Nx	

	psi(i,1)    = psi(i,Ny)

	psi(i,Ny+1) = psi(i,2)

      end do

      !!!!!!!!!!!!!!!!

      ! x component of the current density
      !$acc kernels loop present(psi_old, Qx, Ux)
      do j = 1, Ny+1
	do i = 1, Nx

	  Qx(i,j) = dimag(dconjg(psi_old(i,j)) * Ux(i,j) * psi_old(i+1,j))

	end do
      end do

      ! x component of the Ampere's law
      !$acc kernels loop present(Qx,thetax, phix, Ux, hz)
      do j = 2, Ny
	do i = 1, Nx

	  phix(i,j) = thetax(i,j) + sx * Qx(i,j) - txy * (hz(i,j) - hz(i,j-1))

	  Ux(i,j)   = cdexp(-(0,1) * dcmplx(phix(i,j)))

	end do
      end do

      !$acc kernels loop present(phix,Ux)
      do i = 1,Nx

	phix(i,1)    =  phix(i,Ny)

	phix(i,Ny+1) =  phix(i,2)

	Ux(i,1)      = cdexp(-(0,1) * dcmplx(phix(i,1)))

	Ux(i,Ny+1)   = cdexp(-(0,1) * dcmplx(phix(i,Ny+1)))

      end do

      !!!!!!!!!!!!!!!!

      ! y component of the current density
      !$acc kernels loop present(psi_old, Qy, Uy)
      do j = 1, Ny
	do i = 1, Nx+1

	  Qy(i,j) = dimag(dconjg(psi_old(i,j)) * Uy(i,j) * psi_old(i,j+1))

	end do
      end do

      ! y component of the Ampere's law
      !$acc kernels loop present(Qy, thetay, phiy, Uy, hz)
      do j = 1, Ny
	do i = 2, Nx

	  phiy(i,j) = thetay(i,j) + sy * Qy(i,j) + tyx * (hz(i,j) - hz(i-1,j))

	  Uy(i,j)   = cdexp(-(0,1) * dcmplx(phiy(i,j)))

	end do
      end do

      ! x and y componets of the current density
      !$acc kernels loop present(Qx, Qy, Jsx, Jsy)
      do j = 2, Ny
	do i = 2, Nx
	
	  Jsx(i,j) = 0.5d0 * (Qx(i,j) + Qx(i-1,j)) / dx
	  
	  Jsy(i,j) = 0.5d0 * (Qy(i,j) + Qy(i,j-1)) / dy
	  
	end do
      end do

      !!!!!!!!!!!!!!!!

     !$acc kernels loop present(V_t, Qy, hz)
      do i = 2, Nx
	do j = 1, Ny

	  V_t(i,j) = - (sy * dimag(dconjg(psi(i,j)) * Uy(i,j) * psi(i,j+1)) + tyx * (hz(i,j) - hz(i-1,j))) / dt

	end do
      end do

      !!!!!!!!!!!!!!!!

      ! h = rot A
      !$acc kernels loop present(phix, phiy, hz)
      do j = 1,	Ny
	do i = 2, Nx-1

	  hz(i,j) = (phiy(i+1,j) - phiy(i,j) - phix(i,j+1) + phix(i,j)) / dxdy

	end do
      end do

      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      ! End of recurrence relations !
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!				

      !!!!!!!!!!!!!!!!!!!!!!!
      ! Boundary conditions !
      !!!!!!!!!!!!!!!!!!!!!!!

      !$acc kernels loop present(psi, Ux)
      do j = 1,	Ny+1	

	psi(1,j)    = Ux(1,j) * psi(2,j)

	psi(Nx+1,j) = dconjg(Ux(Nx,j)) * psi(Nx,j)

      end do

      !!!!!!!!!!!!!!!!

      !$acc kernels loop present(hz)
      do j = 1, Ny

	hz(1,j)  = + J_a * (Lx - dx) / (2.0d0 * kappa**2)

	hz(Nx,j) = - J_a * (Lx - dx) / (2.0d0 * kappa**2)

      end do

      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      ! End of boundary conditions !
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				
      !!!!!!!!!!!!!!!!!!!!!!!!!!
      ! Transferring variables !
      !!!!!!!!!!!!!!!!!!!!!!!!!!

      !$acc kernels loop
      do j = 1, Ny+1
	do i = 1, Nx+1

	  psi_old(i,j) = psi(i,j)

	end do
      end do

      !$acc kernels loop
      do j = 1, Ny+1
	do i = 1, Nx

	  thetax(i,j) = phix(i,j)

	end do
      end do

      !$acc kernels loop
      do j = 1, Ny
	do i = 1, Nx+1

	  thetay(i,j) = phiy(i,j)

	end do
      end do

      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      ! End of transferring variables !
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      ! Calculation of the average voltage !
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      !$acc kernels loop present(U_t, V_t)
      do i = 1, Nx-1
	U_t(i) = 0.0d0
	do j = 1, Ny

	  U_t(i) = U_t(i) + V_t(i,j)

	end do
      end do

      avgPot = 0.0d0
      !$acc kernels loop
      do i = 2, Nx

	avgPot = avgPot + U_t(i)

      end do
      avgPot = avgPot / (Nx - 1)

      iCountV = iCountV + 1
      if (iCountV == iVT) then

	! Save the time-averaged voltage
	open(unit = 200, file = 'V_t.dat', status = 'old', position = 'append')
	  write(200, "(F12.8, 1x, F18.8, 1x, F12.8)") J_a, time, avgPot
	close(200)

	iCountV = 0

      end if

    ! Find the maximum of the time-average voltage V(t)
      if ((avgPot < avgPotOld).and.(avgPotOld2 < avgPotOld)) then
	iOsc = iOsc + 1
      end if
      avgPotOld2 = avgPotOld
      avgPotOld  = avgPot  

      if (iOsc >= 2) then
	V_med = V_med + avgPot
	jV_med = jV_med + 1
	U_med = V_med / jV_med
      end if

      if ((iOsc >= 2).and.((iOsc - iOsc_old) > 1)) then
	error = dabs(U_med - U_med_old)
	U_med_old = U_med
	iOsc_old = iOsc
      end if

      !!!!!!!1111!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      ! End calculation of the average voltage !
      !!!!!!!!!!!1111!!!!!!!!!!!!!!!!!!!!!!!!!!!


    end do

    !$acc end data 

  end subroutine TDGL_equations

end module TDGL_solver
