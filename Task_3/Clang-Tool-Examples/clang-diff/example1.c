#include<stdio.h>
#include<stdlib.h>

int getSize(){
   int a=5,b;
   
   switch(a){
	case 10:
	   b=15;
	   break;
   	default:
	   b=10;
   }	

   return b;
}

int main(){

  int size=getSize();
  
  int arr[size]; 
 

  for(int i=0;i<size;i++){
    arr[i]=i;	  
  }

  return 0;
}

