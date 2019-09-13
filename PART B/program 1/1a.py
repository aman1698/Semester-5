#Write a Python Program to read a list of elements
#Create a function to hold all the elements minus the duplicates elements(use function)


def duplicate(list):
	newlist=[];
	for i in list:
		if i not in newlist:
			newlist.append(i)
	print(newlist)
			

input_string = input("Enter a list element separated by space ")
list  = input_string.split()
print(list)
duplicate(list)
