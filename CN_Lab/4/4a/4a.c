#include<stdio.h>
#include<stdlib.h>
int cost[20][20];
void df(int n,int source)
{
	int dist[20],p[20],visited[20],i,j,k,count,min,nextnode;
	for(i=0;i<n;i++)
	{
		dist[i]=cost[source][i];
		visited[i]=0;
		p[i]=source;
	}
	dist[source]=0;
	visited[source]=1;
	count=1;
	while(count<n)
	{
		min=999;
		for(i=0;i<n;i++)
		{
			if(dist[i]<min && !visited[i])
			{
				min=dist[i];
				nextnode=i;
			}
		}
		visited[nextnode]=1;
		for(i=0;i<n;i++)
		{
			if(!visited[i])
			{
				if((min+cost[nextnode][i])<dist[i])
				{
					dist[i]=min+cost[nextnode][i];
					p[i]=nextnode;
				}
			}
		}
		count++;
	}
	for(i=0;i<n;i++)
	{	
		if(i!=source)
		{
			printf("\nDistance from node %d to node %d = %d\n",i,source,dist[i]);
			printf("\nPATH = %d",i);
			j=i;
			do{
				j=p[j];
				printf("<-%d",j);
			}while(j!=source);
		}
	}
}
int main()
{
	int n,source,i,j;
	printf("enter the no of vertices\n");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			scanf("%d",&cost[i][j]);
			if(cost[i][j]==0 && i!=j)
			{
				cost[i][j]=999;
			}
		}
	}
	printf("enter the starting node\n");
	scanf("%d",&source);
	df(n,source);
	return 0;
}
