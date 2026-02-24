CREATE TABLE tbl_stu (
	stu_sid		NUMBER,
	stu_name	VARCHAR2(32),
	stu_major	VARCHAR2(32),

	CONSTRAINT stu_pk PRIMARY KEY (stu_sid)	
);

CREATE TABLE tbl_enroll (
	enr_sid		NUMBER,
	enr_cid		NUMBER,
	enr_grade	CHAR(2),
	
	CONSTRAINT enroll_pk PRIMARY KEY (enr_sid, enr_cid),
	CONSTRAINT enroll_stu_fk FOREIGN KEY (enr_sid) REFERENCES tbl_stu(stu_sid)
	ON DELETE CASCADE  	-- 부모 테이블의 행이 삭제될 경우, 자식 테이블의 관련된 행도 자동으로 삭제된다.
);

INSERT ALL
	INTO tbl_stu VALUES(1, '홍길동', '컴퓨터공학')
	INTO tbl_stu VALUES(2, '김영희', '컴퓨터공학')
	INTO tbl_stu VALUES(3, '이철수', '정보보안학')
	INTO tbl_stu VALUES(4, '신호동', '정보보안학')
	INTO tbl_stu VALUES(5, '신짱구', '정보보안학')
SELECT 1 FROM dual;

INSERT ALL
	INTO TBL_ENROLL VALUES(1, 101, 'A')
	INTO TBL_ENROLL VALUES(2, 102, 'B')
	INTO TBL_ENROLL VALUES(3, 101, 'C')
	INTO TBL_ENROLL VALUES(4, 102, 'A')
	INTO TBL_ENROLL VALUES(4, 101, 'B')
SELECT 1 FROM dual;

SELECT s.stu_sid, s.stu_name, s.stu_major, e.enr_sid, e.enr_cid, e.enr_grade
FROM tbl_stu s
LEFT OUTER JOIN tbl_enroll e
	ON s.stu_sid = e.enr_sid;

SELECT s.stu_sid, s.stu_name, s.stu_major, e.enr_sid, e.enr_cid, e.enr_grade
FROM tbl_stu s
FULL OUTER JOIN tbl_enroll e
	ON s.stu_sid = e.enr_sid;

SELECT * FROM tbl_stu;
SELECT * FROM tbl_enroll;

DROP TABLE tbl_stu;
DROP TABLE tbl_enroll;