#include<stdio.h>
#include<stdlib.h>
int s;
int parent(int v,int p[20])
{
	if(p[v]==s)	
		return s;
	printf("%d <-",p[v]);
	return parent(p[v],p);
}
int bf(int G[20][20],int V,int e,int edge[20][2])
{
	int dist[20],i,j,k,u,v,p[20],flag=1,source;
	for(i=0;i<V;i++)
	{
		dist[i]=100;
		p[i]=-1;
	}
	printf("Enter source\n");
	scanf("%d",&source);
	dist[source]=0;
	for(i=0;i<V-1;i++)
	{
		for(k=0;k<e;k++)
		{
			u=edge[k][0];
			v=edge[k][1];
			if((dist[u] + G[u][v])<dist[v])
			{
				dist[v]=dist[u]+G[u][v];
				p[v]=u;
			}
		}
	}
	for(k=0;k<e;k++)
	{
		u=edge[k][0];
		v=edge[k][1];
		if((dist[u] + G[u][v])<dist[v])
		{
			flag=0;
		}
	}
	if(flag)
	{
		printf("From source verted %d to :\n",source);
		for(i=0;i<V;i++)
		{
			if(i!=source)
			{
				printf("Vertex %d cost = %d \n",i,dist[i]);
				printf("path: %d <-",i);
				printf("%d \n",parent(i,p));
			}
		}
	}
	return flag;
}

int main()
{
	int G[20][20],edge[20][2],k=0,i,j,n;
	printf("enter the no of vertices\n");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			scanf("%d",&G[i][j]);
			if(G[i][j]!=0)
			{
				edge[k][0]=i;
				edge[k++][1]=j;
			}
		}
	}
	if(bf(G,n,k,edge))
		printf("NO");
	else
		printf("YES");
}

		
