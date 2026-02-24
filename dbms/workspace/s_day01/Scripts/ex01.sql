SELECT * FROM tbl_customer;
SELECT * FROM tbl_product;
SELECT * FROM tbl_order;
SELECT * FROM tbl_order_item;

-- 1번 문제 : tbl_customer에 신규 고객을 추가하라.
--   이름: 오지훈, 이메일: jihoon@example.com, 성별: M
--   customer_id는 seq_customer를 사용하고, status/join_date는 기본값을 사용하라.
INSERT INTO tbl_customer
VALUES(seq_customer.nextval, '오지훈', 'jihoon@example.com', 'M', DEFAULT, DEFAULT);

-- 2번 문제 : tbl_product에 신규 상품을 추가하라.
--   상품명: 노이즈캔슬링 이어폰, 카테고리: ELECTRONICS, 가격: 99000, 재고: 15
--   product_id는 seq_product를 사용하라.
INSERT INTO tbl_product
VALUES(seq_product.nextval, '노이즈캔슬링 이어폰', 'ELECTRONICS', 99000, 15);

-- 3번 문제 : 고객 이메일이 jiwoo@example.com인 고객의 새 주문을 1건 생성하라.
--   주문 상태: P, 주문일: SYSDATE
--   주문 아이템: USB-C 허브 1개, 무선 마우스 2개
--   unit_price는 현재 tbl_product.price를 사용하고, total_amount는 아이템 합계로 넣어라.
INSERT INTO tbl_order
VALUES(
	seq_order.nextval, 
	(
		SELECT customer_id 
		FROM tbl_customer 
		WHERE email = 'jiwoo@example.com'
	),
	sysdate,
	'P',
	0
);

INSERT INTO tbl_order_item (order_item_id, order_id, product_id, qty, unit_price)
SELECT
  seq_order_item.nextval,
  seq_order.CURRVAL,
  p.product_id,
  1,
  p.price
FROM tbl_product p
WHERE p.product_name = 'USB-C 허브';

INSERT INTO tbl_order_item (order_item_id, order_id, product_id, qty, unit_price)
SELECT
  seq_order_item.NEXTVAL,
  seq_order.CURRVAL,
  p.product_id,
  2,
  p.price
FROM tbl_product p
WHERE p.product_name = '무선 마우스';

UPDATE tbl_order o
SET o.total_amount =
	(
  		SELECT SUM(i.qty * i.unit_price) 
	  	FROM tbl_order_item i 
  		WHERE i.order_id = o.order_id
	)
WHERE o.order_id = seq_order.currval;