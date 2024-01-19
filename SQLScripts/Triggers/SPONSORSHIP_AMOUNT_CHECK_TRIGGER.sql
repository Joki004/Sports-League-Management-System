--------------------------------------------------------
--  File created - czwartek-stycznia-18-2024   
--------------------------------------------------------
create or replace TRIGGER SPONSORSHIP_AMOUNT_CHECK
BEFORE INSERT ON SPONSOR
FOR EACH ROW
DECLARE
BEGIN
  IF :NEW.SPONSORSHIP_AMOUNT <= 0 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Sponsor can not give nothing to the team!');
  END IF;
END;