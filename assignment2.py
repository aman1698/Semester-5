dict={
	"1MS17IS001":"AMAN",
	"1MS17IS002":"Ayush",
	"1MS17IS003":"Aditya",
	"1MS17IS004":"Pranjal",
	"1MS17IS006":"Himanshu"
      }
l1=dict.keys()
#print(l1)
for i in range (0,len(l1)):
	#print(l1[i])
	a=l1[i]
	b=int(a[7:10])
	#print(type(b))
	if(b%2==0):
		print(l1[i])
		print(dict.get(a))

