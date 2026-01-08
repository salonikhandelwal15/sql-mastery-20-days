# 1 - Employees ordered by salary ASC
SELECT name from employee order by salary;

# 2 - Employees ordered by salary DESC
SELECT name from employee order by salary desc;

# 3 - Employees ordered by name
SELECT name from employee order by name;

# 4 - Employees ordered by hire_date
SELECT name from employee order by hire_date;

# 5 - Top 3 highest paid employees
SELECT name,salary from employee order by salary desc limit 3;

# 6 - Top 5 lowest paid employees
SELECT name,salary from employee order by salary  limit 5;

# 7 - Latest 5 hired employees
SELECT name, hire_date from employee ORDER BY hire_date DESC LIMIT 5;

# 8 - First 10 employees
SELECT name from employee ORDER BY emp_id ASC LIMIT 10;

# 9 - Second highest salary
SELECT MAX(salary) AS second_highest_salary from employee WHERE salary < (SELECT MAX(salary) from employee
);

# 10 - Third highest salary
SELECT MAX(salary) AS third_highest_salary from employee WHERE salary < (SELECT MAX(salary) from employee WHERE salary < (SELECT MAX(salary) from employee));
   