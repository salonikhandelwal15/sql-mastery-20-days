 use sql_practice;
# 1 - Departments having avg salary > 60,000
SELECT department_id from employee GROUP BY department_id HAVING AVG(salary) > 60000;

# 2 - Departments with more than 10 employees
SELECT department_id from employee GROUP BY department_id HAVING COUNT(emp_id) > 10;

# 3 - Managers managing more than 5 employees
SELECT manager_id from employee WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING COUNT(emp_id) > 5;

# 4 - Customers with total order amount > 1,00,000
SELECT customer_id from orders GROUP BY customer_id HAVING SUM(amount) > 100000;

# 5 - Departments with max salary > 90,000
SELECT department_id from employee GROUP BY department_id HAVING MAX(salary) > 90000;

# 6 - Cities with more than 3 customers
SELECT city from customers GROUP BY city HAVING COUNT(customer_id) > 3;

# 7 - Departments with min salary < 30,000
SELECT department_id from employee GROUP BY department_id HAVING MIN(salary) < 30000;

# 8 - Orders grouped by customer having count > 5
SELECT customer_id from orders GROUP BY customer_id HAVING COUNT(order_id) > 5;

# 9 - Employees hired per year > 1
SELECT YEAR(hire_date) AS hire_year from employee GROUP BY YEAR(hire_date) HAVING COUNT(emp_id) > 3;

# 10 - Salary groups having avg > 50,000
SELECT department_id from employee GROUP BY department_id HAVING AVG(salary) > 50000;
