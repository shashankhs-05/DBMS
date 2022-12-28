create database flight;
use flight;

create table flights(
flno int primary key,
place_from varchar(25),
place_to varchar(25),
distance int,
departs time,
arrival time,
price int);

create table aircraft(
aid int primary key,
aname varchar(25),
cruisingrange int
);

create table employee(
eid int primary key,
ename varchar(25),
salary int
);

create table certified(
eid int,
aid int,
primary key(eid,aid),
foreign key(aid) references aircraft(aid) on delete cascade,
foreign key(eid) references employee(eid) on delete cascade
);

insert into flights values
(1,"Bengaluru","New Delhi",500,"6:00","9:00",5000),
(2,"Bengaluru","Chennai",300,"7:00","8:30",3000),
(3,"Trivandrum","New Delhi",800,"8:00","11:30",6000),
(4,"Bengaluru","Frankfurt",10000,"6:00","23:30",50000),
(5,"Kolkata","New Delhi",2400,"11:00","3:30",9000),
(6,"Bengaluru","Frankfurt",8000,"9:00","23:00",40000);

select * from flights;

insert into aircraft values
(1,"Airbus",2000),
(2,"Boeing",700),
(3,"JetAirways",550),
(4,"Indigo",5000),
(5,"Boeing",4500),
(6,"Airbus",2200);

select * from aircraft;

insert into employee values
(101,"Avinash",50000),
(102,"Lokesh",60000),
(103,"Rakesh",70000),
(104,"Santhosh",82000),
(105,"Tilak",5000);

insert into certified values
(101,2),(101,4),(101,5),(101,6),(102,1),(102,3),(102,5),(103,2),
(103,3),(103,5),(103,6),(104,6),(104,1),(104,3),(105,3);

select * from certified;


select a.aname from aircraft a,certified c 
where a.aid=c.aid and c.eid in (select eid from employee where salary>80000);


select c.eid, max(a.cruisingrange) from certified c, aircraft a 
where a.aid in (select aid from certified c1 where c1.eid=c.eid) 
group by c.eid having count(c.eid)>=3;


select ename from employee 
where salary<(select min(price) from flights where place_from='Bengaluru' and place_to='Frankfurt');

select distinct e.ename from employee e, certified c 
where e.eid=c.eid and c.aid in (select aid from aircraft where aname='Boeing');


select aid from aircraft 
where cruisingrange > all(select distance from flights 
where place_from='Bengaluru' and place_to='Delhi');

select a.aid,a.aname,avg(e.salary)
from aircraft a,employee e,certified c
where a.aid=c.aid and
e.eid=c.eid
and a.cruisingrange>1000
group by a.aid;
