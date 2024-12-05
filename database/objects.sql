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

DROP PROCEDURE IF EXISTS get_all_filtered_sponsors;
DELIMITER $$

CREATE PROCEDURE get_all_filtered_sponsors (
    IN league_names_list VARCHAR(1000)
)
BEGIN
    IF league_names_list = '' THEN
        -- Return all sponsors if the input list is empty
        SELECT sponsor.*
        FROM sponsor
        GROUP BY sponsor.name;
    ELSE
        -- Return sponsors filtered by league names
        SELECT sponsor.*
        FROM sponsor
                 JOIN sponsor_league ON sponsor.name = sponsor_league.sponsor_name
        WHERE FIND_IN_SET(League_name, league_names_list)
        GROUP BY sponsor.name;
    END IF;
END $$

DELIMITER ;

CALL get_all_filtered_sponsors('');
CALL get_all_filtered_sponsors('Premier League,La Liga');
CALL get_all_filtered_sponsors('La Liga');


DROP PROCEDURE IF EXISTS delete_sponsor;
DELIMITER $$

CREATE PROCEDURE delete_sponsor(
    IN in_sponsor_name VARCHAR(128)
)
BEGIN
    -- Delete the sponsor
    DELETE FROM sponsor
    WHERE sponsor.name = in_sponsor_name;

END $$

DELIMITER ;


CALL delete_sponsor('Rakuten');


DROP PROCEDURE IF EXISTS get_sponsor_league_details;
DELIMITER $$

CREATE PROCEDURE get_sponsor_league_details(
    IN in_sponsor_name VARCHAR(128)
)
BEGIN
    SELECT
        *
    FROM
        sponsor_league
    WHERE
        sponsor_name = in_sponsor_name;

END $$
DELIMITER ;

CALL get_sponsor_league_details('Rakuten');

DROP PROCEDURE IF EXISTS get_sponsor_league_details_for_league;
DELIMITER $$

CREATE PROCEDURE get_sponsor_league_details_for_league(
    IN in_league_name VARCHAR(128)
)
BEGIN
    SELECT
        *
    FROM
        sponsor_league
    WHERE
        league_name = in_league_name;

END $$
DELIMITER ;

CALL get_sponsor_league_details_for_league('La Liga');

DROP PROCEDURE IF EXISTS update_sponsor_league_details;
DELIMITER $$

CREATE PROCEDURE update_sponsor_league_details(
    IN in_sponsor_name VARCHAR(128),
    IN in_league_name VARCHAR(128),
    IN in_sponsorship_amount BIGINT
)
BEGIN
    -- Check if the row exists
    IF EXISTS (
        SELECT 1
        FROM sponsor_league
        WHERE sponsor_name = in_sponsor_name
          AND league_name = in_league_name
    ) THEN
        -- Update the sponsorship amount
        UPDATE sponsor_league
        SET sponsorship_amount = in_sponsorship_amount
        WHERE sponsor_name = in_sponsor_name
          AND league_name = in_league_name;
    ELSE
        -- Insert a new row
        INSERT INTO sponsor_league (sponsor_name, league_name, sponsorship_amount)
        VALUES (in_sponsor_name, in_league_name, in_sponsorship_amount);
    END IF;
END $$

DELIMITER ;

CALL update_sponsor_league_details('Rakuten', 'Premier League', 99900);

DROP PROCEDURE IF EXISTS add_sponsor;
DELIMITER $$

CREATE PROCEDURE add_sponsor(
    IN in_sponsor_name VARCHAR(128),
    IN in_sponsor_country VARCHAR(128),
    IN in_sponsor_website VARCHAR(128),
    IN in_sponsor_industry VARCHAR(128)
)
BEGIN
    -- Check if mandatory fields are NULL
    IF in_sponsor_name IS NULL OR in_sponsor_country IS NULL OR in_sponsor_website IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sponsor name, country, and industry cannot be NULL';
    ELSE
        -- Insert sponsor details into the sponsor table
        INSERT INTO sponsor (name, country, industry, website_url)
        VALUES (in_sponsor_name, in_sponsor_country, in_sponsor_industry, in_sponsor_website);
    END IF;
END $$

DELIMITER ;

