--  database
CREATE DATABASE MobileShopDB;
USE MobileShopDB;


-- Table for Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber BIGINT
);

-- Table Brands
CREATE TABLE Brands (
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(100)
);

-- Table for Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Email VARCHAR(100),
    Phone BIGINT,
    Address VARCHAR(255)
);

-- Table: Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    BrandID INT,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
);



--  Purchases
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    EmployeeID INT,
    PurchaseDate DATE,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table: Reviews
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    ReviewText VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    PhoneNumber BIGINT,
    Email VARCHAR(100),
    Address VARCHAR(255)



);
-- Stock table
CREATE TABLE Stock (
    ProductID INT PRIMARY KEY,
    SupplierID INT,
    Quantity INT,
    CostPrice DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);







--  Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    EmployeeID INT,
    SaleDate DATE,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


-- Customers
INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber)
VALUES
(1, 'John Doe', 1234567890),
(2, 'Jane Smith', 9876543210),
(3, 'Alice Johnson', 4567890123),
(4,'tom cruise',54545542121),
(5,'Professor Snape',54545542122),
(6,'Albus Dumbeldor',54545542123),
(7,'Bilbo Bagiins',54545542124),
(8,'Lionel Messi',54545542125),
(9,'Kevin Debruen',54545542126),
(10,'Phil Foden',54545542127),
(11,'Steven Smith',54545542128),
(12,'Joo Root',54545542129),
(13,'Jos Buttler',545455421210),
(14,'Sheldon Copper',5454554212111);
--SHOW TABLE DATA
select * from Customers
--NAME WISE SEARCH
SELECT * FROM Customers WHERE CustomerName = 'tom cruise'
--ID WISE SEARCH
SELECT * FROM Customers WHERE CustomerID = 1
--NUMBER OF customer
SELECT COUNT(CustomerName) from Customers
--finding out customers who's name start with j
select * from Customers where CustomerName like 'j%'





-- Brands
INSERT INTO Brands (BrandID, BrandName)
VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Xiaomi');
select *from Brands

-- Employees
INSERT INTO Employees (EmployeeID, EmployeeName, Email, Phone, Address)
VALUES
(1, 'Michael Scott', 'michael@example.com', 1234567890, '123 Main St'),
(2, 'Dwight Schrute', 'dwight@example.com', 9876543210, '456 Elm St'),
(3, 'Chandler Bing', 'chandler@example.com', 2345678901, '234 Elm St'),
(4, 'Joye Tirbiani', 'joye@example.com', 3456789012, '345 Elm St'),
(5, 'Ross Galler', 'ross@example.com', 4567890123, '456 Elm St'),
(6, 'Ted Mosby', 'ted@example.com', 5678901234, '567 Elm St'),
(7, 'Phil Dunphy', 'dunphy@example.com', 6789012345, '678 Elm St');


select *from Employees
-- NUMBER WISE SEARCH
SELECT * FROM Employees WHERE Phone=1234567890




-- Products
INSERT INTO Products (ProductID, ProductName, BrandID)
VALUES
(1, 'Samsung Galaxy S21', 1),
(2, 'iPhone 12', 2),
(3, 'Xiaomi Mi 11', 3);
select * from Products

-- Purchases
INSERT INTO Purchases (PurchaseID, CustomerID, ProductID, EmployeeID, PurchaseDate, Quantity, TotalPrice)
VALUES
(1, 1, 1, 1, '2024-05-01', 1, 1000.00),
(2, 2, 2, 2, '2024-05-02', 2, 2000.00),
(3, 3, 3, 1, '2024-05-03', 3, 3000.00),
(4, 4, 1, 3, '2024-05-04', 1, 1000.00),
(5, 5, 2, 4, '2024-05-05', 2, 2000.00),
(6, 6, 3, 5, '2024-05-06', 3, 3000.00),
(7, 7, 1, 6, '2024-05-07', 1, 1000.00),
(8, 8, 2, 7, '2024-05-08', 2, 2000.00),
(9, 9, 3, 1, '2024-05-09', 3, 3000.00),
(10, 10, 1, 2, '2024-05-10', 1, 1000.00),
(11, 11, 2, 3, '2024-05-11', 2, 2000.00),
(12, 12, 3, 4, '2024-05-12', 3, 3000.00),
(13, 13, 1, 5, '2024-05-13', 1, 1000.00),
(14, 14, 2, 6, '2024-05-14', 2, 2000.00);
--INBETWEEN DATE DATA
SELECT * FROM Purchases WHERE PurchaseDate BETWEEN '2024-05-01' AND '2024-05-04';
--total amount of sales






