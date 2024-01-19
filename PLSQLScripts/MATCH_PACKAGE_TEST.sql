DECLARE

BEGIN
  MATCH_PACKAGE.DISPLAY_TEAM_RANKING();
END;
/

----------------------------------------------------------------------
------------------------DISPLAY RANKING-------------------------------
----------------------------------------------------------------------
DECLARE
  rankingCursor SYS_REFCURSOR;
  v_team_id NUMBER;
  v_ranking NUMBER := 1;
  v_name VARCHAR2(50);
  v_wins NUMBER;
  v_loses NUMBER;
  v_win_percentage NUMBER;
BEGIN
  rankingCursor := TEAM_RANKING_PACKAGE.DISPLAY_TEAM_RANKING();
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('Ranking | Name                  | Wins | Loses | Win Percentage');
  DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------------');


  LOOP
    FETCH rankingCursor INTO v_team_id, v_name, v_wins, v_loses, v_win_percentage;
    EXIT WHEN rankingCursor%NOTFOUND;

    -- Display team ranking
    DBMS_OUTPUT.PUT_LINE(
      RPAD(v_ranking, 8) || ' | ' ||
      RPAD(v_name, 20) || ' | ' ||
      RPAD(v_wins, 4) || ' | ' ||
      RPAD(v_loses, 5) || ' | ' ||
      TO_CHAR(v_win_percentage, '0.000')
    );
    v_ranking := v_ranking + 1;
  END LOOP;

  -- Close the cursor
  CLOSE rankingCursor;
END;



----------------------------------------------------------------------
------------------------UPDATE TEAM WITH MATCH ID---------------------
----------------------------------------------------------------------
DECLARE
  M_MATCH_ID NUMBER;
  P_SCORE_HOME NUMBER;
  P_SCORE_AWAY NUMBER;
BEGIN
  M_MATCH_ID := 58;
  P_SCORE_HOME := 115;
  P_SCORE_AWAY := 103;

  MATCH_PACKAGE.UPDATE_SCORE_WITH_MATCH_ID(
    M_MATCH_ID => M_MATCH_ID,
    P_SCORE_HOME => P_SCORE_HOME,
    P_SCORE_AWAY => P_SCORE_AWAY
  );
  
COMMIT;
END;




----------------------------------------------------------------------
------------------------UPDATE TEAM STATS-----------------------------
----------------------------------------------------------------------

DECLARE
  P_MATCH_DATE DATE;
  P_SPORT_OBJECT_NAME VARCHAR2(200);
BEGIN
  P_MATCH_DATE := TO_DATE('2023-10-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS');
  P_SPORT_OBJECT_NAME := 'Little Caesars Arena';

  MATCH_PACKAGE.UPDATE_TEAM_STATS(
    P_MATCH_DATE => P_MATCH_DATE,
    P_SPORT_OBJECT_NAME => P_SPORT_OBJECT_NAME
  );
COMMIT; 
END;

DECLARE 
    p_player_id NUMBER;
    player_first_name VARCHAR(50);
    player_last_name VARCHAR(50);
    player_datebirth DATE;
    player_position CHAR;
    player_team_ref NUMBER;
    t_team_id NUMBER;
BEGIN
    p_player_id :=63;
    t_team_id :=29;
    select p.first_name,p.last_name,p.birthdate,p.position 
    INTO player_first_name, player_last_name,player_datebirth,player_position
    from player p
    where p.player_id = p_player_id;
    
    UPDATE TEAM SET PLAYERS = PlayerListType() WHERE team_id = t_team_id;
    
    PLAYER_PACKAGE.ADD_PLAYER(player_datebirth, player_first_name,player_last_name , player_position, t_team_id);
    COMMIT;
END;