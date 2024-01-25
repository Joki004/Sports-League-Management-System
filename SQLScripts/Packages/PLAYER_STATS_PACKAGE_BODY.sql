--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PLAYER_STATS_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SCOTT"."PLAYER_STATS_PACKAGE" AS

  PROCEDURE Update_Player_Stats(
    s_stats_id NUMBER,
    p_minutes_played NUMBER,
    p_two_points_goals NUMBER,
    p_assists NUMBER,
    p_blocks NUMBER,
    p_rebounds NUMBER,
    p_three_points_goal NUMBER
  ) AS
  BEGIN
    UPDATE PlayerStats
    SET minutes_played = p_minutes_played,
        two_points_goals = p_two_points_goals,
        assists = p_assists,
         blocks = p_blocks,
         rebounds = p_rebounds,
         three_points_goal = p_three_points_goal
     WHERE stats_id = s_stats_id;
  END Update_Player_Stats;

PROCEDURE Add_Player_Stats(
    p_match_id NUMBER,
    p_player_id NUMBER,
    p_minutes_played NUMBER,
    p_two_points_goals NUMBER,
    p_assists NUMBER,
    p_blocks NUMBER,
    p_rebounds NUMBER,
    p_three_points_goal NUMBER
  ) IS
  v_player_ref REF PlayerType;
    v_match_ref REF MatchType;
  BEGIN
