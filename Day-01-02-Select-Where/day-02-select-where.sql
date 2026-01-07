# 11 - Get employees hired before 2020
SELECT name  from employee where hire_date < '2020-01-01';

# 12 - Get employees with NULL manager
SELECT name from employee where manager_id IS NULL;

# 13 - Get employees with NOT NULL manager
SELECT name from  employee where manager_id IS NOT NULL;

# 14 - Get employees from departments 10 or 30
SELECT name FROM employee where department_id IN(10,30);

# 15 - Get employees with salary >= 60,000 and department 20
SELECT name FROM employee where salary >= 60000 AND department_id=20;

# 16 - Get employees ordered by salary (ascending)
SELECT name from employee order by salary;

# 17 - Get employees ordered by salary (descending)
SELECT name from employee order by salary desc;

# 18 - Get top 5 highest paid employees
SELECT name from employee order by salary desc Limit 5;

# 19 - Get distinct department IDs
SELECT distinct department_id from employee;

# 20 - Get employees excluding salary 40,000
SELECT name from employee where salary <> 40000;