CALL add_sponsor('ChartJS', 'United States', 'https://www.chartjs.org', 'Software Development');
CALL update_sponsor_league_details('ChartJS', 'Major League Soccer', 9990000);


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

    IF in_team_1_name = in_team_2_name THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'A team cannot play a game against itself.';
    END IF;

    -- Check if a game already exists for the given teams and date
    SELECT COUNT(*) INTO game_exists
    FROM game
    WHERE team_1_name = in_team_2_name
      AND team_2_name = in_team_1_name
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
    IN p_match_date DATE
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

    -- Calculate goals scored by both teams in a single query
    SELECT
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_1_name THEN ps.goals_scored END), 0) AS team_1_goals,
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_2_name THEN ps.goals_scored END), 0) AS team_2_goals
    INTO team_1_goals, team_2_goals
    FROM player_stat ps
             JOIN player_team pt ON ps.player_id = pt.player_id
    WHERE pt.season = calc_season
      AND ps.team_1_name = p_team_1_name
      AND ps.team_2_name = p_team_2_name
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
        team_name = p_team_1_name
      AND var_league_name = league_name
      AND season = calc_season;

    -- Update league_team stats for team_2
    UPDATE league_team
    SET
        matches_played = matches_played + 1,
        wins = wins + IF(team_2_goals > team_1_goals, 1, 0),
        losses = losses + IF(team_2_goals < team_1_goals, 1, 0),
        goals_scored = goals_scored + team_2_goals,
        goals_conceded = goals_conceded + team_1_goals
    WHERE
        team_name = p_team_2_name
      AND var_league_name = league_name
      AND season = calc_season;

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

CALL get_league_table('La Liga', 2022, NULL, NULL);

DROP PROCEDURE IF EXISTS get_league_top_stat;
DELIMITER $$

CREATE PROCEDURE get_league_top_stat(
    IN in_league_name VARCHAR(126),
    IN in_season INT,
    IN stat_name VARCHAR(50)
)
BEGIN
    SET @stat_query = CONCAT(
            'SELECT ',
            '    ps.player_id, ',
            '    p.first_name, ',
            '    p.last_name, ',
            '    p.position_abb, ',
            '    pt.team_name, ',
            '    SUM(ps.', stat_name, ') AS total_stat ',
            'FROM ',
            '    player_stat ps ',
            'JOIN ',
            '    player p ON ps.player_id = p.player_id ',
            'JOIN ',
            '    player_team pt ON ps.player_id = pt.player_id ',
            'JOIN ',
            '    league_team lt ON lt.team_name = pt.team_name ',
            'WHERE ',
            '    YEAR(ps.match_date) = ', in_season, ' ',
            '    AND pt.season = ', in_season, ' ',
            '    AND lt.season = ', in_season, ' ',
            '    AND lt.league_name = "', in_league_name, '" ',
            'GROUP BY ',
            '    ps.player_id, ',
            '    p.first_name, ',
            '    p.last_name, ',
            '    p.position_abb, ',
            '    pt.team_name ',
            'ORDER BY ',
            '    total_stat DESC ',
            'LIMIT 5'
                      );

    PREPARE stmt FROM @stat_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$

DELIMITER ;

CALL get_league_top_stat('La Liga', 2022, 'goals_scored'); -- Top scorers
CALL get_league_top_stat('La Liga', 2022, 'yellow_card');  -- Most yellow cards
CALL get_league_top_stat('La Liga', 2022, 'red_card');     -- Most red cards


DROP PROCEDURE IF EXISTS search_player;
DELIMITER $$

CREATE PROCEDURE search_player(
    in_player_name VARCHAR(128)
)
BEGIN
    SELECT *
    FROM player
    WHERE first_name LIKE CONCAT('%', in_player_name, '%')
       OR last_name LIKE CONCAT('%', in_player_name, '%')
    LIMIT 10;
END $$

DELIMITER ;

CALL search_player('ede');


DROP PROCEDURE IF EXISTS player_stats_across_seasons;
DELIMITER $$