SELECT REF(p)
    INTO v_player_ref
    FROM Player p
    WHERE p.player_id = p_player_id;

    SELECT REF(m)
    INTO v_match_ref
    FROM Match m
    WHERE m.match_id = p_match_id;

    -- Insert new player stats for the given match
    INSERT INTO PlayerStats (
      stats_id,
      player_id,
      match_id,
      minutes_played,
      two_points_goals,
      assists,
      blocks,
      rebounds,
      three_points_goal
    ) VALUES (
      stats_id_seq.NEXTVAL,
      v_player_ref,
      v_match_ref,
      p_minutes_played,
      p_two_points_goals,
      p_assists,
      p_blocks,
      p_rebounds,
      p_three_points_goal
    );
  END Add_Player_Stats;

  PROCEDURE Remove_Player_Stats(
    p_match_id NUMBER,
    p_player_id NUMBER
  ) IS
  BEGIN
    -- Delete player stats for the given match
    DELETE FROM PlayerStats ps
    WHERE DEREF(ps.player_id).player_id = p_player_id
      AND DEREF(ps.match_id).match_id = p_match_id;
  END Remove_Player_Stats;

  PROCEDURE Display_Player_Stats(
    p_player_id NUMBER
  )
  AS
    v_player_minutes NUMBER;
    v_player_two NUMBER;
    v_player_assists NUMBER;
    v_player_blocks NUMBER;
    v_player_rebounds NUMBER;
    v_player_three NUMBER;
    v_player_ref REF PlayerType;
    v_cursor SYS_REFCURSOR;
    v_player_first_name VARCHAR2(50);
    v_player_last_name VARCHAR2(50);
    v_match_ref REF MatchType;
    v_away_team_ref REF TeamType;
    v_home_team_ref REF TeamType;
    v_home_team_name VARCHAR2(50);
    v_away_team_name VARCHAR2(50);
    --v_home_name VARCHAR2
  BEGIN
    SELECT REF(t) INTO v_player_ref FROM Player t where t.player_id = p_player_id;
    SELECT p.first_name, p.last_name INTO v_player_first_name, v_player_last_name FROM PLAYER p
    WHERE p.player_id = p_player_id;
    
    DBMS_OUTPUT.PUT_LINE('STATS FOR: ' || v_player_first_name || ' ' || v_player_last_name);
    OPEN v_cursor FOR
        SELECT p.MATCH_ID ,
                p.MINUTES_PLAYED ,
                p.TWO_POINTS_GOALS ,
                p.ASSISTS ,
                p.BLOCKS ,
                p.REBOUNDS ,
                p.THREE_POINTS_GOAL  
        FROM PLAYERSTATS p
        WHERE p.player_id = v_player_ref;

    LOOP
        FETCH v_cursor INTO v_match_ref, v_player_minutes, v_player_two, v_player_assists, v_player_blocks, v_player_rebounds, v_player_three;
        EXIT WHEN v_cursor%NOTFOUND;
        
        SELECT TEAM_HOME_ID, TEAM_AWAY_ID INTO v_home_team_ref, v_away_team_ref FROM MATCH m WHERE m.match_id = DEREF(v_match_ref).match_id;
        
        SELECT t.name INTO v_home_team_name FROM TEAM t where REF(t) = v_home_team_ref;
        SELECT t.name INTO v_away_team_name FROM TEAM t where REF(t) = v_away_team_ref;
        DBMS_OUTPUT.PUT_LINE(v_home_team_name || ' VS ' || v_away_team_name || ' | MINUTES_PLAYED: ' || v_player_minutes || ' TWO_POINTS_GOALS: ' || v_player_two || ' ASSISTS: ' || v_player_assists || ' BLOCKS: ' || v_player_blocks || ' REBOUNDS: ' || v_player_rebounds || ' THREE_POINTS_GOALS: ' || v_player_three );
        
    END LOOP;
    CLOSE v_cursor;
    
    SELECT SUM(MINUTES_PLAYED), SUM(TWO_POINTS_GOALS), SUM(ASSISTS), SUM(BLOCKS), SUM(REBOUNDS), SUM(THREE_POINTS_GOAL) 
    INTO v_player_minutes, v_player_two, v_player_assists, v_player_blocks, v_player_rebounds, v_player_three FROM PLAYERSTATS
    WHERE player_id = v_player_ref;
    
    DBMS_OUTPUT.PUT_LINE('SUM | MINUTES PLAYED: ' || v_player_minutes || ' ASSISTS: ' || v_player_assists || ' BLOCKS: ' || v_player_blocks || ' REBOUNDS: ' || v_player_rebounds || ' THREE_POINTS: ' || v_player_three || ' TWO_POINTS: '  || v_player_two);
  END Display_Player_Stats;
  
    PROCEDURE display_all_player_stats
    AS
        SCHEDULE SYS_REFCURSOR;
        team_home_name VARCHAR2(50);
        team_away_name VARCHAR2(50);
        p_first_name VARCHAR2(50);
        p_last_name VARCHAR2(50);
        s_minutes_played NUMBER;
        s_two_points_goals NUMBER;
        s_assists NUMBER;
        s_blocks NUMBER;
        s_rebounds NUMBER;
        s_three_points_goals NUMBER;
    BEGIN
        OPEN SCHEDULE FOR
            SELECT 
                DEREF(p.player_id).first_name,
                DEREF(p.player_id).last_name,
                DEREF(DEREF(p.match_id).team_home_id).name,
                DEREF(DEREF(p.match_id).team_away_id).name,
                minutes_played,
                two_points_goals,
                assists,
                blocks,
                rebounds,
                three_points_goal
            FROM PLAYERSTATS p; 

        LOOP
            FETCH SCHEDULE INTO p_first_name, p_last_name, team_home_name, team_away_name, s_minutes_played, s_two_points_goals, s_assists, s_blocks, s_rebounds, s_three_points_goals;
            EXIT WHEN SCHEDULE%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(p_first_name || ' ' || p_last_name || ' | ' || team_home_name || ' VS ' || team_away_name || ' | Minutes played: ' || s_minutes_played || ' Two points goals: ' || s_two_points_goals || ' Assists: ' || s_assists || ' Blocks: ' || s_blocks || ' Rebounds: ' || s_rebounds || ' Three points goals: ' || s_three_points_goals);
            
        END LOOP;
        CLOSE SCHEDULE;
    END display_all_player_stats;
    
    PROCEDURE display_all_player_stats_from_match(
        m_match_id NUMBER
    )
    AS
        SCHEDULE SYS_REFCURSOR;
        team_home_name VARCHAR2(50);
        team_away_name VARCHAR2(50);
        p_first_name VARCHAR2(50);
        p_last_name VARCHAR2(50);
        s_minutes_played NUMBER;
        s_two_points_goals NUMBER;
        s_assists NUMBER;
        s_blocks NUMBER;
        s_rebounds NUMBER;
        s_three_points_goals NUMBER;
    BEGIN
        OPEN SCHEDULE FOR
            SELECT 
                DEREF(p.player_id).first_name,
                DEREF(p.player_id).last_name,
                DEREF(DEREF(p.match_id).team_home_id).name,
                DEREF(DEREF(p.match_id).team_away_id).name,
                minutes_played,
                two_points_goals,
                assists,
                blocks,
                rebounds,
                three_points_goal
            FROM PLAYERSTATS p
            WHERE DEREF(p.match_id).match_id = m_match_id;

        LOOP
            FETCH SCHEDULE INTO p_first_name, p_last_name, team_home_name, team_away_name, s_minutes_played, s_two_points_goals, s_assists, s_blocks, s_rebounds, s_three_points_goals;
            EXIT WHEN SCHEDULE%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(p_first_name || ' ' || p_last_name || ' | ' || team_home_name || ' VS ' || team_away_name || ' | Minutes played: ' || s_minutes_played || ' Two points goals: ' || s_two_points_goals || ' Assists: ' || s_assists || ' Blocks: ' || s_blocks || ' Rebounds: ' || s_rebounds || ' Three points goals: ' || s_three_points_goals);
            
        END LOOP;
        CLOSE SCHEDULE;
    END display_all_player_stats_from_match;

END PLAYER_STATS_PACKAGE;

/
