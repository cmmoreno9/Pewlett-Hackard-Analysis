-SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date

INTO retirees_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirees_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirees_titles AS rt
ORDER BY emp_no, to_date DESC;

--Table 3
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM unique_titles

SELECT * FROM  retiring_titles

SELECT DISTINCT ON(emp.emp_no)emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	dep.from_date,
	dep.to_date,
	t.title
--DISTINCT ON(emp_no)
INTO mentorship_table
FROM employees AS emp
	INNER JOIN dept_emp AS dep
		ON (emp.emp_no = dep.emp_no)
			INNER JOIN titles AS t
				ON (emp.emp_no = t.emp_no)
WHERE (emp.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (dep.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_table 

