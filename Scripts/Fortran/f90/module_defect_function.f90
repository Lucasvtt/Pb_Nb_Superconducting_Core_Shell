module defect_function_calculation

Contains

  subroutine defect_function()
    use allocatable_arrays
    use shared_variables
    implicit none

    deltaT = (1.0d0 - p**2) * (1 - T)
    d4 = Tc - T
    do  j = Ny/2+1-5, Ny/2+1+5
      do i = 1, 6
	d4(i,j) = Tc(i,j) - deltaT - T
      end do
    end do
    do  j = Ny/2+1-5, Ny/2+1+5
      do i = Nx+1-5, Nx+1
	d4(i,j) = Tc(i,j) - deltaT - T
      end do
    end do
    !--
    !do  j = 2, 6
    !  do i = 1, 6
    !	d4(i,j) = 1.0d0 - deltaT - T
    !  end do
    !end do
    !do  j = 2, 6
    !  do i = Nx+1-5, Nx+1
    !	d4(i,j) = 1.0d0 - deltaT - T
    !  end do
    !end do
    !--
    !do  j = Ny-4, Ny
    !  do i = 1, 6
    !	d4(i,j) = 1.0d0 - deltaT - T
    !  end do
    !end do
    !do  j = Ny-4, Ny
    !  do i = Nx+1-5, Nx+1
    !	d4(i,j) = 1.0d0 - deltaT - T
    !  end do
    !end do

  end subroutine defect_function

end module defect_function_calculation
