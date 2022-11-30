create database bank1;
use bank1;
create table branch(
branch_name varchar(20) primary key,
branch_city varchar(20),
assets int(10));
create table BankAccount(
accno int(10) primary key,
branch_name varchar(20),
foreign key(branch_name) references branch(branch_name),
balance int(10));
create table BankCustomer(
customer_name varchar(20) primary key,
customer_street varchar(20),
customer_city varchar(20));
create table depositor(
customer_name varchar(20),
primary key(customer_name,accno),
foreign key(customer_name) references BankCustomer(customer_name),
accno int(10),
foreign key(accno) references BankAccount(accno));
create table loan(
loan_number int(10),
branch_name varchar(20),
primary key(loan_number,branch_name),
foreign key(branch_name) references BankAccount(branch_name));
alter table loan
add amt int(10);
insert into depositor values('Avinash',1);
insert into depositor values('Dinesh',2);
insert into depositor values('Nikhil',4);
insert into depositor values('Ravi',5);
insert into depositor values('Avinash',8);
insert into depositor values('Nikhil',9);
insert into depositor values('Dinesh',10);
insert into depositor values('Nikhil',11);
insert into branch values('SBI_Chamrajpet','Bangalore',50000);
insert into branch values('SBI_ResidencyRoad','Bangalore',10000);
insert into branch values('SBI_ShivajiRoad','Bangalore',20000);
insert into branch values('SBI_parlimentRoad','Delhi',10000);
insert into branch values('SBI_JantarMantar','Delhi',50000);
insert into BankAccount values(1,'SBI_Chamrajpet',2000);
insert into BankAccount values(2,'SBI_ResidencyRoad',5000);
insert into BankAccount values(3,'SBI_ShivajiRoad',6000);
insert into BankAccount values(4,'SBI_ParlimentRoad',9000);
insert into BankAccount values(5,'SBI_Jantarmantar',8000);
insert into BankAccount values(6,'SBI_ShivajiRoad',4000);
insert into BankAccount values(7,'SBI_ResidencyRoad',4000);
insert into BankAccount values(8,'SBI_ParlimentRoad',3000);
insert into BankAccount values(9,'SBI_ResidencyRoad',5000);
insert into BankAccount values(10,'SBI_Jantarmantar',2000);
insert into BankCustomer values('Avinash','Bull_temple_road','Bangalore');
insert into BankCustomer values('Dinesh','Bannerghatta_road','Bangalore');
insert into BankCustomer values('Mohan','NationalCollege_road','Bangalore');
insert into BankCustomer values('Nikhil','Akbar_road','Delhi');
insert into BankCustomer values('Ravi','Prithiviraj_road','Delhi');
insert into loan values(1,'SBI_Chamrajpet',1000);
insert into loan values(2,'SBI_ResidencyRoad',2000);
insert into loan values(3,'SBI_ShivajiRoad',3000);
insert into loan values(4,'SBI_parlimentRoad',4000);
insert into loan values(5,'SBI_JantarMantar',5000);
select loan_number,branch_name,concat(amt/100000,'lakhs') as 'assets in lakhs' from loan;
select concat(balance+1000),customer_name from BankAccount where branch_city='Bangalore';
select distinct d.customer_name from depositor d,BankAccount b 
where d.accno=b.accno 
group by b.branch_name
having count(d.customer_name)>=2;

create view loansum as
select branch_name,sum(amt)
from loan
group by branch_name;
SELECT * FROM loansum;
select customer_name from BankCustomer where customer_city='Delhi';
select branch_name from branch where assets > (select max(assets) from branch where branch_city='Bangalore');
update BankAccount
set balance=balance+(balance*0.05);
select balance from BankAccount;
