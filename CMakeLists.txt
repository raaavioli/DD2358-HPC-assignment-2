# define the minimum CMake version
cmake_minimum_required(VERSION 3.1)

# create a new C project
project(DD2358-assignment-2 VERSION 1.0
  DESCRIPTION "Assignment 2 build"
  LANGUAGES Fortran C)

# set compilers
set(CMAKE_C_COMPILER gcc)
set(CMAKE_FC_COMPILER gfortran)

# add the source files that are needed to build an exe
add_executable(gemm_test.out # our executable is the target
  src/matrix.f90
  src/gemm_test.f90
)

# Setup matrix library
add_library(matrix 
  SHARED 
  src/matrix.c)

target_include_directories(matrix PRIVATE include)
set_target_properties(matrix
  PROPERTIES
  LIBRARY_OUTPUT_DIRECTORY "lib/")

target_link_libraries(gemm_test.out PUBLIC matrix)

# set output target
set_target_properties(gemm_test.out
  PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY "lib/"
  LIBRARY_OUTPUT_DIRECTORY "lib/"
  RUNTIME_OUTPUT_DIRECTORY "bin/")

# set compiler options
target_compile_options(gemm_test.out PRIVATE -Wall -O3)

# specify what to install when we run 'make install'
install(TARGETS gemm_test.out DESTINATION bin) 
