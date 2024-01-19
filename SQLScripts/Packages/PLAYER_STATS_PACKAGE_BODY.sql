create or replace PACKAGE BODY PLAYER_STATS_PACKAGE AS

  PROCEDURE UpdatePlayerStats(
    p_match_id NUMBER,
    p_player_id NUMBER,
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
     WHERE player_id IN (SELECT player_id FROM Player WHERE player_id = p_player_id)
       AND match_id IN (SELECT match_id FROM Match WHERE match_id = p_match_id);
  END UpdatePlayerStats;

PROCEDURE AddPlayerStats(
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
  END AddPlayerStats;

  PROCEDURE RemovePlayerStats(
    p_match_id NUMBER,
    p_player_id NUMBER
  ) IS
  BEGIN
    -- Delete player stats for the given match
    DELETE FROM PlayerStats ps
    WHERE DEREF(ps.player_id).player_id = p_player_id
      AND DEREF(ps.match_id).match_id = p_match_id;
  END RemovePlayerStats;

  FUNCTION DisplayPlayerStats(
    p_player_id NUMBER
  ) RETURN VARCHAR2 IS
    v_player_stats VARCHAR2(4000);
  BEGIN
    -- Retrieve player stats and format them into a string
    SELECT
      'Player Name: ' || p.first_name || ' ' || p.last_name ||
      ' | Age: ' || TRUNC(MONTHS_BETWEEN(SYSDATE, p.birthdate) / 12) ||
      ' | Minutes Played: ' || ps.minutes_played ||
      ' | Two-Points Goals: ' || ps.two_points_goals ||
      ' | Assists: ' || ps.assists ||
      ' | Blocks: ' || ps.blocks ||
      ' | Rebounds: ' || ps.rebounds ||
      ' | Three-Points Goal: ' || ps.three_points_goal
    INTO v_player_stats
    FROM Player p
    JOIN PlayerStats ps ON p.player_id = DEREF(ps.player_id).player_id
    WHERE p.player_id = p_player_id;

    RETURN v_player_stats;
  END DisplayPlayerStats;

END PLAYER_STATS_PACKAGE;