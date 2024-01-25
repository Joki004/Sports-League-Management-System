--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PLAYER_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SCOTT"."PLAYER_PACKAGE" AS

    FUNCTION CHECK_IF_PLAYER_EXISTS(
        checked_player_id NUMBER
    )RETURN BOOLEAN
    AS
        player_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO player_exists
        FROM Player p
        WHERE p.player_id = checked_player_id;
        IF player_exists = 0 THEN
            RETURN FALSE;
        END IF;
        RETURN TRUE;
    END CHECK_IF_PLAYER_EXISTS;

    PROCEDURE TRANSFER_PLAYER(
        id_player NUMBER,
        new_team_id NUMBER
      ) AS
        player_exists NUMBER;
        new_team_exists NUMBER;
        old_team REF TeamType;
        new_team REF TeamType;
        old_team_name VARCHAR2(50);
        new_team_name VARCHAR2(50);
        old_team_id NUMBER;
        player_first_name VARCHAR2(50);
        player_last_name VARCHAR2(50);
        player_list PlayerListType;
        choosen_player_id NUMBER;
        choosen_player REF PlayerType;
    BEGIN
        IF CHECK_IF_PLAYER_EXISTS(id_player) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Player does not exists');
            RETURN;
        END IF;
        
        IF TEAM_PACKAGE.CHECK_IF_TEAM_EXISTS(new_team_id) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Team does not exists!');
            RETURN;
        END IF;
            
        SELECT p.TEAM_ID INTO old_team FROM Player p where p.Player_id = id_player;
        SELECT REF(t) INTO new_team FROM Team t where t.TEAM_ID = new_team_id;
        
        IF old_team = new_team THEN
            DBMS_OUTPUT.PUT_LINE('You can not transfer player to the same team!');
            RETURN;
        END IF;
        
        SELECT t.team_id INTO old_team_id FROM Team t WHERE REF(t) = old_team;
        
        IF old_team IS NOT NULL THEN
            SELECT t.players INTO player_list FROM Team t where t.team_id = old_team_id;
            FOR i IN 1..player_list.COUNT LOOP
                SELECT p.player_id INTO choosen_player_id FROM Player p WHERE REF(p) = player_list(i);
                IF choosen_player_id = id_player THEN
                    player_list.DELETE(i);
                    EXIT;
                END IF;
            END LOOP;
            
            UPDATE TEAM t
            SET t.players = player_list
            WHERE t.team_id = old_team_id;
        END IF;
        
        UPDATE PLAYER p
        SET p.TEAM_ID = new_team
        WHERE p.PLAYER_ID = id_player;
       
        SELECT t.players INTO player_list FROM Team t where t.team_id = new_team_id;
        SELECT REF(t) INTO choosen_player FROM Player t where t.player_id = id_player;
        player_list.EXTEND;
        player_list(player_list.LAST) := choosen_player;
        
        UPDATE TEAM t
        SET t.players = player_list
        WHERE t.team_id = new_team_id;
       
        SELECT p.FIRST_NAME INTO player_first_name FROM Player p WHERE p.player_id = id_player;
        SELECT p.LAST_NAME INTO player_last_name FROM Player p WHERE p.player_id = id_player;
        
        SELECT t.name INTO old_team_name FROM Team t WHERE REF(t) = old_team;
        SELECT t.name INTO new_team_name FROM Team t WHERE REF(t) = new_team;
        
        DBMS_OUTPUT.PUT_LINE('Successfully transfered player: ' || player_first_name || ' ' || player_last_name || ' from: ' || old_team_name || ' to: ' || new_team_name);
    END TRANSFER_PLAYER;

    PROCEDURE ADD_PLAYER(
        player_datebirth DATE,
        player_first_name VARCHAR2,
        player_last_name VARCHAR2,
        player_position VARCHAR2,
        player_team_id NUMBER
    )
    AS
        player_team_ref REF TeamType;
        player_list PlayerListType;
        new_player REF PlayerType;
        id_player NUMBER;
    BEGIN
        
        IF TEAM_PACKAGE.CHECK_IF_TEAM_EXISTS(player_team_id) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Team does not exists!');
            RETURN;
        END IF;
        
        IF TEAM_PACKAGE.CHECK_IF_TEAM_IS_FULL(player_team_id) = TRUE THEN
            DBMS_OUTPUT.PUT_LINE('Team have too many players!');
            RETURN;
        END IF;
        
        SELECT REF(t) INTO player_team_ref FROM Team t where t.TEAM_ID = player_team_id;
    
        id_player := MATCH_ID_SEQ.NEXTVAL;
        
        INSERT INTO PLAYER(PLAYER_ID, FIRST_NAME, LAST_NAME, BIRTHDATE, POSITION, TEAM_ID)
        VALUES(id_player,
            player_first_name,
            player_last_name,
            player_datebirth,
            player_position,
            player_team_ref);
            
        SELECT t.players INTO player_list FROM Team t where t.team_id = player_team_id;
        
        SELECT REF(t) INTO new_player FROM Player t where t.player_id = id_player;
        player_list.EXTEND;
        player_list(player_list.LAST) := new_player;
        
        UPDATE TEAM t
        SET t.players = player_list
        WHERE t.team_id = player_team_id;
        
        DBMS_OUTPUT.PUT_LINE('Successfully added new player: ' || player_first_name || ' ' || player_last_name);
    END ADD_PLAYER;
    
    PROCEDURE REMOVE_PLAYER_FROM_TEAM(
        id_player NUMBER
    )
    AS
        old_team REF TeamType;
        old_team_name VARCHAR2(50);
        old_team_id NUMBER;
        player_first_name VARCHAR2(50);
        player_last_name VARCHAR2(50);
        player_list PlayerListType;
        choosen_player_id NUMBER;
    BEGIN
    
        IF CHECK_IF_PLAYER_EXISTS(id_player) = FALSE THEN
            DBMS_OUTPUT.PUT_LINE('Player does not exists');
            RETURN;
        END IF;
        
        SELECT p.TEAM_ID INTO old_team FROM Player p where p.Player_id = id_player;
        
        IF old_team IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('This player is already a free player!');
            RETURN;
        END IF;
    
        UPDATE PLAYER p
        SET p.TEAM_ID = NULL
        WHERE p.PLAYER_ID = id_player;
        
        UPDATE TEAM t
        SET t.players = player_list
        WHERE t.team_id = old_team_id;
        
        SELECT p.FIRST_NAME INTO player_first_name FROM Player p WHERE p.player_id = id_player;
        SELECT p.LAST_NAME INTO player_last_name FROM Player p WHERE p.player_id = id_player;
        SELECT t.name INTO old_team_name FROM Team t WHERE REF(t) = old_team;
        SELECT t.team_id INTO old_team_id FROM Team t WHERE REF(t) = old_team;
        
        SELECT t.players INTO player_list FROM Team t where t.team_id = old_team_id;
        FOR i IN 1..player_list.COUNT LOOP
            SELECT p.player_id INTO choosen_player_id FROM Player p WHERE REF(p) = player_list(i);
            IF choosen_player_id = id_player THEN
                player_list.DELETE(i);
                EXIT;
            END IF;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('Succesfully removed player: ' || player_first_name || ' ' || player_last_name || ' from team: ' || old_team_name);
        
    END REMOVE_PLAYER_FROM_TEAM;
END PLAYER_PACKAGE;

/
