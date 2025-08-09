# SALES_DATASET 
# Overview
This repository contains SQL scripts for the Sales Dataset database, designed for use in MySQL Workbench.
It demonstrates:

Creating a relational database schema

Inserting sample data

Running queries (including self-joins, aggregates, joins)

Viewing results in MySQL Workbench

The goal is to help learners and professionals practice SQL queries in MySQL with a ready-to-use dataset.

# Prerequisites
Before running this project, ensure you have:

MySQL Server (v8.0+ recommended)

MySQL Workbench (Download Here)

Basic SQL knowledge

🖥 Installation & Setup
1️⃣ Install MySQL Server & Workbench
Download and install from MySQL Downloads.

Start the MySQL server before using Workbench.

2️⃣ Create & Load the Database
Open MySQL Workbench

Connect to your MySQL Server instance

Go to File → Open SQL Script…

Select sales_dataset.sql from this repository

Click Run (⚡) to execute the script

# Database Structure
Tables in sales_dataset schema:

Table Name	Description
categories	Stores product categories
customers	Customer details
employees	Employee details & hierarchy
order_details	Products in each order
orders	Order details
products	Product information
shippers	Shipping companies

🗺 ER Diagram
The ER diagram shows the relationships between tables.

📸 Example:

# Example Queries
1️⃣ Employees and Their Managers (Self Join)
sql
Copy
Edit
SELECT 
    e.employeeName AS Employee,
    m.employeeName AS ReportsTo
FROM employees e
JOIN employees m 

# How to Run Queries in MySQL Workbench
Open MySQL Workbench

Select your database connection

Select the sales_dataset schema

Copy & paste your SQL query

Click Run (⚡) or press Ctrl + Enter

View results in the Result Grid

# Notes
You can edit sample_data.sql to add custom data.

Queries are MySQL 8.0 compatible.

The dataset is small enough for quick tests but can be scaled up.

## LINKEDIN : https://www.linkedin.com/in/rohit-gillela
