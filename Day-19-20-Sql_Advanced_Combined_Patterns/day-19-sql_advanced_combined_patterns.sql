use sql_practice;
# 1 - Employees earning more than their department average and hired before 2020
SELECT e.*
FROM employee e
WHERE e.salary >
      (SELECT AVG(salary)
       FROM employee
       WHERE department_id = e.department_id)
  AND e.hire_date < '2020-01-01';
  
  # 2 - Departments having more than 1 employee whose salary is above overall average salary
SELECT department_id
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)
GROUP BY department_id
HAVING COUNT(*) > 1;

# 3 - Employees who earn more than their manager and work in the same department
SELECT e.emp_id, e.name
FROM employee e
JOIN employee m
  ON e.manager_id = m.emp_id
WHERE e.salary > m.salary
  AND e.department_id = m.department_id;
  
  # 4- Customers whose total order value is higher than the city-wise average order value
SELECT c.customer_id, c.city, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.city
HAVING SUM(o.amount) >
       (
         SELECT AVG(city_total)
         FROM (
               SELECT SUM(o2.amount) AS city_total
               FROM customers c2
               JOIN orders o2 ON c2.customer_id = o2.customer_id
               WHERE c2.city = c.city
               GROUP BY c2.customer_id
              ) t
       );

# 5 - Departments where the maximum salary is greater than the company’s average salary
SELECT department_id
FROM employee
GROUP BY department_id
HAVING MAX(salary) > (SELECT AVG(salary) FROM employee);

# 6 - Employees who are managers and whose team’s average salary is greater than 60,000
SELECT m.emp_id, m.name
FROM employee m
WHERE m.emp_id IN (
    SELECT manager_id
    FROM employee
    GROUP BY manager_id
    HAVING AVG(salary) > 60000
);

# 7 - Customers who placed orders in more than one month and spent over 20,000
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT MONTH(order_date)) > 1
   AND SUM(amount) > 20000;
   
# 8 - Employees working in departments where at least one employee earns more than 90,000
SELECT *
FROM employee
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM employee
    WHERE salary > 90000
);

# 9 - Employees whose salary is in the top 20% of all salaries
SELECT *
FROM (
    SELECT *,
           NTILE(5) OVER (ORDER BY salary DESC) AS grp
    FROM employee
) t
WHERE grp = 1;

# 10 - Departments where all employees earn more than 50,000
SELECT department_id
FROM employee
GROUP BY department_id
HAVING MIN(salary) > 50000;
