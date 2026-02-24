SELECT * FROM tbl_user;
SELECT seq_user.nextval FROM dual;


CREATE TABLE tbl_user (
	user_number NUMBER,
	user_id		VARCHAR2(128),
	user_pw		VARCHAR2(128),
	user_name	VARCHAR2(128),
	user_age	NUMBER,
	user_gender CHAR(1) DEFAULT 'M' NOT NULL,
	user_birth	DATE,
	
	CONSTRAINT pk_user PRIMARY KEY (user_number)
);

CREATE SEQUENCE seq_user nocache nocycle;

INSERT INTO tbl_user(user_number, user_id, user_pw, user_name, user_age, user_birth)
VALUES (seq_user.nextval, 'test', '1234', '유리', 5, to_date('2026-01-10', 'yyyy-mm-dd'));

SELECT * FROM tbl_user;
	
INSERT INTO tbl_user VALUES (seq_user.nextval, '0203_test1', 'qwer', '철수', 5, 'M', sysdate);
INSERT INTO tbl_user VALUES (seq_user.nextval, '0203_test2', 'abc', '철수', 5, 'M', sysdate);