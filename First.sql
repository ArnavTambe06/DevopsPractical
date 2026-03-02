-- =========================================
-- CREATE DATABASE
-- =========================================
CREATE DATABASE company_db;

-- Use the database (MySQL)
USE company_db;

-- =========================================
-- CREATE TABLES
-- =========================================

-- Department table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);

-- Employees table with foreign key
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- =========================================
-- INSERT DATA
-- =========================================

-- Insert into departments
INSERT INTO departments (dept_name)
VALUES 
('IT'),
('HR'),
('Finance');

-- Insert into employees
INSERT INTO employees (name, age, salary, dept_id)
VALUES
('John Doe', 30, 60000.00, 1),
('Jane Smith', 28, 50000.00, 2),
('Mike Johnson', 35, 75000.00, 3),
('Emily Davis', 26, 55000.00, 1);

-- =========================================
-- SELECT OPERATIONS
-- =========================================

-- Select all employees
SELECT * FROM employees;

-- Select specific columns
SELECT name, salary FROM employees;

-- Select with condition
SELECT * FROM employees
WHERE salary > 55000;

-- =========================================
-- JOIN OPERATION
-- =========================================

-- Join employees with departments
SELECT e.name, e.salary, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

-- =========================================
-- UPDATE OPERATION
-- =========================================

-- Increase salary of IT employees
UPDATE employees
SET salary = salary + 5000
WHERE dept_id = 1;

-- =========================================
-- DELETE OPERATION
-- =========================================

-- Delete employee with low salary
DELETE FROM employees
WHERE salary < 52000;

-- =========================================
-- AGGREGATE FUNCTIONS
-- =========================================

-- Count employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Average salary
SELECT AVG(salary) AS average_salary FROM employees;

-- Group by department
SELECT dept_id, COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id;

-- =========================================
-- DROP TABLES (Optional)
-- =========================================
-- DROP TABLE employees;
-- DROP TABLE departments;
-- DROP DATABASE company_db;
