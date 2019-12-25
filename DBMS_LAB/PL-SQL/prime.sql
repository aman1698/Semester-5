SET SERVEROUTPUT ON
DECLARE
	n number;
	i number;
	flag number;

BEGIN
	i:=2;
	n:=12;
	flag:=1;

	FOR i in 2..n/2
		loop
			if mod(n,i)=0 then
				flag:=0;
				exit;
		    	end if;
		end loop;
	if flag=1 then
	dbms_output.put_line('Prime');
	else
	dbms_output.put_line('Not prime');
	end if;

END;
/



@p3.sql
Not prime

PL/SQL procedure successfully completed.

