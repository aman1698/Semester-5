def C_to_F(temp):
	res=(temp*1.8)+32
	print(res)
	
def F_to_C(temp):
	res=(temp-32)/1.8
	print(res)

while True:
	res=int(input("Enter 1 - Celsius to Fahrenheit\n 2- Fahrenheit to Celsius\n"))

	if (res == 1):
		temp=int(input("Enter the temp in Celsius\n"))
		C_to_F(temp)
	if (res == 2):
		temp=int(input("Enter the temp in Fahrenheit\n"))
		F_to_C(temp)
	
