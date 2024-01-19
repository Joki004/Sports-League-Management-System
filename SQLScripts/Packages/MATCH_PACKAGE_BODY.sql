CREATE OR REPLACE PACKAGE BODY match_package AS

    PROCEDURE update_team_ranking AS

        team_cursor      SYS_REFCURSOR;
        v_team_id        NUMBER;
        v_name           VARCHAR(50);
        v_wins           NUMBER;
        v_loses          NUMBER;
        v_win_percentage NUMBER;
    BEGIN
        OPEN team_cursor FOR SELECT
                                 team_id,
                                 wins,
                                 loses
                             FROM
                                 team;

    -- Fetch and update team data
        LOOP
            FETCH team_cursor INTO
                v_team_id,
                v_wins,
                v_loses;
            EXIT WHEN team_cursor%notfound;
    
      -- Calculate win percentage
            v_win_percentage := round(
                                     CASE
                                         WHEN(v_wins + v_loses) > 0 THEN
                                             v_wins /(v_wins + v_loses)
                                         ELSE 0
                                     END, 3);

      -- Update Team table with new data
            dbms_output.put_line(v_name);
            UPDATE team
            SET
                wins = v_wins,
                loses = v_loses,
                win_percentage = v_win_percentage
            WHERE
                team_id = v_team_id;

        END LOOP;

    -- Close the cursor
        CLOSE team_cursor;
    END update_team_ranking;

    PROCEDURE update_team_stats (
        p_match_date        DATE,
        p_sport_object_name VARCHAR2
    ) AS

        v_match_id             NUMBER;
        v_team_home_id         NUMBER;
        v_team_away_id         NUMBER;
        v_score_home           NUMBER;
        v_score_away           NUMBER;
        v_wins_home            NUMBER;
        v_loses_home           NUMBER;
        v_win_percentage_home  NUMBER;
        v_points_conceded_home NUMBER;
        v_points_scored_home   NUMBER;
        v_wins_away            NUMBER;
        v_loses_away           NUMBER;
        v_win_percentage_away  NUMBER;
        v_points_conceded_away NUMBER;
        v_points_scored_away   NUMBER;
    BEGIN
  -- Step a: Get the match ID
        v_match_id := get_match_id(p_match_date, p_sport_object_name);
        dbms_output.put_line(v_match_id);
  -- Step b: Check if points scored and conceded are not 0
        SELECT
            m.score_home,
            m.score_away
        INTO
            v_score_home,
            v_score_away
        FROM
            match m
        WHERE
            m.match_id = v_match_id;

        IF
            v_score_home = 0
            AND v_score_away = 0
        THEN
            dbms_output.put_line('Points scored and conceded are both 0. No update needed.');
            RETURN;
        END IF;

        dbms_output.put_line(v_score_home
                             || '-'
                             || v_score_away);
  -- Step c: Update team stats
        SELECT DISTINCT
            t.team_id,
            t.wins,
            t.loses,
            t.win_percentage,
            t.points_conceded,
            t.points_scored
        INTO
            v_team_home_id,
            v_wins_home,
            v_loses_home,
            v_win_percentage_home,
            v_points_conceded_home,
            v_points_scored_home
        FROM
                 team t
            JOIN match m ON t.team_id = deref(m.team_home_id).team_id
        WHERE
            m.match_id = v_match_id;

  -- Update stats for the home team
        IF v_score_home > v_score_away THEN
    -- Home team wins
            UPDATE team t
            SET
                t.wins = t.wins + 1,
                t.points_scored = t.points_scored + v_score_home,
                t.points_conceded = t.points_conceded + v_score_away
            WHERE
                t.team_id = (
                    SELECT
                        deref(m.team_home_id).team_id
                    FROM
                        match m
                    WHERE
                        m.match_id = v_match_id
                );

        ELSE
    -- Home team loses
            UPDATE team t
            SET
                t.loses = t.loses + 1,
                t.points_scored = t.points_scored + v_score_home,
                t.points_conceded = t.points_conceded + v_score_away
            WHERE
                t.team_id = (
                    SELECT
                        deref(m.team_home_id).team_id
                    FROM
                        match m
                    WHERE
                        m.match_id = v_match_id
                );

        END IF;

        SELECT DISTINCT
            t.team_id,
            t.wins,
            t.loses,
            t.win_percentage,
            t.points_conceded,
            t.points_scored
        INTO
            v_team_away_id,
            v_wins_away,
            v_loses_away,
            v_win_percentage_away,
            v_points_conceded_away,
            v_points_scored_away
        FROM
                 team t
            JOIN match m ON t.team_id = deref(m.team_away_id).team_id
        WHERE
            m.match_id = v_match_id;
  -- Update stats for the away team
        IF v_score_away > v_score_home THEN
    -- Away team wins
            UPDATE team t
            SET
                t.wins = t.wins + 1,
                t.points_scored = t.points_scored + v_score_away,
                t.points_conceded = t.points_conceded + v_score_home
            WHERE
                t.team_id = (
                    SELECT
                        deref(m.team_away_id).team_id
                    FROM
                        match m
                    WHERE
                        m.match_id = v_match_id
                );

        ELSE
    -- Away team loses
            UPDATE team t
            SET
                t.loses = t.loses + 1,
                t.points_scored = t.points_scored + v_score_away,
                t.points_conceded = t.points_conceded + v_score_home
            WHERE
                t.team_id = (
                    SELECT
                        deref(m.team_away_id).team_id
                    FROM
                        match m
                    WHERE
                        m.match_id = v_match_id
                );

        END IF;

        dbms_output.put_line('Team stats updated successfully.');
    END update_team_stats;

    FUNCTION get_team_ranking RETURN SYS_REFCURSOR AS
        team_ranking_cursor SYS_REFCURSOR;
    BEGIN
        OPEN team_ranking_cursor FOR SELECT
                                                                      team_id,
                                                                      name,
                                                                      wins,
                                                                      loses,
                                                                      win_percentage
                                                                  FROM
                                                                      (
                                                                          SELECT
                                                                              team_id,
                                                                              name,
                                                                              wins,
                                                                              loses,
                                                                              win_percentage,
                                                                              RANK()
                                                                              OVER(
                                                                                  ORDER BY
                                                                                      wins DESC, win_percentage DESC
                                                                              ) AS team_rank
                                                                          FROM
                                                                              team
                                                                      )
                                     ORDER BY
                                         team_rank ASC;

        RETURN team_ranking_cursor;
        RETURN NULL;
    END get_team_ranking;

    PROCEDURE update_score_with_match_id (
        m_match_id   IN NUMBER,
        p_score_home IN NUMBER,
        p_score_away IN NUMBER
    ) AS
        v_score_home NUMBER;
        v_score_away NUMBER;
        v_arena      VARCHAR2(50);
        v_date       DATE;
    BEGIN
        SELECT
            m.match_date
        INTO v_date
        FROM
            match m
        WHERE
            m.match_id = m_match_id;

        dbms_output.put_line(v_date
                             || ' '
                             || p_score_home);
        UPDATE match m
        SET
            m.score_home = p_score_home,
            m.score_away = p_score_away
        WHERE
            m.match_id = m_match_id;

    END update_score_with_match_id;

    PROCEDURE update_score_with_teams (
        date_match DATE,
        home_team  VARCHAR2,
        away_team  VARCHAR2,
        score_home NUMBER,
        score_away NUMBER
    ) AS
        v_score_home NUMBER;
        v_score_away NUMBER;
    BEGIN
        UPDATE match m
        SET
            m.score_home = score_home,
            m.score_away = score_away
        WHERE
                m.match_date = date_match
            AND deref(m.team_home_id).name = home_team
            AND deref(m.team_away_id).name = away_team;

    END update_score_with_teams;

    FUNCTION display_team_ranking RETURN SYS_REFCURSOR IS

        team_cursor      SYS_REFCURSOR;
        rankingcursor    SYS_REFCURSOR;
        v_team_id        NUMBER;
        v_ranking        NUMBER := 1;
        v_name           VARCHAR2(50);
        v_wins           NUMBER;
        v_loses          NUMBER;
        v_win_percentage NUMBER;
    BEGIN
  -- Open a cursor to fetch team data ordered by win percentage
        OPEN team_cursor FOR SELECT
                                                                      team_id,
                                                                      name,
                                                                      wins,
                                                                      loses,
                                                                      win_percentage
                                                                  FROM
                                                                      (
                                                                          SELECT
                                                                              team_id,
                                                                              name,
                                                                              wins,
                                                                              loses,
                                                                              win_percentage,
                                                                              RANK()
                                                                              OVER(
                                                                                  ORDER BY
                                                                                      wins DESC, win_percentage DESC
                                                                              ) AS team_rank
                                                                          FROM
                                                                              team
                                                                      )
                                     ORDER BY
                                         team_rank ASC;


        rankingcursor := team_cursor;
        dbms_output.put_line('-------------------------------------------------------------------');
        dbms_output.put_line('Ranking | Name                  | Wins | Loses | Win Percentage');
        dbms_output.put_line('--------------------------------------------------------------------');
        LOOP
            FETCH rankingcursor INTO
                v_team_id,
                v_name,
                v_wins,
                v_loses,
                v_win_percentage;
            EXIT WHEN rankingcursor%notfound;

    -- Display team ranking
            dbms_output.put_line(rpad(v_ranking, 8)
                                 || ' | '
                                 || rpad(v_name, 20)
                                 || ' | '
                                 || rpad(v_wins, 4)
                                 || ' | '
                                 || rpad(v_loses, 5)
                                 || ' | '
                                 || to_char(v_win_percentage, '0.000'));

            v_ranking := v_ranking + 1;
        END LOOP;

  -- Close the cursor
        CLOSE rankingcursor;
  -- Return the cursor
        RETURN team_cursor;
    END display_team_ranking;

    FUNCTION get_match_id (
        p_match_date        DATE,
        p_sport_object_name VARCHAR2
    ) RETURN NUMBER IS
        v_match_id NUMBER;
    BEGIN
        FOR match_rec IN (
            SELECT
                m.match_id
            FROM
                     match m
                JOIN sportobject s ON s.object_id = deref(m.sport_object_id).object_id
            WHERE
                    m.match_date = p_match_date
                AND s.object_name = p_sport_object_name
        ) LOOP
            v_match_id := match_rec.match_id;
            dbms_output.put_line('Match ID : ' || v_match_id);
            RETURN v_match_id;
        END LOOP;

    -- If no match is found, handle accordingly
        dbms_output.put_line('No match found for the given date and sport object name.');
        RETURN NULL;
    END get_match_id;

END match_package;