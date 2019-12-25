create table book (
     isbn int Primary Key,
     title varchar(10),
     author varchar(15),
     publisher varchar(15));


create table student (
     usn int Primary Key,
     name varchar(10),
     sem int,
     dept_no int);

create table borrow (
     isbn int,
     usn int,
     dat varchar(10),
     Foreign Key(isbn) references book(isbn) on DELETE CASCADE,
     Foreign Key(usn) references student(usn) on DELETE CASCADE,
     Primary Key(isbn,usn));

desc book;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| isbn      | int(11)     | NO   | PRI | NULL    |       |
| title     | varchar(10) | YES  |     | NULL    |       |
| author    | varchar(15) | YES  |     | NULL    |       |
| publisher | varchar(15) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+


desc student;

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| usn     | int(11)     | NO   | PRI | NULL    |       |
| name    | varchar(10) | YES  |     | NULL    |       |
| sem     | int(11)     | YES  |     | NULL    |       |
| dept_no | int(11)     | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+


desc borrow;

+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| isbn  | int(11)     | NO   | PRI | NULL    |       |
| usn   | int(11)     | NO   | PRI | NULL    |       |
| dat   | varchar(10) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+

insert into book values(1234,'networking','forouzan','abc');
insert into book values(4567,'database','Ramez','def');
insert into book values(6789,'dip','wadhera','ghi');

select *
from book;

+------+------------+----------+-----------+
| isbn | title      | author   | publisher |
+------+------------+----------+-----------+
| 1234 | networking | forouzan | abc       |
| 4567 | database   | Ramez    | def       |
| 6789 | dip        | wadhera  | ghi       |
+------+------------+----------+-----------+

insert into student values(001,'aman',5,10);
insert into student values(002,'ayush',5,11);
insert into student values(003,'ahmed',5,12);

select *
from student;

+-----+-------+------+---------+
| usn | name  | sem  | dept_no |
+-----+-------+------+---------+
|   1 | aman  |    5 |      10 |
|   2 | ayush |    5 |      11 |
|   3 | ahmed |    5 |      12 |
+-----+-------+------+---------+


insert into borrow values(1234,1,'24-08-2017');
insert into borrow values(4567,1,'22-03-2018');
insert into borrow values(4567,3,'25-07-2015');
insert into borrow values(6789,1,'21-01-2014');
insert into borrow values(6789,2,'23-08-2016');

select *
 from borrow;
+------+-----+------------+
| isbn | usn | dat        |
+------+-----+------------+
| 1234 |   1 | 24-08-2017 |
| 4567 |   1 | 22-03-2018 |
| 4567 |   3 | 25-07-2015 |
| 6789 |   1 | 21-01-2014 |
| 6789 |   2 | 23-08-2016 |
+------+-----+------------+

select name
from student
where usn in
  ( select usn
    from borrow
    where isbn=6789);

+-------+
| name  |
+-------+
| aman  |
| ayush |
+-------+


select name 
from student 
where usn in
  (select usn    
   from borrow 
   where isbn in
     ( select isbn
       from book
       where title='database'));

+-------+
| name  |
+-------+
| aman  |
| ahmed |
+-------+

select usn,count(isbn)
from borrow
group by (usn);

+-----+-------------+
| usn | count(isbn) |
+-----+-------------+
|   1 |           3 |
|   2 |           1 |
|   3 |           1 |
+-----+-------------+






