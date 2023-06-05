-- Drop Table if exists
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Create new table
CREATE TABLE departments(
	dept_no VARCHAR(5) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY (dept_no)
)
;

SELECT *
From departments; 

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (emp_no, dept_no)
)
;

SELECT *
From dept_emp; 

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	CONSTRAINT "pk_dept_manager" PRIMARY KEY (dept_no, emp_no)
)
;

SELECT *
From dept_manager; 

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY (emp_no)
);

SELECT *
From employees; 

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary BIGINT NOT NULL,
	CONSTRAINT "pk_salaries" PRIMARY KEY (emp_no)
);

SELECT *
From salaries; 

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(20) NOT NULL,
	CONSTRAINT "pk_titles" Primary KEY (title_id)

)
;

SELECT *
From salaries; 

-- Alter tables with foreign key to reference other tables 
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "titles" ADD CONSTRAINT "unique_title_id" UNIQUE ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");