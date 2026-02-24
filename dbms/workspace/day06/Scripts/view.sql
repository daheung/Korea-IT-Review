SELECT * FROM tbl_rental;
SELECT * FROM tbl_books;
SELECT * FROM tbl_members;


SELECT r.ren_id, m.mem_name, b.books_title, r.rental_date, r.return_date
FROM tbl_rental r
INNER JOIN tbl_members m
	ON r.mem_id = m.mem_id
INNER JOIN tbl_books b
	ON r.books_id = b.books_id
ORDER BY r.ren_id;


CREATE VIEW vw_rental AS 
SELECT r.ren_id, m.mem_name, b.books_title, r.rental_date, r.return_date
FROM tbl_rental r
INNER JOIN tbl_members m
	ON r.mem_id = m.mem_id
INNER JOIN tbl_books b
	ON r.books_id = b.books_id
ORDER BY r.ren_id ASC;


SELECT * FROM vw_rental;

SELECT vr.*, tm.mem_id
FROM vw_rental vr, tbl_members tm
WHERE vr.mem_name = tm.mem_name;