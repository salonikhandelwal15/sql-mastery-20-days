# 1 - Count total employees
SELECT COUNT(*) AS total_employees from employee;

# 2 - Count employees in department 10
SELECT COUNT(*) AS dept10_employee from employee where department_id=10;

# 3 - Find maximum salary
SELECT MAX(salary) AS max_salary from employee;

# 4 - Find minimum salary
SELECT MIN(salary) AS min_salary from employee;

# 5 - Find average salary
SELECT AVG(salary) AS avg_salary from employee;

# 6 - Total salary paid
SELECT SUM(salary) AS total_salary from employee;

# 7 - Highest order amount
SELECT MAX(amount) AS highest_order_amount from orders;

# 8 - Lowest order amount
SELECT MIN(amount) AS lowest_order_amount from orders;

# 9 - Average order value
SELECT AVG(amount) AS avg_order_value from orders;

# 10 - Count distinct departments
SELECT COUNT(DISTINCT department_id) AS total_departments FROM employee;
