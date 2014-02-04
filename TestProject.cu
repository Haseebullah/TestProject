#include<stdio.h>
#include<cuda.h>

__global__
void Test()
{
	printf("Kernel");
}


int main()
{


	Test<<<1,1>>>();
}
