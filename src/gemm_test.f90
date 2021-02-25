program gemm_test
  use matrix
  implicit none 
  type(matrix_t) :: A, B, C
  call A%init(3,3)
  call B%init(3,3)
  ! Fill A, B with data
  A%x(1,:) = (/1, 2, 1/)
  A%x(2,:) = (/2, 1, 1/)
  A%x(3,:) = (/2, 4, 1/)
  
  B%x(1,:) = (/0.0d0, 2.0d0/3, 1.0d0/3/)
  B%x(2,:) = (/0.0d0, -1.0d0/3, 1.0d0/3/)
  B%x(3,:) = (/2.0d0, 0.0d0, -1.0d0/)
  
  C = A * B
  write(*,*) A%x
  write(*,*)
  write(*,*) B%x
  write(*,*)
  write(*,*) C%x
  write(*,*)
end program gemm_test
