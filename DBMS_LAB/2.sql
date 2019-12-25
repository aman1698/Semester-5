create table part (
    pno int Primary Key,
    pname varchar(10),
    colour varchar(10));


create table supplier (
    sno int Primary Key,
    sname varchar(10),
    address varchar(15));

create table supply1 (
    pno int,
    sno int,
    quantity int,
    Foreign Key(pno) references part(pno) on delete cascade,
    Foreign Key(sno) references supplier(sno) on delete cascade,
    Primary Key(pno,sno));

desc part;

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| pno    | int(11)     | NO   | PRI | NULL    |       |
| pname  | varchar(10) | YES  |     | NULL    |       |
| colour | varchar(10) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

desc supplier;

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| sno     | int(11)     | NO   | PRI | NULL    |       |
| sname   | varchar(10) | YES  |     | NULL    |       |
| address | varchar(15) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

desc supply;

+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| pno      | int(11) | NO   | PRI | NULL    |       |
| sno      | int(11) | NO   | PRI | NULL    |       |
| quantity | int(11) | YES  |     | NULL    |       |
+----------+---------+------+-----+---------+-------+

insert into part values(1,'bolt','silver');
insert into part values(2,'screw','gold');
insert into part values(3,'pin','grey');
insert into part values(4,'nut','grey');

select *
from part;

+-----+-------+--------+
| pno | pname | colour |
+-----+-------+--------+
|   1 | bolt  | silver |
|   2 | screw | gold   |
|   3 | pin   | grey   |
|   4 | nut   | grey   |
+-----+-------+--------+

insert into supplier values(1,'ram','bangalore');
insert into supplier values(2,'Alexander','chennai');
insert into supplier values(3,'jacob','mysore');

select *
from supplier;

+-----+-----------+-----------+
| sno | sname     | address   |
+-----+-----------+-----------+
|   1 | ram       | bangalore |
|   2 | Alexander | chennai   |
|   3 | jacob     | mysore    |
+-----+-----------+-----------+

insert into supply values(1,1,10);
insert into supply values(2,1,20);
insert into supply values(2,3,40);
insert into supply values(4,2,50);
insert into supply values(3,1,70);

select *
from supply;

+-----+-----+----------+
| pno | sno | quantity |
+-----+-----+----------+
|   1 |   1 |       10 |
|   2 |   1 |       20 |
|   2 |   3 |       40 |
|   3 |   1 |       70 |
|   4 |   2 |       50 |
+-----+-----+----------+

select pno 
from supply
where sno = 
(select sno 
from supplier
where sname='ram');

+-----+
| pno |
+-----+
|   1 |
|   2 |
|   3 |
+-----+

select sname 
from supplier
where  sno = 
( select sno  
  from supply 
  where pno = 
    (select pno  
     from part 
     where pname='bolt'));

+-------+
| sname |
+-------+
| ram   |
+-------+


delete from part where colour='grey';

select *
from part;

+-----+-------+--------+
| pno | pname | colour |
+-----+-------+--------+
|   2 | screw | gold   |
|   3 | pin   | silver |
+-----+-------+--------+







