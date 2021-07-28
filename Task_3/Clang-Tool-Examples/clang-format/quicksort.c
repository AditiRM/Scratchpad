#include <stdio.h>

int partition(int a[],int l,int r){
int p=a[l],i=l,j=r,s;
while(i<j){
 while(a[i]<=p && i<r){
   i+=1;
  }
 while(a[j]>p){
 j-=1;
  }
if(i<j){
 s=a[i];
 a[i]=a[j];
 a[j]=s;
}
}
if(i>=j){
a[l]=a[j];
a[j]=p;
}
return j;
}

void quicksort(int a[],int l,int r){
if(l<r){
int j=partition(a,l,r);
quicksort(a,l,j-1);
quicksort(a,j+1,r);
}
}

int main(){
int n;
printf("Enter the number of elements in the array\n");
scanf("%d",&n);
int a[n];
for(int i=0;i<n;i++){
printf("Enter number %d\n",i+1);
scanf("%d",&a[i]);
}
quicksort(a,0,n-1);
printf("The numbers arranged in non-descending order are:\n");
for(int j=0;j<n;j++){
printf("%d\n",a[j]);
}
return 0;
}
