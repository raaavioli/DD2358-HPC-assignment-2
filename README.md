# DD2358-HPC-assignment-2

## Build instructions
- git clone --recurse-submodules git@github.com:raaavioli/DD2358-HPC-assignment-2.git
- cd DD2358-HPC-assignment-2
- mkdir build && cd build && cmake .. && make && cd ..
- **Part 1**: Find *libmatrix.so* in *lib/* directory within your build directory. 
  - To add your implementation of *libmatrix.so*, simply add yours into *lib/* with the same name and run *make* in *build/*
- **Part 2**: Find executable *gemm_test.out* in *bin/* inside your build directory.
- **Part 3**: Find *matrix.cpython-38-x86_64-linux-gnu.so* or similar shared library in *lib/*.
  - **Notice**: If file has i.e suffix cpython-38-..., then make sure you have python 3.8 installed, and run the test-script with python 3.8.
  - Find *run_matrix.py* in src/
  - ./run_matrix <*dimension*> to compare matrix multiplication using both numpy.matmul and matrix.gemm.
  - If that causes problems, try: *python3.8 run_matrix.py <dimension>*
