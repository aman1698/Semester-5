BEGIN{
	totalsent=0;
	totalreceived=0;
	totallost=0
}
{
	event=$1;
	packettype=$5;
	if(packettype == "cbr")
	{
		if(event == "+")
		{
			totalsent++;
		}
		if(event == "r")
		{
			totalreceived++;
		}
		if(event == "d")
		{
			totallost++;
		}
	}
}
END{
	printf("Total packet Received = %d \n",totalreceived);
	printf("Total packet Dropped = %d\n ",totallost);
}
