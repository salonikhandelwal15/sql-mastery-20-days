use sql_practice;
# 1 - Employees count per department
SELECT department_id, COUNT(*) AS employee_count from employee GROUP BY department_id;

# 2 - Average salary per department
SELECT department_id ,AVG(salary) AS avg_salary from employee GROUP BY department_id;

# 3 - Max salary per department
SELECT department_id,MAX(salary) AS max_salary from employee GROUP BY department_id;

# 4 - Min salary per department
SELECT department_id,MIN(salary) AS min_salary from employee GROUP BY department_id;

# 5 - Total salary per department
SELECT department_id,SUM(salary) AS total_salary from employee GROUP BY department_id;

# 6 - Number of employees per manager
SELECT manager_id, COUNT(*) AS employee_count from employee WHERE manager_id IS NOT NULL GROUP BY manager_id;

# 7 - Employees hired per year
SELECT year(hire_date) AS hire_year, COUNT(*) AS employees_hired from employee GROUP BY year(hire_date);

# 8 - Orders count per customer
SELECT customer_id, COUNT(*) AS order_count from orders GROUP BY customer_id;

# 9 - Total order amount per customer
SELECT customer_id, SUM(amount) AS total_order_amount from orders GROUP BY customer_id;

# 10 - Avg order amount per customer
SELECT customer_id, AVG(amount) AS avg_order_amount from orders GROUP BY customer_id;