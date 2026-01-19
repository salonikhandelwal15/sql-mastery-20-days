# 11 - Customers with no orders
SELECT * FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;

# 12 - Employees working in department 'IT'
SELECT * FROM employee e JOIN department d ON e.department_id = d.department_id WHERE d.department_name = 'IT';

# 13 - Employees earning more than department avg
SELECT *
FROM employee e
WHERE e.salary >
(
  SELECT AVG(salary)
  FROM employee
  WHERE department_id = e.department_id
);

# 14 - Employees hired after company avg hire date
SELECT *
FROM employee
WHERE hire_date >
(SELECT AVG(hire_date)
  FROM employee
);

# 15 - Employees earning min salary per department
SELECT *
FROM employee e
WHERE salary =
(SELECT MIN(salary)
  FROM employee
  WHERE department_id = e.department_id
);

# 16 - Employees earning max salary per department
SELECT *
FROM employee e
WHERE salary =
(SELECT MAX(salary)
  FROM employee
  WHERE department_id = e.department_id
);

# 17 - Departments with more employees than avg
SELECT department_id
FROM employee
GROUP BY department_id
HAVING COUNT(*) >
(SELECT AVG(emp_count)
  FROM (SELECT COUNT(*) AS emp_count
        FROM employee
        GROUP BY department_id)t
);

# 18 - Employees whose salary is in top 10%
SELECT *
FROM (SELECT *,
           NTILE(10) OVER (ORDER BY salary DESC) AS grp
    FROM employee
) t
WHERE grp = 1;

# 19 - Customers with orders > overall avg
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING SUM(amount) >
(
  SELECT AVG(total_amount)
  FROM (SELECT SUM(amount) AS total_amount
        FROM orders
        GROUP BY customer_id
       ) t
);

# 20 - Employees working under highest paid manager
SELECT *
FROM employee
WHERE manager_id =
(
  SELECT emp_id
  FROM employee
  WHERE salary = (SELECT MAX(salary) FROM employee)
);
