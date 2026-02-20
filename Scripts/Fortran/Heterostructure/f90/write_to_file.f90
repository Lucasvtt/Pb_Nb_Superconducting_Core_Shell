subroutine write_to_file(filename, data, Mx, My)
    implicit none

    ! This subroutine moves each file specified in the file_names array to its corresponding
    ! directory specified in the dir_names array. The arrays must be of the same length, and 
    ! each entry in file_names is moved to the directory at the same index in dir_names.
    ! The subroutine uses the `mv` command through the `execute_command_line` intrinsic 
    ! to perform the move operation, checking the exit status of each command execution.

    character(len=*), intent(in) :: filename
    real(kind=8), intent(in) :: data(Mx, My)   ! Use explicit dimensions
    integer, intent(in) :: Mx, My              ! Add intent for Mx and My
    integer :: i, j, unit_number, ios          ! Declare loop (i,j) and file unit number variables

    ! Assign a unit number for the file
    unit_number = 10

    ! Open the file for writing
    open(unit=unit_number, file=filename, status='unknown', action='write', iostat=ios)

    ! Write data to the file
    do j = 1, My
        do i = 1, Mx
            write(unit_number, '(F15.6)', advance='no') data(i, j)
        end do
        write(unit_number, *)
    end do

    ! Close the file
    close(unit_number)

end subroutine write_to_file
