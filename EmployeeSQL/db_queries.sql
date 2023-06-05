---Data Analysis Section
---Make appropriate Joins 



-- 1. List the employee number, last name, first name, sex, and salary of each employee.
--This was done by Joining the Salaries and Employees table

SELECT salaries.salary, employees.emp_no, employees.last_name, employees.first_name, employees.sex 
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no  

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
--This was done by a query search on Employees table using the Hire_Date to find the results. (No table join was needed here.)

SELECT hire_date, first_name, last_name 
FROM employees
WHERE hire_date between '1/1/1986' and '12/31/1986';

-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.--JOIN dept_manager, departments, & employees
-- This query was done by joining the employees, depart_manager and departments tables

SELECT employees.first_name, employees.last_name, departments.dept_no, departments.dept_name, dept_manager.emp_no
FROM departments
INNER JOIN dept_manager ON 
dept_manager.dept_no = departments.dept_no 
INNER JOIN employees ON
employees.emp_no = dept_manager.emp_no
  

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--This query was done by joining the employees, depart_manager and departments tables
SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
INNER join dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no



-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- List first, last name and sex of employees. Used 'Wildcard' symbol % to get all last names beginning with B. 

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
--- First joining Dept_emp table with departments and next joining employee table with dept_emp table. Followed by a Where search to specify Sales department. 

SELECT employees.first_name, employees.last_name, departments.dept_name, dept_emp.emp_no
FROM departments
INNER join dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name= 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- First joining dept_emp to departments, followed by joining employees and dept_emp tables. Next a Where query is done to obtain both Sales and Development departments.
-- Finally to keep things tidy, I ordered in Ascension so that Sales and Development employees were grouped together, starting with Sales. 

SELECT employees.first_name, employees.last_name, departments.dept_name, dept_emp.emp_no 
FROM departments
INNER join dept_emp ON
dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name= 'Sales' OR departments.dept_name= 'Development'
ORDER BY departments.dept_name='Development' ASC;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
-- Using Count aggregrate function to count the frequency of last_name by using Group By clause to obtain the counts of each last name. 
-- Lastly, using desc order by aggregate to get the list in descending order. 

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;