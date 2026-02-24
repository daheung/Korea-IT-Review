SELECT ie.employee_id, ie.first_name, oe.employee_id, oe.first_name
FROM hr.employees ie
LEFT OUTER JOIN hr.employees oe
	ON ie.manager_id = oe.employee_id
ORDER BY ie.employee_id ASC;

SELECT *
FROM hr.employees ie
LEFT OUTER JOIN hr.employees oe
	ON ie.manager_id = oe.employee_id
ORDER BY ie.employee_id ASC;