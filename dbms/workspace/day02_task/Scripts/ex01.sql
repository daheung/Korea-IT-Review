DROP TABLE tbl_shop_user;

CREATE TABLE tbl_shop_user(
    user_id     NUMBER,
    user_name   VARCHAR2(64) CONSTRAINT cst_user_name NOT NULL,
    email       VARCHAR2(32),
    gender      VARCHAR2(1),
    status      VARCHAR2(1) DEFAULT 'Y',
    join_date   DATE DEFAULT SYSDATE,

    CONSTRAINT pk_user_id PRIMARY KEY (user_id),
    CONSTRAINT cst_email UNIQUE (email),
    CONSTRAINT cst_gender CHECK (gender IN ('F', 'N')),
    CONSTRAINT cst_status CHECK (status IN ('Y', 'N'))
);



-- 1번 --
-- 모든 직원의 이름(이름+성), 급여, 커미션, 커미션을 포함한 연봉을
-- 총보상이라는 별칭으로 출력하시오.
SELECT 
	first_name || ' ' || last_name   			AS "name",
	salary 						    	 		AS "salary",
	 NVL(commission_pct, 0)				    	AS "commission",
	(NVL(commission_pct, 0) + 1) * salary * 12 	AS "all reward"
FROM employees
ORDER BY "all reward";


-- 2번 --
-- 직원번호와 이메일을 연결하여
-- 직원번호_이메일이라는 별칭으로 출력하시오.
-- 조회 컬럼: 직원번호, 이메일, 급여
SELECT 
 	employee_id || '_' || email AS "id + email",
 	email						AS "email",
 	salary 						AS "salary"
FROM employees;


-- 3번 --
-- 급여가 7000 초과인 직원의
-- 직원번호, 이름, 급여, 입사일을 출력하시오.
SELECT 
	employee_id AS "employee id",
	salary 		AS "salary",
	hire_date	AS "hire date"
FROM employees
WHERE salary >= 7000
ORDER BY salary;


-- 4번 --
-- 부서번호가 50번 또는 80번이 아닌 직원만 조회하시오.
-- 조회 컬럼: 직원번호, 이름, 급여, 입사일
SELECT 
	employee_id 					AS "employee id",
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary",
	hire_date 						AS "hire date"
FROM employees
WHERE department_id NOT IN (50, 80);


-- 5번 --
-- 급여가 4000 이상 7500 이하인 직원들을 조회하시오.
-- 조회 컬럼: 직원번호, 이름, 급여, 입사일
SELECT 
	employee_id 					AS "employee id",
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary",
	hire_date 						AS "hire date"
FROM employees
WHERE salary BETWEEN 4000 AND 7500
ORDER BY salary;


-- 6번 --
-- 직무ID가 IT_PROG, SA_REP, SA_MAN인 직원만 조회하시오.
-- 조회 컬럼: 직원번호, 이름, 급여, 입사일, 직무ID
SELECT 
	employee_id 					AS "employee id",
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary",
	hire_date 						AS "hire date",
	job_id							AS "job id"
FROM employees
WHERE job_id IN ('IT_PROG', 'SA_REP', 'SA_MAN');


-- 7번 --
-- 커미션을 받는 직원만 조회하시오.
-- (commission_pct가 NULL이 아닌 직원)
-- 조회 컬럼: 직원번호, 이름, 급여, 입사일
SELECT 
	employee_id 					AS "employee id",
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary",
	hire_date 						AS "hire date"
FROM employees
WHERE commission_pct IS NOT NULL;


-- 8번 --
-- 이름에 D와 e가 모두 포함된 직원만 조회하시오.
-- 조회 컬럼: 이름, 급여
SELECT 
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary"
FROM employees
WHERE 	(first_name || ' ' || last_name) LIKE '%D%'
	AND (first_name || ' ' || last_name) LIKE '%e%';


-- 9번 --
-- 직무ID가 IT_PROG가 아닌 직원만 조회하시오.
-- 조회 컬럼: 직원번호, 이름, 급여, 입사일
SELECT 
	employee_id 					AS "employee id",
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary",
	hire_date 						AS "hire date"
FROM employees
WHERE job_id != 'IT_PROG';


-- 10번 --
-- 직원들 중 봉급이 5000 이상인 직원들의 모든 정보를 조회하시오.
SELECT *
FROM employees
WHERE salary >= 5000
ORDER BY salary;


-- 11번 --
-- 직원들 중 부서번호가 30번인 직원들의 이름과 입사일을 조회하시오.
SELECT 
	first_name || ' ' || last_name 	AS "name",
	hire_date 						AS "hire date"
FROM employees
WHERE department_id = 30;


-- 12번 --
-- 직원들 중 성이 Smith인 직원들의 이름과 봉급을 조회하시오.
SELECT 
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary"
FROM employees
WHERE first_name = 'Smith';


-- 13번 --
-- 직원들 중 봉급이 3000 미만이거나 10000 이상인 직원들의
-- 이름과 봉급을 조회하시오.
SELECT 
	first_name || ' ' || last_name 	AS "name",
	salary 							AS "salary"
FROM employees
WHERE NOT salary BETWEEN 3000 AND 10000
ORDER BY salary;


-- 14번 --
-- 직원들 중 이름이 A로 시작하는 직원들의
-- 이름과 성을 직원명으로,
-- 이메일에 koreait.com을 붙여 이메일이라는 별칭으로 출력하시오.
SELECT 
	first_name || ' ' || last_name 	AS "직원명",
	email || 'koreait.com'			AS "이메일"
FROM employees
WHERE first_name LIKE 'A%'
ORDER BY first_name;


-- 15번 --
-- 직원들 중 성에 o가 포함되고
-- 이름이 4글자인 직원들의
-- 이름, 성, 부서번호를 조회하시오.
SELECT 
	first_name || ' ' || last_name 	AS "name",
	first_name 						AS "first name",
	department_id					AS "department id"
FROM employees
WHERE first_name LIKE '%o%' 
	AND LENGTH(last_name) = 4;

-- 16번 --
-- 직원들 중 이름이 J로 시작하고
-- 성이 n으로 끝나는 직원들의
-- 이름과 성을 조회하시오.
SELECT 
	last_name  AS "last name",
	first_name AS "first name"
FROM employees
WHERE last_name LIKE 'J%'
	AND first_name LIKE '%n';