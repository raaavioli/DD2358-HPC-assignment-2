# define the minimum CMake version
cmake_minimum_required(VERSION 3.1)

# create a new C project
project(DD2358-assignment-2 VERSION 1.0
  DESCRIPTION "Assignment 2 build"
  LANGUAGES Fortran C CXX)

# add the source files that are needed to build an exe
add_executable(gemm_test.out # our executable is the target
  src/matrix.f90
  src/gemm_test.f90
)

# Setup c_matrix library
add_library(c_matrix 
  SHARED 
  src/matrix.c)

target_include_directories(c_matrix PRIVATE include)
set_target_properties(c_matrix
  PROPERTIES
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/")

target_link_libraries(gemm_test.out PUBLIC c_matrix)

# set output target
set_target_properties(gemm_test.out
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")

# set compiler options
target_compile_options(gemm_test.out PRIVATE -Wall -O3)

add_subdirectory(pybind11)
pybind11_add_module(matrix
  "${CMAKE_SOURCE_DIR}/src/matrix.cpp"
)

target_include_directories(matrix
  PUBLIC
  "${CMAKE_SOURCE_DIR}/include/")

target_link_libraries(matrix PRIVATE "${CMAKE_SOURCE_DIR}/lib/libc_matrix.so")

add_dependencies(matrix c_matrix)

set_target_properties(gemm_test.out
  PROPERTIES
  LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/")
