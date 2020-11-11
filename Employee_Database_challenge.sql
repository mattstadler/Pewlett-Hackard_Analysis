-- ** DELIVERABLE 1 **

--  Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--  Retrieve the title, from_date, and to_date columns from the Titles table.
--  Create a new table using the INTO clause.
--  Join both tables on the primary key.
--  Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.

SELECT emp.emp_no,
    emp.first_name,
    emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_employees
FROM employees as emp
INNER JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO retirement_titles
FROM retirement_employees
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(emp_no), title
FROM retirement_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- ** DELIVERABLE 2 **
-- Mentorship Eligibility
SELECT  emp.emp_no,
        emp.first_name,
        emp.last_name,
        emp.birth_date,
        de.from_date,
        de.to_date,
        ti.title
INTO mentorship_eligibility
FROM employees AS emp
    INNER JOIN dept_emp AS de
        ON (emp.emp_no = de.emp_no)
    INNER JOIN titles AS ti
        ON (emp.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');

-- Filter for only first instance of employee
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
birth_date,
from_date,
to_date,
title
INTO mentorship_update
FROM mentorship_eligibility
ORDER BY emp_no


