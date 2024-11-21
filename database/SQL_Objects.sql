DROP PROCEDURE IF EXISTS get_team_players_for_season;
DELIMITER $$

CREATE PROCEDURE get_team_players_for_season (
    IN input_team_name VARCHAR(128),
    IN input_season_year INT
)
BEGIN
    SELECT
        p.player_id AS player_id,
        p.first_name,
        p.last_name
    FROM
        player p
            INNER JOIN
        player_team pt ON p.player_id = pt.player_id
    WHERE
        pt.team_name = input_team_name AND
        pt.season = input_season_year;
END $$

DELIMITER ;

CALL get_team_players_for_season('Arsenal', 2023);

DROP PROCEDURE IF EXISTS get_all_leagues;
DELIMITER $$

CREATE PROCEDURE get_all_leagues ()
BEGIN
    SELECT
        l.name, l.country
    FROM
        league l;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS get_league_teams_for_season;
DELIMITER $$

CREATE PROCEDURE get_league_teams_for_season (
    IN input_league_name VARCHAR(128),
    IN input_season_year INT
)
BEGIN
    SELECT
        *
    FROM
        team t
            INNER JOIN
        league_team lt ON t.name = lt.team_name
    WHERE
        lt.league_name = input_league_name AND
        lt.season = input_season_year;
END $$

DELIMITER ;

CALL get_league_teams_for_season('Major League Soccer', 2024);

DROP PROCEDURE IF EXISTS get_all_stadiums;
DELIMITER $$

CREATE PROCEDURE get_all_stadiums (
)
BEGIN
    SELECT
        *
    FROM
        stadium;
END $$

DELIMITER ;

CALL get_all_stadiums();

DELIMITER $$

CREATE PROCEDURE get_stadiums_by_teams (
    IN team_1_name VARCHAR(255),
    IN team_2_name VARCHAR(255)
)
BEGIN
    SELECT
        *
    FROM
        stadium
    WHERE
        Team_Name = team_1_name OR Team_Name = team_2_name;
END $$

DELIMITER ;

-- Example call:
CALL get_stadiums_by_teams('Manchester United', 'Arsenal');