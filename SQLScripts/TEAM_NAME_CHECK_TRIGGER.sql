--------------------------------------------------------
--  File created - czwartek-stycznia-18-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TEAM_NAME_CHECK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SCOTT"."TEAM_NAME_CHECK" 
BEFORE INSERT ON PLAYER
FOR EACH ROW
DECLARE
  player_birthdate DATE;
  player_min_age NUMBER := 18;
BEGIN
  player_birthdate := :NEW.BIRTHDATE;

  IF MONTHS_BETWEEN(SYSDATE, player_birthdate) < player_min_age * 12 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Player must have a legal age');
  END IF;
END;
/
ALTER TRIGGER "SCOTT"."TEAM_NAME_CHECK" ENABLE;
