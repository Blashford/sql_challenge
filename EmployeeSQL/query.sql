-- #1
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary 
FROM employees e
	JOIN salaries s ON e.emp_no = s.emp_no;



-- #2
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;




-- #3
WITH dep AS (
	SELECT * 
	FROM departments
)
, man AS (
	SELECT dep.*, dm.emp_no
	FROM dept_manager dm
		JOIN dep ON dm.dept_no = dep.dept_no
)
, emp AS (
	SELECT man.*, first_name, last_name
	FROM employees e
		JOIN man ON e.emp_no = man.emp_no
)
SELECT *
FROM emp;


--#4
SELECT e.emp_no, last_name, first_name, d.dept_name
FROM employees e
	JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no;
	


-- #5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';



-- #6
WITH sales AS (
	SELECT *
	FROM departments
	WHERE dept_no = 'd007'
)
, num AS (
	SELECT sales.dept_name, de.emp_no
	FROM dept_emp de
		JOIN sales ON de.dept_no = sales.dept_no
)
, emp AS (
	SELECT num.*, e.first_name, e.last_name
	FROM employees e
		JOIN num ON e.emp_no = num.emp_no
)
SELECT emp_no, first_name, last_name, dept_name
FROM emp;


-- #7
WITH sales AS (
	SELECT *
	FROM departments
	WHERE dept_no = 'd007'
	OR dept_no = 'd005'
)
, num AS (
	SELECT sales.dept_name, de.emp_no
	FROM dept_emp de
		JOIN sales ON de.dept_no = sales.dept_no
)
, emp AS (
	SELECT num.*, e.first_name, e.last_name
	FROM employees e
		JOIN num ON e.emp_no = num.emp_no
)
SELECT emp_no, first_name, last_name, dept_name
FROM emp
ORDER BY dept_name;


-- #8
SELECT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;
