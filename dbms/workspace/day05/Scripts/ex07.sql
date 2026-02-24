CREATE TABLE tbl_a (
	name VARCHAR2(32)
);

CREATE TABLE tbl_b (
   NAME VARCHAR2(20)
);

INSERT ALL
	INTO tbl_a VALUES ('홍길동')
	INTO tbl_a VALUES ('김보라')
	INTO tbl_a VALUES ('김나나')
	INTO tbl_a VALUES ('김뚜비')
	INTO tbl_a VALUES ('이철수')
SELECT 1 FROM dual;

INSERT ALL
	INTO tbl_b VALUES('이철수')
	INTO tbl_b VALUES('심호동')
	INTO tbl_b VALUES('이지민')
	INTO tbl_b VALUES('이영희')
	INTO tbl_b VALUES('김뚜비')
SELECT 1 FROM dual;

SELECT * FROM tbl_a;
SELECT * FROM tbl_b;


-- 1) 합집합
SELECT name FROM tbl_a
UNION 
SELECT name FROM tbl_b;

-- 2) 합집합
SELECT name FROM tbl_a
UNION ALL
SELECT name FROM tbl_b;

-- 3) 교집합
SELECT name FROM tbl_a
INTERSECT
SELECT name FROM tbl_b;

-- 4) 차집합
SELECT name FROM tbl_a
MINUS
SELECT name FROM tbl_b;


DROP TABLE tbl_a;
DROP TABLE tbl_b;