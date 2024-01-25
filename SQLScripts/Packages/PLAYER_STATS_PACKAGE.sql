--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PLAYER_STATS_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SCOTT"."PLAYER_STATS_PACKAGE" AS
    PROCEDURE update_player_stats (
        s_stats_id NUMBER,
        p_minutes_played    NUMBER,
        p_two_points_goals  NUMBER,
        p_assists           NUMBER,
        p_blocks            NUMBER,
        p_rebounds          NUMBER,
        p_three_points_goal NUMBER
    );

    PROCEDURE add_player_stats (
        p_match_id          NUMBER,
        p_player_id         NUMBER,
        p_minutes_played    NUMBER,
        p_two_points_goals  NUMBER,
        p_assists           NUMBER,
        p_blocks            NUMBER,
        p_rebounds          NUMBER,
        p_three_points_goal NUMBER
    );

    PROCEDURE remove_player_stats (
        p_match_id  NUMBER,
        p_player_id NUMBER
    );


    PROCEDURE display_player_stats (
        p_player_id NUMBER
    );
    
    PROCEDURE display_all_player_stats;
    
    PROCEDURE display_all_player_stats_from_match(
        m_match_id NUMBER);

END player_stats_package;

/
