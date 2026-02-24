SELECT * FROM TBL_MEMBERS
WHERE mem_name = '훈이';

DELETE FROM tbl_rental
WHERE mem_id = 4;

SELECT * FROM tbl_rental
WHERE mem_id = 4;

DELETE FROM tbl_rental
WHERE mem_id = (
	SELECT mem_id
	FROM tbl_members
	WHERE mem_name = '훈이'
);

-- 2) SELECT 절 : 스칼라 서브쿼리
-- 	 컬럼 1개, 행 1개
-- 	 JOIN을 사용하지 않고 정보를 추가할 때

-- 대여 정보 + 책 제목
SELECT 
	ren_id,
	(
		SELECT books_title
		FROM tbl_books
		WHERE books_id = r.books_id
	) AS "book name"
FROM tbl_rental r;


-- 3) WHERE절 : 일반 서브쿼리
--	조건값을 서브쿼리로 구함

-- 가장 늦게 빌린 날
SELECT *
FROM tbl_rental
WHERE rental_date = (
	SELECT max(rental_date)
	FROM tbl_rental
);

-- 4) 비연관 서브쿼리 : 개별적으로 실행 가능
SELECT *
FROM tbl_books
WHERE books_id IN (
	SELECT books_id
	FROM tbl_rental
);

-- 5) 연관 서브쿼리 : 바깥 컬럼 사용
SELECT *
FROM tbl_members m
WHERE EXISTS (
	SELECT 1
	FROM tbl_rental r
	WHERE r.mem_id = m.mem_id
);

-- 6) 단일행
SELECT *
FROM tbl_rental
WHERE ren_id = (
	SELECT max(ren_id)
	FROM tbl_rental
);

-- 7) 다중행 
SELECT *
FROM tbl_books
WHERE books_id IN (
	SELECT books_id
	FROM tbl_rental
);

SELECT *
FROM tbl_members m
WHERE EXISTS (
	SELECT  1
	FROM tbl_rental r
	WHERE r.mem_id = m.mem_id
);

SELECT *
FROM tbl_books
WHERE books_id > ALL (
	SELECT books_id
	FROM tbl_rental
	WHERE mem_id = 1
);