class Student:
	def __init__(self,name="Aman",age=20):
		self.name = name
		self.age = age
		self.marks = [100,100,100]
	def display(self):
		print("name  : ", self.name)
		print("age  : ", self.age)
		print("marks in three subject  : ", self.marks)
	def modify(self):
		self.name=input("Enter name")
		self.age=int(input("Enter age"))
		self.marks[0]=int(input("enter marks 1"))
		self.marks[1]=int(input("enter marks 2"))
		self.marks[2]=int(input("enter marks 3"))

st=Student()

while True:
	res=int(input("Enter response (1-display,2-modify,3-exit)"))
	if res==1:
		st.display()
	elif res==2:
		st.modify()
	elif res==3:
		exit(0)
	else: 
		print("Invalid Response")

	
