# 11 - Age of employee in years
SELECT name,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS experience_years
FROM employee;

# 12 - Extract year from hire_date
SELECT 
    name,
    YEAR(hire_date) AS Hire_Year
FROM employee;

# 13 - Extract month from order_date
SELECT 
    order_id,
    MONTH(order_date) AS Order_Month
FROM orders;

# 14 - Employees hired before 2020
SELECT *
FROM employee
WHERE hire_date < '2020-01-01';

# 15 - Orders older than 1 year
SELECT *
FROM orders
WHERE order_date < DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR);

# 16 - First order date per customer
SELECT 
    customer_id,
    MIN(order_date) AS First_Order_Date
FROM orders
GROUP BY customer_id;

# 17 - Last order date per customer
SELECT 
    customer_id,
    MAX(order_date) AS Last_Order_Date
FROM orders
GROUP BY customer_id;

# 18 - Employees with longest tenure
SELECT *
FROM employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM employee
);

# 19 - Orders grouped by year
SELECT 
    YEAR(order_date) AS Order_Year,
    COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY Order_Year
ORDER BY Order_Year;

# 20 - Employees hired in last 5 years
SELECT *
FROM employee
WHERE hire_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR);