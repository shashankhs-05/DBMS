CREATE DATABASE employee_database;
USE employee_database;
CREATE TABLE project(
	p_no INT,
    p_name VARCHAR(20),
    p_loc VARCHAR(20),
    PRIMARY KEY(p_no)
	);
CREATE TABLE dept(
	dept_no INT,
	d_name VARCHAR(20),
    d_loc VARCHAR(20),
    PRIMARY KEY(dept_no)
	);
CREATE TABLE employee(
	emp_no INT,
    e_name VARCHAR(20),
    mgr_no INT,
    hire_date DATE,
    sal INT,
    dept_no INT,
    PRIMARY KEY(emp_no),
    FOREIGN KEY(dept_no) REFERENCES dept(dept_no) ON DELETE CASCADE
	);
CREATE TABLE incentives(
	emp_no INT,
    incentive_date DATE,
    incentive_amount INT,
    PRIMARY KEY(emp_no,incentive_date),
    FOREIGN KEY(emp_no) REFERENCES employee(emp_no) ON DELETE CASCADE
    );
CREATE TABLE assigned_to(
	emp_no INT,
    p_no INT,
    job_role VARCHAR(20),
    PRIMARY KEY(emp_no,p_no),
    FOREIGN KEY(emp_no) REFERENCES employee(emp_no) ON DELETE CASCADE,
    FOREIGN KEY(p_no) REFERENCES project(p_no) ON DELETE CASCADE
    );
INSERT INTO dept VALUES
("1","Electricity","Bangalore"),
("2","Plumbing","Mysore"),
("3","Finance","Goa"),
("4","Security","Pondicherry"),
("5","Food","Chennai"),
("6","Architecture","Goa");

INSERT INTO project VALUES
("1","Majestic","Bangalore"),
("2","Kemepegowga_Station","Bangalore"),
("3","KRS","Mysore"),
("4","Roadways","Goa"),
("5","Railways","Mangalore"),
("6","Airport","Chennai"),
("7","Hotel","Dharwad"),
("8","Roadways","Manipal");


INSERT INTO employee VALUES
("11","ShAshank",null,'2020-11-21',"50000","1"),
("12","Shravanth","11",'2017-7-12',"20000","3"),
("13","Skanda","11",'2020-1-20',"50000","5"),
("14","Shashank","41",'2017-10-21',"60000","6"),
("15","Shreeram","74",'2019-7-5',"15000","4"),
("16","Dheem","11",'2021-5-13',"500000","2"),
("17","Sanvith","48",'2021-7-1',"20000","3"),
("18","Suhas","44",'2022-4-13',"30000","2");

INSERT INTO incentives VALUES
("11",'2021-11-5',"50000"),
("12",'2020-1-21',"30000"),
("14",'2020-10-15',"80000"),
("15",'2015-11-15',"10000"),
("16",'2021-11-5',"90000");

INSERT INTO assigned_to VALUES
("11","2","Engineer"),
("17","2","HR"),
("11","3","Architect"),
("13","1","Engineer"),
("13","3","Production"),
("14","3","Contractor"),
("15","6","Lead"),
("14","4","Finance_mgr"),
("15","5","Surveyor"),
("14","1","Testing"),
("11","7","Architect"),
("13","8","Finance_asst");

update assigned_to
set emp_no=16 where job_role="Lead";
SELECT * from assigned_to;

SELECT DISTINCT e.emp_no,e.e_name
FROM employee e,assigned_to a,project p
WHERE e.emp_no=a.emp_no AND a.p_no=p.p_no AND p.p_loc IN("Bangalore","Goa","Mysore");

SELECT DISTINCT e.emp_no
FROM employee e,incentives i
WHERE e.emp_no NOT IN(SELECT i.emp_no FROM incentives i);

SELECT DISTINCT e.emp_no,d.dept_no,a.job_role
FROM employee e,incentives i,dept d,assigned_to a
WHERE e.emp_no=i.emp_no and e.emp_no=a.emp_no and e.dept_no=d.dept_no and 
i.incentive_amount=(select max(i.incentive_amount) from incentives i where i.incentive_date like "2021%");

SELECT DISTINCT e.e_name,e.emp_no,e.dept_no,a.job_role,d.d_loc,p.p_loc
FROM employee e,dept d,assigned_to a,project p
WHERE d.dept_no=e.dept_no AND e.emp_no=a.emp_no AND a.p_no=p.p_no AND p.p_loc=d.d_loc;
