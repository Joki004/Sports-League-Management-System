--------------------------------------------------------
--  File created - œroda-stycznia-17-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body SCHEDULE_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SCOTT"."SCHEDULE_PACKAGE" AS

    FUNCTION CHECK_IF_DATA_IS_OCCUPIED(
        date_match DATE
    ) RETURN BOOLEAN
    AS
        match_count NUMBER;
        rng_date DATE;
    BEGIN
        SELECT COUNT(*) INTO match_count 
        FROM MATCH t WHERE t.MATCH_DATE = date_match;
        
    
        IF match_count = 0 THEN
            RETURN FALSE;
        ELSIF match_count >= 2 THEN
            RETURN TRUE;
        ELSE
            RETURN TRUE;
        END IF;
    END CHECK_IF_DATA_IS_OCCUPIED;

    PROCEDURE ADD_MATCH(
        team_home REF TeamType,
        team_away REF TeamType,
        match_date DATE,
        sport_object REF SportObjectType)
    AS
    BEGIN
        INSERT INTO MATCH(MATCH_ID, MATCH_DATE, SPORT_OBJECT_ID, TEAM_HOME_ID, TEAM_AWAY_ID, SCORE_HOME, SCORE_AWAY)
        VALUES(MATCH_ID_SEQ.NEXTVAL, match_date, sport_object, team_home, team_away, 0, 0);
    END ADD_MATCH;

    FUNCTION CHECK_IF_READY_FOR_NEXT_MATCH(
        team_name VARCHAR2,
        match_date DATE
    ) RETURN BOOLEAN
    AS
        last_match_date DATE;
        time_difference NUMBER;
    BEGIN
        SELECT MAX(MATCH_DATE) INTO last_match_date FROM MATCH t
        WHERE t.team_home_id = (SELECT REF(t) FROM Team t WHERE t.NAME = team_name)
        OR t.team_away_id = (SELECT REF(t) FROM Team t WHERE t.NAME = team_name);
        IF last_match_date IS NULL THEN
            RETURN TRUE;
        ELSE
            time_difference := (match_date - last_match_date) * 24;
            RETURN time_difference > 24;
        END IF;
    END CHECK_IF_READY_FOR_NEXT_MATCH;

    PROCEDURE GENERATE_SCHEDULE
    AS
        v_team_home_name VARCHAR2(50);
        v_team_away_name VARCHAR2(50);
        v_match_date DATE := TO_DATE('24-10-2023 12:00:00', 'DD-MM-YYYY HH24:MI:SS');
        v_match_count NUMBER := 0;
        v_matches_per_day NUMBER := 10;
        v_match_hours_per_day NUMBER := 10;
        SCHEDULE SYS_REFCURSOR;
        v_team_home REF TeamType;
        v_team_away REF TeamType;
        v_object_sport REF SportObjectType;
        is_ready BOOLEAN;
        is_occupied BOOLEAN;
        v_next_date DATE;

    BEGIN
        OPEN SCHEDULE FOR
        SELECT A.name AS team_a_name, B.name AS team_b_name
        FROM TEAM A
        CROSS JOIN TEAM B
        WHERE A.name != B.name
        ORDER BY DBMS_RANDOM.RANDOM;

        LOOP
            FETCH SCHEDULE INTO v_team_home_name, v_team_away_name;
            EXIT WHEN SCHEDULE%NOTFOUND;
        
            SELECT REF(t) INTO v_team_home FROM Team t WHERE t.NAME = v_team_home_name;
            SELECT REF(t) INTO v_team_away FROM Team t WHERE t.NAME = v_team_away_name;
            SELECT REF(t) INTO v_object_sport FROM SportObject t WHERE t.OWNER_TEAM_ID = v_team_home;
            
            
            v_match_date := FIND_DATA_FOR_MATCH(v_team_home_name, v_team_away_name);
            DBMS_OUTPUT.PUT_LINE('ZWROCILO DATE: ' || TO_CHAR(v_match_date, 'DD-MM-YYYY HH24:MI:SS'));
            ADD_MATCH(v_team_home, v_team_away, v_match_date, v_object_sport);
        END LOOP;
        CLOSE SCHEDULE;
    END GENERATE_SCHEDULE;

    FUNCTION FIND_DATA_FOR_MATCH(
        team_away_name VARCHAR2,
        team_home_name VARCHAR2
    )RETURN DATE
    AS
        found_date BOOLEAN := false;
        v_hour NUMBER;
        start_date DATE := TO_DATE('24-10-2023 12:00:00', 'DD-MM-YYYY HH24:MI:SS');
    BEGIN
        WHILE TRUE LOOP
            EXIT WHEN found_date = TRUE;
            IF CHECK_IF_DATA_IS_OCCUPIED(start_date) = FALSE THEN
                IF CHECK_IF_READY_FOR_NEXT_MATCH(team_home_name, start_date) = TRUE THEN
                    IF CHECK_IF_READY_FOR_NEXT_MATCH(team_away_name, start_date) = TRUE THEN
                        found_date := true;
                        RETURN start_date;
                    END IF;
                END IF;
            END IF;
            start_date := start_date + INTERVAL '1' HOUR;
            v_hour := TO_NUMBER(TO_CHAR(start_date, 'HH24'));
            IF v_hour = 23 THEN
                start_date := TRUNC(start_date) + INTERVAL '1' DAY + INTERVAL '12' HOUR;
            END IF;
        END LOOP;
    END FIND_DATA_FOR_MATCH;

END SCHEDULE_PACKAGE;

/
