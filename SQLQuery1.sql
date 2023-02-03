-- Create New Database --

create database Northwind;


-- Switch to our Database--
use Northwind;

-- Create Table --
create table Products(
	ProductID int primary key NOT NULL identity,
	ProductName varchar(200) NOT NULL,
	SupplierID int NULL,
	CategoryID int NULL,
	QuantityPerUnit nvarchar (20) NULL,
	UnitPrice money NULL DEFAULT(0),
	UnitsInStock smallint NULL DEFAULT(0),
	UnitsOnOrder smallint NULL DEFAULT(0),
	ReorderLevel smallint NULL DEFAULT(0),
	Discontinued bit NOT NULL DEFAULT(0),
)

--Display Table--
select * from Products;

--INSERT DATA INTO PRODUCTS	--
insert into Products(
	"ProductName",
	"SupplierID",
	"CategoryID",
	"QuantityPerUnit",
	"UnitPrice",
	"UnitsInStock",
	"UnitsOnOrder",
	"ReorderLevel",
	"Discontinued") 
	VALUES(
	'Chai',1,1,
	'10 boxes x 20 bags',
	18,39,0,10,0);

insert into Products
VALUES(
	'Chang',
	1,1,
	'24 - 12 oz bottles',
	19,17,40,25,0);

insert into Products
VALUES(
	'Aniseed Syrup',1,2,'12 - 550 ml bottles',10,13,70,25,0);

insert into Products
VALUES(
	'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22,53,0,0,0);

insert into Products
VALUES(
	'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.35,0,0,0,1);

insert into Products
VALUES(
	'Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25,120,0,25,0);

insert into Products
VALUES(
	'Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30,15,0,10,0);

insert into Products
VALUES(
	'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40,6,0,0,0);

insert into Products
VALUES(
	'Mishi Kobe Niku',4,6,'18 - 500 g pkgs.',97,29,0,0,1);

insert into Products
VALUES(
	'Ikura',4,8,'12 - 200 ml jars',31,31,0,0,0);

insert into Products
VALUES(
	'Queso Cabrales',5,4,'1 kg pkg.',21,22,30,30,0);

insert into Products
VALUES(
	'Queso Manchego La Pastora',5,4,'10 - 500 g pkgs.',38,86,0,0,0);

insert into Products
VALUES(
	'Konbu',6,8,'2 kg box',6,24,0,5,0);

insert into Products
VALUES(
	'Tofu',6,7,'40 - 100 g pkgs.',23.25,35,0,0,0);

insert into Products
VALUES(
	'Genen Shouyu',6,2,'24 - 250 ml bottles',15.5,39,0,5,0);

insert into Products
VALUES(
	'Original Frankfurter grüne Soße',12,2,'12 boxes',13,32,0,15,0);

	insert into Products
VALUES(
	'Genen Shouyu',6,2,'24 - 250 ml bottles',15.5,39,0,5,0);

	insert into Products
VALUES(
	'Lakkalikööri',23,1,'500 ml',18,57,0,20,0);
insert into Products
VALUES(
	'Rhönbräu Klosterbier',12,1,'24 - 0.5 l bottles',7.75,125,0,25,0);

	insert into Products
VALUES(
	'Longlife Tofu',4,7,'5 kg pkg.',10,4,20,5,0);

insert into Products
VALUES(
	'Röd Kaviar',17,8,'24 - 150 g jars',15,101,0,5,0);

insert into Products(
	"ProductName",
	"SupplierID",
	"CategoryID",
	"QuantityPerUnit",
	"UnitPrice") 
	VALUES(
	'Mozzarella di Giovanni',14,4,'24 - 200 g pkgs.',34.8);

insert into Products(
	"ProductName",
	"SupplierID",
	"CategoryID",
	"QuantityPerUnit",
	"UnitPrice") 
	VALUES(
	'Flotemysost',15,4,'10 - 500 g pkgs.',21.5);

insert into Products(
	"ProductName",
	"SupplierID",
	"CategoryID",
	"QuantityPerUnit",
	"UnitPrice",
	"UnitsInStock",
	"UnitsOnOrder",
	"ReorderLevel") 
	VALUES(
	'Outback Lager',7,1,'24 - 355 ml bottles',15,15,10,30);

insert into Products(
	"ProductName",
	"SupplierID",
	"CategoryID",
	"QuantityPerUnit",
	"UnitPrice",
	"UnitsInStock",
	"ReorderLevel") 
	VALUES(
	'Gudbrandsdalsost',15,4,'10 kg pkg.',36,26,15);


-- Assignment QUE - 01 --
select ProductID, UnitPrice from Products 
where UnitPrice <= 20;


-- Assignment QUE - 02 --
select ProductID, ProductName, UnitPrice from Products 
where UnitPrice
between 15 and 25;

-- Assignment QUE - 03 --
select Productname, UnitPrice from Products 
where UnitPrice = (select avg(UnitPrice) from Products);

-- Assignment QUE - 04 --
select sount(ProductName) 
from Products
group by Discontinued;

-- Assignment QUE - 05 --
select count(ProductName)
from Products
group by Discontinued;

-- Assignment QUE - 06 --
select ProductName,  UnitsOnOrder , UnitsInStock
from Products
where ((UnitsInStock)<UnitsOnOrder));
