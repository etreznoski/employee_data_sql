-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(50),
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    employee_no VARCHAR(10) NOT NULL,
    salary INTEGER,
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS dept_managers
(
    dept_no VARCHAR(10) NOT NULL,
    employee_no VARCHAR(10) NOT NULL,
    PRIMARY KEY(dept_no, employee_no)
);

CREATE TABLE IF NOT EXISTS dept_employees
(
    employee_no VARCHAR(10) NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    PRIMARY KEY(employee_no, dept_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    employee_no VARCHAR(10) NOT NULL,
    employee_title VARCHAR(10),
    birth_date VARCHAR(20),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    sex VARCHAR(2) NOT NULL,
    hire_date VARCHAR(20),
    PRIMARY KEY(employee_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(10) NOT NULL,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY(title_id)
);


-- Create FKs
ALTER TABLE dept_employees
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_employees
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_managers
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (employee_no)
    REFERENCES employees(employee_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (employee_title)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    

-- Create Indexes