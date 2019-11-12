def odd(num1,num2):
	st=list()
	for i in range (num1,num2):
		if( i % 2 !=0):
			st.append(i)
	print(st)

odd(1,10)
