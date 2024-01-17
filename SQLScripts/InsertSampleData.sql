
--FAN

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

select * from TEAM;
SELECT team_id FROM Team t WHERE t.NAME = 'BOSTON CELTICS';
select * from sector;
select * from Player;
select * from sportObject;
SELECT sectors FROM SPORTOBJECT WHERE OBJECT_ID = 1
(SELECT REF(t) FROM sportObject t WHERE t.object_name = 'TD Garden');

SELECT so.OBJECT_ID, so.OBJECT_NAME, s.sector_id, s.sector_name, s.seat_count
FROM SPORTOBJECT so
CROSS JOIN TABLE(so.sectors) s;

SELECT so.object_id,so.object_name,DEREF(so.owner_team_ID).NAME,city,country,seating_capacity,s.sector_id, s.sector_name, s.seat_count,s.sector_type,s.price_per_seat
FROM SPORTOBJECT so
CROSS JOIN TABLE(so.sectors) s;





--DODAÆ DANE DO ZAWODNIKÓW - S¥ 3 DRUZYNY Z 15, DODAJ PO 8 LOSOWYCH ZAWODNIKÓW Z RESZTY
--DODAJ PARE SPONSORÓW
--DODAÆ SEKTORY I MIEJSCA DO OBIEKTÓW -> KAZDY OBIEKT MA X SEKTORÓW i Y MIEJSC, KA¯DY SEKTOR MA TYLE SAMO MIEJSC
--JAK DODASZ SEKTORY I MIEJSCA TO PRZERÓBB DODAWANIE OBIEKTÓW SPORTOWYCH - SKRYPT

--PRZY ROBIENIU FUNKCJI - PISZMY OD RAZU BLOK PL/SQL KTÓRY TESTUJE TA FUNKCJE ITD.

--Funkcja generujaca harmonogram
--Funkcja Dodaj zawodnika -> weryfikacja czy +18
--Funkcja Sprawdza czy zawodnik nie jest w jakimœ innym teamie
--Transfer z klubu a do klubu b
--Zakoñcz mecz -> zmiana wyników w tabeli Match
--Zakup bilet - przypisujemy do fana, trzeba sprawdzic czy mecz sie juz nie zakonczyl, czy mecz istnieje oraz czy sa jakies wolne bilety?
--Przy transferze sprawdzamy czy druzyna nie ma maxa zawodnikow - 15
--Dodaj druzyne -> Sprawdzamy czy jest mniej niz 15 druzyn
--Usun dru¿yne
--RANKING -> 1 MIEJSCE - NAJLEPSZY WSPOLCZYNNIK ZWYCIEST/PORAZEK - POTEM WSPOLCZYNNIK ZDOBYTE/STRACONE PKT
--FUNKCJa wyswietlajaca ranking
--DODAJ SPONSORA
--DODAJ STATYSTYKI DLA GRACZA W MECZU -> weryfikacja czy dany zawodnik gral w danym meczu
--Dodaj mecz
--Usun mecz
--Koniec kontraktu u zawodnika - usuwamy mu druzyne
--Dodaj fana

--MO¯E:
--FUNKCJA KTÓRA POBIERA WSZYSTKIE MECZE DLA DANEJ DRU¯YNY
--FUNKCJA KTÓRA ZWRACA DANE O MECZU POMIEDZY DRUZYNAMI X/Y
--FUNKCJA KTÓRA ZWRACA WSZYSTKIE MECZE Z DANEJ DATY
--STATYSTYKI -> SUMA ZAGRANYCH MINUT WSZYSTKICH ZAWODNIKÓW Z DANEJ DRUZYNY MUSI BYC ROWNA 300 MINUT (5x 1H)
--

