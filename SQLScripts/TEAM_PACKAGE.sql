--------------------------------------------------------
--  File created - czwartek-stycznia-18-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package TEAM_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SCOTT"."TEAM_PACKAGE" AS 

    FUNCTION CHECK_IF_TEAM_EXISTS(
        checked_team_id NUMBER
    )RETURN BOOLEAN;
    
    FUNCTION CHECK_IF_SPONSOR_EXISTS(
        checked_sponsor_id NUMBER
    )RETURN BOOLEAN;
    
    FUNCTION CHECK_IF_TEAM_HAS_ALREADY_THIS_SPONSOR(
        checked_sponsor_id NUMBER,
        checked_team_id NUMBER
    )RETURN BOOLEAN;
    
    FUNCTION CHECK_IF_SPONSOR_IS_SPONSORING_ANOTHER_TEAM(
        checked_sponsor_id NUMBER
    )RETURN BOOLEAN;
    
    PROCEDURE ADD_TEAM(
        team_name VARCHAR
    );
    
    PROCEDURE DELETE_TEAM(
        delete_team_id NUMBER
    );
    
    PROCEDURE CREATE_SPONSOR(
        name VARCHAR2,
        amount NUMBER
    );
    
    PROCEDURE ADD_SPONSOR_TO_THE_TEAM(
        id_sponsor NUMBER,
        id_team NUMBER
    );
    
    PROCEDURE PRINT_SPONSORS_FROM_TEAM(
        id_team NUMBER
    );

END TEAM_PACKAGE;

/
