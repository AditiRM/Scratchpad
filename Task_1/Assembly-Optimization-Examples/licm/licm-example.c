#include <stdio.h>
#include <stdlib.h>

int main() {
    int NUM = 17000;
    static char flags[8192 + 1];
    long i, k;
    int count = 0;
    int a = 1;

    while (NUM--) {
        count = 0;
        for (i=2; i <= 8192; i++) {
	    a = NUM + 1;	
            flags[i] = 1;
        }
        for (i=2; i <= 8192; i++) {
            if (flags[i]) {
                /* remove all multiples of prime: i */
                for (k=i+i; k <= 8192; k+=i) {
                    flags[k] = 0;
                }
                count++;
            }
        }
    }
    printf("Count: %d\n", count);
    return(0);
}
