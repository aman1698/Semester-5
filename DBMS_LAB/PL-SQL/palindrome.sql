SET SERVEROUTPUT ON

DECLARE
 
	str1 varchar(15):='&n';
	str2 varchar(15);
	i number;
	len number;

BEGIN
	len:=length(str1);
	for i in REVERSE 1..len
	loop
		str2:=str2 || substr(str1,i,1);
	end loop;

	if str1=str2 then
	dbms_output.put_line('Palindrome');
	else
	dbms_output.put_line('Not Palindrome');
	end if;

END;

/

 @p3.sql
Enter value for n: 1234
old   3:        str1 varchar(15):='&n';
new   3:        str1 varchar(15):='1234';
Not Palindrome

PL/SQL procedure successfully completed.

SQL> @p3.sql
Enter value for n: 12321
old   3:        str1 varchar(15):='&n';
new   3:        str1 varchar(15):='12321';
Palindrome

PL/SQL procedure successfully completed.
