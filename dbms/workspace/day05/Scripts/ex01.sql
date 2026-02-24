CREATE TABLE tbl_books (
	book_id 	CHAR(3),
	book_title	VARCHAR2(1024),
	book_author	VARCHAR2(128),
	
	CONSTRAINT book_pk PRIMARY KEY (book_id)
);

SELECT * FROM tbl_books;

INSERT ALL
	INTO tbl_books VALUES (1, '위대한 개츠비', 'F.스콧 피츠제럴드')
	INTO tbl_books VALUES (2, '해리포터와 마법사의 돌', 'J.K. 롤링')
	INTO tbl_books VALUES (3, '1984', '조지오웰')
	INTO tbl_books VALUES (4, '오만과 편견', '제인 오스틴')
	INTO tbl_books VALUES (5, '데미안', '헤르만 헤세')
	INTO tbl_books VALUES (6, '모모', '미하엘 엔더')
	INTO tbl_books VALUES (7, 'DBMS완전정복', 'DBMS')
SELECT 1 FROM dual;

CREATE TABLE tbl_bookprice (
	bp_id 		CHAR(3),
	bp_price	NUMBER,
	
	CONSTRAINT bp_pk PRIMARY KEY (bp_id)
);

SELECT * FROM tbl_bookprice;

INSERT ALL
  INTO tbl_bookprice VALUES (1, 15000)
  INTO tbl_bookprice VALUES (2, 18000)
  INTO tbl_bookprice VALUES (3, 14000)
  INTO tbl_bookprice VALUES (4, 17000)
  INTO tbl_bookprice VALUES (5, 18000)
  INTO tbl_bookprice VALUES (6, 20000)
  INTO tbl_bookprice VALUES (7, 20000)
SELECT 1 FROM dual;

SELECT * FROM tbl_books;
SELECT * FROM tbl_bookprice;

SELECT book_id, book_title, book_author, bp_id, bp_price
FROM tbl_books b
INNER JOIN tbl_bookprice bp
	ON b.book_id = bp.bp_id;

INSERT INTO tbl_books VALUES (8, '자바의 정석', '자바');
INSERT INTO tbl_books VALUES (8, '정보처리기사', '정처기');

DROP TABLE tbl_books;
DROP TABLE tbl_bookprice;