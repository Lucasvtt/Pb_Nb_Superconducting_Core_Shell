module test_convergence

contains

  subroutine convergence()
    use allocatable_arrays
    use shared_variables
    implicit none

    densityNew  = cdabs(psi)

    ! This loop determines the largest difference between |psiNew| and |psiOld| 
    diffPsi = 0.0d0
    do j = 1, Ny+1
      do i = 1, Nx+1
	dif = dabs(densityNew(i,j) - densityOld(i,j))
	densityOld(i,j) = densityNew(i,j)
	if (dif > diffPsi) then
	  diffPsi = dif
	end if
      end do
    end do

    ! This loop determines the largest difference between hz and hz_old 
    diffH = 0.0d0
    do j = 1, Ny
      do i = 1, Nx
	dif = dabs(hz(i,j) - hz_old(i,j))
	hz_old(i,j) = hz(i,j)
	if (dif > diffH) then
	  diffH = dif
	end if
      end do
    end do

    ! Save the number of iterations and the respective error
    open(unit = 10, file = 'convergence.dat', status = 'old', position = 'append')
      write(10, "(F12.8, 1x, I8, 1x, F12.8, F12.8, 1x F12.8, 1x I4)") J_a, n * iTest, diffPsi, diffH, error, iOsc
    close(10)

  end subroutine convergence

end module test_convergence
    
