-- 1. List the details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = 1986;


-- select manager details
SELECT title_id FROM titles
WHERE title = 'Manager';
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_title_id IN
(
	SELECT title_id FROM titles
	WHERE title = 'Manager'
);

-- 3. select manager details with department info

SELECT titles.title, dept_employees.dept_no, department.dept_name,
	employees.emp_no, employees.last_name, employees.first_name	
FROM (((employees
INNER JOIN titles ON employees.emp_title_id = titles.title_id)
INNER JOIN dept_employees ON employees.emp_no = dept_employees.emp_no)
INNER JOIN department ON dept_employees.dept_no = department.dept_no)
WHERE emp_title_id IN    
	(	
		SELECT title_id FROM titles
	  	WHERE title = 'Manager'
	);


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM ((employees
INNER JOIN dept_employees ON employees.emp_no = dept_employees.emp_no)
INNER JOIN department ON dept_employees.dept_no = department.dept_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM ((employees
INNER JOIN dept_employees ON employees.emp_no = dept_employees.emp_no)
INNER JOIN department ON dept_employees.dept_no = department.dept_no)
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM ((employees
INNER JOIN dept_employees ON employees.emp_no = dept_employees.emp_no)
INNER JOIN department ON dept_employees.dept_no = department.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY (last_name)
ORDER BY last_name DESC;


