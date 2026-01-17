use sql_practice;
# 11 - Department-wise total salary
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM department d
JOIN employee e
ON d.department_id = e.department_id
GROUP BY d.department_name;

# 12 - Departments having more than 2 employees
SELECT d.department_name
FROM department d
JOIN employee e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.emp_id) > 2;

# 13 - Customers along with total order amount
SELECT c.customer_name, SUM(o.amount) AS total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

# 14 - Employees earning more than their department’s average salary
SELECT name, salary
FROM employee e
WHERE salary > (SELECT AVG(salary)
FROM employee
WHERE department_id = e.department_id);

# 15 - Employees working under the same manager
SELECT manager_id, COUNT(emp_id) AS employee_count
FROM employee
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(emp_id) > 1;

# 16 - Departments having salary range greater than 25,000
SELECT d.department_name
FROM department d
JOIN employee e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING MAX(e.salary) - MIN(e.salary) > 25000;

# 17 - Customers who placed orders in multiple months
SELECT c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(DISTINCT MONTH(o.order_date)) > 1;

# 18 - Managers who manage employees from the same department
SELECT m.name AS manager_name
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
GROUP BY m.emp_id, m.name
HAVING COUNT(DISTINCT e.department_id) = 1;

# 19 - Customers whose total order value is greater than the city average
SELECT c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
HAVING SUM(o.amount) >
	(SELECT AVG(city_total)
	FROM (SELECT SUM(o2.amount) AS city_total
	FROM customers c2
	JOIN orders o2
		ON c2.customer_id = o2.customer_id
		WHERE c2.city = c.city
		GROUP BY c2.customer_id
       ) x);
       
# 20 - Departments with at least one employee earning above the department average
SELECT DISTINCT d.department_name
FROM department d
JOIN employee e
ON d.department_id = e.department_id
WHERE e.salary >
      (SELECT AVG(salary)
       FROM employee
       WHERE department_id = d.department_id);


