def AgeConvert(st):
	st=st.split("-")

	age=2019-int(st[2])
	#if( int(st[1])>11):
	if(int(st[1])>=11 and int(st[0])>12):
		age=age-1
	print(age)
AgeConvert("14-11-1998")

