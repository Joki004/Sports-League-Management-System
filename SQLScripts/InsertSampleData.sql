--SPONSORZY
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (1,
    'MOTOROLA',
    NULL,
    150000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (2,
    'DISNEY',
    NULL,
    360000);   
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (3,
    'PAYPAL',
    NULL,
    230000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (4,
    'TESLA',
    NULL,
    400000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (5,
    'COCA COLA',
    NULL,
    500000);    
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (6,
    'RAKUTEN',
    NULL,
    450000);   
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (7,
    'MOTOROLA',
    NULL,
    100000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (8,
    'CHIME',
    NULL,
    130000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (9,
    'FEASTABLES',
    NULL,
    160000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (10,
    'WEBULL',
    NULL,
    50000);   
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (11,
    'VISTAPRINT',
    NULL,
    250000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (12,
    'NIKE',
    NULL,
    200000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (13,
    'ADDIDAS',
    NULL,
    265000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (14,
    'PUMA',
    NULL,
    300000);
INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT) 
VALUES (15,
    'GOOGLE',
    NULL,
    420000);

--DRU�YNY

INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(1,
    'BOSTON CELTICS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(2,
    'MILWAUKEE BUCKS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(3,
    'PHILADELPHIA 76ERS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(4,
    'CLEVELAND CAVALIERS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(5,
    'MIAMI HEAT',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(6,
    'NEW YORK KNICKS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(7,
    'INDIANA PACERS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(8,
    'ORLANDO MAGIC',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(9,
    'CHICAGO BULLS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(10,
    'BROOKLYN NETS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(11,
    'ATLANTA HAWKS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(12,
    'TORONTO RAPTORS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(13,
    'CHARLOTTE HORNETS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(14,
    'WASHINGTON WIZARDS',
    NULL,
    NULL);
INSERT INTO TEAM(TEAM_ID, NAME, PLAYERS, SPONSORS)
VALUES(15,
    'DETROIT PISTONS',
    NULL,
    NULL);

--ZAWODNICY

--CELTICS
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(1,
    'DALANO',
    'BANTON',
    TO_DATE('11-07-1999', 'MM-DD-YYYY'),
    'PG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(2,
    'OSHAE',
    'BRISSETT',
    TO_DATE('06/20/1998', 'MM/DD/YYYY'),
    'SF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(3,
    'JAYLEN',
    'BROWN',
    TO_DATE('10/24/1996', 'MM/DD/YYYY'),
    'SF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(4,
    'JD',
    'DAVISON',
    TO_DATE('10/03/2002', 'MM/DD/YYYY'),
    'PG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(5,
    'WENYEN',
    'GABRIEL',
    TO_DATE('03/26/1997', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(6,
    'SAM',
    'HAUSER',
    TO_DATE('12/08/1997', 'MM/DD/YYYY'),
    'SF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(7,
    'JRUE',
    'HOLIDAY',
    TO_DATE('06/12/1990', 'MM/DD/YYYY'),
    'PG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(8,
    'AL',
    'HORFORD',
    TO_DATE('06/03/1986', 'MM/DD/YYYY'),
    'C',
    NULL);

--Bucks
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(9,
    'GIANNIS',
    'ANTETOKOUNMPO',
    TO_DATE('12/06/1994', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(10,
    'THANASIS',
    'ANTETOKOUNMPO',
    TO_DATE('07/18/1992', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(11,
    'MALIK',
    'BEASLEY',
    TO_DATE('11/26/1996', 'MM/DD/YYYY'),
    'SG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(12,
    'MARJON',
    'BEAUCHAMP',
    TO_DATE('10/12/2000', 'MM/DD/YYYY'),
    'SG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(13,
    'PAT',
    'CONNAUGHTON',
    TO_DATE('01/06/1993', 'MM/DD/YYYY'),
    'SG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(14,
    'JAE',
    'CROWDER',
    TO_DATE('07/06/1990', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(15,
    'AJ',
    'GREEN',
    TO_DATE('09/27/1999', 'MM/DD/YYYY'),
    'SG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(16,
    'BROOK',
    'LOPEZ',
    TO_DATE('11/13/2001', 'MM/DD/YYYY'),
    'C',
    NULL);

--76ERS
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(17,
    'MO',
    'BAMBA',
    TO_DATE('05/12/1998', 'MM/DD/YYYY'),
    'C',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(18,
    'NICOLAS',
    'BATUM',
    TO_DATE('12/14/1988', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(19,
    'PATRICK',
    'BEVERLEY',
    TO_DATE('07/12/1998', 'MM/DD/YYYY'),
    'PG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(20,
    'JOEL',
    'EMBIID',
    TO_DATE('03/16/1994', 'MM/DD/YYYY'),
    'C',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(21,
    'ROBERT',
    'CONVINGTON',
    TO_DATE('12/14/1990', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(22,
    'TOBIAS',
    'HARRIS',
    TO_DATE('07/15/1992', 'MM/DD/YYYY'),
    'PF',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(23,
    'FURKAN',
    'KORKMAZ',
    TO_DATE('07/24/1997', 'MM/DD/YYYY'),
    'SG',
    NULL);
INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
VALUES(24,
    'MARCUS',
    'MORRIS',
    TO_DATE('09/02/1989', 'MM/DD/YYYY'),
    'PF',
    NULL);
    
--OBIEKTY SPORTOWE

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

--FAN
INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES(1, 
    'ADAM BIJACIK',
    'bijacik.adam@gmail.com'
    );
INSERT INTO FAN(FAN_ID, FAN_NAME, EMAIL)
VALUES(2, 
    'JORAM MUMB MULAJ KAMBAJ',
    'joram.mumb@gmail.com'
    );

--MECZE
INSERT INTO MATCH(MATCH_ID, MATCH_DATE, SPORT_OBJECT_ID, TEAM_HOME_ID, TEAM_AWAY_ID, SCORE_HOME, SCORE_AWAY)
VALUES(1,
    TO_DATE('03-01-2024', 'DD-MM-YYYY')
    (SELECT REF(t) FROM SPORTOBJECT t WHERE t.team_id = 1));
    );

INSERT INTO TEAM (TEAM_ID, NAME, PLAYERS, SPONSORS) 
VALUES (1,
    'Lakers',
    PlayerListType(
        PlayerType(1, 'Michael', 'Jordan', NULL, NULL, NULL),
        PlayerType(2, 'Barack', 'Obama', NULL, NULL, NULL)),
    SponsorListType(
        SponsorType(1, 'COCA COLA', NULL, NULL),
        SponsorType(2, 'PEPSI', NULL, NULL))
        );


SELECT sname. p.sponsor_name
FROM TEAM s,
TABLE(s.sponsors) p;

--DODA� DANE DO ZAWODNIK�W - S� 3 DRUZYNY Z 15, DODAJ PO 8 LOSOWYCH ZAWODNIK�W Z RESZTY
--DODAJ PARE SPONSOR�W
--DODA� SEKTORY I MIEJSCA DO OBIEKT�W -> KAZDY OBIEKT MA X SEKTOR�W i Y MIEJSC, KA�DY SEKTOR MA TYLE SAMO MIEJSC
--JAK DODASZ SEKTORY I MIEJSCA TO PRZER�BB DODAWANIE OBIEKT�W SPORTOWYCH - SKRYPT

--Funkcja generujaca harmonogram
--Funkcja Dodaj zawodnika -> weryfikacja czy +18
--Funkcja Sprawdza czy zawodnik nie jest w jakim� innym teamie
--Transfer z klubu a do klubu b
--Zako�cz mecz -> zmiana wynik�w w tabeli Match
--Zakup bilet - przypisujemy do fana, trzeba sprawdzic czy mecz sie juz nie zakonczyl, czy mecz istnieje oraz czy sa jakies wolne bilety?
--Przy transferze sprawdzamy czy druzyna nie ma maxa zawodnikow - 15
--Dodaj druzyne -> Sprawdzamy czy jest mniej niz 15 druzyn
--Usun dru�yne
--RANKING -> 1 MIEJSCE - NAJLEPSZY WSPOLCZYNNIK ZWYCIEST/PORAZEK - POTEM WSPOLCZYNNIK ZDOBYTE/STRACONE PKT
--FUNKCJa wyswietlajaca ranking
--DODAJ SPONSORA
--DODAJ STATYSTYKI DLA GRACZA W MECZU -> weryfikacja czy dany zawodnik gral w danym meczu
--Dodaj mecz
--Usun mecz
--Koniec kontraktu u zawodnika - usuwamy mu druzyne
--Dodaj fana

--MO�E:
--FUNKCJA KT�RA POBIERA WSZYSTKIE MECZE DLA DANEJ DRU�YNY
--FUNKCJA KT�RA ZWRACA DANE O MECZU POMIEDZY DRUZYNAMI X/Y
--FUNKCJA KT�RA ZWRACA WSZYSTKIE MECZE Z DANEJ DATY
--STATYSTYKI -> SUMA ZAGRANYCH MINUT WSZYSTKICH ZAWODNIK�W Z DANEJ DRUZYNY MUSI BYC ROWNA 300 MINUT (5x 1H)
--

