-- 서브쿼리로 연습
SELECT * 
FROM (
	SELECT * FROM PLAYER p 
	WHERE p.position = 'GK'
)
WHERE TEAM_ID = 'K01';

SELECT *
FROM player p
WHERE p.POSITION IN (
	SELECT p.position FROM PLAYER p 
	WHERE p.position = 'GK'
)
AND TEAM_ID = 'K01'
	