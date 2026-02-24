SELECT * FROM employees;
SELECT * FROM departments;

-- 1) 급여가 10000 이상 또는 SA_REP 직무를 가진 직원의 목록을 합쳐서 조회하시오. (중복 제외)
SELECT *
FROM employees
WHERE salary >= 10000
UNION 
SELECT *
FROM employees
WHERE job_id = 'SA_REP';

-- 2) Roma 지역에서 근무하는 부서의 소속 직원 중 급여가 5000 이상인 직원만 조회
SELECT * 
FROM departments d
LEFT OUTER JOIN employees e
	ON e.department_id = d.department_id
LEFT OUTER JOIN locations l
	ON l.location_id = d.location_id
WHERE e.salary >= 5000 AND l.city = 'Roma';

-- 3) 모든 직원 목록 중에서 부서 배정 안된 직원만 조회
SELECT *
FROM employees
WHERE department_id IS NULL;

-- 4) 급여가 9000 이상인 직원과 부서번호가 50번인 직원을 중복 포함해서 조회
-- 조회 컬럼 : employee_id, first_name, salary, department_id
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE salary >= 9000
UNION ALL
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id = 50;