module matrix
  use iso_c_binding
  implicit none
  type matrix_t
    real(c_double), pointer :: x(:,:)
    integer :: rows, cols
  contains
    procedure :: init => matrix_init
  end type matrix_t

  interface operator(*)
    module procedure matrix_mult
  end interface operator(*)

  interface
    subroutine c_gemm(n, c, a, b) bind(c, name="gemm")
      use iso_c_binding
      implicit none
      type(c_ptr), value :: a, b, c
      integer(kind=c_int), value, target :: n
    end subroutine
  end interface

contains

  ! Initialize matrix
  subroutine matrix_init(this, rows, cols)
    class(matrix_t), intent(inout) :: this
    integer, intent(in) :: rows, cols
    allocate(this%x(rows, cols))
    this%rows = rows
    this%cols = cols
  end subroutine matrix_init

  ! Deallocate matrix
  subroutine matrix_free(this)
    type(matrix_t), intent(inout) :: this
    ! Cannot check allocated() since x is POINTER type
    deallocate(this%x)
  end subroutine matrix_free

  function matrix_mult(a, b) result(c)
    type(matrix_t), intent(in) :: a, b
    type(matrix_t) :: c
    call c%init(b%cols, a%rows)
    a%x = transpose(a%x)
    b%x = transpose(b%x)
    call c_gemm(a%rows, c_loc(c%x), c_loc(b%x), c_loc(a%x))
    a%x = transpose(a%x)
    b%x = transpose(b%x)
    c%x = transpose(c%x)

!   fortran implementation
!    type(integer) :: i, j, k
!    do j=1, b%cols
!      do i=1, a%rows
!        c%x(i, j) = 0d0
!        do k=1, b%rows
!          c%x(i, j) = c%x(i, j) + a%x(i, k) * b%x(k, j)
!        end do
!      end do
!    end do
  end function matrix_mult
end module matrix

