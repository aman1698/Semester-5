from flask import Flask,render_template,redirect,request,session,url_for
import time 
import re
app=Flask(__name__)
app.secret_key="secret"
@app.route("/",methods=['GET','POST'])
def index():
	
	try:
		balance=session["balance"]
		count=session["count"]
	except KeyError:
		balance=session["balance"]=8000
		count=session["count"]=0
	
	if(request.method=='GET'):
		return render_template("index.html",balance=balance,msg="")
	if(request.method=='POST'):
		
		if(request.form["amount"]==""):
			msg="Amount Required"
			return render_template("index.html",balance=balance,msg=msg)
		if(int(request.form["amount"])<0):
			msg="Amount cannot be negative"
			return render_template("index.html",balance=balance,msg=msg)
		if(session["count"]==5):
			msg="Limit Exceeded"
			return render_template("index.html",balance=balance,msg=msg)
		if(request.form["action"]=="Withdraw"):
			if(int(request.form["amount"])>session["balance"]):
				msg="Transaction exceeded"
				return render_template("index.html",balance=balance,msg=msg)
			elif(int(request.form["amount"])>5000):
				msg="Amount>5000 cannot be withdrawn"
				return render_template("index.html",balance=balance,msg=msg)
			else:
				balance=session["balance"]-int(request.form["amount"])
				session["balance"]=balance;
				session["count"]=session["count"]+1
				msg="Amount Withdrawn"
				return render_template("index.html",balance=balance,msg=msg)
		elif(request.form["action"]=="Deposit"):
			if(int(request.form["amount"])>10000):
				msg="Amount>10000 cannot be deposited"
				return render_template("index.html",balance=balance,msg=msg)
			else:
				balance=session["balance"]+int(request.form["amount"])
				session["balance"]=balance;
				session["count"]=session["count"]+1
				msg="Amount Deposited"
				return render_template("index.html",balance=balance,msg=msg)

if __name__=='__main__':
	app.run(host='localhost' , port='4300',debug=True)

