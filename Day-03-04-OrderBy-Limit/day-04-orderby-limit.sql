# 11 - Employees ordered by department then salary
SELECT * from employee order by department_id, salary;

# 12 - Orders sorted by amount DESC
SELECT * from orders order by  amount DESC;

# 13 - Customers ordered by city
SELECT * from customers order by city;

# 14 - Highest order amount
SELECT MAX(amount) AS highest_order_amount from orders;

# 15 - Lowest order amount
SELECT MIN(amount) AS lowest_order_amount from orders;

# 16 - First 3 orders
SELECT * from orders LIMIT 3;

# 17 - rders ordered by date
SELECT * from orders order by order_date;

# 18 - Orders ordered by customer_id
SELECT * from orders order by customer_id;

# 19 - Employees ordered by manager_id
SELECT * from employee order by manager_id;

# 20 - Salary-wise ranking simulation
SELECT emp_id,name,salary,RANK() OVER (order by salary DESC) AS salary_rank from employee;
