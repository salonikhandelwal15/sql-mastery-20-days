-- ============================================
-- Database Schema for SQL Interview Practice
-- Repo: sql-patterns-in-20-days
-- ============================================

-- 1. Create database
CREATE DATABASE IF NOT EXISTS sql_practice;
USE sql_practice;

-- 2. Drop tables if already exist (clean run)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- 3. Create Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- 4. Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- 5. Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- 6. Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- ============================================
-- Sample Data
-- ============================================

-- Departments
INSERT INTO Department VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

-- Employees
INSERT INTO Employee VALUES
(1, 'Alice', 10, 80000, NULL, '2019-01-10'),
(2, 'Bob', 10, 60000, 1, '2020-03-15'),
(3, 'Charlie', 20, 50000, NULL, '2018-07-20'),
(4, 'David', 30, 70000, 3, '2021-05-25'),
(5, 'Eva', 10, 90000, 1, '2017-09-01');

-- Customers
INSERT INTO Customers VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Anita', 'Delhi'),
(3, 'Suresh', 'Bangalore');

-- Orders
INSERT INTO Orders VALUES
(101, 1, 5000, '2024-01-10'),
(102, 1, 12000, '2024-02-15'),
(103, 2, 8000, '2024-02-20'),
(104, 3, 15000, '2024-03-01');