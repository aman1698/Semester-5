BEGIN{
	tcpsent=0;
	tcplost=0;
	tcpreceived=0;
	udpsent=0;
	udpreceived=0;
	udplost=0;
	totalsent=0;
	totallost=0;
}
{
	event=$1
	packettype=$5
	if(packettype == "tcp")
	{
		if(event == "+")
		{
			tcpsent++;		
		}
		if(event == "r")
		{
			tcpreceived++;		
		}
		if(event == "d")
		{
			tcplost++;		
		}
	}
	if(packettype == "cbr")
	{
		if(event == "+")
		{
			udpsent++;		
		}
		if(event == "r")
		{
			udpreceived++;		
		}
		if(event == "d")
		{
			udplost++;		
		}
	}
}
END{
	totalsent=udpsent+tcpsent;
	totallost=udplost+tcplost;
	printf("TCP packets sent : %d\n",tcpsent);
    	printf("TCP packets recieved : %d\n",tcpreceived);
    	printf("TCP packets dropped: %d\n", tcplost);
    	printf("UDP packets sent : %d\n",udpsent);
    	printf("UDP packets recieved : %d\n",udpreceived);
    	printf("UDP packets dropped: %d\n", udplost);
    	printf("Total Sent: %d\n",totalsent);
	printf("Total Dropped: %d\n",totallost);
}
