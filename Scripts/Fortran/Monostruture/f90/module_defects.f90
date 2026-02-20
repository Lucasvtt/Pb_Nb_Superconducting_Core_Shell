module matrix_defects 

Contains

  subroutine defects()
    use allocatable_arrays
    use shared_variables
    implicit none

    tau = 1.0d0
    do  j = Ny/2+1-5, Ny/2+1+5
      do i = 1, 6
	tau(i,j) = 0.0d0
      end do
    end do
    do  j = Ny/2+1-5, Ny/2+1+5
      do i = Nx+1-5, Nx+1
	tau(i,j) = 0.0d0
      end do
    end do    

  call create_data_file('tau.dat')
  call write_to_file('tau.dat', tau, Nx+1, Ny+1)
  
  end subroutine defects

end module matrix_defects
