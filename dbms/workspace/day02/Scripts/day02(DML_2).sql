SELECT * FROM tbl_student;

-- 학생의 평균 점수를 구하고 학점을 수정하기
/**
 * A : 90점 이상
 * B : 80점 이상 90점 미만
 * C : 70점 이상 80점 미만
 * F : 70점 미만
 * */
UPDATE tbl_student
SET student_grade =
	CASE 
		WHEN (student_math + student_eng + student_kor) / 3 >= 90 THEN 'A'
		WHEN (student_math + student_eng + student_kor) / 3 >= 80 THEN 'B'
		WHEN (student_math + student_eng + student_kor) / 3 >= 70 THEN 'C'
		ELSE 'F'
	END;

SELECT * 
FROM tbl_student
WHERE 1 = 2;

ALTER TABLE tbl_student
RENAME COLUMN student_neme TO student_name;


SELECT 
	student_number, 
	student_name  AS "student name",
	student_math  AS "student math",
	student_eng	  AS "student english",
	student_kor   AS "student korean",
	student_grade AS "student grade",
	(student_math + student_math + student_kor) / 3 AS "student average"
FROM tbl_student;


SELECT 
	student_number AS "student number",
	student_neme AS "student name",
	student_grade AS "student grade"
FROM tbl_student
WHERE (student_math >= 60 AND student_kor >= 60 AND student_eng >= 60)
	AND student_grade IN ('A', 'B');

INSERT INTO tbl_student
VALUES(6, '치타', 40, 100, 100, 'B');

SELECT * FROM tbl_student;