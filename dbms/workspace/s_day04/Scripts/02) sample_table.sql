-- 1) 부서
CREATE TABLE dept (
  dept_id   NUMBER(2) CONSTRAINT pk_dept PRIMARY KEY,
  dept_name VARCHAR2(30) NOT NULL
);

INSERT INTO dept VALUES (10, 'SALES');
INSERT INTO dept VALUES (20, 'DEV');
INSERT INTO dept VALUES (30, 'HR');
INSERT INTO dept VALUES (40, 'OPS');

-- 2) 사원
CREATE TABLE emp (
  emp_id    NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY,
  emp_name  VARCHAR2(30) NOT NULL,
  dept_id   NUMBER(2) CONSTRAINT fk_emp_dept REFERENCES dept(dept_id),
  salary    NUMBER(8,2) NOT NULL,
  hire_date DATE NOT NULL,
  score     NUMBER(3) CONSTRAINT ck_emp_score CHECK (score BETWEEN 0 AND 100)
);

INSERT INTO emp VALUES (1001, 'KIM',  10,  1800, DATE '2024-04-10', 72);
INSERT INTO emp VALUES (1002, 'LEE',  10,  2400, DATE '2023-11-01', 85);
INSERT INTO emp VALUES (1003, 'PARK', 10,  3100, DATE '2021-05-20', 91);
INSERT INTO emp VALUES (1004, 'CHOI', 20,  4200, DATE '2020-02-14', 88);
INSERT INTO emp VALUES (1005, 'JUNG', 20,  5200, DATE '2018-09-03', 77);
INSERT INTO emp VALUES (1006, 'HAN',  20,  6100, DATE '2016-07-18', 95);
INSERT INTO emp VALUES (1007, 'YOO',  20,  7800, DATE '2015-01-05', 83);
INSERT INTO emp VALUES (1008, 'LIM',  30,  2900, DATE '2022-12-28', 66);
INSERT INTO emp VALUES (1009, 'KANG', 30,  3600, DATE '2019-06-11', 58);
INSERT INTO emp VALUES (1010, 'SHIN', 30,  4800, DATE '2014-08-23', 73);
INSERT INTO emp VALUES (1011, 'SONG', 40,  5600, DATE '2012-10-09', 69);
INSERT INTO emp VALUES (1012, 'SEO',  40,  7200, DATE '2011-03-30', 80);
INSERT INTO emp VALUES (1013, 'OH',   40,  9800, DATE '2009-12-01', 92);
INSERT INTO emp VALUES (1014, 'MOON', 40, 12000, DATE '2007-05-17', 87);

-- 3) 급여 구간(비등기조인 대표 테이블)
CREATE TABLE sal_grade (
  grade    NUMBER(2) CONSTRAINT pk_sal_grade PRIMARY KEY,
  low_sal  NUMBER(8,2) NOT NULL,
  high_sal NUMBER(8,2) NOT NULL,
  CONSTRAINT ck_sal_range CHECK (low_sal <= high_sal)
);

INSERT INTO sal_grade VALUES (1,     0,  1999);
INSERT INTO sal_grade VALUES (2,  2000,  2999);
INSERT INTO sal_grade VALUES (3,  3000,  3999);
INSERT INTO sal_grade VALUES (4,  4000,  4999);
INSERT INTO sal_grade VALUES (5,  5000,  6999);
INSERT INTO sal_grade VALUES (6,  7000,  9999);
INSERT INTO sal_grade VALUES (7, 10000, 20000);

-- 4) 세율 구간
CREATE TABLE tax_bracket (
  bracket_id NUMBER(2) CONSTRAINT pk_tax_bracket PRIMARY KEY,
  low_sal    NUMBER(8,2) NOT NULL,
  high_sal   NUMBER(8,2) NOT NULL,
  tax_rate   NUMBER(5,4) NOT NULL,  -- 예: 0.1500
  CONSTRAINT ck_tax_range CHECK (low_sal <= high_sal)
);

INSERT INTO tax_bracket VALUES (1,     0,  2999, 0.0500);
INSERT INTO tax_bracket VALUES (2,  3000,  4999, 0.1000);
INSERT INTO tax_bracket VALUES (3,  5000,  6999, 0.1500);
INSERT INTO tax_bracket VALUES (4,  7000,  9999, 0.2000);
INSERT INTO tax_bracket VALUES (5, 10000, 20000, 0.2500);

-- 5) 근속 보너스(년수 구간)
CREATE TABLE tenure_bonus (
  bonus_id  NUMBER(2) CONSTRAINT pk_tenure_bonus PRIMARY KEY,
  min_years NUMBER(3) NOT NULL,
  max_years NUMBER(3) NOT NULL,
  bonus_pct NUMBER(5,4) NOT NULL, -- 예: 0.0800
  CONSTRAINT ck_years_range CHECK (min_years <= max_years)
);

INSERT INTO tenure_bonus VALUES (1,  0,  0, 0.0000);
INSERT INTO tenure_bonus VALUES (2,  1,  2, 0.0300);
INSERT INTO tenure_bonus VALUES (3,  3,  4, 0.0500);
INSERT INTO tenure_bonus VALUES (4,  5,  9, 0.0800);
INSERT INTO tenure_bonus VALUES (5, 10, 99, 0.1000);

-- 6) 성과점수 등급(점수 구간)
CREATE TABLE score_grade (
  rating    VARCHAR2(1) CONSTRAINT pk_score_grade PRIMARY KEY,
  min_score NUMBER(3) NOT NULL,
  max_score NUMBER(3) NOT NULL,
  CONSTRAINT ck_score_range CHECK (min_score <= max_score)
);

INSERT INTO score_grade VALUES ('F',  0, 59);
INSERT INTO score_grade VALUES ('D', 60, 69);
INSERT INTO score_grade VALUES ('C', 70, 79);
INSERT INTO score_grade VALUES ('B', 80, 89);
INSERT INTO score_grade VALUES ('A', 90,100);

-- 7) 등급별 권장급여 구간
CREATE TABLE reco_sal_by_rating (
  rating    VARCHAR2(1) CONSTRAINT pk_reco PRIMARY KEY,
  low_sal   NUMBER(8,2) NOT NULL,
  high_sal  NUMBER(8,2) NOT NULL,
  CONSTRAINT ck_reco_range CHECK (low_sal <= high_sal)
);

INSERT INTO reco_sal_by_rating VALUES ('A', 7000, 20000);
INSERT INTO reco_sal_by_rating VALUES ('B', 5000,  9999);
INSERT INTO reco_sal_by_rating VALUES ('C', 3000,  6999);
INSERT INTO reco_sal_by_rating VALUES ('D', 2000,  4999);
INSERT INTO reco_sal_by_rating VALUES ('F',    0,  2999);

COMMIT;
