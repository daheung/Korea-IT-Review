/* =========================================================
   (선택) 재실행을 위한 DROP (존재할 때만 삭제)
   ========================================================= */
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tbl_order_audit'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tbl_order_item'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tbl_order'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tbl_product'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP TABLE tbl_customer'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_order_audit'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_order_item'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_order'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_product'; EXCEPTION WHEN OTHERS THEN NULL; END;
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE seq_customer'; EXCEPTION WHEN OTHERS THEN NULL; END;

/* =========================================================
   TABLES
   ========================================================= */
CREATE TABLE tbl_customer (
  customer_id   NUMBER(10)       CONSTRAINT pk_customer PRIMARY KEY,
  customer_name VARCHAR2(50)     NOT NULL,
  email         VARCHAR2(100)    NOT NULL,
  gender        CHAR(1)          NOT NULL,
  status        CHAR(1) DEFAULT 'Y' NOT NULL,
  join_date     DATE    DEFAULT SYSDATE NOT NULL,
  CONSTRAINT uq_customer_email UNIQUE (email),
  CONSTRAINT ck_customer_gender CHECK (gender IN ('M','F')),
  CONSTRAINT ck_customer_status CHECK (status IN ('Y','N'))
);

CREATE TABLE tbl_product (
  product_id    NUMBER(10)       CONSTRAINT pk_product PRIMARY KEY,
  product_name  VARCHAR2(80)     NOT NULL,
  category      VARCHAR2(30)     NOT NULL,
  price         NUMBER(10,2)     NOT NULL,
  stock_qty     NUMBER(10) DEFAULT 0 NOT NULL,
  CONSTRAINT uq_product_name UNIQUE (product_name),
  CONSTRAINT ck_product_price CHECK (price >= 0),
  CONSTRAINT ck_product_stock CHECK (stock_qty >= 0)
);

CREATE TABLE tbl_order (
  order_id      NUMBER(10)       CONSTRAINT pk_order PRIMARY KEY,
  customer_id   NUMBER(10)       NOT NULL,
  order_date    DATE DEFAULT SYSDATE NOT NULL,
  status        CHAR(1) DEFAULT 'P' NOT NULL,
  total_amount  NUMBER(12,2) DEFAULT 0 NOT NULL,
  CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
    REFERENCES tbl_customer(customer_id),
  CONSTRAINT ck_order_status CHECK (status IN ('P','S','C'))
);

CREATE TABLE tbl_order_item (
  order_item_id NUMBER(10)       CONSTRAINT pk_order_item PRIMARY KEY,
  order_id      NUMBER(10)       NOT NULL,
  product_id    NUMBER(10)       NOT NULL,
  qty           NUMBER(10)       NOT NULL,
  unit_price    NUMBER(10,2)     NOT NULL,
  CONSTRAINT fk_item_order FOREIGN KEY (order_id)
    REFERENCES tbl_order(order_id),
  CONSTRAINT fk_item_product FOREIGN KEY (product_id)
    REFERENCES tbl_product(product_id),
  CONSTRAINT ck_item_qty CHECK (qty > 0),
  CONSTRAINT ck_item_price CHECK (unit_price >= 0),
  CONSTRAINT uq_order_product UNIQUE (order_id, product_id)
);

CREATE TABLE tbl_order_audit (
  audit_id     NUMBER(10)        CONSTRAINT pk_order_audit PRIMARY KEY,
  order_id     NUMBER(10)        NOT NULL,
  action       VARCHAR2(20)      NOT NULL,
  action_date  DATE DEFAULT SYSDATE NOT NULL,
  note         VARCHAR2(200),
  CONSTRAINT fk_audit_order FOREIGN KEY (order_id)
    REFERENCES tbl_order(order_id)
);

/* =========================================================
   SEQUENCES
   ========================================================= */
CREATE SEQUENCE seq_customer    START WITH 1    INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_product     START WITH 101  INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_order       START WITH 1001 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_order_item  START WITH 5001 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_order_audit START WITH 9001 INCREMENT BY 1 NOCACHE;

/* =========================================================
   SAMPLE DATA
   ========================================================= */
