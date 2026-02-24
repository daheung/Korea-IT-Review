SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM product;

-- 1. (기본 WHERE/ORDER BY)
-- customer에서 **도시(city)가 'Seoul'**인 고객의 customer_id, name, signup_date를 조회하되, 가입일 최신순으로 정렬하라.
SELECT 
	customer_id,
	name,
	signup_date
FROM customer
WHERE city = 'Seoul'
ORDER BY signup_date DESC;

-- 2. (LIKE + NULL 처리)
-- customer에서 city가 NULL인 고객만 조회하고, 결과에 city 대신 'UNKNOWN'을 출력하라. (NVL 사용)
SELECT 
	customer_id,
	name,
	NVL(city, 'UNKNOWN'),
	signup_date
FROM customer
WHERE city IS NULL;

-- 3. (INNER JOIN)
-- orders와 customer를 조인해서, **각 주문의 order_id, 고객이름(name), order_date, status**를 출력하라. 정렬은 order_date 오름차순.
SELECT 
	o.order_id,
	c.name,
	o.order_date,
	o.status
FROM customer c
INNER JOIN orders o
	ON o.customer_id = c.customer_id
ORDER BY order_date ASC;

-- 4. (집계 + GROUP BY)
-- orders와 order_item을 이용해, 주문별(order_id) 총 결제금액을 계산하라.
--   총 결제금액 = SUM(qty * unit_price)
--   단, status='PAID' 인 주문만 대상으로 한다.
SELECT sum(oi.qty * oi.unit_price) AS "total_amount"
FROM orders o
INNER JOIN order_item oi
	ON oi.order_id = o.order_id 
WHERE o.status = 'PAID'
GROUP BY o.order_id
ORDER BY o.order_id;

-- 5. (HAVING)
-- 문제 4의 결과에서, 총 결제금액이 100,000원 이상인 주문만 남겨라.
SELECT sum(oi.qty * oi.unit_price) AS "total_amount"
FROM orders o
INNER JOIN order_item oi
	ON oi.order_id = o.order_id 
WHERE o.status = 'PAID'
GROUP BY o.order_id
HAVING sum(oi.qty * oi.unit_price) >= 100000
ORDER BY o.order_id;

-- 6. (LEFT OUTER JOIN: 주문 없는 고객 찾기)
-- 한 번도 주문한 적 없는 고객의 customer_id, name을 조회하라.
SELECT 
	c.customer_id,
	c.name
FROM customer c
LEFT OUTER JOIN orders o
	ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 7. (서브쿼리: 카테고리 평균보다 비싼 상품)
-- product에서 각 상품이 속한 category의 평균 price보다 비싼 상품만 조회하라.
-- 출력: product_id, product_name, category, price
SELECT 
	p.product_id,
	p.product_name,
	p.category,
	p.price
FROM product p
WHERE p.price > (
	SELECT avg(p2.price)
	FROM product p2
	WHERE p2.category = p.category
);

SELECT 
	p.product_id,
	p.product_name,
	p.category,
	p.price
FROM product p
INNER JOIN (
	SELECT 
		p2.category,
		avg(p2.price) AS avg_price
	FROM product p2
	GROUP BY p2.category
) t
	ON t.category = p.category
WHERE p.price > t.avg_price;

-- 8. (상관 서브쿼리/EXISTS: 2025년에 PAID 주문이 있는 고객)
-- 2025년에 status='PAID' 주문이 존재하는 고객의 customer_id, name을 조회하라. (EXISTS 사용)
SELECT 
	c.customer_id,
	c.name
FROM customer c
WHERE EXISTS (
	SELECT *
	FROM orders o
	WHERE o.status = 'PAID'
);

SELECT 
	c.customer_id,
	c.name
FROM customer c
LEFT OUTER JOIN (
	SELECT *
	FROM customer c2
	WHERE c2.customer_id = 'PAID'
) t
	ON c.customer_id = t.customer_id;


-- 9. (분석함수 Top-N: 고객별 결제금액 1위 주문)
-- 고객별로 PAID 주문 중 총 결제금액이 가장 큰 주문 1건씩만 뽑아라.
-- 출력: customer_id, order_id, total_amount
SELECT
	customer_id,
	order_id,
	total_amount
FROM (
  	SELECT
    	o.customer_id,
	    o.order_id,
    	SUM(oi.qty * oi.unit_price) AS total_amount,
	    ROW_NUMBER() OVER (
    	  	PARTITION BY o.customer_id
	    	ORDER BY SUM(oi.qty * oi.unit_price) DESC, 
	    	o.order_id DESC
    	) AS rn
	FROM orders o
	INNER JOIN order_item oi
    	ON oi.order_id = o.order_id
	WHERE o.status = 'PAID'
	GROUP BY o.customer_id, o.order_id
)
WHERE rn = 1
ORDER BY customer_id;

SELECT t.customer_id, t.order_id, t.total_amount
FROM (
  	SELECT o.customer_id,
         o.order_id,
         SUM(oi.qty * oi.unit_price) AS total_amount
	FROM orders o
	INNER JOIN order_item oi 
  		ON oi.order_id = o.order_id
  	WHERE o.status = 'PAID'
 	GROUP BY o.customer_id, o.order_id
) t
INNER JOIN (
  	SELECT 
  		customer_id, 
  		MAX(total_amount) AS max_amount
  	FROM (
    	SELECT o.customer_id,
        	o.order_id,
           	SUM(oi.qty * oi.unit_price) AS total_amount
    FROM orders o
    INNER JOIN order_item oi 
    	ON oi.order_id = o.order_id
    WHERE o.status = 'PAID'
    GROUP BY o.customer_id, o.order_id
)
  	GROUP BY customer_id
) m
	ON m.customer_id = t.customer_id
	AND m.max_amount  = t.total_amount
ORDER BY t.customer_id;