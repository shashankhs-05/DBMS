create database shaa;
use shaa;
create table person(
driver_id varchar(20) primary key,
name varchar(20),
address varchar(20));
create table car(
reg_num char(10) primary key,
model char(10),
year year);show tables;
desc person;
desc car;
create table owns(
driver_id varchar(20),
reg_num char(10) ,
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
create table accident(
report_num int(4) primary key,
accident_date date ,
location varchar(20));

alter table owns
add constraint primary(driver_id,reg_num);
desc accident;
show tables;
create table participated(
driver_id varchar(20),
reg_num char(10),
report_num int(4),
damage_amt int(5),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
desc participated;
insert into person values('a1234','shashank','bengaluru');
insert into person values('b1234','skanda','mangalore');
insert into person values('c1234','sharavanth','mysore');
select * from person;
alter table car
modify reg_num varchar(20);
insert into car values('KA41ET1234','honda',2020);
insert into car values('KA6979','toyota',2021);
insert into car values('4567','audi',1999);
select * from car;
select * from owns;
insert into owns values('a1234','KA41ET1234');
insert into owns values('b1234','KA6979');
insert into owns values('c1234','4567');
insert into accident values(11,'2020-11-19','bengaluuru');
insert into accident values(12,'2020-11-18','bengaluuru');
insert into accident values(13,'2020-11-17','bengaluuru');
insert into participated values('a1234','KA41ET1234',11,12345);
insert into participated values('b1234','KA6979',12,54321);
insert into participated values('c1234','4567',13,45795);
select * from participated;
select * from person where address like '%u';
select * from participated where damage_amt>20000; 