CREATE PROCEDURE player_stats_across_seasons(
    IN in_player_id INT,
    IN in_seasons TEXT
)
BEGIN
    DROP TEMPORARY TABLE IF EXISTS season_list;
    -- Create a temporary table to store the list of seasons
    CREATE TEMPORARY TABLE season_list (season_year INT);

    -- Prepare the dynamic SQL to insert the seasons into the temporary table
    SET @sql = CONCAT(
            'INSERT INTO season_list (season_year) VALUES (',
            REPLACE(in_seasons, ',', '), ('),
            ')'
               );

    -- Execute the dynamic SQL
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Query stats for the specified seasons
    SELECT
        ps.player_id,
        sl.season_year AS season,
        COALESCE(SUM(ps.goals_scored), 0) AS total_goals,
        COALESCE(SUM(ps.yellow_card), 0) AS total_yellows,
        COALESCE(SUM(ps.red_card), 0) AS total_reds,
        pt.team_name,
        lt.league_name
    FROM
        season_list sl
    LEFT JOIN
        player_team pt ON pt.player_id = in_player_id AND pt.season = sl.season_year
    LEFT JOIN
        league_team lt ON lt.team_name = pt.team_name AND lt.season = sl.season_year
    LEFT JOIN
        player_stat ps ON ps.player_id = in_player_id AND YEAR(ps.match_date) = sl.season_year
    GROUP BY
        ps.player_id, sl.season_year, pt.team_name, lt.league_name;

    -- Drop the temporary table
    DROP TEMPORARY TABLE season_list;
END $$

DELIMITER ;

CALL player_stats_across_seasons(328, '2022,2023,2024');
CALL player_stats_across_seasons(318, '2022,2023,2024');
CALL player_stats_across_seasons(328, '2022');
CALL player_stats_across_seasons(340, '2022');


DROP PROCEDURE IF EXISTS search_team;
DELIMITER $$

CREATE PROCEDURE search_team(
    IN in_team_name VARCHAR(128)
)
BEGIN
    SELECT *
    FROM team
    WHERE team.name LIKE CONCAT('%', in_team_name, '%')
    LIMIT 10;
END $$

DELIMITER ;

CALL search_team('Ars');

DROP PROCEDURE IF EXISTS get_team_details;
DELIMITER $$

CREATE PROCEDURE get_team_details(
    IN in_team_name VARCHAR(128),
    IN in_season INT
)
BEGIN
    IF in_season IS NULL OR in_season = '' THEN
        SET in_season = 2024;
    END IF;

    SELECT
        m.*,
        lt.league_name,
        s.name as stadium_name,
        SUM(p.market_value) AS total_team_value
    FROM manager m
            LEFT JOIN player_team pt ON m.team_name = pt.team_name
            LEFT JOIN player p ON pt.player_id = p.player_id
            LEFT JOIN league_team lt ON lt.team_name = m.team_name
            LEFT JOIN stadium s ON s.team_name = m.team_name
    WHERE m.team_name = in_team_name
      AND (pt.season = in_season OR pt.season IS NULL)
    GROUP BY m.manager_id, lt.league_name, s.name;
END $$

DELIMITER ;

-- Example usage
CALL get_team_details('Barcelona', 2024);


DROP PROCEDURE IF EXISTS get_team_games;
DELIMITER $$

CREATE PROCEDURE get_team_games(
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_season INT
)
BEGIN
    SELECT
        *
    FROM
        game g
    WHERE
        g.team_1_name IN (in_team_1_name, in_team_2_name)
    AND
        g.team_2_name IN (in_team_1_name, in_team_2_name)
    AND
        YEAR(g.match_date) = in_season;
END $$

DELIMITER ;

CALL get_team_games('Arsenal', 'Aston Villa', 2024);

DROP PROCEDURE IF EXISTS get_player_stats_for_game;
DELIMITER $$

CREATE PROCEDURE get_player_stats_for_game(
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_match_date DATE
)
BEGIN
   SELECT
       *
    FROM
        player_stat
    WHERE
        team_1_name = in_team_1_name
    AND
        team_2_name = in_team_2_name
    AND
        match_date = in_match_date;
END $$

DELIMITER ;

CALL get_player_stats_for_game('Arsenal', 'Aston Villa', '2024-11-01');



DROP PROCEDURE IF EXISTS update_player_stats;
DELIMITER $$

CREATE PROCEDURE update_player_stats(
    IN in_player_id INT,
    IN in_team_1_name VARCHAR(128),
    IN in_team_2_name VARCHAR(128),
    IN in_match_date DATE,
    IN in_goals_scored INT,
    IN in_yellow_card INT,
    IN in_red_card INT
)
BEGIN
    DECLARE stat_exists INT;

    -- Check if a player stat exists for the given player, teams, and date
    SELECT COUNT(*) INTO stat_exists
    FROM player_stat
    WHERE player_id = in_player_id
      AND team_1_name = in_team_1_name
      AND team_2_name = in_team_2_name
      AND match_date = in_match_date;

    -- If the player stat exists, update it
    IF stat_exists > 0 THEN
        UPDATE player_stat
        SET
            goals_scored = in_goals_scored,
            yellow_card = in_yellow_card,
            red_card = in_red_card
        WHERE player_id = in_player_id
          AND team_1_name = in_team_1_name
          AND team_2_name = in_team_2_name
          AND match_date = in_match_date;
    ELSE
        -- If no existing stat, insert a new one
        INSERT INTO player_stat(player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card)
        VALUES (in_player_id, in_team_1_name, in_team_2_name, in_match_date, in_goals_scored, in_yellow_card, in_red_card);
    END IF;
