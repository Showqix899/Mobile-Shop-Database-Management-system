CREATE DATABASE mobileShopDatabase;
--customer informatio 
CREATE TABLE tb_Customer(
	customer_ID INT PRIMARY KEY IDENTITY(1,1),
	customer_Name VARCHAR(50),
	customer_Mobile_Number BIGINT DEFAULT 00000000000
);
INSERT INTO tb_Customer values('Abdullah Mahmud','01307823878')
INSERT INTO tb_Customer values('Asraful Ajom Jisan','0122222222')
INSERT INTO tb_Customer values('Abrar Mayaz','013333333')
INSERT INTO tb_Customer values('Harry Potter','0144444444')
INSERT INTO tb_Customer values('Md Talukdar','01555555555')
INSERT INTO tb_Customer values('Tom Cruise','01666666666')
INSERT INTO tb_Customer values('Gandalf the gray','01777777777')
INSERT INTO tb_Customer values('Albus Dumbeldor','01888888888')
INSERT INTO tb_Customer values('Professor Snape','09999999999')
INSERT INTO tb_Customer values('Ethan Hunt','01101010101')
INSERT INTO tb_Customer values('Bilbo Bagins','01101018998')
--customer Table
select *from tb_Customer


--brand information
CREATE TABLE brand(
	brand_id INT PRIMARY KEY IDENTITY(1,1),
	brand_name VARCHAR(50),
);
INSERT INTO brand values('Samsung')
INSERT INTO brand values('Apple')
INSERT INTO brand values('Realme')
INSERT INTO brand values('Xioami')
INSERT INTO brand values('Google')
INSERT INTO brand values('Oppo')
INSERT INTO brand values('Vivo')
INSERT INTO brand values('Nothing')
INSERT INTO brand values('Nokia')
INSERT INTO brand values('Sony')
INSERT INTO brand values('Asus')
INSERT INTO brand values('Techno')
INSERT INTO brand values('Infinix')
--show brand table
select *from brand


CREATE TABLE shopEmployee(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	employee_name VARCHAR(50),
	employee_phone BIGINT DEFAULT 00000000000,
	employee_email varchar(50),
	employee_address varchar(255),
	employee_salary int
);
insert into shopEmployee values('Kamal Hasan',0111111,'kalam@gmail.com','chittagong',7000)
insert into shopEmployee values('Tanim Ahmed',02233,'tanimgmail.com','Dhaka',8000)
insert into shopEmployee values('jamal Khan',124123,'Jamal@gmail.com','Shylet',7000)
insert into shopEmployee values('Shakib Mahmud',0123126,'shakib@gmail.com','Rangpur',9000)
insert into shopEmployee values('Rakib hussai',0123125,'Rakib@gmail.com','Cumilla',9000)
insert into shopEmployee values('Saif ullah',0123124,'saif@gmail.com','Cumilla',9000)
insert into shopEmployee values('Majed Khan',0123123,'majed@gmail.com','Noakhali',9000)
insert into shopEmployee values('Sumit kumar',0123122,'Sumit@gmail.com','Noakhali',9000)
insert into shopEmployee values('Andrew Tate',0123121,'tate@gmail.com','Feni',9000)
insert into shopEmployee values('Christiano Ronaldo',0123129,'Ronaldo@gmail.com','Noakhali',9000)
--show employee table
select *from shopEmployee

SELECT * FROM shopEmployee ORDER BY employee_salary DESC


CREATE TABLE mobiles(
product_id int primary key identity(1,1),
Phone_model varchar(220),
ram varchar(20),
rom varchar(20),
processor  varchar(100),
price decimal(10,2),
stock_quantity int
)
INSERT INTO mobiles VALUES('Samsung Galaxy S21','8GB','256GB','Snapdragon 888',145000,12)
INSERT INTO mobiles VALUES('Samsung Galaxy S24  Ultra','16GB','256GB','Snapdragon 888',185000,12)
INSERT INTO mobiles VALUES('Google Pixel 8 pro','8GB','128GB','Tensor G3',80000,17)
INSERT INTO mobiles VALUES('Sony Xperia 5V','6GB','128GB','Snapdragon 889',120000,16)
INSERT INTO mobiles VALUES('Iphone 15 Pro Max','8GB','256GB','Apple A17 Pro (3 nm)',145000,12)
INSERT INTO mobiles VALUES('Realme Narzo 50','6GB','128GB','Media tak G96',23500,11)
INSERT INTO mobiles VALUES('Xiaomi Redmi Note 13','8GB','128GB','Snapdragon 777',29000,10)
INSERT INTO mobiles VALUES('Oppo A71','6GB','64GB','Snapdragon 666',20000,17)
INSERT INTO mobiles VALUES('Teckno Spark 4','8GB','256GB','Media tak G90',18000,9)
INSERT INTO mobiles VALUES('Samsung Galaxy S22 ultra','8GB','256GB','Snapdragon 887',130000,2)
--show product table
SELECT *FROM mobiles
--show most expensive product
SELECT *FROM mobiles where price=(SELECT MAX(price) FROM mobiles)
--TOP 3 EXPENSIVE PRODUCT
SELECT TOP 3* FROM mobiles ORDER BY price DESC


CREATE TABLE customer_sales_info(
sale_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
sale_amount DECIMAL(10,2),
customer_id INT,
product_id INT,
FOREIGN KEY (customer_id) REFERENCES tb_Customer(customer_ID),
FOREIGN KEY (product_id) REFERENCES mobiles(product_id),
)
INSERT INTO customer_sales_info(sale_amount,customer_id,product_id)
values(145000,1,2),
		(12000,3,4),
		(20000,4,8),
		(130000,5,10),
		(130000,6,10),
		(130000,7,10),
		(23500,8,6),
		(23500,9,6),
		(13000,3,7)



SELECT *FROM customer_sales_info

CREATE TABLE employee_sales_info(
emp_sale_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
sale_amount decimal(10,2),
employee_id int,
FOREIGN KEY(employee_id) REFERENCES shopEmployee(employee_id),
)

INSERT INTO employee_sales_info(sale_amount,employee_id)
values(1000000,1),
		(1000000,2),
		(1220000,3),
		(1030000,5),
		(2200000,12),
		(1000000,13),
		(300000,14),
		(1005000,15),
		(400000,16)
SELECT * FROM employee_sales_info
--total sale amount
SELECT SUM(sale_amount) AS total_sales_amount FROM employee_sales_info;


---CUSTOMER PURCHASE 
CREATE TABLE customer_purchase(
customer_id int ,
purchase_amount decimal(10,2)
FOREIGN KEY (customer_id) REFERENCES tb_Customer(customer_id)
)
INSERT INTO customer_purchase VALUES(3,20000)
INSERT INTO customer_purchase VALUES(1,80000)
INSERT INTO customer_purchase VALUES(4,120000)
INSERT INTO customer_purchase VALUES(13,210000)
INSERT INTO customer_purchase VALUES(12,90000)
INSERT INTO customer_purchase VALUES(11,220000)
INSERT INTO customer_purchase VALUES(14,30000)
INSERT INTO customer_purchase VALUES(8,50000)
INSERT INTO customer_purchase VALUES(9,44000)
INSERT INTO customer_purchase VALUES(10,20000)
--SHOW CUSTOMER PURCHASE DETAIL
SELECT *FROM customer_purchase

























