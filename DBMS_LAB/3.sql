create table boat (
    bid int Primary Key,
    bname varchar(10),
    colour varchar(10));

create table sailor (
    sid int Primary Key,
    sname varchar(10),
    age int,
    rating int 
    );

create table reserves (
    bid int ,
    sid int ,
    day varchar(15), 
    Foreign Key(bid) references boat(bid) on DELETE CASCADE,
    Foreign Key(sid) references sailor(sid) on DELETE CASCADE,
    Primary Key(bid,sid));

desc boat;

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| bid    | int(11)     | NO   | PRI | NULL    |       |
| bname  | varchar(10) | YES  |     | NULL    |       |
| colour | varchar(10) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+


desc sailor;

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| sid    | int(11)     | NO   | PRI | NULL    |       |
| sname  | varchar(10) | YES  |     | NULL    |       |
| age    | int(11)     | YES  |     | NULL    |       |
| rating | int(11)     | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

desc reserves;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| bid   | int(11)     | NO   | PRI | NULL    |       |
| sid   | int(11)     | NO   | PRI | NULL    |       |
| day   | varchar(15) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+


insert into boat values(1,'abc','white');
insert into boat values(2,'def','grey');
insert into boat values(3,'ghi','black');

select * 
from boat;

+-----+-------+--------+
| bid | bname | colour |
+-----+-------+--------+
|   1 | abc   | white  |
|   2 | def   | grey   |
|   3 | ghi   | black  |
+-----+-------+--------+

insert into sailor values(1,'ram',20,4);
insert into sailor values(2,'Alexander',23,4.5);
insert into sailor values(3,'Jacob',22,4.2);

select *
from sailor;

+-----+-----------+------+--------+
| sid | sname     | age  | rating |
+-----+-----------+------+--------+
|   1 | ram       |   20 |      4 |
|   2 | Alexander |   23 |      5 |
|   3 | Jacob     |   22 |      4 |
+-----+-----------+------+--------+

insert into reserves values(1,1,'monday');
insert into reserves values(1,2,'tuesday');
insert into reserves values(2,2,'tuesday');
insert into reserves values(3,1,'friday');
insert into reserves values(1,3,'saturday');

select *
from reserves;

+-----+-----+----------+
| bid | sid | day      |
+-----+-----+----------+
|   1 |   1 | monday   |
|   1 |   2 | tuesday  |
|   1 |   3 | saturday |
|   2 |   2 | tuesday  |
|   3 |   1 | friday   |
+-----+-----+----------+

select bid
from reserves
where sid = (
 select sid 
 from sailor
 where sname='ram');

+-----+
| bid |
+-----+
|   1 |
|   3 |
+-----+

 select bid
 from reserve
 group by bid 
 having count(sid)=
  ( select count(*)
    from sailor);

+-----+
| bid |
+-----+
|   1 |
+-----+

select sid,count(*)
from reserves
group by sid;

+-----+----------+
| sid | count(*) |
+-----+----------+
|   1 |        2 |
|   2 |        2 |
|   3 |        1 |
+-----+----------+




