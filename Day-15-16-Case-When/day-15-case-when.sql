use sql_practice;
# 1 - Salary category (High/Medium/Low)
SELECT name, salary,
CASE
    WHEN salary >= 80000 THEN 'High'
    WHEN salary BETWEEN 40000 AND 79999 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employee;

# 2 - Employee status based on salary
SELECT name, salary,
CASE
    WHEN salary >= 70000 THEN 'Senior Employee'
    ELSE 'Junior Employee'
END AS employee_status
FROM employee;

# 3 - Orders amount category
SELECT order_id, amount,
CASE
    WHEN amount >= 10000 THEN 'Large Order'
    WHEN amount BETWEEN 5000 AND 9999 THEN 'Medium Order'
    ELSE 'Small Order'
END AS order_category
FROM orders;

# 4 - Bonus eligibility
SELECT name, salary,
CASE
    WHEN salary >= 60000 THEN 'Eligible'
    ELSE 'Not Eligible'
END AS bonus_eligibility
FROM employee;

# 5 - Experience level from hire date
SELECT name, hire_date,
CASE
    WHEN YEAR(CURDATE()) - YEAR(hire_date) >= 10 THEN 'Expert'
    WHEN YEAR(CURDATE()) - YEAR(hire_date) BETWEEN 5 AND 9 THEN 'Experienced'
    ELSE 'Fresher'
END AS experience_level
FROM employee;

# 6 - Salary hike percentage
SELECT name, salary,
CASE
    WHEN salary < 40000 THEN salary * 0.20
    WHEN salary BETWEEN 40000 AND 70000 THEN salary * 0.15
    ELSE salary * 0.10
END AS hike_amount
FROM employee;

# 7 - Customer type (Premium/Regular)
SELECT c.customer_name,
SUM(o.amount) AS total_amount,
CASE
    WHEN SUM(o.amount) >= 50000 THEN 'Premium'
    ELSE 'Regular'
END AS customer_type
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

# 8 - Department size category
SELECT department_id, COUNT(*) AS emp_count,
CASE
    WHEN COUNT(*) >= 20 THEN 'Large'
    WHEN COUNT(*) BETWEEN 10 AND 19 THEN 'Medium'
    ELSE 'Small'
END AS department_size
FROM employee
GROUP BY department_id;

# 9 - Order priority
SELECT order_id, amount,
CASE
    WHEN amount >= 15000 THEN 'High Priority'
    WHEN amount BETWEEN 7000 AND 14999 THEN 'Medium Priority'
    ELSE 'Low Priority'
END AS order_priority
FROM orders;

# 10 - Employee seniority
SELECT name, hire_date,
CASE
    WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) >= 15 THEN 'Very Senior'
    WHEN TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) BETWEEN 7 AND 14 THEN 'Senior'
    ELSE 'Junior'
END AS seniority
FROM employee;
