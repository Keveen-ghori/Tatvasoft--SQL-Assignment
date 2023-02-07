Create Table Department (
	Dept_Id int Primary Key,
	Dept_name varchar(50) Not Null
);

Create Table Employee(
	Emp_Id int Primary Key,
	Dept_Id int Foreign Key References Department(Dept_Id),
	Mngr_Id int Not Null,
	Emp_Name varchar(50) Not Null,
	Salary money
)

Select * From Department;
Select * From Employee;

insert into department(dept_id, dept_name) values (1001,'FINANCE   ' );
insert into department(dept_id, dept_name) values (2001,'AUDIT     ' );
insert into department(dept_id, dept_name) values (3001,'MARKETING ' );
insert into department(dept_id, dept_name) values (4001,'PRODUCTION' );


insert into employee (emp_id,emp_name,mngr_id ,salary,dept_id) values (68319 ,'KAYLING  ', 68350 ,6000.00 ,1001);
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (66928 ,'BLAZE    ',    68319 , 2750.00 ,3001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (67832 ,'CLARE    ',    68319 , 2550.00 ,1001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (65646 ,'JONAS    ',    68319 , 2957.00 ,2001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (67858 ,'SCARLET  ',    65646 , 3100.00 ,2001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (69062 ,'FRANK    ',    65646 , 3100.00 ,2001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (63679 ,'SANDRINE ',    69062 ,  900.00 ,2001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (64989 ,'ADELYN   ',    66928 , 1700.00 ,3001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (65271 ,'WADE     ',    66928 , 1350.00 ,3001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (66564 ,'MADDEN   ',    66928 , 1350.00 ,3001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (68454 ,'TUCKER   ',    66928 , 1600.00 ,3001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (68736 ,'ADNRES   ',    67858 , 1200.00 ,2001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (69000 ,'JULIUS   ',    66928 , 1050.00 ,3001	  );
insert into employee (emp_id,emp_name,mngr_id,salary,dept_id) values (69324 ,'MARKER   ',    67832 , 1400.00 ,1001	  );

--1. write a SQL query to find Employees who have the biggest salary in their Department
Select Top 1 Emp_Name [Employee]
From Employee;

--2. write a SQL query to find Departments that have less than 3 people in it
Select D.Dept_Id, E.Dept_Id, Count(E.Dept_Id)
From Employee E
Inner Join Department D
On D.Dept_Id = E.Dept_Id
Group By E.Dept_Id, D.Dept_Id
Having Count(D.Dept_Id) >3;

--3. write a SQL query to find All Department along with the number of people there
SELECT D.dept_name,E.dept_id,count(emp_name) as "number of people"
FROM employee E
INNER JOIN department D
ON E.dept_id =D.dept_id
GROUP BY D.dept_name,E.dept_id;

--4. write a SQL query to find All Department along with the total salary there
Select Dept_Id,Sum(Salary) [Total Salary], Count(Dept_Id)
From Employee
Group By Dept_Id;
