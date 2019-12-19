def ctof(temp):
	res=(temp*1.8)+32
	return res
def ftoc(temp):
	res=(temp-32)/1.8
	return res

l1=[]
while(True):
	
	print("1-Celsius to Fahrenheit\n2-Fahrenheit to Celsius\n3-exit")
	n=int(input())
	if(n==1):
		print("Enter the temperature in celsius")
		n1=int(input())
		r1=ctof(n1)
		s1=str(n1)+"C------>"+str(r1)+"F"
		print(s1)
		l1.append(s1)
	elif(n==2):
		print("Enter the temperature in Fahrenheit")
		n2=int(input())
		r2=ftoc(n2)
		s2=str(n2)+"F------>"+str(r2)+"C"
		print(s2)
		l1.append(s2)
	else:
		print("Do you want to view the conversion\n1-yes\n2-no")
		n3=int(input())
		if(n3==1):
			print(l1)
			exit(0)
		else:
			exit(0)
		
