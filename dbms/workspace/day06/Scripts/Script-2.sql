-- 1) 3번 책을 빌린 회원 조회
SELECT *
FROM tbl_members m
WHERE m.mem_id IN (
	SELECT r.mem_id
	FROM tbl_rental r
	WHERE r.books_id = 3
);

-- 2) 가장 최근 대여일 조회
SELECT *
FROM tbl_rental r
WHERE rental_date = (
	SELECT max(rental_date)
	FROM tbl_rental
);

-- 3) 대여한 적이 없는 회원 조회
SELECT *
FROM tbl_members tm
WHERE NOT EXISTS (
	SELECT 1
	FROM tbl_rental tr
	WHERE tm.mem_id = tr.mem_id
);

-- 4) 가장 마지막에 등록된 회원 조회
SELECT *
FROM tbl_members tm
WHERE ;

-- 5) 빌려간 적이 없는 책 조회
SELECT *
FROM tbl_books tb
WHERE NOT EXISTS (
	SELECT 1
	FROM tbl_rental tr
	WHERE tr.books_id = tb.books_id
);

-- 6) 회원 별 대여 횟수 조회
SELECT 
	tm.*,
	(
		SELECT count(*)
		FROM tbl_rental tr
		WHERE tr.mem_id = tm.mem_id
	) AS "rental count"
FROM tbl_members tm;

-- 7) 가장 많이 빌린 회원 조회
SELECT tr.mem_id, count(tr.mem_id) AS "max"
FROM tbl_rental tr
GROUP BY tr.mem_id
ORDER BY count(tr.mem_id) DESC;

SELECT *
FROM tbl_members tm
WHERE tm.mem_id = (
	SELECT t.mem_id
	FROM (
		SELECT tr.mem_id, count(tr.mem_id) AS "ren count"
		FROM tbl_rental tr
		GROUP BY tr.mem_id
		ORDER BY count(tr.mem_id) DESC
	) t
	WHERE rownum = 1
);
	
-- 8)  상위 3개 대여 기록 조회
SELECT t.*
FROM (
	SELECT *
	FROM tbl_rental tr
	ORDER BY tr.ren_id
) t
WHERE rownum <= 3;

-- 9) 가장 인기 많은 책 정보 조회
SELECT tr.books_id, count(*)
FROM tbl_rental tr
GROUP BY tr.books_id
ORDER BY tr.books_id;

SELECT *
FROM tbl_books tb
WHERE tb.books_id = (
	SELECT t.books_id
	FROM (
		SELECT tr.books_id, count(*)
		FROM tbl_rental tr
		GROUP BY tr.books_id
		ORDER BY tr.books_id	
	) t
	WHERE rownum = 1
);