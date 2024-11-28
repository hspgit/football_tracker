DROP PROCEDURE IF EXISTS get_team_players_for_season;
DELIMITER $$

CREATE PROCEDURE get_team_players_for_season (
    IN input_team_name VARCHAR(128),
    IN input_season_year INT
)
BEGIN
    SELECT
        *
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

DROP PROCEDURE IF EXISTS get_stadiums_by_teams_list;
DELIMITER $$

CREATE PROCEDURE get_stadiums_by_teams_list (
    IN team_names_list VARCHAR(1000)
)
BEGIN
    SELECT
        *
    FROM
        stadium
    WHERE
        FIND_IN_SET(Team_Name, team_names_list);
END $$

DELIMITER ;

CALL get_stadiums_by_teams_list('Manchester United,Arsenal,Chelsea');
CALL get_stadiums_by_teams_list('Manchester City,Arsenal,Chelsea');


DROP PROCEDURE IF EXISTS insert_game;
DELIMITER $$
CREATE PROCEDURE insert_game(
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_stadium_name VARCHAR(128),
    IN in_match_date DATE,
    IN in_attendance INT
)
BEGIN
    DECLARE stadium_capacity INT;
    DECLARE game_exists INT;

    -- Check if a game already exists for the given teams and date
    SELECT COUNT(*) INTO game_exists
    FROM game
    WHERE team_1_name = in_team_1_name
      AND team_2_name = in_team_2_name
      AND match_date = in_match_date;

    -- If the game already exists, raise an error
    IF game_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A game already exists for this date with the same teams.';
    END IF;

    -- Retrieve the capacity of the specified stadium
    SELECT capacity INTO stadium_capacity
    FROM stadium
    WHERE name = in_stadium_name;

    -- Check if the stadium exists and if attendance is valid
    IF stadium_capacity IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stadium not found.';
    ELSEIF in_attendance > stadium_capacity THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Attendance exceeds stadium capacity.';
    END IF;

    -- Insert the game record
    INSERT INTO game(team_1_name, team_2_name, stadium_name, match_date, attendance)
    VALUES (in_team_1_name, in_team_2_name, in_stadium_name, in_match_date, in_attendance);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_player_stat;
DELIMITER $$
CREATE PROCEDURE insert_player_stat(
    IN in_player_id INT,
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_match_date DATE,
    IN in_goals_scored INT,
    IN in_yellow_card INT,
    IN in_red_card INT
)
BEGIN
    DECLARE game_exists INT;

    -- Check if a game already exists for the given teams and date
    SELECT COUNT(*) INTO game_exists
    FROM player_stat
    WHERE player_id = in_player_id
        AND team_1_name = in_team_1_name
        AND team_2_name = in_team_2_name
        AND match_date = in_match_date;

    -- If the game already exists, raise an error
    IF game_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A player stat already exists for this date with the same teams.';
    END IF;

    INSERT INTO player_stat(player_id,team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card)
    VALUES (in_player_id, in_team_1_name, in_team_2_name, in_match_date, in_goals_scored, in_yellow_card, in_red_card);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_league_team_stats;
DELIMITER $$

CREATE PROCEDURE update_league_team_stats(
    IN p_team_1_name VARCHAR(128),
    IN p_team_2_name VARCHAR(128),
    IN p_match_date DATETIME
)
BEGIN
    DECLARE team_1_goals INT DEFAULT 0;
    DECLARE team_2_goals INT DEFAULT 0;
    DECLARE calc_season INT;
    DECLARE var_league_name VARCHAR(128);

    -- Determine season
    SET calc_season = YEAR(p_match_date);


    -- Get league name (both teams share the same league)
    SELECT lt.league_name
    INTO var_league_name
    FROM league_team lt
    WHERE lt.team_name = p_team_1_name AND lt.season = calc_season;

    -- Calculate goals scored by team_1
    SELECT SUM(ps.goals_scored)
    INTO team_1_goals
    FROM player_stat ps
             JOIN player_team pt ON ps.player_id = pt.player_id
    WHERE pt.team_name = p_team_1_name AND pt.season = calc_season
      AND ps.team_1_name = p_team_1_name AND ps.team_2_name = p_team_2_name
      AND ps.match_date = p_match_date;

    -- Calculate goals scored by team_2
    SELECT SUM(ps.goals_scored)
    INTO team_2_goals
    FROM player_stat ps
             JOIN player_team pt ON ps.player_id = pt.player_id
    WHERE pt.team_name = p_team_2_name AND pt.season = calc_season
      AND ps.team_1_name = p_team_1_name AND ps.team_2_name = p_team_2_name
      AND ps.match_date = p_match_date;

    -- Update league_team stats for team_1
    UPDATE league_team
    SET
        matches_played = matches_played + 1,
        wins = wins + IF(team_1_goals > team_2_goals, 1, 0),
        losses = losses + IF(team_1_goals < team_2_goals, 1, 0),
        goals_scored = goals_scored + team_1_goals,
        goals_conceded = goals_conceded + team_2_goals
    WHERE
        team_name = p_team_1_name AND var_league_name = league_name AND season = calc_season;

    -- Update league_team stats for team_2
    UPDATE league_team
    SET
        matches_played = matches_played + 1,
        wins = wins + IF(team_2_goals > team_1_goals, 1, 0),
        losses = losses + IF(team_2_goals < team_1_goals, 1, 0),
        goals_scored = goals_scored + team_2_goals,
        goals_conceded = goals_conceded + team_1_goals
    WHERE
        team_name = p_team_2_name AND var_league_name = league_name AND season = calc_season;

END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS get_league_table;
DELIMITER $$

CREATE PROCEDURE get_league_table(
    IN in_league_name VARCHAR(128),
    IN in_season INT,
    IN sortColumn VARCHAR(128),
    IN sortOrder VARCHAR(4)
)
BEGIN
    -- Set default values for sortColumn and sortOrder if they are NULL or empty
    IF sortColumn IS NULL OR sortColumn = '' THEN
        SET sortColumn = 'points';
    END IF;

    IF sortOrder IS NULL OR sortOrder = '' THEN
        SET sortOrder = 'DESC';
    END IF;

    -- Validate sortColumn and sortOrder
    IF sortColumn NOT IN ('matches_played', 'points', 'goal_difference', 'team_name', 'wins', 'losses', 'goals_scored', 'goals_conceded', 'draws') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid sortColumn';
    END IF;

    IF sortOrder NOT IN ('ASC', 'DESC') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid sortOrder';
    END IF;

    -- Build dynamic query
    SET @sql_query = CONCAT(
            'SELECT ',
            'league_name, team_name, season, matches_played, wins, losses, goals_scored, goals_conceded, ',
            '(wins * 3 + losses * 0 + (matches_played - wins - losses) * 1) AS points, ',
            '(goals_scored - goals_conceded) AS goal_difference, ',
            '(matches_played - wins - losses) AS draws ',
            'FROM league_team ',
            'WHERE league_name = "', in_league_name, '" ',
            'AND season = ', in_season, ' ',
                'ORDER BY ', sortColumn, ' ', sortOrder
                     );

    -- Prepare and execute the dynamic SQL
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END $$

DELIMITER ;

CALL get_league_table('La Liga', 2024, NULL, NULL);


# DROP PROCEDURE IF EXISTS get_all_broadcasters;
# DELIMITER $$
# CREATE PROCEDURE get_all_broadcasters()
# BEGIN
#         SELECT
#             *
#         FROM
#              broadcaster;
# end $$
#
# DELIMITER ;
#
# CALL get_all_broadcasters;



