subroutine move_files_to_directories(file_names, dir_names, number_of_files)
    implicit none

    character(len=*), intent(in) :: file_names(number_of_files)
    character(len=*), intent(in) :: dir_names(number_of_files)
    integer, intent(in) :: number_of_files
    integer :: i, status
    character(len=32) :: command

    ! Loop through each file and move it to the respective directory
    do i = 1, number_of_files
        ! Construct the mv command with trimming
        command = 'mv ' // trim(adjustl(file_names(i))) // ' ' // trim(adjustl(dir_names(i)))

        ! Print the command for debugging
       ! print *, "Executing command:", command

        ! Execute the command using execute_command_line
        call execute_command_line(trim(command), exitstat=status)

    end do

end subroutine move_files_to_directories
