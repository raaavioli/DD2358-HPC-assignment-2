module matrix
  implicit none
  type matrix_t
    real, allocatable :: x(:,:)
    integer :: rows, cols
  contains
    procedure :: init => matrix_init
  end type matrix_t

  interface operator(*)
    module procedure matrix_mult
  end interface operator(*)

contains

  ! Initialize matrix
  subroutine matrix_init(this, rows, cols)
    class(matrix_t), intent(inout) :: this
    type(integer), intent(in) :: rows, cols

    call matrix_free(this)
    allocate(this%x(rows, cols))
    this%rows = rows
    this%cols = cols
  end subroutine matrix_init

  ! Deallocate matrix
  subroutine matrix_free(this)
    type(matrix_t), intent(inout) :: this

    if (allocated(this%x)) then
      deallocate(this%x)
    end if
  end subroutine matrix_free

  function matrix_mult(a, b) result(c)
    type(matrix_t), intent(in) :: a, b
    type(matrix_t) :: c
    type(integer) :: i, j, k

    call c%init(a%rows, b%cols)
    c%x = 0

    do j=1, b%cols
      do i=1, a%rows
        do k=1, b%rows
          c%x(i, j) = c%x(i, j) + a%x(i, k) * b%x(k, j)
        end do
      end do
    end do
  end function matrix_mult

end module matrix

