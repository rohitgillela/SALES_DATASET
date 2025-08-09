use sales_dataset;

CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
)

SELECT * FROM categories LIMIT 8;

CREATE TABLE customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName VARCHAR(255),
    ContactName VARCHAR(255),
    ContactTitle VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100)
);

SELECT * FROM customers LIMIT 5;

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipperID INT,
    Freight DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);


SELECT * FROM orders LIMIT 5;

###
CREATE TABLE employees (
    employeeID INT PRIMARY KEY,
    employeeName VARCHAR(255),
    title VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    reportsTo INT NULL
);


###
SELECT * FROM employees LIMIT 5;

###
CREATE TABLE products (
    productID INT PRIMARY KEY,
    productName VARCHAR(255),
    quantityPerUnit VARCHAR(100),
    unitPrice DECIMAL(10, 2),
    discontinued BOOLEAN,
    categoryID INT,
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

###
SELECT * FROM products LIMIT 5;

###
CREATE TABLE shippers (
    shipperID INT PRIMARY KEY,
    companyName VARCHAR(255)
);

###
SELECT * FROM shippers LIMIT 5;

###
CREATE TABLE orderDetails (
    orderID INT,
    productID INT,
    unitPrice DECIMAL(10, 2) ,
    quantity INT,
    discount DECIMAL(3,2) ,
    PRIMARY KEY (orderID, productID));


###
SELECT * FROM orderDetails LIMIT 5;

###
SELECT *
FROM customers
WHERE country = 'Italy';

###
SELECT 
    e.employeeID,
    e.employeeName AS Employee,
    m.employeeName AS Manager
FROM employees e
LEFT JOIN employees m ON e.reportsTo = m.employeeID;

###
SELECT 
    country,
    COUNT(customerID) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;

SELECT 'product name' AS productname FROM products;
###
SELECT 
    'product name',
    unitPrice,
    quantityPerUnit
FROM products
ORDER BY unitPrice ASC
LIMIT 10;

### 
SELECT 
	 'productname',
    c.categoryName,
    p.unitPrice
FROM products p
JOIN categories c ON p.categoryID = c.categoryID
WHERE p.discontinued = 1;

###
SELECT 
    c.customerID,
    c.companyName,
    COUNT(o.orderID) AS totalOrders
FROM customers c
JOIN orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.companyName
ORDER BY totalOrders DESC
LIMIT 5;

###
SELECT 
    c.categoryID,
    c.categoryName,
    ROUND(AVG(p.unitPrice), 2) AS avgUnitPrice
FROM categories c
JOIN products p ON c.categoryID = p.categoryID
GROUP BY c.categoryID, c.categoryName;

###
SELECT
    'product name',
    SUM(od.quantity) AS totalOrdered
FROM orderdetails od
JOIN products p ON od.productID = p.productID
GROUP BY 'product name'
ORDER BY totalOrdered ASC
LIMIT 3;

###
SELECT 
    s.companyName AS Shipper,
    COUNT(o.orderID) AS TotalOrders,
    SUM(o.freight) AS TotalFreight
FROM 
    orders o
JOIN 
    shippers s ON o.shipperID = s.shipperID
GROUP BY 
    s.companyName
ORDER BY 
    TotalFreight DESC
LIMIT 5;

###

SELECT 
    e.employeeName AS Employee,
    m.employeeName AS ReportsTo
FROM 
    employees e
JOIN 
    employees m ON e.reportsTo = m.employeeID;