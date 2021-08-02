echo
# echo
# echo "*** Run NVIDIA profiler & time it ***"
# time nvprofil ./bin/add-array-gpu
echo "*** Compile using NVIDIA CUDA compiler & time it ***"
time nvcc add-array-gpu.cu -o ./bin/add-array-gpu # -V
echo
echo "*** Run resulting binary & time it ***"
time ./bin/add-array-gpu
