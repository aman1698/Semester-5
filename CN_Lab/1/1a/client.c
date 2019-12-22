#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<fcntl.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<sys/socket.h>
#include<netinet/in.h>

int main(int argc , char **argv)
{
	int ns,fd,n,cs;
	int bufsize=1024;
	char fname[255];
	char *buffer=malloc(bufsize);
	
	struct sockaddr_in address;
	
	address.sin_family=AF_INET;
	address.sin_port=htons(15000);
	inet_pton(AF_INET,argv[1],&address.sin_addr);
	
	cs=socket(AF_INET,SOCK_STREAM,0);
	connect(cs,(struct sockaddr *)&address,sizeof(address));
	
	printf("Enter data\n");
	scanf("%s",fname);
	send(cs,fname,255,0);
	while((recv(cs,buffer,bufsize,0))>0)
	printf("%s",buffer);
	return close(cs);
}
