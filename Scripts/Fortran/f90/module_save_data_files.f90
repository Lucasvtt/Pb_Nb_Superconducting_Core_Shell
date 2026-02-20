module save_data_files

contains

  subroutine data_files()
  use allocatable_arrays
  use shared_variables
  implicit none

  external :: write_to_file             ! Subroutine to write array output data to files

  ! Save the averaged voltage for each value of J_a
  open(unit = 10, file = 'IV.dat', status = 'old', position = 'append')
    write(10, "(F12.8, 1x, F12.8)") J_a, U_med
  close(10)

  ! Save the iteration number for each value of J_a
  open(unit = 10, file = 'iterations.dat', status = 'old', position = 'append')
    write(10, "(F12.8, 1x, I8)") J_a, n * iTest
  close(10)

  ! Save the execution time for each value of J_a
  open(unit = 10, file = 'execution_time.dat', status = 'old', position = 'append')
    write(10, "(F12.8, 1x, F12.8)") J_a, total_time / 60.0d0 ! time is in minutes
  close(10)
  
  end subroutine data_files
  
end module save_data_files