END $$

DELIMITER ;

-- ADD TEAM PROCEDURES
DROP PROCEDURE IF EXISTS insert_team;
DELIMITER //

CREATE PROCEDURE insert_team(
    IN p_team_name VARCHAR(128),
    IN p_established_year INT
)
BEGIN
    INSERT INTO team (name, established_year)
    VALUES (p_team_name, p_established_year);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS insert_stadium;
DELIMITER //
CREATE PROCEDURE insert_stadium(
    IN p_stadium_name VARCHAR(128),
    IN p_city VARCHAR(128),
    IN p_zip_code VARCHAR(20),
    IN p_capacity INT,
    IN p_team_name VARCHAR(128)
)
BEGIN
    INSERT INTO stadium (name, city, zip_code, capacity, team_name)
    VALUES (p_stadium_name, p_city, p_zip_code, p_capacity, p_team_name);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS insert_league_team;
DELIMITER //

CREATE PROCEDURE insert_league_team(
    IN p_league_name VARCHAR(128),
    IN p_team_name VARCHAR(128),
    IN p_season INT
)
BEGIN
    INSERT INTO league_team (league_name, team_name, season)
    VALUES (p_league_name, p_team_name, p_season);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_player;
DELIMITER //

CREATE PROCEDURE insert_player(
    IN p_first_name VARCHAR(128),
    IN p_last_name VARCHAR(128),
    IN p_dob DATE,
    IN p_nationality VARCHAR(128),
    IN p_market_value DECIMAL(15,2),
    IN p_jersey_number INT,
    IN p_position_abb VARCHAR(10)
)
BEGIN
    INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
    VALUES (p_first_name, p_last_name, p_dob, p_nationality, p_market_value, p_jersey_number, p_position_abb);
END //

DELIMITER ;
DROP PROCEDURE IF EXISTS insert_player_team;
DELIMITER //

CREATE PROCEDURE insert_player_team(
    IN p_player_id INT,
    IN p_team_name VARCHAR(128),
    IN p_season INT
)
BEGIN
    INSERT INTO player_team (player_id, team_name, season)
    VALUES (p_player_id, p_team_name, p_season);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_manager;
DELIMITER //
CREATE PROCEDURE insert_manager(
    IN p_first_name VARCHAR(128),
    IN p_last_name VARCHAR(128),
    IN p_dob DATE,
    IN p_nationality VARCHAR(128),
    IN p_team_name VARCHAR(128)
)
BEGIN
    INSERT INTO manager (first_name, last_name, dob, nationality, team_name)
    VALUES (p_first_name, p_last_name, p_dob, p_nationality, p_team_name);
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS get_latest_team_by_player_id;
DELIMITER $$

CREATE PROCEDURE get_latest_team_by_player_id(
    IN in_player_id INT
)
BEGIN
    DECLARE v_team_name VARCHAR(128);
    DECLARE v_season INT;

    -- Check 2024 season first
    SELECT team_name, season INTO v_team_name, v_season
    FROM player_team
    WHERE player_id = in_player_id AND season = 2024
    LIMIT 1;

    -- If no team found for 2024, check 2023
    IF v_team_name IS NULL THEN
        SELECT team_name, season INTO v_team_name, v_season
        FROM player_team
        WHERE player_id = in_player_id AND season = 2023
        LIMIT 1;
    END IF;

    -- If no team found for 2023, check 2022
    IF v_team_name IS NULL THEN
        SELECT team_name, season INTO v_team_name, v_season
        FROM player_team
        WHERE player_id = in_player_id AND season = 2022
        LIMIT 1;
    END IF;

    -- Return the found team name and season
    SELECT v_team_name AS team_name, v_season AS season;
END $$

DELIMITER ;

CALL get_latest_team_by_player_id(123);
