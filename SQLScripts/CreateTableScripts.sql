CREATE OR REPLACE TYPE TeamType AS OBJECT (
  team_id NUMBER,
  name VARCHAR2(50),
  wins NUMBER,
  loses NUMBER,
  
  players PlayerListType,
  sponsors SponsorListType
);

CREATE OR REPLACE TYPE PlayerType AS OBJECT (
  player_id NUMBER,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  birthdate DATE,
  position VARCHAR2(50),
  team_id REF TeamType
);

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

CREATE OR REPLACE TYPE MatchType AS OBJECT (
  match_id NUMBER,
  match_date DATE,
  sport_object_id REF SportObjectType,
  team_home_id REF TeamType,
  team_away_id REF TeamType,
  score_home NUMBER,
  score_away NUMBER
);

CREATE OR REPLACE TYPE FanType AS OBJECT (
  fan_id NUMBER,
  fan_name VARCHAR2(50),
  email VARCHAR2(100)
);

CREATE OR REPLACE TYPE TicketType AS OBJECT (
  ticket_id NUMBER,
  match_id REF MatchType,
  fan_id REF FanType,
  sport_object_id REF SportObjectType,
  seat NUMBER,
  sector VARCHAR2(5),
  purchase_date DATE
);

CREATE OR REPLACE TYPE SponsorType AS OBJECT (
  sponsor_id NUMBER,
  sponsor_name VARCHAR2(50),
  team_id REF TeamType,
  sponsorship_amount NUMBER
);

CREATE OR REPLACE TYPE SportObjectType AS OBJECT (
  object_id NUMBER,
  object_name VARCHAR2(50),
  owner_team_id REF TeamType,
  city VARCHAR(50),
  country VARCHAR(50),
  seating_capacity NUMBER,
  sectors SectorListType
);
CREATE TYPE sectorType AS OBJECT (
    sector_id NUMBER,
    sport_object_id REF SportObjectType,
    sector_name VARCHAR2(50),
    seat_count NUMBER,
    sector_type VARCHAR2(50),
    price_per_seat NUMBER
);

CREATE OR REPLACE TYPE PlayerListType AS TABLE OF PlayerType;
CREATE OR REPLACE TYPE SponsorListType AS TABLE OF SponsorType;
CREATE TYPE SectorListType AS TABLE OF SectorType;

CREATE TABLE Team OF TeamType
( 
team_id PRIMARY KEY 
)
NESTED TABLE sponsors STORE AS sponsors_nt
NESTED TABLE players STORE AS players_nt;

CREATE TABLE Player OF PlayerType (
  player_id PRIMARY KEY
);

CREATE TABLE Match OF MatchType (
  match_id PRIMARY KEY
);

CREATE TABLE Fan OF FanType (
  fan_id PRIMARY KEY
);

CREATE TABLE Ticket OF TicketType (
  ticket_id PRIMARY KEY
);

CREATE TABLE Sponsor OF SponsorType (
  sponsor_id PRIMARY KEY
);

CREATE TABLE Sector OF SectorType (
    sector_id PRIMARY KEY
);

CREATE TABLE SportObject OF SportObjectType (
  object_id PRIMARY KEY
)NESTED TABLE sectors STORE AS sectors_nt;

CREATE TABLE PlayerStats OF PlayerStatsType(
    stats_id PRIMARY KEY
);

DROP TABLE PlayerStats;
DROP TABLE SportObject;
DROP TABLE sector;
DROP TABLE Sponsor;
DROP TABLE Ticket;
DROP TABLE Match;
DROP TABLE Fan;
DROP TABLE League;
DROP TABLE Team;
DROP TABLE Player;

DROP TYPE SponsorListType FORCE;
DROP TYPE PlayerListType FORCE;
DROP TYPE SectorListType FORCE;

DROP TYPE TeamType FORCE; 
DROP TYPE FanType FORCE;
DROP TYPE PlayerStatsType FORCE;
DROP TYPE MatchType FORCE;
DROP TYPE PlayerType FORCE;
DROP TYPE SponsorType FORCE;
DROP TYPE TicketType FORCE;
DROP TYPE SportObjectType FORCE;
DROP TYPE SectorType FORCE;

      