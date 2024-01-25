--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
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
        SELECT COUNT(*) INTO MATCH_COUNT FROM MATCH t
        WHERE t.MATCH_DATE = date_match;
        
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
        SELECT (MAX(p.MATCH_DATE)) INTO last_match_date
        FROM MATCH p
        WHERE p.team_home_id = (SELECT REF(t) FROM Team t WHERE t.NAME = team_name)
           OR p.team_away_id = (SELECT REF(t) FROM Team t WHERE t.NAME = team_name);
        
        IF last_match_date IS NULL THEN
            RETURN TRUE;
        ELSE
            time_difference := (match_date - last_match_date) * 24;
            RETURN time_difference > 24;
        END IF;
    END CHECK_IF_READY_FOR_NEXT_MATCH;

    PROCEDURE GENERATE_SCHEDULE(
        start_season_date DATE
    )
    AS
        v_team_home_name VARCHAR2(50);
        v_team_away_name VARCHAR2(50);
        v_match_date DATE;
        SCHEDULE SYS_REFCURSOR;
        v_team_home REF TeamType;
        v_team_away REF TeamType;
        v_object_sport REF SportObjectType;

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
            
            
            v_match_date := FIND_DATA_FOR_MATCH(v_team_home_name, v_team_away_name, start_season_date);
            ADD_MATCH(v_team_home, v_team_away, v_match_date, v_object_sport);
        END LOOP;
        CLOSE SCHEDULE;
    END GENERATE_SCHEDULE;

    FUNCTION FIND_DATA_FOR_MATCH(
        team_away_name VARCHAR2,
        team_home_name VARCHAR2,
        start_season_date DATE
    )RETURN DATE
    AS
        found_date BOOLEAN := false;
        v_hour NUMBER;
        start_date DATE := start_season_date;
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
    
    PROCEDURE PRINT_SCHEDULE
    AS
        SCHEDULE SYS_REFCURSOR;
        team_home_name VARCHAR2(50);
        team_away_name VARCHAR2(50);
        sport_object_name VARCHAR2(50);
        v_match_date DATE;
        v_score_away NUMBER;
        v_score_home NUMBER;
    BEGIN
        OPEN SCHEDULE FOR
            SELECT 
                m.match_date,
                DEREF(m.team_home_id).name,
                DEREF(m.team_away_id).name,
                DEREF(m.sport_object_id).object_name,
                score_home,
                score_away
            FROM match m; 

        LOOP
            FETCH SCHEDULE INTO v_match_date, team_home_name, team_away_name, sport_object_name, v_score_away, v_score_home;
            EXIT WHEN SCHEDULE%NOTFOUND;
            
            IF v_score_home = 0 AND v_score_away = 0 THEN
                DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_match_date, 'DD-MM-YYYY HH24:MI:SS') || ' | ' || team_home_name || ' vs ' || team_away_name || ' | ' || sport_object_name || ' | MATCH NOT PLAYED YET');
            ELSE
                DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_match_date, 'DD-MM-YYYY HH24:MI:SS') || ' | ' || team_home_name || ' vs ' || team_away_name || ' | ' || v_score_home || ' : ' || v_score_away);
            END IF;
            
        END LOOP;
        CLOSE SCHEDULE;
    END PRINT_SCHEDULE;
    
    PROCEDURE PRINT_MATCHES_FOR_TEAM(
        v_team_id NUMBER
    )AS
        SCHEDULE SYS_REFCURSOR;
        team_home_name VARCHAR2(50);
        team_away_name VARCHAR2(50);
        sport_object_name VARCHAR2(50);
        v_match_date DATE;
        v_team_ref REF TeamType;
        v_score_away NUMBER;
        v_score_home NUMBER;
    BEGIN
        SELECT REF(t) INTO v_team_ref FROM Team t where t.team_id = v_team_id;
        
        OPEN SCHEDULE FOR
            SELECT 
                m.match_date,
                DEREF(m.team_home_id).name,
                DEREF(m.team_away_id).name,
                DEREF(m.sport_object_id).object_name,
                score_home, 
                score_away
            FROM match m
            where m.team_home_id = v_team_ref
            OR m.team_away_id = v_team_ref; 

        LOOP
            FETCH SCHEDULE INTO v_match_date, team_home_name, team_away_name, sport_object_name, v_score_away, v_score_home;
            EXIT WHEN SCHEDULE%NOTFOUND;
            
            IF v_score_home = 0 AND v_score_away = 0 THEN
                DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_match_date, 'DD-MM-YYYY HH24:MI:SS') || ' | ' || team_home_name || ' vs ' || team_away_name || ' | ' || sport_object_name || ' | MATCH NOT PLAYED YET');
            ELSE
                DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_match_date, 'DD-MM-YYYY HH24:MI:SS') || ' | ' || team_home_name || ' vs ' || team_away_name || ' | ' || v_score_home || ' : ' || v_score_away);
            END IF;
                        
        END LOOP;
        CLOSE SCHEDULE;
    END PRINT_MATCHES_FOR_TEAM;
END SCHEDULE_PACKAGE;

/
