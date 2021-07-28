#include <stdio.h>

int main() {
    int NUM = 17000;
    static char flags[8192 + 1];
    long i, k;
    int count = 0;
    int a = 1;
    a++;
    k=NUM+1;
    printf("%ld\n", k);
    return 0;
}
