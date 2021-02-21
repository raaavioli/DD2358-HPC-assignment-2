# DD2358-HPC-assignment-2

## Instructions
- git clone --recurse-submodules git@github.com:raaavioli/DD2358-HPC-assignment-2.git
- cd DD2358-HPC-assignment-2
- mkdir build && cd build && cmake .. && make && cd ..
- **Part 1**: Find *libc_matrix.so* in *lib/* directory. 
  - Library is named libc_matrix.so due to naming conflicts in cmake, as matrix-module in part 3 also has the variable name *matrix*.
- **Part 2**: Find executable *gemm_test.out* in *bin/* directory.
- **Part 3**: Find *matrix.cpython-38-x86_64-linux-gnu.so* or similar shared library in *lib/*.
  - **Notice**: If file has i.e suffix cpython-38-..., then make sure you have python 3.8 installed, and run the test-script with python 3.8.
  - Find *run_matrix.py* in src/
  - ./run_matrix <*dimension*> to compare matrix multiplication using both numpy.matmul and matrix.gemm.
  - If that causes problems, try: *python3.8 run_matrix.py <dimension>*
