class Student:
	def __init__(self,name="Aman",age=20):
		self.name=name
		self.age=age
		self.marks=[40,40,40]
	def display(self):
		print("Name : ",self.name)
		print("Age : ",self.age)
		print("marks : ",self.marks)
	def modify(self):
		self.name=input("Enter the name\n")
		self.age=int(input("Enter the age\n"))
		self.marks[0]=int(input("Enter marks in 1st subject\n"))
		self.marks[1]=int(input("Enter marks in 2nd subject\n"))
		self.marks[2]=int(input("Enter marks in 3rd subject\n"))
s=Student()
while(True):
	print("1-display\n2-modify\n3-exit")
	n=int(input())
	if(n==1):
		s.display()
	elif(n==2):
		s.modify()
	else:
		exit(0)

