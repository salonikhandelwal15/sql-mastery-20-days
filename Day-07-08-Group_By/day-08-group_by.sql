# 11 - Orders per city
SELECT c.city,COUNT(*)
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.city;

# 12 - Customers per city
SELECT city,COUNT(*) FROM customers GROUP BY city;

# 13 - Salary grouped by hire year
SELECT YEAR(hire_date) AS Year,SUM(salary) AS Salary FROM employee GROUP BY YEAR(hire_date);

# 14 - Orders per month
SELECT MONTH(order_date) AS Month, COUNT(*) AS Orders FROM orders GROUP BY MONTH(order_date);

# 15 - Highest salary per department
SELECT department_id,MAX(salary) AS Highest_Salary FROM employee GROUP BY department_id;

# 16 - Lowest salary per department
SELECT department_id,MIN(salary) AS Lowest_Salary FROM employee GROUP BY department_id;

# 17 - Employees grouped by manager
SELECT manager_id,COUNT(*) AS Employees FROM employee GROUP BY manager_id;

# 18 - Orders grouped by year
SELECT YEAR(order_date) AS Year,COUNT(*) AS Orders FROM orders GROUP BY YEAR(order_date);

# 19 - Employees grouped by department and hire year
SELECT department_id,YEAR(hire_date) AS Year,COUNT(emp_id) AS Employees FROM employee GROUP BY department_id,YEAR(hire_date);

# 20 - Departments having more than 2 employees
SELECT department_id,COUNT(emp_id) AS Employees FROM employee GROUP BY department_id HAVING COUNT(emp_id) > 2;