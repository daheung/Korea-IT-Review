-- 2번 : 정규화

-- 학생 정보 테이블(정규화 되지 않은 일반 테이블)
/*
 * 학번(Stu_id)   이름(stu_name) 전공(stu_major) 과목코드(stu_course_code) 과목명(stu_course_name)
 * 001         홍길동         컴공            cs101               데이터베이스
 * 001         홍길동         컴공            cs202               알고리즘
 * 002         김철수         경영학         bus202               경영이론
 * 
 * */

-- 학생정보 테이블 생성
CREATE TABLE TBL_STU(
   STU_ID NUMBER,
   STU_NAME VARCHAR2(100),
   STU_MAJOR VARCHAR2(100),
   STU_COURSE_CODE VARCHAR2(100),
   STU_COURSE_NAME VARCHAR2(100)
);

-- 테이블 만든 후 반드시 테이블 조회
SELECT * FROM TBL_STU;

-- PK 제약조건 추가
ALTER TABLE TBL_STU
ADD CONSTRAINT PK_STU PRIMARY KEY(STU_ID);

-- 데이터 삽입
INSERT INTO TBL_STU
--VALUES(001, '홍길동', '컴퓨터 공학', 'CS101', '데이터베이스');
--VALUES(001, '홍길동', '컴퓨터 공학', 'CS202', '알고리즘'); -- PK 중복 불가하므로 오류발생
VALUES(002, '김철수', '경영학', 'BUS202', '경영이론');

-- 데이터 삽입 후 반드시 테이블 조회
SELECT * FROM TBL_STU;

-- 특정 학번의 학생정보 조회(학번 2)
SELECT * FROM TBL_STU
WHERE STU_ID = 2;

-- 특정 과목명에 해당하는 학생 정보 조회(과목명 데이터베이스)
SELECT * FROM TBL_STU
WHERE STU_COURSE_NAME = '데이터베이스';

-- 학번2인 학생의 전공을 데이터 사이언스로 변경
UPDATE TBL_STU
SET STU_MAJOR = '데이터 사이언스'
WHERE STU_ID = 2;

-- 변경된 결과만 확인
SELECT * FROM TBL_STU 
WHERE STU_ID = 2;

-- 컬럼 추가 STU_ADDRESS VARCHAR2(100)
ALTER TABLE TBL_STU
ADD STU_ADDRESS VARCHAR2(100);

-- 컬럼 추가 한 뒤에는 컬럼값 수정으로 진행해야함
--INSERT INTO TBL_STU(STU_ADDRESS)
--VALUES('서울시 강남구 역삼동, 12345');

-- 컬럼값 수정
UPDATE TBL_STU 
SET STU_ADDRESS = '서울시 강남구 역삼동, 12345'
WHERE STU_ID = 1;

INSERT INTO TBL_STU
VALUES(3, '홍길동', '컴퓨터 공학', 'CS202', '알고리즘', '서울시 강남구 역삼동, 12345');

SELECT * FROM TBL_STU;



