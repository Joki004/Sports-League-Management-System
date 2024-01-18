DECLARE
rankingCursor SYS_REFCURSOR;
BEGIN
  --TEAM_RANKING_PACKAGE.UPDATE_TEAM_RANKING();
  rankingCursor := TEAM_RANKING_PACKAGE.DISPLAY_TEAM_RANKING();
END;

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