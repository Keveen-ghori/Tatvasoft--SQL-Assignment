Use MyDatabase;
Select * From Categories;
Select * From CustomerCustomerDemo;
Select * From CustomerDemographics;
Select * From Customers;
Select * From Employees;
Select * From EmployeeTerritories;
Select * From [Order Details];
Select * From Orders;
Select * From Products;
Select * From Region;
Select * From Shippers;

--1.
CREATE PROCEDURE GetAverageFreight (@CustomerID nchar(5))
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @AverageFreight decimal(10, 2);

    SELECT @AverageFreight = AVG(Freight)
    FROM Orders
    WHERE CustomerID = @CustomerID;

    SELECT @AverageFreight AS AverageFreight;
END;

Alter TRIGGER tr_Orders_CheckFreight
ON Orders
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Freight decimal(10, 2),
            @AverageFreight decimal(10, 2),
            @CustomerID nchar(5);

    SELECT @Freight = i.Freight,
           @CustomerID = i.CustomerID
    FROM inserted i;

    EXEC GetAverageFreight @CustomerID, @AverageFreight OUT;

    IF (@Freight > @AverageFreight)
    BEGIN
        RAISERROR('Freight value exceeds the average freight.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;




--2.
Alter  Procedure Employee_SalesById
	@shipcontry nvarchar(15)
	As 
	BEGIN
		SELECT Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID,
		"Order Subtotals".Subtotal AS SaleAmount
		FROM Employees INNER JOIN 
		(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
		ON Employees.EmployeeID = Orders.EmployeeID 
		Where shipcountry = @shipcontry
		END

Employee_SalesById 'USA'

--3. write a SQL query to Create Stored procedure in the Northwind database to retrieve Sales by Year

Alter  procedure SalesbyYear 
	@Beginning_Date  DateTime
	AS
	BEGIN
		SELECT Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
		FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
		WHERE Orders.ShippedDate= @Beginning_Date 
	END

SalesbyYear '1998'
--4.
Create Proc TopTen
as
begin
	select top 10  ProductName, UnitPrice from Products order by UnitPrice desc
end

execute TopTen

--5. write a SQL query to Create Stored procedure in the Northwind database to insert
--Customer Order Details

Alter Proc InsertCustomers
	@OrderID int,
	@ProductID int,
	@UnitPrice money,
	@Quantity smallint,
	@Discount real

	As
	BEGIN
		INSERT INTO [Order Details]
		 VALUES
			   (@OrderID,
			   @ProductID,
			   @UnitPrice, 
			   @Quantity,
			   @Discount)
	END

InsertCustomers 10248, 46, 20, 10, 0;

--6.
Alter Proc UpdateCustomers
	@ProductID int,
	@UnitPrice money,
	@Quantity smallint,
	@Discount real,
	@OrderID int

	As
	BEGIN
		Update [Order Details]
		 SET   @ProductID =ProductID ,
			   @UnitPrice=UnitPrice, 
			   @Quantity=Quantity,
			   @Discount=Discount
			   Where OrderId = @OrderID;
	END

UpdateCustomers 13, 10, 3, 2, 10266;
Select * From [Order Details]









































