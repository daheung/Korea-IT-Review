SELECT *
FROM tbl_member
WHERE member_name = '짱구';

DELETE FROM tbl_member
WHERE member_id = 2;

DELETE FROM tbl_member
WHERE member_age IS NULL;

INSERT ALL
  INTO tbl_member (member_id, member_name, member_age) VALUES (2, '철수', 5)
  INTO tbl_member (member_id, member_name, member_age) VALUES (3, '유리', 5)
  INTO tbl_member (member_id, member_name, member_age) VALUES (4, '훈이', 5)
SELECT * FROM dual;

SELECT * FROM tbl_member
ORDER BY member_id;

CREATE TABLE tbl_student(
	student_number 	NUMBER,
	student_neme 	VARCHAR2(100),
	student_math 	NUMBER,
	student_eng		NUMBER,
	student_kor		NUMBER,
	student_grade	VARCHAR2(100)
);

SELECT * 
FROM tbl_student
WHERE FALSE;

INSERT ALL
  INTO tbl_student (student_number, student_neme, student_math, student_eng, student_kor) VALUES (1, '짱구', 90 , 90 , 90 )
  INTO tbl_student (student_number, student_neme, student_math, student_eng, student_kor) VALUES (2, '철수', 100, 80 , 100)
  INTO tbl_student (student_number, student_neme, student_math, student_eng, student_kor) VALUES (3, '유리', 70 , 25 , 25 )
  INTO tbl_student (student_number, student_neme, student_math, student_eng, student_kor) VALUES (4, '훈이', 40 , 100, 70 )
  INTO tbl_student (student_number, student_neme, student_math, student_eng, student_kor) VALUES (5, '맹구', 70 , 77 , 89 )
SELECT * FROM dual;

SELECT * FROM tbl_student;
