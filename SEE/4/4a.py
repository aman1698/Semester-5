class Rectangle:
	def __init__(self,length=10,breadth=5):
		self.length=length
		self.breadth=breadth
		self.area=(self.length)*(self.breadth)
	def modify(self):
		self.length=int(input("Enter the length\n"))
		self.breadth=int(input("Enter the breadth\n"))
		self.area=(self.length)*(self.breadth)
	def display(self):
		print("Length ",self.length)	
		print("Breadth ",self.breadth)
		print("Area ",self.area)

r=Rectangle()
while(True):
	print("1-display\n2-modify\n3-exit")
	n=int(input())
	if(n==1):
		r.display()
	elif(n==2):
		r.modify()
	else:
		exit(0)

