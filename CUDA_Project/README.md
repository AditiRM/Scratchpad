# Parallelized Array Element Addition

Simple example on how to (partially) parallelize operations such as vector addition in the format:
`x[i] + y[i] = z[i]`

This project compares linear C++ code running on the CPU vs parallel CUDA code running on the GPU. 
Mostly focusing on the differences between both implementations.
## Get started

- C++/CPU implementation:
    - Make + Run: [make-run-cpu.sh](make-run-cpu.sh)
    - Source code: [add-array-cpu.cpp](add-array-cpu.cpp)
    - *nix binary: [bin/add-array-cpu](bin/add-array-cpu)
- CUDA/GPU implementation:
    - Make + Run: [make-run-gpu.sh](make-run-gpu.sh)
    - Source code: [add-array-gpu.cu](add-array-gpu.cu)
    - *nix binary: [bin/add-array-gpu](bin/add-array-gpu)

## Performance

### Volume of data

- 3 arrays * 100M elements each = 300M elements total.

### Results overview

- GPU has ~12x speed vs CPU.

### C++/CPU implementation results

```bash
> ./make-run-cpu.sh

*** Compile using clang++ compiler & time it ***

real	0m0.579s
user	0m0.270s
sys	0m0.269s

*** Run resulting binary & time it ***
@ 00.000s > Setting up array dimension and size...
@ 00.000s > Allocating memory for arrays...
@ 00.000s > Initializing arrays...
@ 09.372s > Adding 1000000000 elements from both arrays...
@ 20.069s > Aggregating deltas over all elements to check for errors...
Sum of errors: 0.000000
z[0] = 5.000000
z[N-1] = 5.000000
@ 33.474s > Freeing memory...
@ 34.567s > Done.

real	0m34.573s
user	0m15.531s
sys	0m14.253s
```

### CUDA/GPU implementation results:

```bash
> ./make-run-gpu.sh

*** Compile using NVIDIA CUDA compiler & time it ***

real	0m2.326s
user	0m1.678s
sys	0m0.494s

*** Run resulting binary & time it ***
@ 00.000s > Setting up array dimension and size...
@ 00.000s > Allocating memory for arrays...
@ 00.314s > Initializing arrays...
@ 01.114s > Copying arrays from host to device...
@ 02.185s > Adding 100000000 elements from both arrays...
Kernel using 256 threads for each of 390625 blocks.
@ 02.189s > Copying arrays from device back to host...
@ 02.470s > Aggregating deltas over all elements to check for errors...
Sum of errors: 0.000000
hz[0] = 5.000000
hz[N-1] = 5.000000
@ 02.831s > Freeing memory...
@ 02.955s > Done.

real	0m3.641s
user	0m2.228s
sys	0m1.356s
```