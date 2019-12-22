#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define N strlen(g)

char t[28],cs[28],g[]="10001000000100001";
int a,e,c;
void xor()
{
	for(c=1;c<N;c++)
	{
		cs[c]=((cs[c]==g[c]) ? '0':'1');
	}
}
void crc()
{
	for(e=0;e<N;e++)
		cs[e]=t[e];
	do{
		if(cs[0]=='1')
			xor();
		for(c=0;c<N-1;c++)
			cs[c]=cs[c+1];
		cs[c]=t[e++];
	}while(e<=a+N-1);
}

void main()
{
	printf("Enter data\n");
	scanf("%s",t);
	printf("Generating Polynomial ---> %s\n",g);
	a=strlen(t);
	for(e=a;e<a+N-1;e++)
		t[e]='0';
	printf("Padded data ---> %s\n",t);
	crc();
	printf("Checksum --->%s\n",cs);
	for(e=a;e<a+N-1;e++)
		t[e]=cs[e-a];
	printf("Final Codeword --->%s\n",t);
	printf("Enter 1 for errorneous data and 2 for not\n");
	scanf("%d",&e);
	if(e==1)
	{
		do{
			printf("Enter the postion where error is to be inserted\n");
			scanf("%d",&e);
		 }while(e==0 || e>a+N-1);
		t[e-1]=((t[e-1]=='0') ? '1':'0');
		printf("Erroneous data ---> %s\n", t);
	}
	crc();
	for(e=0;(e<N-1) && (cs[e]!='1');e++)
	{
	}
	if(e<N-1)
		printf("error detected\n");
	else
		printf("no error detected\n");
	
}

