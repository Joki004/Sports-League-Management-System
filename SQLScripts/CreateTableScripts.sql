-- CreateTableScripts.sql

-- Team table
CREATE TABLE Team (
  team_id NUMBER PRIMARY KEY,
  team_name VARCHAR2(50) NOT NULL,
  team_city VARCHAR2(50),
  team_captain VARCHAR2(50),
  founding_year NUMBER,
  sponsor_id NUMBER,
  CONSTRAINT fk_team_sponsor FOREIGN KEY (sponsor_id) REFERENCES Sponsor(sponsor_id)
);

-- Player table
CREATE TABLE Player (
  player_id NUMBER PRIMARY KEY,
  player_name VARCHAR2(50) NOT NULL,
  birthdate DATE,
  position VARCHAR2(50),
  team_id NUMBER,
  CONSTRAINT fk_player_team FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

-- Match table
CREATE TABLE Match (
  match_id NUMBER PRIMARY KEY,
  match_date DATE,
  location VARCHAR2(100),
  team_home_id NUMBER,
  team_away_id NUMBER,
  score_home NUMBER,
  score_away NUMBER,
  CONSTRAINT fk_match_team_home FOREIGN KEY (team_home_id) REFERENCES Team(team_id),
  CONSTRAINT fk_match_team_away FOREIGN KEY (team_away_id) REFERENCES Team(team_id)
);

-- League table
CREATE TABLE League (
  league_id NUMBER PRIMARY KEY,
  league_name VARCHAR2(50) NOT NULL,
  season VARCHAR2(20),
  start_date DATE,
  end_date DATE,
  organizing_sponsor_id NUMBER,
  CONSTRAINT fk_league_sponsor FOREIGN KEY (organizing_sponsor_id) REFERENCES Sponsor(sponsor_id)
);

-- Fan table
CREATE TABLE Fan (
  fan_id NUMBER PRIMARY KEY,
  fan_name VARCHAR2(50) NOT NULL,
  email VARCHAR2(100),
  favorite_team_id NUMBER,
  CONSTRAINT fk_fan_team FOREIGN KEY (favorite_team_id) REFERENCES Team(team_id)
);

-- Ticket table
CREATE TABLE Ticket (
  ticket_id NUMBER PRIMARY KEY,
  match_id NUMBER,
  fan_id NUMBER,
  seat_number VARCHAR2(20),
  purchase_date DATE,
  CONSTRAINT fk_ticket_match FOREIGN KEY (match_id) REFERENCES Match(match_id),
  CONSTRAINT fk_ticket_fan FOREIGN KEY (fan_id) REFERENCES Fan(fan_id)
);

-- Sponsor table
CREATE TABLE Sponsor (
  sponsor_id NUMBER PRIMARY KEY,
  sponsor_name VARCHAR2(50) NOT NULL,
  industry VARCHAR2(50),
  sponsorship_amount NUMBER
);
