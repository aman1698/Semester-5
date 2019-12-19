from flask import Flask,render_template,redirect,request,url_for,session
import time
import re
app=Flask(__name__)
app.secret_key=("secret")
@app.route("/",methods=['GET','POST'])
def index():
	
	if(request.method=='GET'):
		return render_template("student.html",msg="")
	if(request.method=='POST'):
		if(request.form["usn"]=="" or request.form["dob"]=="" or request.form["m1"]=="" or request.form["m2"]=="" or request.form["m3"]==""):
			return render_template("student.html",msg="Details Required")
		elif(int(request.form["m1"])<0 or int(request.form["m2"])<0 or int(request.form["m3"])<0 ):
			return render_template("student.html",msg="Negative marks not allowed")
		else:
			try:
				time.strptime(request.form["dob"],"%d/%m/%Y")
			except ValueError:
				return render_template("student.html",msg="Date in invalid")
		
			if re.match('^[1][A-Z][A-Z][1][0-9][A-Z][A-Z][0-9][0-9][0-9]$',request.form["usn"]):
				avg=(int(request.form["m1"])+int(request.form["m2"])+int(request.form["m3"]))/3;
				return render_template("student.html",msg="Average="+str(avg))
			else:
				return render_template("student.html",msg="Invalid usn")
if __name__=='__main__':
	app.run(host='localhost',port="4600",debug=True)

