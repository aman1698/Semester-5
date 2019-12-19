import sys
import os
from functools import reduce

dict={}
if(len(sys.argv)!=2):
	print("Invalid argument")
if(not(os.path.exists(sys.argv[1]))):
	print("path does not exist")
if(sys.argv[1].split(".")[-1]!="txt"):
	print("Only txt files allowed")

with open(sys.argv[1]) as file:
	for line in file:
		for word in line.split():
			dict[word]=dict.get(word,0)+1
	print(dict)

s1=[]
s1=sorted(dict.items(),key=lambda x:x[1],reverse=True)
print(s1[:10])

word=[]
for i,j in s1[:10]:
	word.append(len(i))
print(word)

sum=reduce((lambda x,y:x+y),word)
print("Average is ", sum/len(word))

print([x*x for x in word if x%2!=0])
