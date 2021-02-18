program gemm_test
  use matrix
  implicit none 
  type(matrix_t) :: A, B, C
  call A%init(3,3)
  call B%init(3,3)
  ! Fill A, B with data
  A%x(1,:) = (/3, 0, 2/)
  A%x(2,:) = (/2, 0, -2/)
  A%x(3,:) = (/0, 1, 1/)
  write(*,*) A%x
  
  B%x(1,:) = (/0.2, 0.2, 0.0/)
  B%x(2,:) = (/-0.2, 0.3, 1.0/)
  B%x(3,:) = (/0.2, -0.3, 0.0/)
  write(*,*) B%x
  
  C = A * B
  write(*,*)
  write(*,*) C%x
  write(*,*)
end program gemm_test
