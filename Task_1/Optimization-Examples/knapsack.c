#include<stdio.h>
int max(int a, int b) { return (a > b)? a : b; }
int knapSack(int W, int wt[], int val[], int n)
{
   int i, w;
   int K[n+1][W+1];
   for (i = 0; i <= n; i++)
   {
       for (w = 0; w <= W; w++)
       {
           if (i==0 || w==0)
               K[i][w] = 0;
           else if (wt[i-1] <= w)
                 K[i][w] = max(val[i-1] + K[i-1][w-wt[i-1]],  K[i-1][w]);
           else
                 K[i][w] = K[i-1][w];
       }
   }
   return K[n][W];
}
int main()
{
    int num_items, W;
    
    scanf("%d %d", &W,&num_items);
   
    int val[num_items], wt[num_items];

    for(int i = 0;i < num_items; ++i){
     scanf("%d %d", &val[i], &wt[i]);
    }
    
    printf("%d", knapSack(W, wt, val, num_items));
    return 0;
}
