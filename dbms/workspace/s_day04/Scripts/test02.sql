-- 문제 1. 각 사원의 급여가 어떤 급여등급(grade) 에 속하는지 출력하라.
SELECT *
FROM emp e
LEFT OUTER JOIN sal_grade g
	ON e.salary BETWEEN g.low_sal AND g.high_sal
ORDER BY e.emp_id;

-- 문제 2. 급여등급이 5 이상(grade >= 5) 인 사원만 출력하라.
SELECT *
FROM emp e
LEFT OUTER JOIN sal_grade g
	ON e.salary BETWEEN g.low_sal AND g.high_sal
WHERE g.grade >= 5;

-- 문제 3. 부서별로 급여등급(grade)별 사원 수를 구하라. (부서명, 등급, 인원)
SELECT t.dept_name, g.grade, count(g.grade)
FROM (
	SELECT d.dept_id, d.dept_name, e.salary
	FROM dept d
	LEFT OUTER JOIN emp e
		ON d.dept_id = e.dept_id
) t
LEFT OUTER JOIN sal_grade g
	ON t.salary BETWEEN g.low_sal AND g.high_sal
WHERE g.grade IS NOT NULL
GROUP BY t.dept_name, g.grade
ORDER BY t.dept_name;

-- 문제 4. 사원 KIM과 같은 급여등급에 속하는 사원 목록을 구하라. (KIM 포함)
SELECT *
FROM emp e
LEFT OUTER JOIN sal_grade g
	ON e.salary BETWEEN g.low_sal AND g.high_sal
WHERE g.grade IN (
	SELECT g2.grade
	FROM emp e2
	LEFT OUTER JOIN sal_grade g2
		ON e2.salary BETWEEN g2.low_sal AND g2.high_sal
	WHERE e2.emp_name = 'KIM'
);

-- 문제 5. 각 사원의 급여에 맞는 세율(tax_rate) 을 붙여서,
-- 	연세금 = salary * 12 * tax_rate 를 계산하라.
SELECT 
	e.emp_name AS "name",
	e.salary AS "salary",
	e.salary * 12 * b.tax_rate AS "tax per year"
FROM emp e
LEFT OUTER JOIN tax_bracket b
	ON e.salary BETWEEN b.low_sal AND b.high_sal;

-- 문제 6. 기준일을 DATE '2026-01-30' 로 고정하고, 근속년수(버림)를 계산해
--	근속 보너스 구간에 따라 bonus_pct 를 출력하라.
SELECT 
	t.*,
	t.salary * t."years of service" AS "bouns_pct"
FROM (
	SELECT 
		e.*,
		TRUNC( MONTHS_BETWEEN(DATE '2026-01-30', e.hire_date) / 12 ) AS "years of service"
	FROM emp e
) t
LEFT OUTER JOIN tenure_bonus b
 	ON t."years of service" BETWEEN b.min_years AND b.max_years;


-- 문제 7. 급여등급 + 세율 + 근속보너스를 모두 붙여서 아래를 구하라.
-- 	net_monthly = salary - salary*tax_rate + salary*bonus_pct
SELECT 
	ft.emp_id,
	ft.emp_name,
	ft."bouns_pct",
	ft.salary - (ft.salary * ft.tax_rate) + (ft.salary * ft.bonus_pct) AS "net_monthly"
FROM (
	SELECT 
		t.*,
		ten_b.*,
		tax_b.*,
		t.salary * t."years of service" AS "bouns_pct"
	FROM (
		SELECT 
			e.*,
			TRUNC( MONTHS_BETWEEN(DATE '2026-01-30', e.hire_date) / 12 ) AS "years of service"
		FROM emp e
	) t
	LEFT OUTER JOIN tenure_bonus ten_b
	 	ON t."years of service" BETWEEN ten_b.min_years AND ten_b.max_years
	LEFT OUTER JOIN tax_bracket tax_b
		ON t.salary BETWEEN tax_b.low_sal AND tax_b.high_sal
) ft;
	

-- 문제 8. 성과점수로 등급(A/B/C/D/F)을 붙이고, 성과등급이 A 또는 B 이면서
-- 	급여등급이 4 이하(grade <= 4) 인 사원을 출력하라.
SELECT *
FROM emp e
LEFT OUTER JOIN score_grade score_g
	ON e.score BETWEEN score_g.min_score AND score_g.max_score
LEFT OUTER JOIN sal_grade sal_g
	ON e.salary BETWEEN sal_g.low_sal AND sal_g.high_sal
WHERE score_g.rating IN ('A', 'B')
	AND sal_g.grade <= 4;


-- 문제 9. 성과등급(rating)별 권장급여 구간(reco_sal_by_rating) 을 붙이고,
--	권장구간에 들지 않는(권장급여 범위 밖) 사원을 찾아라.
SELECT 
	e.emp_id, 
	e.emp_name,
	e.salary,
	e.score,
	reco_rating.rating,
	reco_rating.low_sal,
	reco_rating.high_sal
FROM emp e
LEFT OUTER JOIN score_grade score_g
	ON e.score BETWEEN score_g.min_score AND score_g.max_score
LEFT OUTER JOIN reco_sal_by_rating reco_rating
	ON score_g.rating = reco_rating.rating
WHERE e.salary NOT BETWEEN reco_rating.low_sal AND reco_rating.high_sal;

-- 문제 10. 같은 부서 내에서 사원 2명씩 짝지어, 급여 차이가 500 미만인 쌍을 찾아라.
-- 	(중복 방지를 위해 e1.emp_id < e2.emp_id 조건 포함)
SELECT 
	e1.dept_id,
	e2.dept_id,
	e1.emp_name, 
	e2.emp_name,
	e1.salary,
	e2.salary,
	abs(e1.salary - e2.salary) AS 'diff'
FROM emp e1
CROSS JOIN emp e2
WHERE e1.emp_id < e2.emp_id
	AND e1.dept_id = e2.dept_id
	AND abs(e1.salary - e2.salary) < 500;


-----------------------------------------------------------------------------

DROP TABLE emp;
DROP TABLE dept;