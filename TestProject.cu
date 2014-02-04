#include<iostream>
#include<cuda.h>
#include<stdio.h>

using namespace std;

__global__
void Test(int* array_d, const int size)
{
	int id=threadIdx.y*blockDim.x+threadIdx.x;

	if(id>=size)
		return;

	printf("%d\n",array_d[id]);
}


int main()
{
	const int size=1000;

	int array[size];

	int* array_d;

	cudaMalloc((void**)&array_d, sizeof(int)*size);

	for(int i=0;i<size;i++)
	{
		array[i]=i;
	}


	cudaMemcpy(array_d,array,sizeof(int)*size,cudaMemcpyHostToDevice);

	dim3 gridblock(1,1,1);
	dim3 threadsperblock(32,32,1);



	Test<<<gridblock,threadsperblock>>>(array_d, size);
	cudaDeviceSynchronize();
	
	//This file has been edit

}
