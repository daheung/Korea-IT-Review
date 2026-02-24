-- (1) 급여가 가장 높은 직원 조회
SELECT 
	employee_id,
	first_name || ' ' || last_name AS name,
	salary
FROM employees
WHERE salary = (
	SELECT max(salary)
	FROM employees
);

-- (2) 부서 별 평균 급여보다 높은 직원들의 급여 조회
SELECT e1.employee_id, e1.first_name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
	SELECT avg(e2.salary)
	FROM employees e2
	WHERE e1.department_id = e2.department_id
	GROUP BY department_id
)
ORDER BY e1.employee_id;

-- 가장 입사일이 오래된 직원 조회
SELECT *
FROM employees e
WHERE e.hire_date = (
	SELECT min(hire_date)
	FROM employees
);

-- 특정 부서에 속한 직원번호, 이름, 부서번호 조회
SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id IN (
	SELECT department_id
	FROM employees
	WHERE department_id = 60
);

-- 부서명까지 같이 조회
-- join으로 조회
SELECT e.employee_id, d.department_name, e.first_name, e.department_id
FROM employees e
LEFT OUTER JOIN departments d
	ON e.department_id = d.department_id
WHERE e.department_id IN (
	SELECT department_id
	FROM employees
	WHERE department_id = 60
);

-- join 없이 조회
SELECT 
	e.employee_id, 
	e.first_name, 
	e.department_id,
	(
		SELECT department_name
		FROM departments d
		WHERE e.department_id = d.department_id
	) AS department_name
FROM employees e
WHERE e.department_id IN (
	SELECT department_id
	FROM employees
	WHERE department_id IN (
		SELECT department_id
		FROM employees
		WHERE department_id = 60
	)
);
		