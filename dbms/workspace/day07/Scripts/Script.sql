CREATE TABLE tbl_student (
	stu_number 	NUMBER,	
	stu_name	VARCHAR(128) NOT NULL,
	stu_major 	VARCHAR(128) NOT NULL,
	
	CONSTRAINT pk_stu PRIMARY KEY (stu_number)
);

CREATE TABLE tbl_attendance (
	att_number	NUMBER,
	stu_number 	NUMBER 	 NOT NULL,
	att_adate	DATE 	 NOT NULL,
	att_status	CHAR(20) NOT NULL,
	
	CONSTRAINT pk_att PRIMARY KEY (att_number),
	CONSTRAINT fk_att FOREIGN KEY (stu_number) REFERENCES tbl_student(stu_number);
);

CREATE SEQUENCE seq_student nocache nocycle;
CREATE SEQUENCE seq_atte nocycle;

SELECT s.stu_name
FROM tbl_student s
INNER JOIN tbl_attendance a
	ON s.stu_number = a.stu_number;