--Sample example
--INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCETANGE, PLAYERS, SPONSORS)
----VALUES(26, 'DALLAS MAVERICKS', PlayerListType(), SponsorListType());
CREATE SEQUENCE team_id_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;
  
--re use ids
ALTER SEQUENCE team_id_seq INCREMENT BY -1;
SELECT team_id_seq.NEXTVAL FROM dual;
ALTER SEQUENCE team_id_seq INCREMENT BY 1;

-- Eastern Conference
-- Atlantic Division
-- Boston Celtics
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'BOSTON CELTICS', 32, 9,0,0,0,NULL,NULL);

-- Brooklyn Nets
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'BROOKLYN NETS', 16, 24,0,0,0,NULL,NULL);

-- New York Knicks
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'NEW YORK KNICKS', 24, 17,NULL,NULL,NULL,NULL,NULL);

-- Philadelphia 76ers
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'PHILADELPHIA 76ERS', 0, 0,0,0,0,NULL,NULL);

-- Toronto Raptors
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'TORONTO RAPTORS', 0, 0,0,0,0,NULL,NULL);

-- Central Division
-- Chicago Bulls
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'CHICAGO BULLS', 0, 0,0,0,0,NULL,NULL);

-- Cleveland Cavaliers
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'CLEVELAND CAVALIERS', 0, 0,0,0,0,NULL,NULL);

-- Detroit Pistons
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'DETROIT PISTONS', 0, 0,0,0,0,NULL,NULL);

-- Indiana Pacers
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'INDIANA PACERS', 0, 0,0,0,0,NULL,NULL);

-- Milwaukee Bucks
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'MILWAUKEE BUCKS', 0, 0,0,0,0,NULL,NULL);

-- Southeast Division
-- Atlanta Hawks
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'ATLANTA HAWKS', 0, 0,0,0,0,NULL,NULL);

-- Charlotte Hornets
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'CHARLOTTE HORNETS', 0, 0,0,0,0,NULL,NULL);

-- Miami Heat
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'MIAMI HEAT', 0, 0,0,0,0,NULL,NULL);

-- Orlando Magic
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'ORLANDO MAGIC', 0, 0,0,0,0,NULL,NULL);

-- Washington Wizards
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'WASHINGTON WIZARDS', 0, 0,0,0,0,NULL,NULL);

-- Western Conference
-- Northwest Division
-- Denver Nuggets
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'DENVER NUGGETS', 0, 0,0,0,0,NULL,NULL);

-- Minnesota Timberwolves
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'MINNESOTA TIMBERWOLVES', 0, 0,0,0,0,NULL,NULL);

-- Oklahoma City Thunder
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'OKLAHOMA CITY THUNDER', 0, 0,0,0,0,NULL,NULL);

-- Portland Trail Blazers
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'PORTLAND TRAIL BLAZERS', 0, 0,0,0,0,NULL,NULL);

-- Utah Jazz
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'UTAH JAZZ', 0, 0,0,0,0,NULL,NULL);

-- Pacific Division
-- Golden State Warriors
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'GOLDEN STATE WARRIORS', 0, 0,0,0,0,NULL,NULL);

-- LA Clippers
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'LA CLIPPERS', 0, 0,0,0,0,NULL,NULL);

-- Los Angeles Lakers
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'LOS ANGELES LAKERS', 0, 0,0,0,0,NULL,NULL);

-- Phoenix Suns
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'PHOENIX SUNS', 0, 0,0,0,0,NULL,NULL);

-- Sacramento Kings
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'SACRAMENTO KINGS', 0, 0,0,0,0,NULL,NULL);

-- Southwest Division
-- Dallas Mavericks
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'DALLAS MAVERICKS', 0, 0,0,0,0,NULL,NULL);

-- Houston Rockets
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'HOUSTON ROCKETS', 0, 0,0,0,0,NULL,NULL);

-- Memphis Grizzlies
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'MEMPHIS GRIZZLIES', 0, 0,0,0,0,NULL,NULL);

-- New Orleans Pelicans
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'NEW ORLEANS PELICANS', 0, 0,0,0,0,NULL,NULL);

-- San Antonio Spurs
INSERT INTO TEAM(TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
VALUES(team_id_seq.NEXTVAL, 'SAN ANTONIO SPURS', 0, 0,0,0,0,NULL,NULL);

--DELETE EVERYTHING
DELETE FROM TEAM