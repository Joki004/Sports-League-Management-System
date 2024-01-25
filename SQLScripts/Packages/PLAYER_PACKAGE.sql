--------------------------------------------------------
--  File created - pi¹tek-stycznia-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PLAYER_PACKAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SCOTT"."PLAYER_PACKAGE" AS 

    PROCEDURE TRANSFER_PLAYER(
        id_player NUMBER,
        new_team_id NUMBER
    );
    
    FUNCTION CHECK_IF_PLAYER_EXISTS(
        checked_player_id NUMBER
    )RETURN BOOLEAN;
    
    PROCEDURE ADD_PLAYER(
        player_datebirth DATE,
        player_first_name VARCHAR2,
        player_last_name VARCHAR2,
        player_position VARCHAR2,
        player_team_id NUMBER
    );
    
    PROCEDURE REMOVE_PLAYER_FROM_TEAM(
        id_player NUMBER
    );    
END PLAYER_PACKAGE;

/
