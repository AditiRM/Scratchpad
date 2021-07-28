This folder consists of example codes for demonstrating optimization levels

Contents:

The following examples are covered 
 i) Bubblesort
 ii) O/1 knapsack
 iii) Matrix-chain-Multiplication 
 iv) Transitive Closure of graphs

Along with the examples demo test cases are also provided for the benefit of students 

Test Case format:

i)Bubblesort : first input line is the number of elements in the array(N)
	       Subsequent lines define N elements of the array

ii) Knapsack : first line is the weight of knapsack(W) and the number of items to choose from (N)
               Subsequent lines define N items with value and weight pairs

iii) Matrix Chain Multiplication : First input line contains number of matrices (N) 
				   Subsequent lines define the dimension of matrices

iv) Trasitive Closure : First input line defines the number of vertices (V)
		        Subsequent lines define a adjacency matrix of size (VxV) 

Running the test cases:

Running the test cases is as easy as compiling any of the programs to get the compiled binary (a.out) and then redirecting the testcase

Example: 

$ clang bubble_sort.c
$ ./a.out < bubblesort_test

where < is the redirection operator

Note: Due to large test cases may encounter segmentation fault which happens due to large allocation on stack (large array allocations) which causes it to overflow.
To fix this use:

$ ulimit -s unlimited  


