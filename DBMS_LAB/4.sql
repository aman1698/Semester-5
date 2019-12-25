create table part (
    pno int,
    pname varchar(10),
    colour varchar(10),
    Primary Key(pno));


create table warehouse (
    wno int Primary Key,
    wname varchar(10),
    city varchar(10));

create table shipment (
    pno int,
    wno int,
    quantity int,
    dat varchar(10),
    Foreign Key(pno) references part(pno) on DELETE CASCADE,       
    Foreign Key(wno) references warehouse(wno) on DELETE CASCADE,    	 Primary Key(pno,wno));

desc part;

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| pno    | int(11)     | NO   | PRI | NULL    |       |
| pname  | varchar(10) | YES  |     | NULL    |       |
| colour | varchar(10) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+


desc warehouse ;

+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| wno   | int(11)     | NO   | PRI | NULL    |       |
| wname | varchar(10) | YES  |     | NULL    |       |
| city  | varchar(10) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+

desc shipment;

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| pno      | int(11)     | NO   | PRI | NULL    |       |
| wno      | int(11)     | NO   | PRI | NULL    |       |
| quantity | int(11)     | YES  |     | NULL    |       |
| dat      | varchar(10) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

insert into part values (1,'bolt','grey');
insert into part values (2,'screw','gold');
insert into part values (3,'pin','silver');
insert into part values (4,'nut','grey');

select *
from part;

+-----+-------+--------+
| pno | pname | colour |
+-----+-------+--------+
|   1 | bolt  | grey   |
|   2 | screw | gold   |
|   3 | pin   | silver |
|   4 | nut   | grey   |
+-----+-------+--------+

insert into warehouse values (1,'abc','bangalore');
insert into warehouse values (2,'def','chennai');
insert into warehouse values (3,'ghi','mysore');

select *
from warehouse;

+-----+-------+-----------+
| wno | wname | city      |
+-----+-------+-----------+
|   1 | abc   | bangalore |
|   2 | def   | chennai   |
|   3 | ghi   | mysore    |
+-----+-------+-----------+

insert into shipment values (1,1,10,'28-02-2017');
insert into shipment values (2,1,30,'25-03-2017');
insert into shipment values (4,3,20,'24-08-2017');
insert into shipment values (3,1,50,'26-07-2017');
insert into shipment values (3,3,80,'21-02-2017');
insert into shipment values (4,1,40,'20-10-2017');
insert into shipment values (3,2,35,'23-08-2018');
insert into shipment values (4,2,45,'23-07-2019');


select *
from shipment;

+-----+-----+----------+------------+
| pno | wno | quantity | dat        |
+-----+-----+----------+------------+
|   1 |   1 |       10 | 28-02-2017 |
|   2 |   1 |       30 | 25-03-2017 |
|   3 |   1 |       50 | 26-07-2017 |
|   3 |   2 |       35 | 23-08-2018 |
|   3 |   3 |       80 | 21-02-2017 |
|   4 |   1 |       40 | 20-10-2017 |
|   4 |   2 |       45 | 23-07-2019 |
|   4 |   3 |       20 | 24-08-2017 |
+-----+-----+----------+------------+



select wname  
from warehouse  
where wno in  
  ( select wno   
    from shipment 
    where pno in 
     ( select pno 
       from part
       where colour='grey'));

+-------+
| wname |
+-------+s
| abc   |
| ghi   |
+-------+

select wno,count(pno)
from shipment
group by wno;

+-----+------------+
| wno | count(pno) |
+-----+------------+
|   1 |          4 |
|   2 |          2 |
|   3 |          2 |
+-----+------------+

select pno 
from shipment1 
group by pno 
having count(wno)=
  ( select count(*)
    from warehouse);

+-----+
| pno |
+-----+
|   3 |
|   4 |
+-----+





