module save_output

contains

  subroutine output_files()
  use allocatable_arrays
  use shared_variables
  implicit none

  external :: create_directories        ! Subroutine to create directories for storing output files
  external :: move_files_to_directories ! Subroutine to move output files to their respective directories
  external :: write_to_file             ! Subroutine to write array output data to files

  ! Calculate the phase of the order parameter
  do j = 1,Ny+1
    do i = 1,Nx+1
      phase(i,j) = dimag(cdlog(psi(i,j)))
    end do
  end do

  ! Calculate the x and y componets of the current density
  do j = 2, Ny
    do i = 2, Nx
      Jsx(i,j) = 0.5d0 * (Qx(i,j) + Qx(i-1,j)) / dx
      Jsy(i,j) = 0.5d0 * (Qy(i,j) + Qy(i,j-1)) / dy
    end do
  end do

  ! Write array data to files
  call write_to_file('psi.dat', cdabs(psi), Nx+1, Ny+1)
  call write_to_file('phase.dat', phase, Nx+1, Ny+1)
  call write_to_file('hz.dat', hz, Nx, Ny)
  call write_to_file('Jsx.dat', Jsx, Nx+1, Ny+1)
  call write_to_file('Jsy.dat', Jsy, Nx+1, Ny+1)
  file_names(1) = 'psi.dat'
  file_names(2) = 'phase.dat'
  file_names(3) = 'hz.dat'
  file_names(4) = 'Jsx.dat'
  file_names(5) = 'Jsy.dat'
  file_names(6) = 'V_t.dat'
  file_names(7) = 'restart.dat'

  ! Move array data files to directories
  call move_files_to_directories(file_names, dir_names, 7)
  
  end subroutine output_files
  
end module save_output
