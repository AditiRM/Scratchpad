echo
echo "*** Compile using clang++ compiler & time it ***"
time clang++ add-array-cpu.cpp -o ./bin/add-array-cpu # -v
echo
echo "*** Run resulting binary & time it ***"
time ./bin/add-array-cpu