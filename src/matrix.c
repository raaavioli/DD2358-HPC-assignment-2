#include "matrix.h"

void gemm(int n, double* c, double* a, double* b) 
{
  for (size_t i = 0; i < n; i++)
  {
    for (size_t j = 0; j < n; j++)
    {
      // reset c in case it contained some value
      c[i * n + j] = 0;
      for (size_t k = 0; k < n; k++)
      {
        c[i * n + j] += a[i * n + k] * b[k * n + j];
      }
    }
  }
}

// Test to verify 'gemm' works.
//
// #include <stdio.h>
//
// int main()
// {
//   double a[4] = {4,7,2,6};
//   double b[4] = {0.6,-0.7,-0.2,0.4};
//   double c[4] = {1,1,1,1};
//
//   gemm(2, c, a, b);
//   printf("%f, %f, %f, %f \n", c[0], c[1], c[2], c[3]);
//
// }


