--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package SCHEDULE_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SCOTT"."SCHEDULE_PACKAGE" AS 

    PROCEDURE GENERATE_SCHEDULE(
        start_season_date DATE
    );
    PROCEDURE ADD_MATCH(
        team_home REF TeamType,
        team_away REF TeamType,
        match_date DATE,
        sport_object REF SportObjectType
    );
    FUNCTION CHECK_IF_READY_FOR_NEXT_MATCH(
        team_name VARCHAR2,
        match_date DATE
    )RETURN BOOLEAN;
    
    FUNCTION CHECK_IF_DATA_IS_OCCUPIED(
        date_match DATE
    )RETURN BOOLEAN;
    
    FUNCTION FIND_DATA_FOR_MATCH(
        team_away_name VARCHAR2,
        team_home_name VARCHAR2,
        start_season_date DATE
        )RETURN DATE;
    
    PROCEDURE PRINT_SCHEDULE;
    PROCEDURE PRINT_MATCHES_FOR_TEAM(
        v_team_id NUMBER
    );
    
END SCHEDULE_PACKAGE;

/
