#include <pybind11/pybind11.h>
#include <pybind11/numpy.h>

extern "C" 
{
  #include "matrix.h"
}

namespace py = pybind11;

void gemm_wrapper(py::array_t<double> py_c, py::array_t<double> py_a, py::array_t<double> py_b)
{
  py::buffer_info a_buffer = py_a.request();
  py::buffer_info b_buffer = py_b.request();
  py::buffer_info c_buffer = py_c.request();

    // check dim
    if (a_buffer.ndim != 2 || b_buffer.ndim != 2) {
      throw std::runtime_error("Error: dimension of each matrix should be 2");
    }

    // check shape match
    if (a_buffer.shape[0] != a_buffer.shape[1] || b_buffer.shape[0] != b_buffer.shape[1] || c_buffer.shape[0] != c_buffer.shape[1]) {
      throw std::runtime_error("Error: matrices must be square for current gemm implementation");
    }

    // check result size
    if (c_buffer.size != a_buffer.size || c_buffer.size != b_buffer.size || a_buffer.size != b_buffer.size) {
      throw std::runtime_error("Error: all matrices must be equal size");
    }

    double* a = (double*) a_buffer.ptr;
    double* b = (double*) b_buffer.ptr;
    double* c = (double*) c_buffer.ptr;

    gemm(a_buffer.ndim, c, a, b);
}

PYBIND11_MODULE(matrix, m)
{
  m.doc() = "pybind11 matrix module";
  m.def("gemm", &gemm_wrapper, "Multiply two n*n matrices a and b, the result is stored in c");
}
