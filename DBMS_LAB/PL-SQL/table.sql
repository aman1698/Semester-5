create table branch_detail (
  2   code varchar(2) Primary Key,
  3   name varchar(3),
  4  assests number );

Table created.

SQL> create table customer_detail (
  2   ssn number Primary Key,
  3  name varchar(20),
  4  place varchar(3) );

Table created

SQL> create table account_detail (
  2    accno varchar(2) Primary Key,
  3    ssn number,
  4    code varchar(2),
  5    balance number,
  6   Foreign Key(ssn) references customer_detail(ssn) on delete cascade,
  7   Foreign Key(code) references branch_detail(code) on delete cascade);

Table created.

SQL> create table employee_detailcopy (
  2    ssn number Primary Key,
  3    name varchar(20),
  4    salary number,
  5    deptno number);

Table created.

insert into branch_detail values('&code','&name',&assests);
Enter value for code: c1
Enter value for name: msr
Enter value for assests: 10000
old   1: insert into branch_detail values('&code','&name',&assests)
new   1: insert into branch_detail values('c1','msr',10000)

1 row created.

SQL> insert into branch_detail values('&code','&name',&assests);
Enter value for code: c2
Enter value for name: rnr
Enter value for assests: 20000
old   1: insert into branch_detail values('&code','&name',&assests)
new   1: insert into branch_detail values('c2','rnr',20000)

1 row created.

SQL> insert into branch_detail values('&code','&name',&assests);
Enter value for code: c3
Enter value for name: smr
Enter value for assests: 15000
old   1: insert into branch_detail values('&code','&name',&assests)
new   1: insert into branch_detail values('c3','smr',15000)

1 row created.

insert into customer_detail values(1,'ram','bng');

1 row created.

SQL> insert into account_detail values('a1',1,'c1',20000);

1 row created.

SQL> insert into customer_detail values(2,'sri','del');

1 row created.

SQL> insert into account_detail values('a2',2,'c1',15000);

1 row created.

SQL> insert into employee_detail values(111,'ram',100000,10);

1 row created.

SQL> insert into employee_detail values(121,'sri',120000,11);

1 row created.


BEGIN
	
 	for rec in (select * from branch_detail)
	 loop
		dbms_output.put_line('CODE :'||rec.code||'Name :'||rec.name||'ASSESTS :'||rec.assests);
	end loop;

	for rec in (select * from account_detail)
	 loop
		dbms_output.put_line('Account no :'||rec.accno||'SSN :'||rec.ssn||'Code :'||rec.code||'Balance :'||rec.balance);
	end loop;

	update account_detail
	set balance = 13000
	where ssn=1;
	
	dbms_output.put_line('Some rows are updated');	

	for rec in (select * from account_detail)
	 loop
		dbms_output.put_line('Account no :'||rec.accno||'SSN :'||rec.ssn||'Code :'||rec.code||'Balance :'||rec.balance);
	end loop;
	
	
END;
/



 @ p1.sql
CODE :c1Name :msrASSESTS :10000
CODE :c2Name :rnrASSESTS :20000
CODE :c3Name :smrASSESTS :15000
Account no :a1SSN :1Code :c1Balance :20000
Account no :a2SSN :2Code :c1Balance :15000
Some rows are updated
Account no :a1SSN :1Code :c1Balance :13000
Account no :a2SSN :2Code :c1Balance :15000

PL/SQL procedure successfully completed.


SET SERVEROUTPUT ON

BEGIN
	
 	update employee_detail
	set salary=salary + (salary*0.15)
	where deptno = 10;

	dbms_output.put_line(TO_Char(SQL%ROWCOUNT) ||'rows affected');
	
END;
/

 @ p1.sql
1rows affected

PL/SQL procedure successfully completed.
