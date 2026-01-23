use sql_practice;
# 1 - Employees hired today
SELECT * FROM employee WHERE hire_date = CURRENT_DATE(); 

# 2 - Employees hired this year
SELECT * FROM employee WHERE YEAR(hire_date) = YEAR(CURRENT_DATE());

# 3 - Employees hired last year
SELECT * FROM employee WHERE YEAR(hire_date) = YEAR(CURRENT_DATE()) - 1;

# 4 - Orders placed today
SELECT * FROM orders WHERE order_date = CURRENT_DATE();

# 5 - Orders placed last month
SELECT * FROM orders WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
AND order_date < CURRENT_DATE();

# 6 - Employees hired in last 30 days
SELECT * FROM employee WHERE hire_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY);

# 7 - Difference between hire date and today
SELECT name,DATEDIFF(CURRENT_DATE(),hire_date) AS Day_Worked FROM employee;

# 8 - Orders per month
SELECT 
YEAR(order_date) AS Order_Year,
MONTH(order_date) AS Order_Month,
COUNT(order_id) AS Number_Of_Orders
FROM orders
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;

# 9 - Employees hired in January
SELECT * FROM employee WHERE MONTH(hire_date) = 1;

# 10 - Orders placed on weekend
SELECT * FROM orders WHERE DAYOFWEEK(order_date) IN (1,7);