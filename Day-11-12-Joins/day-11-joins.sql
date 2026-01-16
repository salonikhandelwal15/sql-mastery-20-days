use sql_practice;
# 1 - Employees with their department name
SELECT e.emp_id,d.department_name from employee e INNER JOIN department d ON e.department_id=d.department_id;

# 2 - Employees with department using LEFT JOIN
SELECT e.emp_id,d.department_name from employee e LEFT JOIN department d ON e.department_id=d.department_id;

# 3 - Departments without employees
SELECT d.department_name from department d LEFT JOIN employee e ON d.department_id=e.department_id WHERE e.emp_id IS NULL;

# 4 - Orders with customer name
SELECT o.order_id,o.customer_id from orders o INNER JOIN customers c ON o.customer_id=c.customer_id;

# 5 - Orders with customer city
SELECT o.order_id,c.city from orders o INNER JOIN customers c ON o.customer_id=c.customer_id;

# 6 - Customers without any orders
SELECT c.customer_name from customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;

# 7 - Employees and their manager names
SELECT e.name AS employee,m.name AS manager from employee e INNER JOIN employee m ON e.manager_id = m.emp_id;

# 8 - Employees who do not have a manager
SELECT e.name from employee e LEFT JOIN employee m ON e.manager_id=m.emp_id WHERE m.emp_id IS NULL;

# 9 - Employees with manager and department name
SELECT e.name AS employee,m.name AS manager,
d.department_name
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id
LEFT JOIN department d
ON e.department_id = d.department_id;

# 10 - Customers along with total number of orders
SELECT c.customer_name,
COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
