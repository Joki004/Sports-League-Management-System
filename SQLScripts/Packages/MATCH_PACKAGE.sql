--------------------------------------------------------
--  File created - pi�tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package MATCH_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SCOTT"."MATCH_PACKAGE" AS 

   -- Procedure to calculate and update team ranking
    PROCEDURE update_team_ranking;

    PROCEDURE update_team_stats (
        p_match_date        DATE,
        p_sport_object_name VARCHAR2
    );

  -- Function to get the team ranking based on wins and losses
    FUNCTION get_team_ranking RETURN SYS_REFCURSOR;

    PROCEDURE display_team_ranking;

    FUNCTION get_match_id (
        p_match_date        DATE,
        p_sport_object_name VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE UPDATE_SCORE_WITH_MATCH_ID(
        m_match_id IN NUMBER,
        p_score_home IN NUMBER,
        p_score_away IN NUMBER
        );

    PROCEDURE UPDATE_SCORE_WITH_TEAMS(
        date_match DATE,
        home_team VARCHAR2,
        away_team VARCHAR2,
        score_home NUMBER,
        score_away NUMBER
        );

END match_package;

/
