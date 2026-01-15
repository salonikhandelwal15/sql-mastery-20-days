use sql_practice;
# 11 - Departments with total salary > 5,00,000
SELECT department_id from employee GROUP BY department_id HAVING SUM(salary) > 500000;

# 12 - Customers with avg order value > 10,000
SELECT customer_id from orders GROUP BY customer_id HAVING AVG(amount) > 10000;

# 13 - Managers with avg salary of team > 60,000
SELECT manager_id from employee WHERE manager_id IS NOT NULL GROUP BY manager_id HAVING AVG(salary) > 60000;

# 14 - Departments with more than 2 managers
SELECT department_id from employee WHERE manager_id IS NOT NULL GROUP BY department_id HAVING COUNT(DISTINCT manager_id) > 2;
 
# 15 - Cities with total orders > 2,00,000
SELECT c.city from customers c JOIN orders o ON c.customer_id=o.customer_id GROUP BY c.city HAVING SUM(o.amount) > 200000;

# 16 - Departments with employees between 5 and 10
SELECT department_id from employee GROUP BY department_id HAVING COUNT(emp_id) between 5 and 10;

# 17 - Years with more than 10 hires
SELECT year(hire_date) AS hire_year from employee GROUP BY year(hire_date) HAVING COUNT(emp_id) > 10;

# 18 - Customers with minimum order > 5,000
SELECT customer_id from orders GROUP BY customer_id HAVING MIN(amount) > 5000;

# 19 -Departments having salary range > 40,000
SELECT department_id from employee GROUP BY department_id HAVING MAX(salary) - MIN(salary) > 40000;

# 20 - Departments with average salary > 50,000
SELECT d.department_name,AVG(e.salary) AS Average_Salary
from employee e
INNER JOIN department d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 50000;