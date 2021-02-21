# define the minimum CMake version
cmake_minimum_required(VERSION 3.1)

# create a new C project
project(DD2358-assignment-2 VERSION 1.0
  DESCRIPTION "Assignment 2 build"
  LANGUAGES Fortran C CXX)

include_directories("${CMAKE_SOURCE_DIR}/include/")

add_library(matrix
  SHARED src/matrix.c)

# Create executable target for gemm_test
add_executable(gemm_test.out
  src/matrix.f90
  src/gemm_test.f90
)
target_compile_options(gemm_test.out PRIVATE -Wall -O3)

add_subdirectory(pybind11)
pybind11_add_module(py_matrix "${CMAKE_SOURCE_DIR}/src/matrix.cpp")

set_target_properties(py_matrix
  PROPERTIES
  OUTPUT_NAME matrix)


# Link c_matrix into gemm_test.out executable and matrix library
target_link_libraries(gemm_test.out PRIVATE matrix)
target_link_libraries(py_matrix PUBLIC matrix)

# set output target
set_target_properties(matrix gemm_test.out py_matrix
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")