-- Customers
INSERT INTO tbl_customer(customer_id, customer_name, email, gender, status, join_date)
VALUES (seq_customer.NEXTVAL, '김다흥', 'daheung@example.com', 'M', 'Y', TO_DATE('2025-11-01','YYYY-MM-DD'));
INSERT INTO tbl_customer(customer_id, customer_name, email, gender, status, join_date)
VALUES (seq_customer.NEXTVAL, '이서연', 'seoyeon@example.com', 'F', 'Y', TO_DATE('2025-10-10','YYYY-MM-DD'));
INSERT INTO tbl_customer(customer_id, customer_name, email, gender, status, join_date)
VALUES (seq_customer.NEXTVAL, '박민수', 'minsu@example.com', 'M', 'N', TO_DATE('2024-07-15','YYYY-MM-DD'));
INSERT INTO tbl_customer(customer_id, customer_name, email, gender, status, join_date)
VALUES (seq_customer.NEXTVAL, '최지우', 'jiwoo@example.com', 'F', 'Y', TO_DATE('2025-12-20','YYYY-MM-DD'));
INSERT INTO tbl_customer(customer_id, customer_name, email, gender, status, join_date)
VALUES (seq_customer.NEXTVAL, '정하늘', 'haneul@example.com', 'F', 'Y', TO_DATE('2023-03-03','YYYY-MM-DD'));

-- Products
INSERT INTO tbl_product(product_id, product_name, category, price, stock_qty)
VALUES (seq_product.NEXTVAL, 'USB-C 허브', 'ELECTRONICS', 39000, 50);
INSERT INTO tbl_product(product_id, product_name, category, price, stock_qty)
VALUES (seq_product.NEXTVAL, '기계식 키보드', 'ELECTRONICS', 129000, 20);
INSERT INTO tbl_product(product_id, product_name, category, price, stock_qty)
VALUES (seq_product.NEXTVAL, '무선 마우스', 'ELECTRONICS', 45000, 35);
INSERT INTO tbl_product(product_id, product_name, category, price, stock_qty)
VALUES (seq_product.NEXTVAL, '해석학 교재', 'BOOK', 32000, 100);
INSERT INTO tbl_product(product_id, product_name, category, price, stock_qty)
VALUES (seq_product.NEXTVAL, '머신러닝 입문', 'BOOK', 28000, 80);
INSERT INTO tbl_product(product_id, product_name, category, price, stock_qty)
VALUES (seq_product.NEXTVAL, '텀블러 500ml', 'LIFE', 15000, 60);

-- Orders (customer_id는 삽입 순서대로 1~5)
INSERT INTO tbl_order(order_id, customer_id, order_date, status, total_amount)
VALUES (seq_order.NEXTVAL, 1, TO_DATE('2026-01-10','YYYY-MM-DD'), 'P', 62000);
INSERT INTO tbl_order(order_id, customer_id, order_date, status, total_amount)
VALUES (seq_order.NEXTVAL, 2, TO_DATE('2025-12-15','YYYY-MM-DD'), 'S', 170000);
INSERT INTO tbl_order(order_id, customer_id, order_date, status, total_amount)
VALUES (seq_order.NEXTVAL, 2, TO_DATE('2024-05-05','YYYY-MM-DD'), 'C', 39000);
INSERT INTO tbl_order(order_id, customer_id, order_date, status, total_amount)
VALUES (seq_order.NEXTVAL, 4, TO_DATE('2026-01-20','YYYY-MM-DD'), 'P', 84000);
INSERT INTO tbl_order(order_id, customer_id, order_date, status, total_amount)
VALUES (seq_order.NEXTVAL, 5, TO_DATE('2023-07-07','YYYY-MM-DD'), 'S', 75000);

-- Order Items (order_id는 seq_order 시작값이 1001이므로 1001~1005로 가정)
-- 1001: 해석학 교재(1*32000), 텀블러(2*15000)
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1001, 104, 1, 32000);
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1001, 106, 2, 15000);

-- 1002: 키보드(1*125000), 마우스(1*45000)
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1002, 102, 1, 125000);
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1002, 103, 1, 45000);

-- 1003: 허브(1*39000) (취소)
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1003, 101, 1, 39000);

-- 1004: 머신러닝 입문(3*28000)
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1004, 105, 3, 28000);

-- 1005: 해석학 교재(2*30000), 텀블러(1*15000)
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1005, 104, 2, 30000);
INSERT INTO tbl_order_item(order_item_id, order_id, product_id, qty, unit_price)
VALUES (seq_order_item.NEXTVAL, 1005, 106, 1, 15000);

COMMIT;
