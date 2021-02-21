# define the minimum CMake version
cmake_minimum_required(VERSION 3.1)

# create a new C project
project(DD2358-assignment-2 VERSION 1.0
  DESCRIPTION "Assignment 2 build"
  LANGUAGES Fortran C CXX)

include_directories("${CMAKE_SOURCE_DIR}/include/")

# Setup c_matrix library, libc_matrix.so
add_library(c_matrix 
  SHARED 
  src/matrix.c)

# Create executable target for gemm_test
add_executable(gemm_test.out
  src/matrix.f90
  src/gemm_test.f90
)
target_compile_options(gemm_test.out PRIVATE -Wall -O3)

add_subdirectory(pybind11)
pybind11_add_module(matrix "${CMAKE_SOURCE_DIR}/src/matrix.cpp")

# Link c_matrix into gemm_test.out executable and matrix library
target_link_libraries(gemm_test.out PRIVATE c_matrix)
target_link_libraries(matrix PUBLIC c_matrix)

# set output target
set_target_properties(c_matrix gemm_test.out matrix
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")


