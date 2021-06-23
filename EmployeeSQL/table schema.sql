
CREATE TABLE department (
	dept_no TEXT PRIMARY KEY,
	dept_name TEXT
);


CREATE TABLE dept_employees (
	emp_no INT, 
	dept_no TEXT,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_manager (
	dept_no TEXT,
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id TEXT,
	birth_date DATE,
	first_name TEXT,
	last_name TEXT,
	sex TEXT,
	hire_date DATE, 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE salaries(
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT
);


CREATE TABLE titles(
	title_id TEXT,
	title TEXT
);
