Create Table Salesman(
Salesman_id int primary key,
Salesman_name VARCHAR(50),
City VARCHAR(50),
Commision decimal(4,2)
);

Create Table Customers (
	Customer_Id int Primary Key ,
	Customer_Name varchar(50) Not Null,
	City Varchar(50) Not Null,
	Grade int,
	Salesman_Id int Foreign Key References Salesman(Salesman_id)
);

CREATE TABLE Orders (

	Ord_no int primary key,
	Purch_amt decimal(6,2),
	Ord_date DATE,
	Customer_id INT Foreign Key References Customers(Customer_Id),
	Salesman_id INT Foreign Key References Salesman(Salesman_id),
)

Insert into salesman values('5001', 'James Hoog', 'New York', 0.15)
Insert into salesman values('5002 ', 'Nail Knite', 'Paris', 0.13);
Insert into salesman values('5005 ', 'Pit Alex', 'london', 0.11);
Insert into salesman values('5003 ', 'Lauson Hen',' ', 0.12);
Insert into salesman values('5006 ', 'Mc Lyon ','Paris ', 0.14);
Insert into salesman values('5007 ', 'Paul Adam ','Romes ', 0.13);
Insert into salesman values('9007 ', 'Paul Adam ','Romes ', 0.13);
Select * From Salesman;

insert into customers values (3002 ,' Nick Rimando  ',' New York  ',  100 ,       5001);

insert into customers values (3007 ,' Brad Davis    ',' New York  ',  200 ,       5001);
insert into customers values (3005 ,' Graham Zusi   ',' California',  200 ,       5002);
insert into customers values (3008 ,' Julian Green  ',' London    ',  300 ,       5002);
insert into customers values (3004 ,' Fabian Johnson',' Paris     ',  300 ,       5006);
insert into customers values (3009 ,' Geoff Cameron ',' Berlin    ',  100 ,       5003);
insert into customers values (3003 ,' Jozy Altidor  ',' Moscow    ',  200 ,       5007);
insert into customers (customer_id, Customer_Name, city, salesman_id) values (3001 ,' Brad Guzan    ',' London    ',       5005);
Select * From Customers;

insert into orders values (70001   ,    150.5    ,  '2012-10-05' , 3005   ,      5002);
insert into orders values (70009   ,    270.65   ,  '2012-09-10' , 3001   ,      5005);
insert into orders values (70002   ,    65.26    ,  '2012-10-05' , 3002   ,      5001);
insert into orders values (70004   ,    110.5    ,  '2012-08-17' , 3009   ,      5003);
insert into orders values (70007   ,    948.5    ,  '2012-09-10' , 3005   ,      5002);
insert into orders values (70005   ,    2400.6   ,  '2012-07-27' , 3007   ,      5001);
insert into orders values (70008   ,    5760     ,  '2012-09-10' , 3002   ,      5001);
insert into orders values (70010   ,    1983.43  ,  '2012-10-10' , 3004   ,      5006);
insert into orders values (70003   ,    2480.4   ,  '2012-10-10' , 3009   ,      5003);
insert into orders values (70012   ,    250.45   ,  '2012-06-27' , 3008   ,      5002);
insert into orders values (70011   ,    75.29    ,  '2012-08-17' , 3003   ,      5007);
insert into orders values (70013   ,    3045.6   ,  '2012-04-25' , 3002   ,      5001);
Select * From Orders;
Select * From Salesman;
Select * From Customers;

--1. write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city 
Select S.Salesman_name, C.Customer_Name, C.City
From Customers C
inner Join Salesman S
on S.City = C.City;

-- 2. write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city
SELECT  O.ord_no,O.purch_amt,
C.customer_name,C.city 
FROM orders O,Customers C 
WHERE O.customer_id=C.Customer_Id 
AND O.purch_amt BETWEEN 500 AND 2000;

--3. write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission
SELECT a.customer_name AS "Customer Name", 
a.city, b.Salesman_name AS "Salesman", b.Commision 
FROM Customers a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id;

