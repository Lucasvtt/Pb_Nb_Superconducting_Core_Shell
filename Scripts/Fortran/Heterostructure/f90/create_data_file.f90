subroutine create_data_file(filename)
    implicit none
    
    ! Input parameter
    character(len=*), intent(in) :: filename
    
    ! Local variables
    logical :: file_exists               ! Logical to check file existence
    character(len=256) :: temp_filename  ! Temporary variable for inquiry

    ! Assign filename to temporary variable for inquiry
    temp_filename = filename
    
    ! Check if the file exists
    inquire(file=temp_filename, exist=file_exists)

    ! Open a new file if it does not exist
    if (.not. file_exists) then
        open(unit=1, file=filename, status='new', position='append')
        close(1)
    else
        continue
    end if

end subroutine create_data_file
