program gemm_test
  use matrix
  implicit none 
  type(matrix_t) :: A, B, C
  call A%init(2,2)
  call B%init(2,2)
  ! Fill A, B with data
  A%x(1,:) = (/4, 7/)
  A%x(2,:) = (/2, 6/)
  write(*,*) A%x
  
  B%x(1,:) = (/0.6, -0.7/)
  B%x(2,:) = (/-0.2, 0.4/)
  write(*,*) B%x
  
  C = A * B
  write(*,*)
  write(*,*) C%x
  write(*,*)
end program gemm_test
