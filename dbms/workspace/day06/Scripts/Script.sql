SELECT * FROM tbl_rental;
SELECT * FROM tbl_members;
SELECT * FROM tbl_books;

SELECT *
FROM (
	SELECT r.ren_id, m.mem_name, r.books_id
	FROM tbl_rental r
		INNER JOIN tbl_members m
			ON r.mem_id = m.mem_id
);

SELECT *
FROM (
	SELECT mem_id, count(*) cnt
	FROM tbl_rental
	GROUP BY mem_id
)
WHERE cnt >= 1;

	SELECT mem_id, count(*) cnt
	FROM tbl_rental
	GROUP BY mem_id;