dict={'O':"Oxygen","N":"Nitrogen","S":"Sulphur"}
print(dict)

sym=input("Enter new element  ").upper()
dict[sym]=input("Enter element name  ").upper()

print(dict)

print("no of terms in dictionary ",len(dict))

search=input(" enter element to be searched:  ")
if search in dict:
	print("element found")
else:
	print("not found")

