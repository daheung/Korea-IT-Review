SELECT 
	sysdate		   AS "current date",
	sysdate - 0.5  AS "before 12 hours", 
	sysdate + 0.5  AS "after 12 hours", 
	sysdate + 1/24 AS "after 1 hour",
	sysdate - 1/24 AS "before 1 hour"
FROM dual;

SELECT *
FROM employees;

SELECT 
	last_name 		AS "last name",
	first_name 		AS "first name",
	department_id 	AS "department id"
FROM employees
WHERE 
	department_id = 80 AND 
	salary >= 10000
ORDER BY salary;

