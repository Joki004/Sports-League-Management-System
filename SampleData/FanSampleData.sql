CREATE SEQUENCE fan_id_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOCYCLE;

INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES( fan_id_seq.NEXTVAL, 
    'ADAM BIJACIK',
    'bijacik.adam@gmail.com'
    );
INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES(2, 
    'JORAM MUMB MULAJ KAMBAJ',
    'joram.mumb@gmail.com'
    );

-- Inserting more fans
INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES( fan_id_seq.NEXTVAL, 
    'SARA ANDERSON',
    'sara.anderson@gmail.com'
    );

INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES( fan_id_seq.NEXTVAL, 
    'MIKE JOHNSON',
    'mike.johnson@gmail.com'
    );

INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES( fan_id_seq.NEXTVAL, 
    'EMMA SMITH',
    'emma.smith@gmail.com'
    );


-- Inserting 20 fans using the sequence for FAN_ID
INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
SELECT
  fan_id_seq.NEXTVAL,
  FIRST_NAME || ' ' || LAST_NAME AS FAN_NAME,
  EMAIL
FROM (
  SELECT 'JOHN' AS FIRST_NAME, 'DOE' AS LAST_NAME, 'john.doe@gmail.com' AS EMAIL FROM DUAL
  UNION ALL
  SELECT 'ALICE', 'SMITH', 'alice.smith@gmail.com' FROM DUAL
  UNION ALL
  SELECT 'ROBERT', 'JONES', 'robert.jones@gmail.com' FROM DUAL
  UNION ALL
  SELECT 'OLIVIA', 'ROBINSON', 'olivia.robinson@gmail.com' FROM DUAL
);
