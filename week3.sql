create database bank;
use bank;
create table branch(
name varchar(20) primary key,
city varchar(20),
assets real);
create table bank_Account(
account_no int,
branch_name varchar(20) , balance real,
primary key(account_no,branch_name),
foreign key(branch_name) references branch(name));
create table customer(
customer_name varchar(20),
customer_street varchar(20),
city varchar(20));
alter table customer
add primary key(customer_name);
create table depositor(
customer_name varchar(20),
account_no int,
primary key(customer_name,account_no),
foreign key(customer_name) references customer(customer_name) on delete cascade,
foreign key(account_no) references bank_account(account_no) on delete cascade);
create table loan(
loan_no int , branch_name varchar(20) primary key,amount real,
foreign key(branch_name) references branch(name));
select *from customer;
insert into branch values ('SBI_Chamarajpet','Bengalore',50000);
insert into branch values('SBI_ResidencyRoad','Bengalore',10000);
insert into branch values('SBI_ShivajiRoad','Bengalore',20000);

insert into branch values('SBI_ParlimentRoad','Delhi',10000);
insert into branch values('SBI_Jantarmantar','Delhi',20000);
insert into bank_account values (1,'SBI_Chamarajpet',2000);
insert into bank_account values(2,'SBI_ResidencyRoad',5000);
insert into bank_account values(3,'SBI_ShivajiRoad',6000);
insert into bank_account values(4,'SBI_ParlimentRoad',9000);
insert into bank_account values(5,'SBI_Jantarmantar',8000);
insert into bank_account values(6,'SBI_ShivajiRoad',4000);
insert into bank_account values(8,'SBI_ResidencyRoad',4000);
insert into bank_account values(9,'SBI_ParlimentRoad',3000);
insert into bank_account values(10,'SBI_ResidencyRoad',5000);
insert into bank_account values(11,'SBI_Jantarmantar',2000);
insert into customer values ('Avinash','Bull_Temple_Road','Bangalore');

insert into customer values('Dinesh','Bannergatta_Road','Bangalore');
insert into customer values('Mohan','NationalCollege_Road','Bangalore');
insert into customer values('Nikil','Akbar_Road','Delhi');
insert into customer values('Ravi','Prithviraj_Road','Delhi');
insert into depositor values('Avinash',1);
insert into depositor values('Dinesh',2);
insert into depositor values('Nikil',4);
insert into depositor values('Ravi',5);
insert into depositor values('Avinash',8);
insert into depositor values('Nikil',9);
insert into depositor values('Dinesh',10);
insert into depositor values('Nikil',11);
insert into loan values(1,'SBI_Chamarajpet',1000);
insert into loan values(2,'SBI_ResidencyRoad',2000);
insert into loan values(3,'SBI_ShivajiRoad',3000);
insert into loan values(4,'SBI_ParlimentRoad',4000);
insert into loan values(5,'SBI_Jantarmantar',5000);

select * from loan;
select * from depositor;
select * from customer;
select * from bank_account;
select * from branch;

select distinct customer_name
from depositor d, bank_account b
where d.account_no= b.account_no 
and branch_name ='SBI_ResidencyRoad' 
having count(customer_name)>=2;

select name,assets/100000 as Asset_In_Lakhs from branch;

create view loansum as
select branch_name,sum(amount)
from loan
group by branch_name;
SELECT * FROM loansum;
