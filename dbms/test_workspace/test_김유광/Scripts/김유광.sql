/**
 * 다음 요구사항을 확인 후 답을 제출하세요.
내용	
아래의 내용을 확인하고 올바른 답을 작성하고, 화면 캡처와 스크립트파일을 본인이름.zip 압축파일로 첨부하세요

화면 캡처파일과 스크립트 파일(본인이름.sql)을 본인이름.zip 파일로 첨부하세요.

- 계정명 : TESTDB / 비밀번호 : 1234

1번. 다음 물음에 간단히 서술하시오.
(1) PRIMARY KEY의 특징을 2가지 이상 작성하시오. 
	1) Unique
	2) Not Null
(2) SELECT문의 실행 순서를 순서대로 작성하시오.
	1) FROM -> WHERE -> SELECT
(3) 다음 중 이행적 함수 종속의 예를 1개 작성하시오. (형식: A → B → C)
(4) 컬럼에 저장될 수 있는 값의 범위, 형식, 타입을 제한해서 허용된 값만 입력되도록 하는 무결성은 (데이터) 무결성이다.
(5) 테이블이 정규화되지 않았을 때 발생하는 데이터 오류 현상을 (        )이라고 하고 종류로는 (                 )가 있다. (※모든 종류를 다 써야 함)
 * (6) 아래 sql문의 실행순서대로 해석을 쓰시오.
 * 
 * 
2번. 다음 요구사항을 분석하여 모델링 후 테이블 생성까지 수행하시오.
[요구사항] 

조건

한 명의 환자는 여러 번 진료를 받을 수 있다.
한 명의 의사는 여러 환자를 진료할 수 있다.
환자와 의사는 진료를 통해 연결된다.
 
[문제]
(1) 요구사항 분석
필요한 엔티티, 속성, 관계를 서술하시오.
	엔티티: 환자, 의사
	
	환자 정보는 환자번호, 이름, 주민번호, 전화번호, 주소 정보가 필요하다.
	의사 정보는 의사번호, 이름, 진료과 정보가 필요하다
	진료 정보는 진료번호, 진료일, 진단내용 정보가 필요하다.
	
	- 의사:환자 = N:M 관계
	
(2) 개념적 설계
	환자 정보는 환자번호, 이름, 주민번호, 전화번호, 주소 정보가 필요하다.
	의사 정보는 의사번호, 이름, 진료과 정보가 필요하다
	진료 정보는 진료번호, 진료일, 진단내용 정보가 필요하다.
	
(3) 논리적설계
table 의사 (
	id(pk)		숫자,
	name		문자열,
	rrn			문자열,
	phone_num	문자열,
	address		문자열
)

table 환자 (
	id(pk)		숫자,
	name		문자열,
	info		문자열
)

table 진료정보 (
	id(pk)		숫자,
	date		날짜,
	content		문자열	
);

(4) 물리적 설계
create table d (
	id(pk)		NUMBER,
	name		VARCHAR(64),
	rrn			VARCHAR(64),
	phone_num	VARCHAR(32),
	address		VARCHAR(32)
)

create table p (
	id(pk)		NUMBER,
	name		VARCHAR(64),
	info		VARCHAR(32)
)

create table t (
	id(pk)		NUMBER,
	date		DATE,
	content		VARCHAR(128)	
);

(5) 구현
create table d (
	id			NUMBER PRIMARY KEY,
	name		VARCHAR(64),
	rrn			VARCHAR(64),
	phone_num	VARCHAR(32),
	address		VARCHAR(32)
)

create table p (
	id			NUMBER PRIMARY KEY,
	name		VARCHAR(64),
	info		VARCHAR(32)
)

create table t (
	id(pk)		NUMBER,
	date		DATE,
	content		VARCHAR(128)
	p_id(fk)	NUMBER,
	d_id(fk)	NUBMER	
);

(6) 구현한 모든 테이블에 각 행을 2개씩 추가 후 각 테이블 전체 조회

INSERT INTO d VALUES (1, 'kim', '123123-123123', '010-0000-0000', '서울시 은평구');
INSERT INTO d VALUES (2, 'yu', '457435-3453655', '010-1111-1111', '서울시 종로구');
SELECT * FROM d;

INSERT INTO p VALUES (1, 'kim', '소화기내과');
INSERT INTO p VALUES (2, 'yu', '신경과');
SELECT * FROM p;

INSERT INTO t VALUES (1, SYSDATE, '~가 아픔', 1, 2);
INSERT INTO t VALUES (2, SYSDATE, '~가 아파서 약 처방', 2, 1);
SELECT * FROM t;

3번. 다음 테이블이 있을 때 아래 조건에 맞는 sql문을 작성하시오.
[TBL_STU]
CREATE TABLE tbl_stu (
	stu_id 		NUMBER PRIMARY KEY,
	stu_name	VARCHAR(50),
	stu_age 	NUMBER,
	stu_major	VARCHAR(50),
	stu_score	NUMBER,
);

컬럼명	타입	설명
STU_ID	숫자	학번(PK)
STU_NAME	문자(50)	이름
STU_AGE	숫자	나이
STU_MAJOR	문자(50)	학과
STU_SCORE	숫자	점수
[학생 데이터]

(1, '김철수', 20, '컴퓨터', 85)
(2, '이영희', 22, '인공지능', 90)
(3, '박민수', 21, '컴퓨터', 70)
(4, '최지은', 23, '정보보안', 95)
(5, '홍길동', 20, '컴퓨터', 88)
(6, '김유리', 22, '인공지능', 60)
(7, '장민호', 24, '정보보안', 75)
(8, '신짱구', 21, '컴퓨터', 92)

INSERT INTO tbl_stu (1, '김철수', 20, '컴퓨터', 85);
INSERT INTO tbl_stu (2, '이영희', 22, '인공지능', 90);
INSERT INTO tbl_stu (3, '박민수', 21, '컴퓨터', 70);
INSERT INTO tbl_stu (4, '최지은', 23, '정보보안', 95);
INSERT INTO tbl_stu (5, '홍길동', 20, '컴퓨터', 88);
INSERT INTO tbl_stu (6, '김유리', 22, '인공지능', 60);
INSERT INTO tbl_stu (7, '장민호', 24, '정보보안', 75);
INSERT INTO tbl_stu (8, '신짱구', 21, '컴퓨터', 92);

[문제]
(1) 모든 학생 정보 조회
SELECT *
FROM tbl_stu;

(2) 나이가 22세 이상인 학생 조회
SELECT *
FROM tbl_stu
WHERE stu_age >= 22;

(3) 컴퓨터학과 학생을 점수 내림차순으로 조회
SELECT *
FROM stu_table
WHERE stu_major = '컴퓨터' DESC;

(4) 학과별 학생 수 조회 (GROUP BY)
SELECT COUNT(*)
FROM stu_table
GROUP BY stu_major;

(5) 학과별 평균 점수 조회
SELECT avg(stu_score)
FROM stu_table
GROUP BY stu_major;

(6) 평균 점수가 80점 이상인 학과 조회 (HAVING 사용)
SELECT avg(stu_score)
FROM stu_table
GROUP BY stu_major
HAVING avg(stu_score) >= 80;

(7) 학과별 최고 점수 조회
SE
 */