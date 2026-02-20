module shared_variables
  implicit none

  ! Define physical constants
  real(kind=8) :: u     ! Kramer's constant
  real(kind=8) :: gama  ! Gamma constant
  real(kind=8) :: gama2 ! Gamma square constant
  real(kind=8) :: sigma ! Normal conductivity
  real(kind=8) :: T     ! Temperature
  real(kind=8) :: kappa ! Ginzburga-Landau paparameter
  real(kind=8) :: time  ! Time counter

  ! Define geometrical constants
  real(kind=8) :: Lx     ! Size in x direction
  real(kind=8) :: Ly     ! Size in x direction
  real(kind=8) :: dx, dy ! Grid spacings in x and y directions
  real(kind=8) :: dxdy   ! Area of a unit cell in the grid
  real(kind=8) :: area   ! Area of the supercondutor
  
  ! Define number of grid points
  integer :: Nx ! Number of unit cells in the x direction
  integer :: Ny ! Number of unit cells in the y direction

  ! Define constants for GTDGL equations
  real(kind=8)    :: dt, dt1, dt2, delta ! Time step size
  real(kind=8)    :: rx, ry, c           ! Coefficients for the finite difference scheme
  real(kind=8)    :: sx, sy              ! Coefficients for the finite difference scheme
  real(kind=8)    :: txy, tyx            ! Coefficients for the finite difference scheme

  ! Define control flux variables 
  real(kind=8) :: eps    ! Tolerance for convergence
  integer      :: iTest  ! Number of iterations for internal loop time
  integer      :: itMax  ! Number of iterations for external loop time
  integer      :: istart ! Used to decide to start from zero applied field OR restart the simulation
  
  ! Define current values
  real(kind=8) :: J_a   ! Applied current density
  real(kind=8) :: J_a_i ! Initial value of the applied current
  real(kind=8) :: J_a_f ! Final value of the applied current
  real(kind=8) :: dJ_a  ! Applied current step

  ! Define variables to create directores to store output files
  character(len=10) J_a_string ! Value of the current converted to string

  ! Define reduction factor for \Delta t
  real(kind=8) :: dtFact

  ! Define variables to store errors
  real(kind=8) :: diffPsi ! In the order parameter
  real(kind=8) :: diffH   ! In the local magnetic field
  real(kind=8) :: dif

  ! Define variables to calculate the averaged voltage
  integer      :: iVT        ! Each iVT iterations the averaged voltage is calculated
  integer      :: iCountV    ! Save V(t) on the V_t.dat file when iCounT = iVT
  real(kind=8) :: avgPot     ! Averaged voltage
  real(kind=8) :: avgPotOld  ! Temporary value of the averaged voltage
  real(kind=8) :: avgPotOld2 ! Temporary value of the averaged voltage
  real(kind=8) :: V_med      ! Total averaged time-voltage
  real(kind=8) :: U_med      ! Averaged voltage
  real(kind=8) :: U_med_old  ! Temporary averaged voltage
  real(kind=8) :: error      ! Error in the calculation of U_med
  integer      :: iOsc       ! Store the number of oscilation of the curve V(t)
  integer      :: iOsc_old   ! Temporary value of iOsc
  integer      :: jV_med     ! Coount the number of avgPot to calculate the U_med

  ! Define constants to calculate the defect matrix
  real(kind=8) :: p
  real(kind=8) :: deltaT

  ! Define the string variable names for psi.number, phase.number, hz.number, Jsx.numver, Jsy.number, where number = 1, 2, 3, ...
  character(len=20) psi_w
  character(len=20) phase_w
  character(len=20) hz_w
  character(len=20) Jsx_w
  character(len=20) Jsy_w
  character(len=20) n_string

  ! Define the pi number
  real(kind=8) :: pi
  real(kind=8) :: dpi

  ! Define variables to count time execution
  real(kind=8) :: time_initial
  real(kind=8) :: time_final
  real(kind=8) :: total_time

  ! Difine variable to decide the end of the simulation 
  real(kind=8) :: psi2Max 

  ! Define loop conters
  integer :: i, j, k, n, m, l, iter

end module shared_variables

