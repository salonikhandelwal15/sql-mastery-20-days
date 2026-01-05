# 1 - Get all employees
SELECT * FROM employee;

# 2 - Get employee names and salaries
SELECT name,salary from employee;

# 3 - Get employees with salary > 50,000
SELECT name from employee where salary > 50000;

# 4 - Get employees from department 10
SELECT name from employee where department_id= 10;

# 5 - Get employees not in department 20
SELECT name from employee where department_id != 20;

# 6 - Get employees with salary between 30,000 and 70,000
SELECT name from employee where salary between 30000 and 70000;

# 7 - Get employees whose name starts with 'A'
SELECT name from employee where name LIKE 'A%';

# 8 - Get employees whose name ends with 'n'
SELECT name from employee where name LIKE '%n';

# 9 - Get employees whose name contains 'sh'
SELECT name from employee where name LIKE '%sh%';

# 10 - Get employees hired after 2020
SELECT name from employee where hire_date>'2020-01-01';
