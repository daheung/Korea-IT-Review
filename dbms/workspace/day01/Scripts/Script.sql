-- 4번 : 연산자

-- 피연산자 자리에 어떤 타입의 값이 오는지
-- 연산자가 어떻게 동작하는지
-- 연산의 결과가 어떤 타입의 값인지

-- 오라클 자료형 : 문자형(CHAR, VARCHAR2), 숫자형(NUMBER), 날짜(DATE, TIMESTAMP)

-- (1) 연결 연산자
-- a || b : a와 b를 연결해준다

SELECT 10, 20, 10 || 20
FROM dual;

SELECT 'a', 'b', 'a' || 'b'
FROM dual;

-- employees테이블에서 이름과 성을 연결해서 풀네임이라는 별칭으로 조회
SELECT first_name 이름, last_name 성, first_name || ' ' || last_name 풀네임
FROM employees;

-- employees 테이블에서 날짜타입의 값 확인
--SELECT * FROM employees; -- hire_date
SELECT hire_date, hire_date || ' 안녕'
FROM employees;

-- [실습] 사원의 이름과 메일 주소를 출력하기
-- 이 때 사원의 이름은 이름과 성이 띄어쓰기로 이어져 이름이라는 컬럼명으로 있고
-- 메일 주소는 사원메일주소@korea.com으로 메일 주소 라는 컬럼명이 있다

SELECT first_name || ' ' || last_name 이름, email || '@korea.com' "메일 주소"
-- 2) first_name과 last_name을 연결해서 이름이라는 별칭, email에 korea.com 연결해서 조회하겠다
FROM employees; -- 1) employees 테이블에서

