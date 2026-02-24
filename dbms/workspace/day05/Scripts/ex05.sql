CREATE TABLE tbl_books(
	books_id		NUMBER,
	books_title		VARCHAR2(124),
	books_author	VARCHAR2(128),
	
	CONSTRAINT books_pk PRIMARY KEY (books_id)
);

CREATE TABLE tbl_members(
	mem_id		NUMBER,
	mem_name	VARCHAR2(128),
	mem_phone	VARCHAR2(128),
	mem_email	VARCHAR2(128),
	
	CONSTRAINT members_pk PRIMARY KEY (mem_id)
);

CREATE TABLE tbl_rental (
	ren_id		NUMBER,
	mem_id		NUMBER,
	books_id	NUMBER,
	rental_date	DATE,
	return_date	DATE,
	
	CONSTRAINT rental_pk PRIMARY KEY (ren_id),
	CONSTRAINT rental_books_fk 		FOREIGN KEY (books_id) REFERENCES tbl_books(books_id),
	CONSTRAINT rental_members_fk	FOREIGN KEY (mem_id)   REFERENCES tbl_members(mem_id)
)

SELECT * FROM tbl_books;
SELECT * FROM tbl_members;
SELECT * FROM tbl_rental;

INSERT ALL
	INTO tbl_books VALUES (1, '위대한 개츠비', 'F.스콧 피츠제럴드')
	INTO tbl_books VALUES (2, '해리포터와 마법사의 돌', 'J.K. 롤링')
	INTO tbl_books VALUES (3, '1984', '조지오웰')
	INTO tbl_books VALUES (4, '오만과 편견', '제인 오스틴')
	INTO tbl_books VALUES (5, '데미안', '헤르만 헤세')
SELECT 1 FROM dual;

INSERT ALL
 INTO tbl_members VALUES (1, '짱구', '123-456-7890', 'aaa@koreait.com')
 INTO tbl_members VALUES (2, '유리', '987-654-3210', 'bbb@koreait.com')
 INTO tbl_members VALUES (3, '철수', '555-123-4567', 'ccc@koreait.com')
 INTO tbl_members VALUES (4, '훈이', '777-888-9999', 'ddd@koreait.com')
 INTO tbl_members VALUES (5, '맹구', '555-777-3333', 'eee@koreait.com')
SELECT 1 FROM dual;

INSERT ALL 
	INTO tbl_rental VALUES (1, 1, 3, TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-18', 'YYYY-MM-DD'))
	INTO tbl_rental VALUES (2, 2, 1, TO_DATE('2023-12-11', 'YYYY-MM-DD'), TO_DATE('2023-12-18', 'YYYY-MM-DD'))
	INTO tbl_rental VALUES (3, 3, 2, TO_DATE('2023-12-13', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'))
	INTO tbl_rental VALUES (4, 4, 4, TO_DATE('2023-12-20', 'YYYY-MM-DD'), TO_DATE('2023-12-27', 'YYYY-MM-DD'))
	INTO tbl_rental VALUES (5, 5, 5, TO_DATE('2023-12-22', 'YYYY-MM-DD'), TO_DATE('2023-12-29', 'YYYY-MM-DD'))
SELECT 1 FROM dual;

-----------------------------------------------------------------------------

SELECT r.return_date, m.mem_name, r.rental_date, r.return_date,
	CASE 
		WHEN r.rental_date - r.rental_date <= 7
			THEN '단기 대여'
		ELSE '장기 대여'
	END "type"
FROM tbl_rental r
JOIN tbl_books b 
	ON r.books_id =  b.books_id
JOIN tbl_members m
	ON r.mem_id = m.mem_id;

-----------------------------------------------------------------------------

DROP TABLE tbl_rental;
DROP TABLE tbl_members;
DROP TABLE tbl_books;