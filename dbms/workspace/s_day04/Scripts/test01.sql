-- 문제 1. SHOP_PRODUCT에서 아무 정렬 없이 조회 결과 상위 5행만 출력하라.
SELECT *
FROM shop_product
WHERE rownum <= 5;

-- 문제 2. SHOP_PRODUCT에서 price가 가장 비싼 상품 3개를 출력하라.
SELECT *
FROM (
	SELECT *
	FROM shop_product
	ORDER BY price DESC
)
WHERE rownum <= 3;

-- 문제 3. SHOP_PRODUCT에서 price가 가장 싼 상품 1개를 출력하라. (x)
SELECT *
FROM (
	SELECT *
	FROM shop_product
--	ORDER BY price DESC (x)
	ORDER BY price ASC 
)
WHERE rownum = 1;

-- 문제 4. SHOP_PRODUCT를 price DESC로 정렬했을 때 6~10번째 상품을 출력하라.
SELECT *
FROM (
	SELECT t.*, rownum AS rn
	FROM (
		SELECT *
		FROM shop_product
		ORDER BY price DESC
	) t
	WHERE rownum <= 10
)
WHERE rn >= 6;

-- 문제 5. SHOP_ORDER에서 order_date가 가장 최근인 주문 5건을 출력하라.
SELECT * 
FROM (
	SELECT *
	FROM shop_order
	ORDER BY order_date DESC
) t
WHERE rownum <= 5;

-- 문제 6. 아래 쿼리는 의도상 "비싼 상품 기준 6 ~ 10번째"를 뽑고 싶지만 0행이 나올 수 있다.
-- 왜 그런지 설명하고, 정상 동작하는 쿼리로 수정하라.
--   SELECT *
--   FROM (
--		SELECT * 
--		FROM shop_product 
--		ORDER BY price DESC
--	 )
--   WHERE ROWNUM >= 6 AND ROWNUM <= 10;
--
-- >> ROWNUM은 컬럼은 select가 만들어지는 과정에서 가상 컬럼이 만들어지는 구조이다.
--	  하지만 쿼리문 실행 순서는 다음과 같다:
--	  	FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
-- 
-- 	  때문에, where나 order by를 사용하면 select의 ROWNUM 컬럼이 삽입되기 전이기 때문에 원하는 결과가 나오지 않을 수 있다
SELECT *
FROM (
	SELECT t.*, rownum AS rn
	FROM (
		SELECT *
		FROM shop_product
		ORDER BY price DESC
	) t
)
WHERE rn BETWEEN 6 AND 10;

-- 문제 7. SHOP_ORDER와 SHOP_PRODUCT를 조인하여, 주문별 총액(qty * price) 기준으로 내림차순 정렬 후 상위 7건을 출력하라.
-- (출력 컬럼 예: order_id, buyer, product_name, qty, price, total_amount)
SELECT 
	order_id,
	buyer,
	product_name,
	qty, 
	price,
	total_amount
FROM (
	SELECT t.*, rownum AS rn
	FROM (
		SELECT 
			o.order_id, 
			o.buyer, 
			p.product_name, 
			o.qty, 
			p.price, 
			o.qty * p.price AS total_amount
		FROM shop_order o
		LEFT OUTER JOIN shop_product p
			ON o.product_id = p.product_id
		ORDER BY o.qty * p.price DESC
	) t
)
WHERE rn <= 7
ORDER BY rn;

-- 문제 8. SHOP_ORDER에서 "두 번째로 최근 주문(1건)" 을 출력하라. (x)
-- (ROWNUM 페이징 방식으로 구현)
SELECT 
	order_id,
	product_id,
	buyer,
	qty,
	order_date
FROM (
	SELECT t.*, rownum AS rn
	FROM (
		SELECT *
		FROM shop_order
--		ORDER BY order_date (x)
		ORDER BY order_date DESC
	) t
)
WHERE rn = 2;

-- 문제 9. SHOP_ORDER에서 무작위로 5건을 출력하라.
-- 힌트: ORDER BY DBMS_RANDOM.VALUE + ROWNUM
SELECT *
FROM (
	SELECT *
	FROM shop_order
	ORDER BY dbms_random.value + rownum
)
WHERE rownum <= 5;


-- 문제 10. SHOP_PRODUCT를 product_name ASC로 정렬했을 때, 페이지 사이즈 4 기준으로 3페이지(9~12행) 를 출력하라.
-- (ROWNUM을 이용한 페이징 쿼리로 작성)
SELECT 
	product_id,
	category,
	product_name,
	price,
	created_at
FROM (
	SELECT t.*, rownum AS rn
	FROM (
		SELECT *
		FROM shop_product
		ORDER BY product_name ASC
	) t
)
WHERE rn BETWEEN 9 AND 12;

-----------------------------------------------------------------------------

DROP TABLE shop_order;
DROP TABLE shop_product;