CREATE TABLE tbl_member(
	member_id NUMBER,
	member_name VARCHAR2(100),
	member_age NUMBER(3)
);

SELECT * FROM tbl_member;

INSERT INTO tbl_member 
VALUES(1, '짱구', 5);

INSERT INTO tbl_member(member_id, member_name)
VALUES(2, '유리');

INSERT INTO tbl_member
VALUES(3, '철수', NULL);

SELECT * FROM tbl_member;