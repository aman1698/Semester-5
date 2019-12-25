create table employee 
	( ssn int Primary Key,
	  name varchar(10), 
	  deptno int
	);

 desc employee

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| ssn    | int(11)     | NO   | PRI | NULL    |       |
| name   | varchar(10) | YES  |     | NULL    |       |
| deptno | int(11)     | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

create table project (
    	project_no int Primary Key,
        project_area varchar(10)
     );

desc project;

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| project_no   | int(11)     | NO   | PRI | NULL    |       |
| project_area | varchar(10) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

create table assigned_to (
    usn int,
    project_no int,
    Foreign Key(usn) references employee(ssn),
    Foreign Key(project_no) references project(project_no),
    Primary Key(usn,project_no)
);

desc assigned_to;

+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| usn        | int(11) | NO   | PRI | NULL    |       |
| project_no | int(11) | NO   | PRI | NULL    |       |
+------------+---------+------+-----+---------+-------+

insert into employee values(001,'aman',1);
insert into employee values(002,'ayush',2);
insert into employee values(003,'ahmed',3);
insert into employee values(004,'sarvesh',4);

select * 
from employee;

+-----+---------+--------+
| ssn | name    | deptno |
+-----+---------+--------+
|   1 | aman    |      1 |
|   2 | ayush   |      2 |
|   3 | ahmed   |      3 |
|   4 | sarvesh |      4 |
+-----+---------+--------+

insert into project values(10,'database');
insert into project values(11,'Networking');
insert into project values(12,'Cloud');
insert into project values(13,'android');

select *
from project;

+------------+--------------+
| project_no | project_area |
+------------+--------------+
|         10 | database     |
|         11 | Networking   |
|         12 | Cloud        |
|         13 | android      |
+------------+--------------+

insert into assigned_to values(1,10);
insert into assigned_to values(2,10);
insert into assigned_to values (2,11);
insert into assigned_to values (3,12);
insert into assigned_to values (4,13);
insert into assigned_to values (3,13);
insert into assigned_to values (4,12);
insert into assigned_to values (1,13);

select *
from assigned_to;

+-----+------------+
| usn | project_no |
+-----+------------+
|   1 |         10 |
|   2 |         10 |
|   2 |         11 |
|   3 |         12 |
|   4 |         12 |
|   1 |         13 |
|   3 |         13 |
|   4 |         13 |
+-----+------------+

select usn
from assigned_to
where project_no=
  ( select project_no
    from project
    where project_area='database');

+-----+
| usn |
+-----+
|   1 |
|   2 |
+-----+

select deptno,count(ssn)
from employee
group by (deptno);

+--------+------------+
| deptno | count(ssn) |
+--------+------------+
|      1 |          1 |
|      2 |          1 |
|      3 |          1 |
|      4 |          1 |
+--------+------------+

delete from assigned_to where usn=1 and project_no=13;


select *
from assigned_to;

+-----+------------+
| usn | project_no |
+-----+------------+
|   1 |         10 |
|   2 |         10 |
|   2 |         11 |
|   3 |         12 |
|   4 |         12 |
|   3 |         13 |
|   4 |         13 |
+-----+------------+

update assigned_to 
set project_no = 12 
where usn=1;

select *
from assigned_to;

+-----+------------+
| usn | project_no |
+-----+------------+
|   2 |         10 |
|   2 |         11 |
|   1 |         12 |
|   3 |         12 |
|   4 |         12 |
|   3 |         13 |
|   4 |         13 |
+-----+------------+








