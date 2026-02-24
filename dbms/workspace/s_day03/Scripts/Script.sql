/* PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수 검색 */
SELECT *
FROM player
WHERE weight BETWEEN 70 AND 80
ORDER BY weight;

/* PLAYER 테이블에서 TEAM_ID가 'K03'이고 HEIGHT가 180 미만인 선수 검색 */
SELECT *
FROM player
WHERE team_id = 'K03'
	AND height < 180;

/* PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수 검색 */
SELECT *
FROM player 
WHERE team_id = 'K06'
	AND nickname = '제리';

/* PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름 검색 */
SELECT player_name
FROM player
WHERE height >= 170
	AND weight >= 80;

/* STADIUM 테이블에서 SEAT_COUNT가 30000초과이고 41000이하인 경기장 검색 */
SELECT stadium_name
FROM stadium
WHERE seat_count BETWEEN 30001 AND 41000;

/* PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07'이고 포지션은 'MF'인 선수 검색 */
SELECT *
FROM player p
WHERE p.team_id IN ('K02', 'K07') AND
	p.position = 'MF';

/*
 * PLAYER 테이블에서 POSITION이 NULL인 선수 검색
 */
SELECT *
FROM player p
WHERE p.position IS NULL;

/*
 * PLAYER 테이블에서 NICKNAME이 NULL인 선수를 '없음'으로 변경하여 조회하기
 */
SELECT NVL(nickname, '없음') AS nickname
FROM player;

/*
 * PLAYER 테이블에서 POSITION이 NULL인 선수를 '미정'으로 변경 후 검색
 */
SELECT 
	NVL(p.position, '미정') AS "position"
FROM player p;

/*
 * PLAYER 테이블에서 NATION이 등록되어 있으면 '등록', 아니면 '미등록'으로 검색
 */