module allocatable_arrays

  implicit none

  ! Define TDGL arrays
  complex(kind=8), allocatable :: psi(:,:)         ! Array to store the order parameter
  complex(kind=8), allocatable :: psi_old(:,:)     ! Temporary array to store the updated order parameter
  complex(kind=8), allocatable :: delP(:,:)        ! Store auxiliary array to find order parameter 
  real(kind=8),    allocatable :: phix(:,:)        ! Array to store the vector potential (phix = dx * Ax)
  real(kind=8),    allocatable :: phiy(:,:)        ! Array to store the vector potential (phix = dy * Ay)
  real(kind=8),    allocatable :: thetax(:,:)      ! Temporary value for phix
  real(kind=8),    allocatable :: thetay(:,:)      ! Temporary value for phiy
  complex(kind=8), allocatable :: Ux(:,:)          ! Array for the link variavle
  complex(kind=8), allocatable :: Uy(:,:)          ! Array for the link variable
  real(kind=8),    allocatable :: hz(:,:)          ! Array to store the local magnetic field
  real(kind=8),    allocatable :: hz_old(:,:)      ! Temporary array to store the updated the local magnetic field
  real(kind=8),    allocatable :: Qx(:,:)          ! Array for the superconducting velocity in the x direction
  real(kind=8),    allocatable :: Qy(:,:)          ! Array for the superconducting velocity in the y direction
  real(kind=8),    allocatable :: Jsx(:,:)         ! Array to store the superconducting current density in x direction
  real(kind=8),    allocatable :: Jsy(:,:)         ! Array to store the superconducting current density in y direction
  real(kind=8),    allocatable :: phase(:,:)       ! Array to store the pahse of the order parameter
  real(kind=8),    allocatable :: densityOld(:,:)  ! Copper pair density
  real(kind=8),    allocatable :: densityNew(:,:)
  real(kind=8),    allocatable :: densityNew2(:,:)
  real(kind=8),    allocatable :: Tc(:,:)          ! Array to store local critical temperature
  real(kind=8),    allocatable :: ag(:,:)          ! Array to store local Ginzbug-Landau parameter
  real(kind=8),    allocatable :: af(:,:)          ! Array to store local coherence length
  real(kind=8),    allocatable :: d4(:,:)          ! Array to store defect matrix function

  ! Define variables to create directoires and file names
  character(len=32), dimension(8) :: dir_names  ! Array to store directory names
  character(len=32), dimension(8) :: file_names ! Array to assign file names

  ! Define auxiliary arryas used to calculate the averaged voltage
  real(kind=8) , allocatable :: V_t(:,:) ! Array to store - \partial A_y / \patial t
  real(kind=8) , allocatable :: U_t(:)   ! Array to the sum of - \partial A_y / \patial t for each value of i 

end module allocatable_arrays
