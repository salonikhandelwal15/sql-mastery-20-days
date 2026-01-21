# 11 - City classification
SELECT customer_id, city,
CASE
    WHEN city IN ('Mumbai','Delhi','Bangalore','Chennai','Hyderabad') THEN 'Metro'
    ELSE 'Non-Metro'
END AS city_type
FROM customers;

# 12 - Salary tax slab
SELECT name, salary,
CASE
    WHEN salary >= 100000 THEN '30% Tax'
    WHEN salary >= 50000 THEN '20% Tax'
    WHEN salary >= 25000 THEN '10% Tax'
    ELSE 'No Tax'
END AS tax_slab
FROM employee;

# 13 - Manager vs Employee label
SELECT name,
CASE
    WHEN emp_id IN (SELECT DISTINCT manager_id FROM employee WHERE manager_id IS NOT NULL)
    THEN 'Manager'
    ELSE 'Employee'
END AS role_label
FROM employee;

# 14 - Order month name
SELECT order_id, order_date,
CASE MONTH(order_date)
    WHEN 1 THEN 'January'
    WHEN 2 THEN 'February'
    WHEN 3 THEN 'March'
    WHEN 4 THEN 'April'
    WHEN 5 THEN 'May'
    WHEN 6 THEN 'June'
    WHEN 7 THEN 'July'
    WHEN 8 THEN 'August'
    WHEN 9 THEN 'September'
    WHEN 10 THEN 'October'
    WHEN 11 THEN 'November'
    ELSE 'December'
END AS order_month
FROM orders;

# 15 - Weekend vs weekday orders
SELECT order_id, order_date,
CASE
    WHEN DAYOFWEEK(order_date) IN (1,7) THEN 'Weekend'
    ELSE 'Weekday'
END AS order_type
FROM orders;

# 16 - Salary increment logic
SELECT emp_name, salary,
CASE
    WHEN salary < 30000 THEN salary * 1.20
    WHEN salary < 60000 THEN salary * 1.10
    ELSE salary * 1.05
END AS incremented_salary
FROM employee;

# 17 - Employee retention risk
SELECT name, hire_date,
CASE
    WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) < 1 THEN 'High Risk'
    WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) < 3 THEN 'Medium Risk'
    ELSE 'Low Risk'
END AS retention_risk
FROM employee;

# 18 - Performance grade
SELECT name, salary,
CASE
    WHEN salary >= 80000 THEN 'Excellent'
    WHEN salary >= 50000 THEN 'Good'
    WHEN salary >= 30000 THEN 'Average'
    ELSE 'Poor'
END AS performance_grade
FROM employee;

# 19 - Customer loyalty category
SELECT c.customer_id,
       COUNT(o.order_id) AS total_orders,
CASE
    WHEN COUNT(o.order_id) >= 20 THEN 'Platinum'
    WHEN COUNT(o.order_id) >= 10 THEN 'Gold'
    WHEN COUNT(o.order_id) >= 5 THEN 'Silver'
    ELSE 'New'
END AS loyalty_category
FROM customers c
LEFT JOIN orders o 
       ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

# 20 - Salary comparison flag
SELECT name, salary,
CASE
    WHEN salary > (SELECT AVG(salary) FROM employee) THEN 'Above Average'
    WHEN salary < (SELECT AVG(salary) FROM employee) THEN 'Below Average'
    ELSE 'Average'
END AS salary_flag
FROM employee;
