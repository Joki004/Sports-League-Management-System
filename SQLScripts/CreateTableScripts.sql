
CREATE OR REPLACE TYPE TeamType AS OBJECT (
  team_id NUMBER,
  name VARCHAR2(50),
  wins NUMBER,
  loses NUMBER,
  win_percentage NUMBER,
  points_conceded NUMBER,
  points_scored NUMBER,
  players PlayerListType,
  sponsors SponsorListType
);
/
CREATE OR REPLACE TYPE PlayerType AS OBJECT (
  player_id NUMBER,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  birthdate DATE,
  position VARCHAR2(50),
  team_id REF TeamType
);
/
CREATE OR REPLACE TYPE PlayerStatsType AS OBJECT (
    stats_id NUMBER,
    player_id REF PlayerType,
    match_id REF MatchType,
    minutes_played NUMBER,
    two_points_goals NUMBER,
    assists NUMBER,
    blocks NUMBER,
    rebounds NUMBER,
    three_points_goal NUMBER
);
/
CREATE OR REPLACE TYPE MatchType AS OBJECT (
  match_id NUMBER,
  match_date DATE,
  sport_object_id REF SportObjectType,
  team_home_id REF TeamType,
  team_away_id REF TeamType,
  score_home NUMBER,
  score_away NUMBER
);
/
CREATE OR REPLACE TYPE SponsorType AS OBJECT (
  sponsor_id NUMBER,
  sponsor_name VARCHAR2(50),
  team_id REF TeamType,
  sponsorship_amount NUMBER
);
/
CREATE OR REPLACE TYPE SportObjectType AS OBJECT (
  object_id NUMBER,
  object_name VARCHAR2(50),
  owner_team_id REF TeamType
);
/
CREATE OR REPLACE TYPE PlayerListType AS TABLE OF REF PlayerType;
/
CREATE OR REPLACE TYPE SponsorListType AS TABLE OF REF SponsorType;
/
CREATE TABLE Team OF TeamType
( 
    team_id PRIMARY KEY 
)
NESTED TABLE sponsors STORE AS sponsors_nt
NESTED TABLE players STORE AS players_nt;
/
CREATE TABLE Player OF PlayerType (
    player_id PRIMARY KEY
);
/
CREATE TABLE Match OF MatchType (
    match_id PRIMARY KEY
);
/
CREATE TABLE Sponsor OF SponsorType (
    sponsor_id PRIMARY KEY
);
/
CREATE TABLE SportObject OF SportObjectType (
    object_id PRIMARY KEY
);
/
CREATE TABLE PlayerStats OF PlayerStatsType(
    stats_id PRIMARY KEY
);
/
DROP TABLE PlayerStats;
DROP TABLE SportObject;
DROP TABLE Sponsor;
DROP TABLE Match;
DROP TABLE League;
DROP TABLE Team;
DROP TABLE Player;

DROP TYPE SponsorListType FORCE;
DROP TYPE PlayerListType FORCE;
DROP TYPE TeamType FORCE; 
DROP TYPE PlayerStatsType FORCE;
DROP TYPE MatchType FORCE;
DROP TYPE PlayerType FORCE;
DROP TYPE SponsorType FORCE;
DROP TYPE SportObjectType FORCE;

