subroutine create_directories(dir_names, number_of_directories)
    implicit none

    ! This subroutine creates multiple directories specified in the dir_names array.
    ! Each directory path is passed as an element of the array, and the subroutine uses
    ! the `mkdir -p` command via the `execute_command_line` intrinsic to create each
    ! directory, including any necessary parent directories. The number_of_directories
    ! parameter indicates the number of directories to be created. The subroutine
    ! checks the exit status of each command to ensure successful directory creation.

    character(len=*), intent(in) :: dir_names(number_of_directories)
    integer, intent(in) :: number_of_directories
    integer :: i, status
    character(len=32) :: command

    ! Loop through each directory name and create it using execute_command_line
    do i = 1, number_of_directories
        ! Construct the mkdir command with trimming
        command = 'mkdir -p ' // trim(adjustl(dir_names(i)))

        ! Execute the command using execute_command_line
        call execute_command_line(trim(command), exitstat=status)

    end do

end subroutine create_directories
