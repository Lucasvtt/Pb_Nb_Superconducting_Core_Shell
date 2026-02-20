module initial_conditions

contains

  subroutine init_conditions()
    use allocatable_arrays
    use shared_variables
    implicit none

    psi_old = dsqrt(1.0d0 - T)
    thetax  = 0.0d0
    Ux      = cdexp(-(0,1) * dcmplx(thetax))
    thetay  = 0.0d0
    Uy      = cdexp(-(0,1) * dcmplx(thetay))
    do j = 1, Ny
      do i = 1, Nx
	hz(i,j) = (thetay(i+1,j) - thetay(i,j) - thetax(i,j+1) + thetax(i,j)) / dxdy
      end do
    end do
    psi = psi_old

    densityOld = cdabs(psi_old)

    hz_old = hz

  end subroutine init_conditions

end module initial_conditions
