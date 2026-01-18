# 1 - Employee with highest salary
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee);

# 2 - Employee with second highest salary
SELECT * FROM employee WHERE salary = (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee));

# 3 - Employees earning more than avg salary
SELECT * FROM employee WHERE salary > (SELECT AVG(salary) FROM employee);

# 4 - Employees in department with highest avg salary
SELECT * FROM employee WHERE department_id = (SELECT department_id FROM employee GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1);

# 5 - Departments with max salary employee
SELECT d.department_name,e.name
FROM department d
JOIN employee e
ON d.department_id = e.department_id
WHERE e.salary = (SELECT MAX(salary) FROM employee);

# 6 - Customers with highest total order
SELECT * FROM customers WHERE customer_id = (SELECT customer_id FROM orders GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1);

# 7 - Employees earning more than manager
SELECT * FROM employee e WHERE salary > (SELECT salary FROM employee m WHERE e.manager_id = m.emp_id);

# 8 - Employees with same salary as someone else
SELECT * FROM employee WHERE salary IN (SELECT salary FROM employee GROUP BY salary HAVING COUNT(salary) > 1);

# 9- Employees not earning max salary
SELECT * FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);

# 10 - Orders greater than avg order amount
SELECT * FROM orders WHERE amount > (SELECT AVG(amount) FROM orders);