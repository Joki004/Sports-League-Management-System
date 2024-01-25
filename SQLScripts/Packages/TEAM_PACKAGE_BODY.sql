--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body TEAM_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SCOTT"."TEAM_PACKAGE" AS

    FUNCTION CHECK_IF_SPONSOR_EXISTS(
        checked_sponsor_id NUMBER
    )RETURN BOOLEAN
    AS
        new_sponsor_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO new_sponsor_exists
        FROM SPONSOR p
        WHERE p.sponsor_id = checked_sponsor_id;
        IF new_sponsor_exists = 0 THEN
            RETURN FALSE;
        END IF;
        RETURN TRUE;
    END CHECK_IF_SPONSOR_EXISTS;

    FUNCTION CHECK_IF_TEAM_EXISTS(
        checked_team_id NUMBER
    )RETURN BOOLEAN
    AS
        new_team_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO new_team_exists
        FROM Team p
        WHERE p.team_id = checked_team_id;
        IF new_team_exists = 0 THEN
            RETURN FALSE;
        END IF;
        RETURN TRUE;
    END CHECK_IF_TEAM_EXISTS;
    
    PROCEDURE ADD_TEAM(
        team_name VARCHAR
    )
    AS
    BEGIN
        INSERT INTO TEAM (TEAM_ID, NAME, WINS, LOSES, WIN_PERCENTAGE, POINTS_CONCEDED, POINTS_SCORED, PLAYERS, SPONSORS)
        VALUES(TEAM_ID_SEQ.NEXTVAL, team_name, 0, 0, 0, 0, 0, PlayerListType(), SponsorListType());
        
        DBMS_OUTPUT.PUT_LINE('Successfully added a new team: ' || team_name);
    END ADD_TEAM;
    
    PROCEDURE DELETE_TEAM(
        delete_team_id NUMBER
    )
    AS
        team_exists BOOLEAN;
        team_name VARCHAR2(50);
    BEGIN
        team_exists := CHECK_IF_TEAM_EXISTS(delete_team_id);
        IF TEAM_EXISTS = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('This team does not exists!');
            RETURN;
        END IF;
        
        SELECT NAME INTO TEAM_NAME FROM TEAM
        WHERE TEAM_ID = delete_team_id;
        
        DELETE FROM TEAM
        WHERE TEAM_ID = delete_team_id;
        
        DBMS_OUTPUT.PUT_LINE('Successfully deleted team: ' || team_name);
    END DELETE_TEAM;
    
    PROCEDURE CREATE_SPONSOR(
        name VARCHAR2,
        amount NUMBER
    )
    AS
    BEGIN
        INSERT INTO SPONSOR(SPONSOR_ID, SPONSOR_NAME, TEAM_ID, SPONSORSHIP_AMOUNT)
        VALUES(SPONSOR_ID_SEQ.NEXTVAL, name, NULL, amount);
        DBMS_OUTPUT.PUT_LINE('Successfully added new sponsor: ' || name || ' with the sponsorship amount: ' || amount);
    END CREATE_SPONSOR;
    
    PROCEDURE ADD_SPONSOR_TO_THE_TEAM(
        id_sponsor NUMBER,
        id_team NUMBER
    )
    AS
        new_sponsor REF SponsorType;
        sponsored_team REF TeamType;
        sponsor_list SponsorListType;
        name_sponsor VARCHAR2(50);
        name_team VARCHAR2(50);
    BEGIN
        IF CHECK_IF_TEAM_EXISTS(id_team) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Team does not exists!');
            RETURN;
        END IF;
        
        IF CHECK_IF_SPONSOR_EXISTS(id_sponsor) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Sponsor does not exists!');
            RETURN;
        END IF;
        
        IF CHECK_IF_TEAM_HAS_ALREADY_THIS_SPONSOR(id_sponsor, id_team) = TRUE THEN
            DBMS_OUTPUT.PUT_LINE('Team is already sponsored by this sponsor!');
            RETURN;
        END IF; 
        
        IF CHECK_IF_SPONSOR_IS_SPONSORING_ANOTHER_TEAM(id_sponsor) = TRUE THEN
            DBMS_OUTPUT.PUT_LINE('This sponsor is already sponsoring someone else!');
            RETURN;
        END IF; 
        
        SELECT REF(t) INTO sponsored_team FROM TEAM t where t.team_id = id_team;
        SELECT REF(t) INTO new_sponsor FROM sponsor t where t.sponsor_id = id_sponsor;
        
        UPDATE SPONSOR
        SET TEAM_ID = sponsored_team
        WHERE sponsor_id = id_sponsor;
        
        SELECT t.sponsors INTO sponsor_list FROM Team t WHERE t.team_id = id_team;
        sponsor_list.EXTEND;
        sponsor_list(sponsor_list.LAST) := new_sponsor;
        
        UPDATE TEAM t
        SET t.sponsors = sponsor_list
        WHERE t.team_id = id_team;
        
        SELECT SPONSOR_NAME INTO name_sponsor FROM SPONSOR WHERE SPONSOR_ID = ID_SPONSOR;
        SELECT NAME INTO name_team FROM TEAM WHERE TEAM_ID = ID_TEAM;
        
        DBMS_OUTPUT.PUT_LINE('Successfully added new sponsor: ' || name_sponsor || ' to: ' || name_team);
        
    END ADD_SPONSOR_TO_THE_TEAM;

    PROCEDURE PRINT_SPONSORS_FROM_TEAM(
        id_team NUMBER
    )
    AS
        sponsor_list SponsorListType;
        choosen_Sponsor REF SponsorType;
        s_name VARCHAR2(50);
        amount NUMBER;
    BEGIN
        SELECT t.sponsors INTO sponsor_list FROM Team t WHERE t.team_id = id_team;
        DBMS_OUTPUT.PUT_LINE('Sponsorzy: ');
        FOR i IN 1..sponsor_list.COUNT LOOP
            choosen_Sponsor := sponsor_list(i);
            SELECT p.sponsor_name INTO s_name FROM Sponsor p WHERE REF(p) = choosen_Sponsor;
            SELECT p.sponsorship_amount INTO amount FROM Sponsor p WHERE REF(p) = choosen_Sponsor;
            DBMS_OUTPUT.PUT_LINE('Sponsor ' || i || ': ' || s_name|| ' ' || amount);
        END LOOP;
    END PRINT_SPONSORS_FROM_TEAM;
    
    FUNCTION CHECK_IF_TEAM_HAS_ALREADY_THIS_SPONSOR(
        checked_sponsor_id NUMBER,
        checked_team_id NUMBER
    )RETURN BOOLEAN
    AS
        sponsor_list SponsorListType;
        new_sponsor REF SponsorType;
    BEGIN
        SELECT REF(t) INTO new_sponsor FROM sponsor t where t.sponsor_id = checked_sponsor_id;
        SELECT t.sponsors INTO sponsor_list FROM Team t WHERE t.team_id = checked_team_id;
        
        FOR i IN 1..sponsor_list.COUNT LOOP
            IF sponsor_list(i) = new_sponsor THEN
                RETURN TRUE;
            END IF;
        END LOOP;
        RETURN FALSE;
    END CHECK_IF_TEAM_HAS_ALREADY_THIS_SPONSOR;
    
    FUNCTION CHECK_IF_SPONSOR_IS_SPONSORING_ANOTHER_TEAM(
        checked_sponsor_id NUMBER
    )RETURN BOOLEAN
    AS
        sponsor_ref REF TeamType;
    BEGIN
        SELECT s.TEAM_ID INTO sponsor_ref FROM SPONSOR s
        where s.sponsor_id = checked_sponsor_id;
        
        IF sponsor_ref IS NULL THEN
            RETURN FALSE;
        END IF;
        
        RETURN TRUE;
    END;
    
    PROCEDURE ADD_SPORT_OBJECT(
        sport_object_name VARCHAR2,
        owner_team_id NUMBER
    )
    AS
        owner_team_ref REF TeamType;
    BEGIN
        IF CHECK_IF_TEAM_EXISTS(owner_team_id) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Team does not exists!');
            RETURN;
        END IF;
    
        SELECT REF(t) INTO owner_team_ref FROM TEAM t
        where t.team_id = owner_team_id;
    
        INSERT INTO SPORTOBJECT(OBJECT_ID, OBJECT_NAME, OWNER_TEAM_ID)
        VALUES (SPORT_OBJECT_ID_SEQ.NEXTVAL, sport_object_name, owner_team_ref);
        DBMS_OUTPUT.PUT_LINE('Successfully added new sport object: ' || sport_object_name);
    END ADD_SPORT_OBJECT;
    
    PROCEDURE PRINT_PLAYERS_FROM_TEAM(
        id_team NUMBER
    )
    AS
        player_list PlayerListType;
        choosen_player REF PlayerType;
        player_f_name VARCHAR2(50);
        player_l_name VARCHAR2(50);
    BEGIN
        SELECT t.players INTO player_list FROM Team t WHERE t.team_id = id_team;
        
        FOR i IN 1..player_list.COUNT LOOP
            choosen_player := player_list(i);
            SELECT p.first_name INTO player_f_name FROM Player p WHERE REF(p) = choosen_player;
            SELECT p.last_name INTO player_l_name FROM Player p WHERE REF(p) = choosen_player;
            DBMS_OUTPUT.PUT_LINE('Player ' || i || ': ' || player_f_name|| ' ' || player_l_name);
        END LOOP;
    END PRINT_PLAYERS_FROM_TEAM;

    FUNCTION CHECK_IF_TEAM_IS_FULL(
        id_team NUMBER
    )RETURN BOOLEAN
    AS
        player_list PlayerListType;
    BEGIN
        SELECT t.players INTO player_list FROM Team t WHERE t.team_id = id_team;
        IF player_list.COUNT <= 14 THEN
            RETURN FALSE;
        ELSE
            RETURN TRUE;
        END IF;
    END CHECK_IF_TEAM_IS_FULL;

END TEAM_PACKAGE;

/
