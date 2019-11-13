def C_to_F(temp):
	res=(temp*1.8)+32
	return(res)
	
def F_to_C(temp):
	res=(temp-32)/1.8
	return(res)


li1=[]
while True:
	res=int(input("Enter 1 - Celsius to Fahrenheit\n 2- Fahrenheit to Celsius\n"))

	if (res == 1):
		temp=int(input("Enter the temp in Celsius\n"))
		c=C_to_F(temp)
		li1.append(str(temp)+"---->"+str(c))
		print(li1)
	if (res == 2):
		temp=int(input("Enter the temp in Fahrenheit\n"))
		f=F_to_C(temp)
		li1.append(str(temp)+"---->"+str(f))
		print(li1)
