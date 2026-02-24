SELECT 
	last_name 	 AS "name",
	phone_number AS "phone number",
	hire_date 	 AS "hire_date"
FROM employees
WHERE department_id = 60 OR salary <= 4000
ORDER BY hire_date DESC;

SELECT first_name || ' ' || last_name AS name
FROM employees
WHERE MANAGER_ID IS NOT NULL;