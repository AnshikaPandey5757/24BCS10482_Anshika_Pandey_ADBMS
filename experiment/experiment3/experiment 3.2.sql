-- Create Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10,2) NOT NULL,
    emp_city VARCHAR(100) NOT NULL
);

-- Insert Data
INSERT INTO employees VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata');

-- 1. Count employees in each city
SELECT emp_city, COUNT(*) AS cnt
FROM employees
GROUP BY emp_city;

-- 2(i). Count employees in each city, sort by count ascending
SELECT emp_city, COUNT(*) AS cnt
FROM employees
GROUP BY emp_city
ORDER BY cnt ASC;

-- 2(ii). Count employees in each city, sort by count descending
-- If counts are equal, sort city name ascending
SELECT emp_city, COUNT(*) AS cnt
FROM employees
GROUP BY emp_city
ORDER BY cnt DESC, emp_city ASC;

-- 3. Count employees in each city whose salary >= 90000
SELECT emp_city,
       SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) AS cnt
FROM employees
GROUP BY emp_city;

-- 4. Cities having at least one employee with salary >= 90000
SELECT emp_city
FROM employees
GROUP BY emp_city
HAVING SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) > 0;

-- 5. Average employee salary of each city
SELECT emp_city,
       ROUND(AVG(emp_salary), 2) AS avg_salary
FROM employees
GROUP BY emp_city;

-- 6. Distinct cities
SELECT DISTINCT emp_city
FROM employees;

-- 7. Count distinct cities
SELECT COUNT(DISTINCT emp_city) AS cnt
FROM employees;
