
BEGIN
  SCHEDULE_PACKAGE.GENERATE_SCHEDULE;
  
    --PLAYER_PACKAGE.TRANSFER_PLAYER(226, 1);

  
  --PLAYER_PACKAGE.ADD_PLAYER(TO_DATE('02-03-1973', 'MM-DD-YYYY'), 'BARACK', 'OBAMA', 'C', 2);
  
  --PLAYER_PACKAGE.ADD_PLAYER(TO_DATE('02-03-1993', 'MM-DD-YYYY'), 'JACUS', 'DEBILOS', 'C', 2);
  --PLAYER_PACKAGE.PRINT_PLAYERS_FROM_TEAM(2);
  --TEAM_PACKAGE.ADD_TEAM('ORKI Z MAJORKI');
  --PLAYER_PACKAGE.ADD_PLAYER(TO_DATE('02-03-1983', 'MM-DD-YYYY'), 'JOHN', 'CENA', 'C', 2);
  --TEAM_PACKAGE.DELETE_TEAM(2);
  --TEAM_PACKAGE.CREATE_SPONSOR('MEDIA SZROTEX', 150000);
  --TEAM_PACKAGE.PRINT_SPONSORS_FROM_TEAM(4);
  --TEAM_PACKAGE.add_sponsor_to_the_team(1, 5);
  --TEAM_PACKAGE.PRINT_SPONSORS_FROM_TEAM(4);
end;

SELECT MATCH_ID, TO_CHAR(MATCH_DATE, 'DD-MM-YY HH:MM:SS') FROM MATCH;


DELETE FROM Player;

DELETE FROM Match;
DELETE FROM TEAM;
DELETE FROM SPORTOBJECT;
DELETE FROM SPONSOR;

CREATE SEQUENCE MATCH_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE MATCH_ID_SEQ;

CREATE SEQUENCE PLAYER_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE PLAYER_ID_SEQ;

CREATE SEQUENCE TEAM_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE TEAM_ID_SEQ;

CREATE SEQUENCE SPONSOR_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE SPONSOR_ID_SEQ;

CREATE SEQUENCE SPORT_OBJECT_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE SPORT_OBJECT_ID_SEQ;

CREATE SEQUENCE SECTOR_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE SECTOR_ID_SEQ;

CREATE SEQUENCE STATS_ID_SEQ INCREMENT BY 1 START WITH 0 NOCACHE MINVALUE 0;
DROP SEQUENCE STATS_ID_SEQ;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS';  
    
    
SELECT MATCH_ID, MATCH_DATE, DEREF(M.SPORT_OBJECT_ID).OBJECT_NAME, DEREF(M.TEAM_HOME_ID).NAME, DEREF(M.TEAM_AWAY_ID).NAME, SCORE_HOME, SCORE_AWAY FROM MATCH M;

SELECT t.players FROM Team t where t.team_id = 1;

UPDATE PLAYER p
SET p.last_name = 'Bajcikowski'
WHERE p.player_id = 223;

