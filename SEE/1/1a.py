def insert():
	l=[]
	while(True):
		print("1-insert an element\n2-exit")
		n=int(input())
		if(n==1):
			print("Enter the element")
			n1=int(input())
			l.append(n1)
		else:
			return l


l1=insert()
#l1=input().split()
print("Original List: ",l1)
l1.sort()
l2=len(l1)
print("Maximum Element ",l1[l2-1])
print("Minimum Element ",l1[0])

l3=int(input("Enter the number to be inserted\n"))
l1.append(l3)
print("List after insertion : ",l1)
l4=int(input("Enter the element to be deleted\n"))
if l4 in l1:
	l1.remove(l4)
	print("List after Deletion : ",l1)
else:
	print("Element not present to be Deleted")
l5=int(input("Enter the element to be searched\n"))
if l5 in l1:
	print("Element Found")
else:
	print("Element not found")