-- Payments
INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount)
VALUES
(1, 1, '2024-05-01', 1000.00),
(2, 2, '2024-05-02', 2000.00),
(3, 3, '2024-05-03', 3000.00),
(4, 4, '2024-05-04', 4000.00),
(5, 5, '2024-05-05', 5000.00),
(6, 6, '2024-05-06', 6000.00),
(7, 7, '2024-05-07', 7000.00),
(8, 8, '2024-05-08', 8000.00),
(9, 9, '2024-05-09', 9000.00),
(10, 10, '2024-05-10', 10000.00),
(11, 11, '2024-05-11', 11000.00),
(12, 12, '2024-05-12', 12000.00),
(13, 13, '2024-05-13', 13000.00),
(14, 14, '2024-05-14', 14000.00);
--MINIMUM WISE SEARCH
SELECT * FROM Customers WHERE CustomerID = ( SELECT CustomerID  FROM Payments  WHERE Amount = (SELECT MIN(Amount) FROM Payments));
--MAXIMUM WISE SEARCH
SELECT * FROM Customers WHERE CustomerID = ( SELECT CustomerID  FROM Payments  WHERE Amount = (SELECT MAX(Amount) FROM Payments));




-- Reviews
INSERT INTO Reviews (ReviewID, CustomerID, ProductID, Rating, ReviewText)
VALUES
(1, 1, 1, 5, 'Great phone!'),
(2, 2, 2, 4, 'Good product, but expensive'),
(3, 3, 3, 3, 'Average quality'),
(4, 4, 1, 4, 'Satisfied with the purchase'),
(5, 5, 2, 3, 'Not as expected'),
(6, 6, 3, 2, 'Disappointed with the product'),
(7, 7, 1, 5, 'Best phone ever!'),
(8, 8, 2, 4, 'Happy with the purchase'),
(9, 9, 3, 3, 'Could be better'),
(10, 10, 1, 2, 'Not satisfied'),
(11, 11, 2, 3, 'Average product'),
(12, 12, 3, 4, 'Good quality'),
(13, 13, 1, 5, 'Excellent phone!'),
(14, 14, 2, 4, 'Value for money');

-- Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, ContactPerson, PhoneNumber, Email, Address)
VALUES
(1, 'Supplier A', 'John Supplier', 1234567890, 'supplierA@example.com', '123 Supplier St'),
(2, 'Supplier B', 'Jane Supplier', 9876543210, 'supplierB@example.com', '456 Supplier St'),
(3, 'Supplier C', 'Jack Supplier', 2345678901, 'supplierC@example.com', '789 Supplier St'),
(4, 'Supplier D', 'Janet Supplier', 3456789012, 'supplierD@example.com', '1011 Supplier St');
--updating data
UPDATE Suppliers SET Address = 'New Address'WHERE SupplierID = 4;
--DLETING data
Delete Suppliers WHERE SupplierName='Supplier d'



--Stock
INSERT INTO Stock (ProductID, SupplierID, Quantity, CostPrice)
VALUES
(1, 1, 10, 800.00),
(2, 2, 15, 1200.00),
(3, 3, 20, 1000.00);

select *from Stock

-- Sales
INSERT INTO Sales (SaleID, ProductID, EmployeeID, SaleDate, Quantity, TotalPrice)
VALUES
(1, 1, 1, '2024-05-01', 1, 1000.00),
(2, 2, 2, '2024-05-02', 2, 2000.00),
(3, 3, 1, '2024-05-03', 3, 3000.00),
(4, 1, 2, '2024-05-04', 4, 4000.00),  
(5, 2, 1, '2024-05-05', 5, 5000.00),  
(6, 3, 2, '2024-05-06', 6, 6000.00), 
(7, 1, 1, '2024-05-07', 7, 7000.00),  
(8, 2, 2, '2024-05-08', 8, 8000.00),
(9, 3, 1, '2024-05-09', 9, 9000.00), 
(10, 1, 2, '2024-05-10', 10, 10000.00), 
(11, 2, 1, '2024-05-11', 11, 11000.00),  
(12, 3, 2, '2024-05-12', 12, 12000.00),  
(13, 1, 1, '2024-05-13', 13, 13000.00),  
(14, 2, 2, '2024-05-14', 14, 14000.00); 
select* from Sales
--total number of sales
SELECT SUM(TotalPrice) from Sales




SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Reviews;
SELECT * FROM Sales;
SELECT * FROM Employees;
SELECT * FROM Purchases;
SELECT * FROM Brands;
SELECT * FROM Products;
SELECT * FROM Purchases;
SELECT * FROM Payments;
SELECT * FROM Suppliers;
SELECT * FROM Stock;

--inner join on Customers and Purchase
SELECT CustomerName, PhoneNumber, PurchaseDate, Quantity, TotalPrice FROM Customers INNER JOIN Purchases ON Customers.CustomerID = Purchases.CustomerID order by TotalPrice DESC;


--inner join on Employee and sales
SELECT EmployeeName,Email,Phone,Address,saleDate,Quantity,TotalPrice From Employees inner join Sales ON Employees.EmployeeID= Sales.EmployeeID ORDER BY TotalPrice  DESC

--review 

SELECT CustomerName,PhoneNumber,ProductName,Rating,ReviewText From Customers inner join Reviews on Customers.CustomerID=Reviews.CustomerID inner join Products on Products.ProductID=Reviews.ProductID