--4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
SELECT a.customer_name AS "Customer Name", 
a.city, b.Salesman_name AS "Salesman", b.Commision 
FROM Customers a 
INNER JOIN salesman b 
ON a.salesman_id=b.salesman_id 
WHERE b.Commision>.12;

--5.
SELECT a.customer_name AS "Customer Name", 
a.city, b.Salesman_name AS "Salesman", b.city,b.Commision  
FROM Customers a  
INNER JOIN salesman b  
ON a.salesman_id=b.salesman_id 
WHERE b.Commision>.12 
AND a.city<>b.city;

--6.
SELECT a.ord_no,a.ord_date,a.purch_amt,
b.Customer_Name AS "Customer Name", b.grade, 
c.Salesman_name AS "Salesman", c.Commision 
FROM orders a 
INNER JOIN Customers b 
ON a.customer_id=b.customer_id 
INNER JOIN salesman c 
ON a.salesman_id=c.salesman_id;

--7.
SELECT a.ord_no,a.purch_amt,a.customer_id,a.salesman_id,b.Customer_Name,a.ord_date,b.city as 
"customer city",b.grade,c.Salesman_name,c.commision,c.city as "salesman_city"
FROM orders a 
INNER JOIN Customers b 
ON a.customer_id=b.customer_id 
INNER JOIN salesman c 
ON a.salesman_id=c.salesman_id;


--8.
SELECT a.customer_name,a.city,a.grade, 
b.Salesman_name AS "Salesman",b.city 
FROM Customers a 
LEFT JOIN salesman b 
ON a.salesman_id=b.salesman_id 
order by a.customer_id;


--9.
SELECT a.customer_name,a.city,a.grade, 
b.Salesman_name AS "Salesman", b.city 
FROM Customers a 
LEFT OUTER JOIN salesman b 
ON a.salesman_id=b.salesman_id 
WHERE a.grade<300 
ORDER BY a.customer_id;

--10.
SELECT a.customer_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM Customers a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
order by b.ord_date;


--11.
SELECT a.customer_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount", 
c.Salesman_name,c.Commision 
FROM Customers a 
LEFT OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
LEFT OUTER JOIN salesman c 
ON c.salesman_id=b.salesman_id;

--12.
SELECT a.customer_name,a.city,a.grade, 
b.Salesman_name AS "Salesman", b.city 
FROM Customers a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
ORDER BY b.salesman_id;


--13.
SELECT a.customer_name,a.city,a.grade, 
b.Salesman_name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM Customers a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
RIGHT OUTER JOIN orders c 
ON c.customer_id=a.customer_id;

--14.
SELECT a.customer_name,a.city,a.grade, 
b.Salesman_name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM Customers a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id=a.customer_id 
WHERE c.purch_amt>=2000 
AND a.grade IS NOT NULL;


--15.
SELECT a.customer_name,a.city,a.grade, 
b.Salesman_name AS "Salesman", 
c.ord_no, c.ord_date, c.purch_amt 
FROM customers a 
RIGHT OUTER JOIN salesman b 
ON b.salesman_id=a.salesman_id 
LEFT OUTER JOIN orders c 
ON c.customer_id=a.customer_id 
WHERE c.purch_amt>=2000 
AND a.grade IS NOT NULL;

--16.
SELECT a.customer_name,a.city, b.ord_no,
b.ord_date,b.purch_amt AS "Order Amount" 
FROM Customers a 
FULL OUTER JOIN orders b 
ON a.customer_id=b.customer_id 
WHERE a.grade IS NOT NULL;

--17.
SELECT * 
FROM salesman a 
CROSS JOIN Customers b;

--18.
Select * From Salesman a
cross join Customers b
Where a.city is not null;

--19.
SELECT * 
FROM salesman a 
CROSS JOIN  Customers b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL;



--20.
SELECT * 
FROM salesman a 
CROSS JOIN customers b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL 
AND  a.city<>b.city;
