#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define MIN(x,y) (x>y)?y:x

int main()
{
	int rate=10,drop=0,cap=100,count=0,inp[30]={0},nsec,i=0,x;
	printf("Bucket size = %d \n",cap);
	printf("Output rate = %d \n",rate);
	srand(time(0));
	
	do{
		inp[i]=rand()%200;
		printf("No of packet coming at second %d : %d \n",(i+1),inp[i]);
		i++;
	}while(i<5);
	
	nsec=i;
	printf("Seconds \t  received \t  sent \t  dropped \t  remaining\n");
	for(i=0;count || i<nsec ;i++)
	{
		printf("\t%d\t",(i+1));
		printf("\t%d\t",inp[i]);
		printf("\t%d\t",MIN((inp[i]+count),rate));
		if((x=inp[i]+count-rate)>0)
		{
			if(x>cap)
			{
				count=cap;
				drop=x-cap;
			}
			else	
			{
				count=x;
				drop=0;
			}
		}
		else
		{
			count=0;
			drop=0;
		}
		printf("\t%d\t\t\%d\n",drop,count);
	}
	return 0;
}
