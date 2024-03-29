CREATE OR REPLACE TRIGGER PLAYER_AGE_CHECK 
BEFORE INSERT ON PLAYER 
FOR EACH ROW
DECLARE
  v_min_age NUMBER := 18;
BEGIN
  IF MONTHS_BETWEEN(SYSDATE, :NEW.BIRTHDATE) < v_min_age * 12 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Player must be at least 18 years old!');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER SPONSORSHIP_AMOUNT_CHECK 
BEFORE INSERT ON SPONSOR 
FOR EACH ROW
DECLARE
BEGIN
  IF :NEW.SPONSORSHIP_AMOUNT <= 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Sponsorship must be bigger than 0!');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER TEAM_NAME_CHECK 
BEFORE INSERT ON TEAM 
FOR EACH ROW
DECLARE
BEGIN
  IF :NEW.NAME = '' THEN
    RAISE_APPLICATION_ERROR(-20003, 'Team name can not be empty!');
  END IF;
END;
/