--Celtics
-- Insert into SPORTOBJECT without sectors
delete from SPORTOBJECT;
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'TD Garden',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'BOSTON CELTICS'),
    'Boston',
    'USA',
    1500
);
---INSERT SINGLE SECTOR IN TABLE SECTOR
--delete from sector;
INSERT INTO Sector VALUES (sectorType(SECTOR_ID_SEQ.NEXTVAL, (SELECT REF(s) FROM SportObject s WHERE s.object_name = 'TD Garden'), 'Main', 1000, 'VIP', 200));

INSERT INTO Sector (sector_id, sport_object_id, sector_name, seat_count,sector_type,price_per_seat)
VALUES (SECTOR_ID_SEQ.NEXTVAL, (SELECT REF(s) FROM SportObject s WHERE s.object_name = 'TD Garden'), 'upper Level', 500,'regular',50);


INSERT INTO Sector (sector_id, sport_object_id, sector_name, seat_count,sector_type,price_per_seat)
VALUES (SECTOR_ID_SEQ.NEXTVAL, (SELECT REF(s) FROM SportObject s WHERE s.object_name = 'TD Garden'), 'Lower Bowl', 800,'Premium',150);

--Initialize sectors

UPDATE SPORTOBJECT SET sectors = SectorListType() WHERE object_name = 'TD Garden';

--insert sector in sector sportObject table
INSERT INTO TABLE (
    SELECT sectors FROM SPORTOBJECT WHERE object_name = 'TD Garden'
)
SELECT SectorType(1, (SELECT REF(t) FROM SportObject t WHERE t.object_name = 'Main'), 'Main', 1000,'VIP',200) FROM DUAL UNION ALL
SELECT SectorType(2, (SELECT REF(t) FROM SportObject t WHERE t.object_name = 'Upper Level'), 'Upper Level', 500,'Regular',50) FROM DUAL UNION ALL
SELECT SectorType(3, (SELECT REF(t) FROM SportObject t WHERE t.object_name = 'Lower Bowl'), 'Lower Bowl', 800,'Premium',150) FROM DUAL;

--Brooklyn Nets
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Barclays Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'BROOKLYN NETS'),
    'Brooklyn',
    'USA',
    1500
);


--New York Knicks
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Madison Square Garden',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'NEW YORK KNICKS'),
    'New York City',
    'USA',
    1500
);

--Philadelphia 76ers
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Wells Fargo Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'PHILADELPHIA 76ERS'),
    'Philadelphia',
    'USA',
    1500
);

--TORONTO RAPTORS
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Scotiabank Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'TORONTO RAPTORS'),
    'Toronto',
    'USA',
    1500
);

--CHICAGO BULLS
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'United Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'CHICAGO BULLS'),
    'Chicago',
    'USA',
    1500
);

--CLEVELAND CAVALIERS
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Rocket Mortgage FieldHouse',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'CLEVELAND CAVALIERS'),
    'Cleveland',
    'USA',
    1500
);

--DETROIT PISTONS

INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Little Caesars Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'DETROIT PISTONS'),
    'Detroit',
    'USA',
    1500
);

--INDIANA PACERS
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Bankers Life Fieldhouse',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'INDIANA PACERS'),
    'Indianapolis',
    'USA',
    1500
);


--MILWAUKEE BUCKS
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Arena: Fiserv Forum',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'MILWAUKEE BUCKS'),
    'Milwaukee',
    'USA',
    1500
);


--Atlanta Hawks
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'State Farm Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'ATLANTA HAWKS'),
    'Atlanta',
    'USA',
    1500
);

--Charlotte Hornets

INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Spectrum Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'CHARLOTTE HORNETS'),
    'Charlotte',
    'USA',
    1500
);


--Miami Heat:


INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'FTX Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'MIAMI HEAT'),
    'Miami',
    'USA',
    1500
);


--ORLANDO MAGIC

INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Amway Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'ORLANDO MAGI'),
    'Orlando',
    'USA',
    1500
);

--WASHINGTON WIZARDS
INSERT INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity)
VALUES (
    SPORT_OBJECT_ID_SEQ.NEXTVAL,
    'Capital One Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'WASHINGTON WIZARDS'),
    'Washington',
    'USA',
    1500
);







---------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------

INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (1,
    'TD Garden',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'BOSTON CELTICS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (2,
    'Fiserv Forum',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'MILWAUKEE BUCKS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (3,
    'Wells Fargo Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'PHILADELPHIA 76ERS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (4,
    'Rocket Mortgage FieldHouse',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'CLEVELAND CAVALIERS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (5,
    'TD Kaseya Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'MIAMI HEAT')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (6,
    'Bankers Life Fieldhouse',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'NEW YORK KNICKS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (7,
    'Madison Square Garden',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'INDIANA PACERS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (8,
    'Amway Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'ORLANDO MAGIC')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (9,
    'United Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'CHICAGO BULLS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (10,
    'Barclays Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'BROOKLYN NETS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (11,
    'State Farm Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'ATLANTA HAWKS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (12,
    'Scotiabank Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'TORONTO RAPTORS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (13,
    'Spectrum Center',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'CHARLOTTE HORNETS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (14,
    'Capital One Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'WASHINGTON WIZARDS')
    );
INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
VALUES (15,
    'Little Caesars Arena',
    (SELECT REF(t) FROM Team t WHERE t.NAME = 'DETROIT PISTONS')
    );
    
    
--for later    
--faster
-- Insert into SPORTOBJECT without sectors
DELETE FROM SPORTOBJECT;
INSERT ALL
    INTO SPORTOBJECT (OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID, city, country, seating_capacity) VALUES (1, 'TD Garden', (SELECT REF(t) FROM Team t WHERE t.NAME = 'BOSTON CELTICS'), 'Boston', 'USA', 1500)
    INTO Sector VALUES (sectorType(1, (SELECT REF(s) FROM SportObject s WHERE s.object_name = 'TD Garden'), 'Main', 1000, 'VIP', 200))
    INTO Sector (sector_id, sport_object_id, sector_name, seat_count, sector_type, price_per_seat) VALUES (2, (SELECT REF(s) FROM SportObject s WHERE s.object_name = 'TD Garden'), 'Upper Level', 500, 'regular', 50)
    INTO Sector (sector_id, sport_object_id, sector_name, seat_count, sector_type, price_per_seat) VALUES (3, (SELECT REF(s) FROM SportObject s WHERE s.object_name = 'TD Garden'), 'Lower Bowl', 800, 'Premium', 150)
SELECT * FROM DUAL;
