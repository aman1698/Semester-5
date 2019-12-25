SET SERVEROUTPUT ON

DECLARE 
	
	first number:=0;
	second number:=1;
	third number;
	i number;
	n number:=8;

BEGIN
	dbms_output.put_line(first);
	dbms_output.put_line(second);
	for i in 2..n
	loop
		third:=first+second;
		first:=second;
		second:=third;
		dbms_output.put_line(third);
	end loop;
END;
/
	
@p3.sql
0
1
1
2
3
5
8
13
21

PL/SQL procedure successfully completed.
