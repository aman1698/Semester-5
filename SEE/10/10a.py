from functools import reduce
l1=[]
for i in range(0,6):
	n=int(input("Enter the element\n"))
	l1.append(n)
print(l1)
new_list=[i*3 for i in l1]
print(new_list)

sum1=reduce((lambda x,y:x+y),l1)
sum2=reduce((lambda x,y:x+y),new_list)
print(sum1,sum2)
