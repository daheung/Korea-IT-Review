-- (선택) 기존 테이블 있으면 삭제
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE shop_order';
EXCEPTION WHEN OTHERS THEN NULL;
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE shop_product';
EXCEPTION WHEN OTHERS THEN NULL;
END;

-- 상품 테이블
CREATE TABLE shop_product (
  product_id   NUMBER PRIMARY KEY,
  category     VARCHAR2(20) NOT NULL,
  product_name VARCHAR2(50) NOT NULL,
  price        NUMBER(10)   NOT NULL,
  created_at   DATE DEFAULT SYSDATE NOT NULL
);

-- 주문 테이블
CREATE TABLE shop_order (
  order_id    NUMBER PRIMARY KEY,
  product_id  NUMBER NOT NULL REFERENCES shop_product(product_id),
  buyer       VARCHAR2(30) NOT NULL,
  qty         NUMBER(10) NOT NULL CHECK (qty > 0),
  order_date  DATE DEFAULT SYSDATE NOT NULL
);

-- 상품 데이터
INSERT INTO shop_product VALUES (101, 'BOOK',   'SQL Basics',        18000, DATE '2025-12-01');
INSERT INTO shop_product VALUES (102, 'BOOK',   'Oracle 11g Guide',  32000, DATE '2025-12-03');
INSERT INTO shop_product VALUES (103, 'BOOK',   'DB Design',         27000, DATE '2025-12-05');
INSERT INTO shop_product VALUES (104, 'IT',     'Mechanical Keyboard',89000,DATE '2025-12-07');
INSERT INTO shop_product VALUES (105, 'IT',     'Gaming Mouse',      45000, DATE '2025-12-07');
INSERT INTO shop_product VALUES (106, 'IT',     'USB-C Hub',         29000, DATE '2025-12-09');
INSERT INTO shop_product VALUES (107, 'FOOD',   'Coffee Beans',      16000, DATE '2025-12-10');
INSERT INTO shop_product VALUES (108, 'FOOD',   'Green Tea',         12000, DATE '2025-12-11');
INSERT INTO shop_product VALUES (109, 'LIFE',   'Desk Lamp',         38000, DATE '2025-12-12');
INSERT INTO shop_product VALUES (110, 'LIFE',   'Notebook Set',       9000, DATE '2025-12-12');
INSERT INTO shop_product VALUES (111, 'BOOK',   'Indexing Master',   41000, DATE '2025-12-14');
INSERT INTO shop_product VALUES (112, 'IT',     'SSD 1TB',          115000, DATE '2025-12-15');
INSERT INTO shop_product VALUES (113, 'LIFE',   'Ergonomic Chair',  210000, DATE '2025-12-18');
INSERT INTO shop_product VALUES (114, 'FOOD',   'Protein Bar Box',   24000, DATE '2025-12-20');
INSERT INTO shop_product VALUES (115, 'IT',     'Monitor 27"',      189000, DATE '2025-12-21');

-- 주문 데이터
INSERT INTO shop_order VALUES (201, 101, 'kim',   1, DATE '2026-01-02');
INSERT INTO shop_order VALUES (202, 104, 'kim',   1, DATE '2026-01-03');
INSERT INTO shop_order VALUES (203, 110, 'lee',   3, DATE '2026-01-03');
INSERT INTO shop_order VALUES (204, 107, 'park',  2, DATE '2026-01-04');
INSERT INTO shop_order VALUES (205, 112, 'choi',  1, DATE '2026-01-04');
INSERT INTO shop_order VALUES (206, 105, 'lee',   1, DATE '2026-01-05');
INSERT INTO shop_order VALUES (207, 109, 'kim',   2, DATE '2026-01-05');
INSERT INTO shop_order VALUES (208, 114, 'park',  1, DATE '2026-01-06');
INSERT INTO shop_order VALUES (209, 115, 'choi',  2, DATE '2026-01-06');
INSERT INTO shop_order VALUES (210, 102, 'han',   1, DATE '2026-01-07');
INSERT INTO shop_order VALUES (211, 113, 'han',   1, DATE '2026-01-08');
INSERT INTO shop_order VALUES (212, 108, 'kim',   5, DATE '2026-01-09');
INSERT INTO shop_order VALUES (213, 106, 'park',  2, DATE '2026-01-09');
INSERT INTO shop_order VALUES (214, 111, 'lee',   1, DATE '2026-01-10');
INSERT INTO shop_order VALUES (215, 103, 'choi',  2, DATE '2026-01-11');

COMMIT;
