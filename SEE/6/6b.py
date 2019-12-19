class Sentence:
	def __init__(self,sen):
		self.sen=sen
	def reverse(self):
		word=self.sen.split()
		reverse=""
		for i in word:
			reverse=i+"  "+reverse
		return reverse
	def vowel(self):
		count=0
		vo=['A','E','I','O','U','a','e','i','o','u']
		for i in self.sen:
			if i in vo:
				count=count+1
		return count

r1=Sentence(input())
r2=Sentence(input())
r3=Sentence(input())

c1=r1.vowel()
c2=r2.vowel()
c3=r3.vowel()

worddes={
	c1:r1.reverse(),
	c2:r2.reverse(),
	c3:r3.reverse()
	}

for i in sorted(worddes.keys(), reverse=True):
	print(i,worddes[i])

		
		
