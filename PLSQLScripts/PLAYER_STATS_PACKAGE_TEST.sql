DECLARE
  P_MATCH_ID NUMBER;
  P_PLAYER_ID NUMBER;
  P_MINUTES_PLAYED NUMBER;
  P_TWO_POINTS_GOALS NUMBER;
  P_ASSISTS NUMBER;
  P_BLOCKS NUMBER;
  P_REBOUNDS NUMBER;
  P_THREE_POINTS_GOAL NUMBER;
BEGIN
  P_MATCH_ID := 56;
  P_PLAYER_ID := 63;
  P_MINUTES_PLAYED := 32;
  P_TWO_POINTS_GOALS := 40;
  P_ASSISTS := 10;
  P_BLOCKS := 5;
  P_REBOUNDS := 12;
  P_THREE_POINTS_GOAL := 5;

  PLAYER_STATS_PACKAGE.ADDPLAYERSTATS(
    P_MATCH_ID => P_MATCH_ID,
    P_PLAYER_ID => P_PLAYER_ID,
    P_MINUTES_PLAYED => P_MINUTES_PLAYED,
    P_TWO_POINTS_GOALS => P_TWO_POINTS_GOALS,
    P_ASSISTS => P_ASSISTS,
    P_BLOCKS => P_BLOCKS,
    P_REBOUNDS => P_REBOUNDS,
    P_THREE_POINTS_GOAL => P_THREE_POINTS_GOAL
  );
COMMIT;
END;


DECLARE
  P_PLAYER_ID NUMBER;
  v_Return VARCHAR2(200);
BEGIN
  P_PLAYER_ID := 63;

  v_Return := PLAYER_STATS_PACKAGE.DISPLAYPLAYERSTATS(
    P_PLAYER_ID => P_PLAYER_ID
  );

DBMS_OUTPUT.PUT_LINE('Player stats = ' || v_Return);

  :v_Return := v_Return;
COMMIT; 
END;

