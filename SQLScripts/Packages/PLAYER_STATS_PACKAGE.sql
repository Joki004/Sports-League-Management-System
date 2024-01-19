create or replace PACKAGE         "PLAYER_PACKAGE" AS 

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

    PROCEDURE PRINT_PLAYERS_FROM_TEAM(
        id_team NUMBER
    );

    FUNCTION CHECK_IF_TEAM_IS_FULL(
        id_team NUMBER
    )RETURN BOOLEAN;


END PLAYER_PACKAGE;