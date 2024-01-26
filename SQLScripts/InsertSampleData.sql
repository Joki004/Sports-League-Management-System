
--FAN

--MECZE
INSERT INTO MATCH(MATCH_ID, MATCH_DATE, SPORT_OBJECT_ID, TEAM_HOME_ID, TEAM_AWAY_ID, SCORE_HOME, SCORE_AWAY)
VALUES(1,
    TO_DATE('03-01-2024', 'DD-MM-YYYY')
    (SELECT REF(t) FROM SPORTOBJECT t WHERE t.team_id = 1));
    );

INSERT INTO TEAM (TEAM_ID, NAME, PLAYERS, SPONSORS) 
VALUES (1,
    'Lakers',
    PlayerListType(
        PlayerType(1, 'Michael', 'Jordan', NULL, NULL, NULL),
        PlayerType(2, 'Barack', 'Obama', NULL, NULL, NULL)),
    SponsorListType(
        SponsorType(1, 'COCA COLA', NULL, NULL),
        SponsorType(2, 'PEPSI', NULL, NULL))
        );


SELECT sname. p.sponsor_name
FROM TEAM s,
TABLE(s.sponsors) p;

select * from TEAM;
select * from sector;
SELECT * FROM Match;
select * from Player;
select * from PlayerStats;
select * from sponsor;
select * from sportObject;
SELECT sectors FROM SPORTOBJECT WHERE OBJECT_ID = 1
(SELECT REF(t) FROM sportObject t WHERE t.object_name = 'TD Garden');

SELECT so.OBJECT_ID, so.OBJECT_NAME, s.sector_id, s.sector_name, s.seat_count
FROM SPORTOBJECT so
CROSS JOIN TABLE(so.sectors) s;

SELECT so.object_id,so.object_name,DEREF(so.owner_team_ID).NAME,city,country,seating_capacity,s.sector_id, s.sector_name, s.seat_count,s.sector_type,s.price_per_seat
FROM SPORTOBJECT so
CROSS JOIN TABLE(so.sectors) s;

select match_id,match_date,DEREF(m.sport_object_id).object_name,
DEREF(m.team_home_id).name,DEREF(m.team_away_id).name,
score_home,score_away from match m;

SELECT
        *
        FROM
                 match m
            JOIN sportobject s ON s.object_id = deref(m.sport_object_id).object_id
        WHERE
                m.match_date = TO_DATE('2023-10-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS')
            AND s.object_name = 'Little Caesars Arena';
SELECT
    TO_CHAR(m.match_date, 'YYYY-MM-DD HH24:MI:SS') AS formatted_date,DEREF(m.team_home_id).name,DEREF(m.team_away_id).name,DEREF(m.sport_object_id).object_name
FROM
    match m
where DEREF(m.team_home_id).name = 'DETROIT PISTONS';
SELECT
    TO_CHAR(m.match_date, 'YYYY-MM-DD HH24:MI:SS') AS formatted_date,DEREF(m.team_home_id).name,DEREF(m.team_away_id).name,DEREF(m.sport_object_id).object_name
FROM
    match m
where DEREF(m.team_away_id).name = 'DETROIT PISTONS';
 SELECT DISTINCT t.wins,
 t.name,
           t.loses,
           t.win_percentage,
           t.points_conceded,
           t.points_scored
    from TEAM t
    JOIN Match m ON t.team_id = DEREF(m.team_home_id).team_id
    WHERE t.team_id = 25
SELECT DISTINCT
            *
       
        FROM
                 team t
            JOIN match m ON t.team_id = deref(m.team_home_id).team_id
            where m.match_id = 1;
            
SELECT
                                                                      team_id,
                                                                      name,
                                                                      wins,
                                                                      loses,
                                                                      win_percentage
                                                                  FROM
                                                                      (
                                                                          SELECT
                                                                              team_id,
                                                                              name,
                                                                              wins,
                                                                              loses,
                                                                              win_percentage,
                                                                              RANK()
                                                                              OVER(
                                                                                  ORDER BY
                                                                                      wins DESC, win_percentage DESC
                                                                              ) AS team_rank
                                                                          FROM
                                                                              team
                                                                      )
                                     ORDER BY
                                         team_rank ASC;
                                         
select * from team t
CROSS JOIN TABLE(t.players) p;

select * from player;





