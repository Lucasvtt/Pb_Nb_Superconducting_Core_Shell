module finite_difference_constants  

Contains

  subroutine TDGL_constants()
    use shared_variables
    implicit none
  
    delta = 1.0d0 / dx**2 + 1.0d0 / dy**2 ! Calculate the dt that garantees convergence
    delta = 2.0d0 / delta
    gama2 = gama**2
    dt1 = u * delta / 4.0d0 / dsqrt(1.0d0+gama2)
    dt2 = sigma * delta /(4.0d0 * kappa**2)
    dt  = dmin1(dt1, dt2)
    dt  = dt * dtFact

    dxdy = dx * dy ! Area of a unit cell
    area = (Lx - dx) * (Ly - dy)

    rx = dt / (u * dx**2) ! Used in the TDGL equation
    ry = dt / (u * dy**2)
    c  = dt / u

    sx  = dt / sigma ! Used in the Ampère's law
    sy  = dt / sigma
    txy = kappa**2 * dt * dx / (sigma * dy)
    tyx = kappa**2 * dt * dy / (sigma * dx)

    p = 0.95d0 ! Used in the calculation of matrix defect

    pi  = dacos(-1.0d0) ! pi number
    dpi = 2.0d0 * pi
  
  end subroutine TDGL_constants

end module finite_difference_constants
