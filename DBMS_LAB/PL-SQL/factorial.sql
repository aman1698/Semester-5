SET SERVEROUTPUT ON

DECLARE 
	t number;
	fact number;

PROCEDURE factorial (n in number,fact1 out number) is
   i number;
	
   BEGIN	
	fact1:=1;
	for i in 1..n
   	loop
		 fact1:=fact1*i;
	end loop;
  END;
 
BEGIN
 t:=&t;
 factorial(t,fact);
 dbms_output.put_line('Factorial is '|| fact);

END;
/


@p3.sql
Enter value for t: 5
old  17:  t:=&t;
new  17:  t:=5;
Factorial is 120

PL/SQL procedure successfully completed.

