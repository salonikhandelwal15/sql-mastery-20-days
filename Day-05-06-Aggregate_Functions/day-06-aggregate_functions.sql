# 11 - Number of orders
SELECT COUNT(*) AS total_orders from orders;

# 12 - Total order amount
SELECT SUM(amount) AS total_order_amount from orders;

# 13 - Average salary per employee
SELECT AVG(salary) AS avg_salary from employee;

# 14 - Count employees with manager
SELECT COUNT(*) AS employees_with_manager from employee WHERE manager_id IS NOT NULL;

# 15 - Count employees without manager
SELECT COUNT(*) AS employees_without_manager from employee WHERE manager_id IS NULL;

# 16 - Salary difference (max - min)
SELECT MAX(salary) - MIN(salary) AS salary_difference from employee;

# 17 - Max salary per department
SELECT department_id, MAX(salary) AS max_salary from employee GROUP BY department_id;

# 18 - Min salary per department
SELECT department_id, MIN(salary) AS min_salary from employee GROUP BY department_id;

# 19 - Avg salary per department
SELECT department_id , AVG(salary) AS avg_salary from employee GROUP BY department_id;

# 20 - Total salary per department
SELECT department_id, SUM(salary) AS total_salary from employee GROUP BY department_id;

