def dic(dict):
	
	print("Original dictionary")
	print(dict)
	n=input("Enter the symbol\n").upper()
	dict[n]=input("Enter the name of symbol\n")
	
	print("New Dictionary\n")
	print(dict)
	print("Length of dictionary: ",len(dict))
	n1=input("Enter the element you want to search\n")
	if n1 in dict:
		print("Element found")
	else:
		print("Element not found")

dict={'O':'Oyygen','S':'Sulphur','N':'Nitrogen'}
dic(dict)
