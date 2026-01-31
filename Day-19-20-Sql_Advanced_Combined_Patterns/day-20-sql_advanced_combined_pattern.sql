use sql_practice;
# 11 - Customers who never placed an order or whose total order value is below average
SELECT c.customer_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) = 0
OR SUM(o.amount) < (SELECT AVG(amount) FROM orders);

# 12 - Employees hired earlier than their manager and earning less than their manager
SELECT e.emp_id, e.name
FROM employee e
JOIN employee m ON e.manager_id = m.emp_id
WHERE e.hire_date < m.hire_date
AND e.salary < m.salary;

# 13 - Departments whose average salary is higher than the company average salary
SELECT department_id
FROM employee
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) FROM employee);

# 14 - Customers whose first order was placed in January 2024 and spent more than 10,000
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING MIN(order_date) BETWEEN '2024-01-01' AND '2024-01-31'
   AND SUM(amount) > 10000;
   
# 15 - Employees who are not managers but earn more than at least one manager
SELECT emp_id, name
FROM employee
WHERE emp_id NOT IN (
    SELECT DISTINCT manager_id
    FROM employee
    WHERE manager_id IS NOT NULL
)
AND salary > (
    SELECT MIN(salary)
    FROM employee
    WHERE emp_id IN (
        SELECT DISTINCT manager_id
        FROM employee
        WHERE manager_id IS NOT NULL
    )
);

# 16 - Departments with salary range (max–min) greater than 25,000 and having more than 1 employee
SELECT department_id
FROM employee
GROUP BY department_id
HAVING MAX(salary) - MIN(salary) > 25000
AND COUNT(*) > 1;

# 17 - Customers whose total order amount is greater than the maximum order placed in Mumbai
SELECT o.customer_id
FROM orders o
GROUP BY o.customer_id
HAVING SUM(o.amount) >
(
    SELECT MAX(o2.amount)
    FROM orders o2
    JOIN customers c2 ON o2.customer_id = c2.customer_id
    WHERE c2.city = 'Mumbai'
);

# 18 - Managers who manage employees from multiple departments
SELECT m.emp_id, m.name
FROM employee m
JOIN employee e ON m.emp_id = e.manager_id
GROUP BY m.emp_id, m.name
HAVING COUNT(DISTINCT e.department_id) > 1;

# 19 - Employees whose salary is above department average but below company max salary
SELECT e.*
FROM employee e
WHERE e.salary >
      (SELECT AVG(salary)
       FROM employee
       WHERE department_id = e.department_id)
  AND e.salary <
      (SELECT MAX(salary) FROM employee);
      
# 20 - Departments where the earliest hired employee earns more than department average salary
SELECT e.department_id
FROM employee e
JOIN (
    SELECT department_id, MIN(hire_date) AS min_hire_date
    FROM employee
    GROUP BY department_id
) t
  ON e.department_id = t.department_id
 AND e.hire_date = t.min_hire_date
WHERE e.salary >
      (
        SELECT AVG(salary)
        FROM employee
        WHERE department_id = e.department_id
      );
