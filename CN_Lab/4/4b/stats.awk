BEGIN{
	count=0;
}
{
	event=$1;
	if(event=="d")
	{
		count++;
	}
}
END{
	printf("Total packet dropped = %d \n",count)
}
