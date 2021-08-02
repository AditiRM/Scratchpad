
// Array element addition using simple C++ on CPUs
// Note: see companion `*-gpu` file for the CUDA parallelized version.

#include <chrono>
#include <iostream>
#include <math.h>


// PRINT_TIME - calculates how many seconds since the start of the program


using namespace std::chrono;

const system_clock::time_point start = system_clock::now();

float print_time(){
    // elapsed time
    system_clock::time_point end = system_clock::now();
 
    duration<double> elapsed_seconds = end - start;
    std::time_t end_time = system_clock::to_time_t(end);
 
    float elapsed = elapsed_seconds.count();

    printf("@ %06.3fs > ", elapsed);
    return elapsed;
}

// ADD_ARRAYS adds elements of two arrays on CPU

void add_arrays(int n, float *x, float *y, float *z){
    // loop over the array index adding elements "one by one"
    for (int i = 0; i < n; i++){
        z[i] = x[i] + y[i];
    }
}

int main(void){
    print_time();
    // set up array dimensions and byte size
    printf("Setting up array dimension and size...\n");
    int N = pow(10, 9); // 100M elements per array
    size_t sizeN = N * sizeof(float);
    
    print_time();
    // allocate memory for arrays
    printf("Allocating memory for arrays...\n");
    float *x = (float *)malloc(sizeN);
    float *y = (float *)malloc(sizeN);
    float *z = (float *)malloc(sizeN);
    
    print_time();
    // initialize x, y, z arrays
    printf("Initializing arrays...\n");
    for (int i = 0; i < N; i++){
        x[i] = 2.0f;
        y[i] = 3.0f;
        z[i] = 0.0f;
    }
    
    print_time();
    // add elements (on CPU)
    printf("Adding %d elements from both arrays...\n", N);
    add_arrays(N, x, y, z);
    
    print_time();
    // sum errors to check for problems
    printf("Aggregating deltas over all elements to check for errors...\n");
    float sumOfErrors = 0.0f;
    for (int i = 0; i < N; i++)
    {
        sumOfErrors += fabs(x[i] + y[i] - z[i]);
    }
    printf("Sum of errors: %.6f\n", sumOfErrors);

    // print first and last z array contents
    printf("z[0] = %.6f\n", z[0]);
    printf("z[N-1] = %.6f\n", z[N-1]);
    
    print_time();
    // free mem when done
    printf("Freeing Memory...\n");
    delete [] x;
    delete [] y;
    delete [] z;

    print_time();
    printf("Done.\n");

    return 0;
}