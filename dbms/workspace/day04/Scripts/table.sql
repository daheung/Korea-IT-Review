CREATE TABLE patient (
   patient_id NUMBER, 
   patient_name varchar2(20) NOT NULL,
   patient_age NUMBER NOT NULL,
   patient_birth DATE NOT null,
   patient_phone varchar2(100) NOT NULL,
   
   CONSTRAINT pk_patient PRIMARY KEY (patient_id)
);


CREATE TABLE doctor (
	doctor_id NUMBER,
	doctor_name varchar2(20) NOT NULL,
	doctor_category  varchar2(20) NOT NULL,
	doctor_gender char(2) NOT NULL ,
	doctor_workingday DATE NOT NULL,
	CONSTRAINT pk_doctor PRIMARY KEY (doctor_id),
	CONSTRAINT gender CHECK (doctor_gender IN ('m','w')) 
);

CREATE TABLE booking(
	booking_id NUMBER,
	booking_day DATE,
	booking_purpose varchar2(100),
	patient_id NUMBER,
	doctor_id NUMBER,
	CONSTRAINT pk_booking PRIMARY KEY (booking_id),
	CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patient (patient_id) ON DELETE CASCADE,
	CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id) ON DELETE CASCADE
);

CREATE SEQUENCE seq_patient nocache nocycle;
CREATE SEQUENCE seq_doctor nocache nocycle;
CREATE SEQUENCE seq_booking nocache nocycle;

INSERT INTO patient VALUES (seq_patient.NEXTVAL, '홍길동', 25, DATE '1999-03-12', '010-0000-0001');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '김민수', 32, DATE '1992-07-21', '010-0000-0002');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '이서연', 45, DATE '1979-01-10', '010-0000-0003');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '박지훈', 18, DATE '2006-11-05', '010-0000-0004');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '최은지', 60, DATE '1964-06-14', '010-0000-0005');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '정우성', 29, DATE '1995-02-02', '010-0000-0006');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '한지민', 41, DATE '1983-08-30', '010-0000-0007');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '오세훈', 36, DATE '1988-12-17', '010-0000-0008');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '윤아름', 52, DATE '1972-04-09', '010-0000-0009');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '강동원', 22, DATE '2002-09-25', '010-0000-0010');

INSERT INTO patient VALUES (seq_patient.NEXTVAL, '서현진', 34, DATE '1990-05-01', '010-0000-0011');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '임재범', 48, DATE '1976-10-19', '010-0000-0012');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '조수빈', 55, DATE '1969-03-03', '010-0000-0013');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '신동엽', 27, DATE '1997-07-07', '010-0000-0014');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '문채원', 39, DATE '1985-01-28', '010-0000-0015');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '김태리', 44, DATE '1980-06-16', '010-0000-0016');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '유재석', 31, DATE '1993-11-11', '010-0000-0017');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '장미란', 67, DATE '1957-02-22', '010-0000-0018');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '이승기', 20, DATE '2004-08-08', '010-0000-0019');
INSERT INTO patient VALUES (seq_patient.NEXTVAL, '배수지', 58, DATE '1966-12-31', '010-0000-0020');

-- 외과 (3명)
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '김성훈', '외과', 'm', DATE '1995-03-12');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '이정민', '외과', 'w', DATE '2002-07-21');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '박준호', '외과', 'm', DATE '2018-11-05');

-- 내과 (3명)
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '최은영', '내과', 'w', DATE '1998-01-10');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '정우진', '내과', 'm', DATE '2009-06-14');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '한지수', '내과', 'w', DATE '2021-09-30');

-- 피부과 (3명)
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '윤서현', '피부과', 'w', DATE '1993-04-09');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '김도현', '피부과', 'm', DATE '2005-12-17');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '이수빈', '피부과', 'w', DATE '2016-08-22');

-- 산부인과 (3명)
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '박미정', '산부인과', 'w', DATE '1991-02-28');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '서재훈', '산부인과', 'm', DATE '2007-10-10');
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '김하은', '산부인과', 'w', DATE '2024-05-03');

-- 안과 (1명)
INSERT INTO doctor VALUES (seq_doctor.NEXTVAL, '조현석', '안과', 'm', DATE '2012-01-15');

-- 2024-06-01
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-01' + 9/24,  '외과 상담', 1, 1);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-01' + 10/24, '내과 진료', 2, 2);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-01' + 11/24, '피부 트러블', 3, 7);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-01' + 12/24, '산부인과 검진', 4, 10);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-01' + 13/24, '시력 검사', 5, 13);

-- 2024-06-02
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-02' + 9/24,  '외과 수술 상담', 6, 1);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-02' + 10/24, '소화불량', 7, 3);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-02' + 11/24, '여드름 치료', 8, 8);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-02' + 14/24, '임신 초기 검사', 9, 11);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-02' + 15/24, '눈 피로', 10, 13);

-- 2024-06-03
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-03' + 9/24,  '복부 통증', 11, 2);
INSERT INTO booking VALUES (seq_booking.NEXTVAL, DATE '2024-06-03' + 10/24, '피부 알러지', 12, 9);

SELECT * FROM patient;
SELECT * FROM doctor;
SELECT * FROM booking;

DROP TABLE booking;
DROP TABLE doctor;
DROP TABLE patient;

DROP SEQUENCE seq_patient;
DROP SEQUENCE seq_doctor;
DROP SEQUENCE seq_booking;