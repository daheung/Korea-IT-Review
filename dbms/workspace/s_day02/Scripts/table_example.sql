-- 고객
CREATE TABLE customer (
  customer_id   NUMBER PRIMARY KEY,
  name          VARCHAR2(50) NOT NULL,
  city          VARCHAR2(30),
  signup_date   DATE NOT NULL
);

-- 상품
CREATE TABLE product (
  product_id    NUMBER PRIMARY KEY,
  product_name  VARCHAR2(50) NOT NULL,
  category      VARCHAR2(30) NOT NULL,
  price         NUMBER(10,2) NOT NULL
);

-- 주문
CREATE TABLE orders (
  order_id      NUMBER PRIMARY KEY,
  customer_id   NUMBER NOT NULL REFERENCES customer(customer_id),
  order_date    DATE NOT NULL,
  status        VARCHAR2(10) NOT NULL  -- PAID, CANCEL, REFUND
);

-- 주문 상세
CREATE TABLE order_item (
  order_id     NUMBER NOT NULL REFERENCES orders(order_id),
  product_id   NUMBER NOT NULL REFERENCES product(product_id),
  qty          NUMBER NOT NULL,
  unit_price   NUMBER(10,2) NOT NULL,
  CONSTRAINT pk_order_item PRIMARY KEY (order_id, product_id)
);

-- 직원(조직/계층 질의용)
CREATE TABLE emp (
  emp_id      NUMBER PRIMARY KEY,
  emp_name    VARCHAR2(50) NOT NULL,
  manager_id  NUMBER NULL REFERENCES emp(emp_id),
  dept        VARCHAR2(30) NOT NULL,
  hire_date   DATE NOT NULL,
  salary      NUMBER(10,2) NOT NULL
);

-- 샘플 데이터
INSERT INTO customer VALUES (1, 'Kim',  'Seoul',  TO_DATE('2024-11-10','YYYY-MM-DD'));
INSERT INTO customer VALUES (2, 'Lee',  'Busan',  TO_DATE('2025-01-03','YYYY-MM-DD'));
INSERT INTO customer VALUES (3, 'Park', 'Seoul',  TO_DATE('2025-06-21','YYYY-MM-DD'));
INSERT INTO customer VALUES (4, 'Choi', 'Incheon',TO_DATE('2023-12-30','YYYY-MM-DD'));
INSERT INTO customer VALUES (5, 'Jung', NULL,     TO_DATE('2025-12-01','YYYY-MM-DD'));

INSERT INTO product VALUES (10, 'Keyboard', 'IT',     50000);
INSERT INTO product VALUES (11, 'Mouse',    'IT',     25000);
INSERT INTO product VALUES (12, 'Monitor',  'IT',    200000);
INSERT INTO product VALUES (20, 'Coffee',   'Food',    6000);
INSERT INTO product VALUES (21, 'Tea',      'Food',    5500);
INSERT INTO product VALUES (30, 'Chair',    'Office',120000);

INSERT INTO orders VALUES (100, 1, TO_DATE('2025-01-10','YYYY-MM-DD'), 'PAID');
INSERT INTO orders VALUES (101, 1, TO_DATE('2025-02-01','YYYY-MM-DD'), 'CANCEL');
INSERT INTO orders VALUES (102, 2, TO_DATE('2025-02-12','YYYY-MM-DD'), 'PAID');
INSERT INTO orders VALUES (103, 3, TO_DATE('2024-12-28','YYYY-MM-DD'), 'PAID');
INSERT INTO orders VALUES (104, 3, TO_DATE('2025-07-02','YYYY-MM-DD'), 'REFUND');

INSERT INTO order_item VALUES (100, 10, 1, 50000);
INSERT INTO order_item VALUES (100, 20, 2,  6000);
INSERT INTO order_item VALUES (101, 12, 1, 200000);
INSERT INTO order_item VALUES (102, 11, 3,  25000);
INSERT INTO order_item VALUES (102, 20, 1,   6000);
INSERT INTO order_item VALUES (103, 30, 1, 120000);
INSERT INTO order_item VALUES (104, 10, 2,  50000);

INSERT INTO emp VALUES (1, 'CEO',   NULL, 'HQ',    TO_DATE('2020-01-01','YYYY-MM-DD'), 9000000);
INSERT INTO emp VALUES (2, 'CTO',      1, 'HQ',    TO_DATE('2020-03-01','YYYY-MM-DD'), 7000000);
INSERT INTO emp VALUES (3, 'DevA',     2, 'DEV',   TO_DATE('2021-04-10','YYYY-MM-DD'), 4500000);
INSERT INTO emp VALUES (4, 'DevB',     2, 'DEV',   TO_DATE('2022-08-15','YYYY-MM-DD'), 4200000);
INSERT INTO emp VALUES (5, 'SalesH',   1, 'SALES', TO_DATE('2020-05-20','YYYY-MM-DD'), 6500000);
INSERT INTO emp VALUES (6, 'SalesA',   5, 'SALES', TO_DATE('2023-02-11','YYYY-MM-DD'), 3800000);

COMMIT;
