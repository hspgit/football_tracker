-- Functions, Procedures, Triggers, Prepared Statemetnts
use football_tracker;

DROP Procedure if exists get_all_teams;
DELIMITER $$

CREATE PROCEDURE get_all_teams()
BEGIN
    SELECT * FROM team;
END $$

DELIMITER ;

CALL get_all_teams();

DELIMITER //

CREATE TRIGGER check_teams_not_equal
BEFORE INSERT ON game
FOR EACH ROW
BEGIN
    IF NEW.team_1_name = NEW.team_2_name THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Team 1 and Team 2 must be different';
    END IF;
END; //

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
    DECLARE league_name VARCHAR(128);

    -- Determine season
    SET calc_season = YEAR(p_match_date);


    -- Get league name (both teams share the same league)
    SELECT lt.league_name
    INTO league_name
    FROM league_team lt
    WHERE lt.team_name = p_team_1_name AND lt.season = calc_season
    LIMIT 1;

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
        team_name = p_team_1_name AND league_name = league_name AND season = calc_season;

    -- Update league_team stats for team_2
    UPDATE league_team
    SET 
        matches_played = matches_played + 1,
        wins = wins + IF(team_2_goals > team_1_goals, 1, 0),
        losses = losses + IF(team_2_goals < team_1_goals, 1, 0),
        goals_scored = goals_scored + team_2_goals,
        goals_conceded = goals_conceded + team_1_goals
    WHERE 
        team_name = p_team_2_name AND league_name = league_name AND season = calc_season;

END $$
DELIMITER ;


SELECT SUM(ps.goals_scored) AS goals_scored
FROM player_stat ps
JOIN player_team pt ON ps.player_id = pt.player_id
WHERE pt.team_name = 'Arsenal' AND pt.season = 2022
  AND ps.team_1_name = 'Arsenal' AND ps.team_2_name = 'Manchester City'
  AND ps.match_date = '2022-01-01 15:00:00';
  
SELECT SUM(ps.goals_scored) AS goals_scored
FROM player_stat ps
JOIN player_team pt ON ps.player_id = pt.player_id
WHERE pt.team_name = 'Manchester City' AND pt.season = 2022
	AND ps.team_1_name = 'Arsenal' AND ps.team_2_name = 'Manchester City'
	AND ps.match_date = '2022-01-01 15:00:00';
    
SELECT league_name
    FROM league_team
    WHERE team_name = 'Manchester City' AND season = 2022
    LIMIT 1;    
    
    
-- Check if teams exist in league_team for the correct season
SELECT * FROM league_team 
WHERE team_name IN ('Arsenal', 'Manchester City') 
AND season = 2022;

-- Check if players exist in player_team for the correct season
SELECT * FROM player_team 
WHERE player_id IN (19, 20, 6, 11, 9) 
AND season = 2022;    

CREATE TABLE debug_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELETE FROM `football_tracker`.`game` WHERE (`team_1_name` = 'Arsenal') and (`team_2_name` = 'Manchester City') and (`match_date` = '2022-01-01 15:00:00');

UPDATE `football_tracker`.`league_team` SET `matches_played` = '0', `wins` = '0', `losses` = '0', `goals_scored` = '0', `goals_conceded` = '0' WHERE (`league_name` = 'Premier League') and (`team_name` = 'Arsenal') and (`season` = '2022');
UPDATE `football_tracker`.`league_team` SET `matches_played` = '0', `wins` = '0', `losses` = '0', `goals_scored` = '0', `goals_conceded` = '0' WHERE (`league_name` = 'Premier League') and (`team_name` = 'Manchester City') and (`season` = '2022');


CALL update_league_team_stats('Arsenal', 'Manchester City', '2022-01-01 15:00:00');
SELECT * FROM football_tracker.league_team where season = 2022 order by matches_played DESC;
-- ----------------------------- ----------------------------- ----------------------------- ----------------------------- ----------------------------- ---------------------------
-- ----------------------------- ----------------------------- ----------------------------- ----------------------------- ----------------------------- ---------------------------
-- ----------------------------- ----------------------------- ----------------------------- ----------------------------- ----------------------------- ---------------------------
INSERT INTO game (team_1_name, team_2_name, team_1_goals, team_2_goals, stadium_name, broadcaster_channel_name, broadcaster_commentator, match_date, attendance) VALUES
('Arsenal', 'Manchester City', 1, 2, 'Emirates Stadium', 'BBC Sport', 'Gary Lineker', '2022-01-01 15:00:00', 59757);   

-- Flipped player stats with Arsenal as team_2 and Manchester City as team_1
INSERT INTO player_stat (player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card) VALUES
 (19, 'Manchester City', 'Arsenal', '2023-01-01 15:00:00', 2, 1, 0),  -- Saka
 (20, 'Manchester City', 'Arsenal', '2023-01-01 15:00:00', 1, 0, 1),  -- Gabriel
 (6,  'Manchester City', 'Arsenal', '2023-01-01 15:00:00', 1, 1, 0),  -- Rodri
 (11, 'Manchester City', 'Arsenal', '2023-01-01 15:00:00', 1, 0, 0),  -- Haaland
 (9,  'Manchester City', 'Arsenal', '2023-01-01 15:00:00', 1, 1, 0);  -- Bernardo Silva
 
 SELECT * FROM player_stat;
 
 -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`football_tracker`.`player_stat`, CONSTRAINT `player_stat_ibfk_2` FOREIGN KEY (`team_1_name`, `team_2_name`, `match_date`) REFERENCES `game` (`team_1_name`, `team_2_name`, `match_date`) ON DEL)
-- 18:07:23	INSERT INTO player_stat (player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card) VALUES  (19, 'Arsenal', 'Manchester City', '2023-01-01 15:00:00', 2, 1, 0), -- Gabriel stats  (20, 'Arsenal', 'Manchester City', '2023-01-01 15:00:00', 1, 0, 1), -- Rodri stats  (6, 'Arsenal', 'Manchester City', '2023-01-01 15:00:00', 1, 1, 0), -- Haaland stats  (11, 'Arsenal', 'Manchester City', '2023-01-01 15:00:00', 1, 0, 0), -- Bernardo Silva stats  (9, 'Arsenal', 'Manchester City', '2023-01-01 15:00:00', 1, 1, 0)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`football_tracker`.`player_stat`, CONSTRAINT `player_stat_ibfk_2` FOREIGN KEY (`team_1_name`, `team_2_name`, `match_date`) REFERENCES `game` (`team_1_name`, `team_2_name`, `match_date`) ON DEL)	0.0017 sec

 CALL update_league_team_stats('Manchester City', 'Arsenal', '2023-01-01 15:00:00');
SELECT * FROM football_tracker.league_team where season = 2023 order by matches_played DESC;



DELIMITER $$

CREATE PROCEDURE get_league_table(
    IN in_league_name VARCHAR(128),
    IN in_season INT,
    IN sortColumnsAndOrders VARCHAR(512) -- Single string containing columns and their sort orders
)
BEGIN
    -- Set default sorting if no input is provided
    IF sortColumnsAndOrders IS NULL OR sortColumnsAndOrders = '' THEN
        SET sortColumnsAndOrders = 'points DESC'; -- Default to sorting by points in descending order
    END IF;

    -- Validate the sortColumnsAndOrders input (basic validation example)
    -- NOTE: Stronger validation may require splitting and checking each column and order individually.
    IF sortColumnsAndOrders NOT REGEXP '^[a-zA-Z0-9_, ]+(ASC|DESC)?$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid sortColumnsAndOrders';
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
            'ORDER BY ', sortColumnsAndOrders -- Add dynamic sorting
                     );

    -- Prepare and execute the dynamic SQL
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END $$

DELIMITER ;

CALL get_league_table('Premier League', 2024, 'points DESC, goal_difference ASC');
CALL get_league_table('Premier League', 2024, 'team_name ASC, matches_played DESC');
CALL get_league_table('Premier League', 2024, NULL);





DROP PROCEDURE IF EXISTS get_league_table_new;
DELIMITER $$

CREATE PROCEDURE get_league_table_new(
    IN in_league_name VARCHAR(128),
    IN in_season INT,
    IN sortColumn VARCHAR(128),
    IN sortOrder VARCHAR(4),
    OUT out_league_name VARCHAR(128),
    OUT out_team_name VARCHAR(128),
    OUT out_season INT,
    OUT out_matches_played INT,
    OUT out_wins INT,
    OUT out_losses INT,
    OUT out_goals_scored INT,
    OUT out_goals_conceded INT,
    OUT out_points INT,
    OUT out_goal_difference INT,
    OUT out_draws INT
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

    -- Build dynamic query for the league table
    SET @sql_query = CONCAT(
            'SELECT league_name, team_name, season, matches_played, wins, losses, goals_scored, goals_conceded, ',
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

    -- Fetch the first result and assign to OUT parameters
    SELECT
        league_name,
        team_name,
        season,
        matches_played,
        wins,
        losses,
        goals_scored,
        goals_conceded,
        (wins * 3 + losses * 0 + (matches_played - wins - losses) * 1) AS points,
        (goals_scored - goals_conceded) AS goal_difference,
        (matches_played - wins - losses) AS draws
    INTO
        out_league_name,
        out_team_name,
        out_season,
        out_matches_played,
        out_wins,
        out_losses,
        out_goals_scored,
        out_goals_conceded,
        out_points,
        out_goal_difference,
        out_draws
    FROM league_team
    WHERE league_name = in_league_name AND season = in_season
    ORDER BY points DESC, goal_difference DESC
    LIMIT 1;  -- Optional: Limit to a single team if only one team should be returned
END $$

DELIMITER ;
# CALL get_league_table_new('La Liga', 2022, NULL, NULL);


DROP PROCEDURE IF EXISTS get_team_rank;
DELIMITER $$
CREATE PROCEDURE get_team_rank(
    IN in_league_name VARCHAR(128),
    IN in_season INT,
    IN in_team_name VARCHAR(128),
    OUT team_rank INT,
    OUT out_league_name VARCHAR(128),
    OUT out_team_name VARCHAR(128),
    OUT out_season INT,
    OUT out_matches_played INT,
    OUT out_wins INT,
    OUT out_losses INT,
    OUT out_goals_scored INT,
    OUT out_goals_conceded INT,
    OUT out_points INT,
    OUT out_goal_difference INT,
    OUT out_draws INT
)
BEGIN
    DECLARE rank_counter INT DEFAULT 1;
    DECLARE found_team BOOLEAN DEFAULT FALSE;

    -- Loop through the league table and calculate the rank
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR
        SELECT
            league_name, team_name, season, matches_played, wins, losses, goals_scored, goals_conceded,
            (wins * 3 + losses * 0 + (matches_played - wins - losses) * 1) AS points,
            (goals_scored - goals_conceded) AS goal_difference,
            (matches_played - wins - losses) AS draws
        FROM league_team
        WHERE league_name = in_league_name AND season = in_season
        ORDER BY points DESC, goal_difference DESC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;

    -- Loop through each team in the result set
    read_loop: LOOP
        FETCH cur INTO
            out_league_name, out_team_name, out_season, out_matches_played,
            out_wins, out_losses, out_goals_scored, out_goals_conceded,
            out_points, out_goal_difference, out_draws;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if this is the team we're looking for
        IF in_team_name = out_team_name THEN
            SET team_rank = rank_counter;
            SET found_team = TRUE;
        END IF;

        SET rank_counter = rank_counter + 1;
    END LOOP;

    -- Close the cursor
    CLOSE cur;

    -- If the team is not found, set the rank to 0 (or handle as needed)
    IF NOT found_team THEN
        SET team_rank = 0;
    END IF;

END $$

DELIMITER ;

-- Example to call the get_team_rank procedure
CALL get_team_rank('La Liga', 2022, 'Barcelona', @team_rank,
                   @league_name, @team_name, @season, @matches_played,
                   @wins, @losses, @goals_scored, @goals_conceded,
                   @points, @goal_difference, @draws);

-- Retrieve the values
SELECT @team_rank, @league_name, @team_name, @season, @matches_played,
       @wins, @losses, @goals_scored, @goals_conceded,
       @points, @goal_difference, @draws;






SELECT
    COALESCE(SUM(CASE WHEN pt.team_name = 'Newcastle United' THEN ps.goals_scored END), 0) AS team_1_goals,
    COALESCE(SUM(CASE WHEN pt.team_name = 'Tottenham Hotspur' THEN ps.goals_scored END), 0) AS team_2_goals
FROM player_stat ps
         JOIN player_team pt ON ps.player_id = pt.player_id
WHERE pt.season = 2024
  AND ps.match_date = '2024-12-03'
  AND ps.team_1_name = 'Newcastle United'
  AND ps.team_2_name = 'Tottenham Hotspur';

SELECT COUNT(*)
FROM game
WHERE team_1_name = p_team_1_name
  AND team_2_name = p_team_2_name
  AND match_date = p_match_date;




DROP PROCEDURE IF EXISTS update_league_team_stats_new;
DELIMITER $$

CREATE PROCEDURE update_league_team_stats_new(
    IN p_team_1_name VARCHAR(128),
    IN p_team_2_name VARCHAR(128),
    IN p_match_date DATETIME
)
BEGIN
    DECLARE team_1_goals INT DEFAULT 0;
    DECLARE team_2_goals INT DEFAULT 0;
    DECLARE calc_season INT;
    DECLARE var_league_name VARCHAR(128);
    DECLARE old_team_1_goals INT DEFAULT 0;
    DECLARE old_team_2_goals INT DEFAULT 0;
    DECLARE game_exists INT;
    DECLARE operation_type ENUM('INSERT', 'UPDATE', 'DELETE');

    -- Determine the season
    SET calc_season = YEAR(p_match_date);

    -- Get the league name (both teams belong to the same league)
    SELECT lt.league_name
    INTO var_league_name
    FROM league_team lt
    WHERE lt.team_name = p_team_1_name AND lt.season = calc_season;

    -- Retrieve current game data from player_stat_log for the given match and teams
    SELECT
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_1_name THEN ps.goals_scored END), 0) AS team_1_goals,
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_2_name THEN ps.goals_scored END), 0) AS team_2_goals
    INTO team_1_goals, team_2_goals
    FROM player_stat ps
             JOIN player_team pt ON ps.player_id = pt.player_id
    WHERE pt.season = calc_season
      AND ps.match_date = p_match_date
      AND ps.team_1_name = p_team_1_name
      AND ps.team_2_name = p_team_2_name;

    -- Retrieve old goals (only for updates)
    SELECT
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_1_name THEN psl.goals_scored END), 0) AS old_team_1_goals,
        COALESCE(SUM(CASE WHEN pt.team_name = p_team_2_name THEN psl.goals_scored END), 0) AS old_team_2_goals
    INTO old_team_1_goals, old_team_2_goals
    FROM player_stat_log psl
             JOIN player_team pt ON psl.player_id = pt.player_id
    WHERE pt.season = calc_season
      AND psl.match_date = p_match_date
      AND psl.team_1_name = p_team_1_name
      AND psl.team_2_name = p_team_2_name
      AND psl.operation_type = 'UPDATE';

    -- Get the count of games in the game table
    SELECT COUNT(*)
    INTO game_exists
    FROM game
    WHERE team_1_name = p_team_1_name
      AND team_2_name = p_team_2_name
      AND match_date = p_match_date;

    -- Get the last operation_type from the player_stat_log
    SELECT operation_type
    INTO operation_type
    FROM player_stat_log
    WHERE match_date = p_match_date
      AND team_1_name = p_team_1_name
      AND team_2_name = p_team_2_name
    ORDER BY log_timestamp DESC
    LIMIT 1;

    -- Handle INSERT operation: Update stats if it's a new game
    IF game_exists = 0 THEN
        -- Logic for Team 1
        UPDATE league_team
        SET
            matches_played = matches_played + 1,
            wins = wins + IF(team_1_goals > team_2_goals, 1, 0),
            losses = losses + IF(team_1_goals < team_2_goals, 1, 0),
            goals_scored = goals_scored + team_1_goals,
            goals_conceded = goals_conceded + team_2_goals
        WHERE
            team_name = p_team_1_name
          AND league_name = var_league_name
          AND season = calc_season;

        -- Logic for Team 2
        UPDATE league_team
        SET
            matches_played = matches_played + 1,
            wins = wins + IF(team_2_goals > team_1_goals, 1, 0),
            losses = losses + IF(team_2_goals < team_1_goals, 1, 0),
            goals_scored = goals_scored + team_2_goals,
            goals_conceded = goals_conceded + team_1_goals
        WHERE
            team_name = p_team_2_name
          AND league_name = var_league_name
          AND season = calc_season;

        -- Handle UPDATE operation: Adjust the stats based on old and new goals
    ELSEIF game_exists = 1 THEN
        -- Update Team 1
        UPDATE league_team
        SET
            wins = wins +
                   CASE
                       WHEN team_1_goals > team_2_goals AND old_team_1_goals <= old_team_2_goals THEN 1
                       WHEN team_1_goals <= team_2_goals AND old_team_1_goals > old_team_2_goals THEN -1
                       ELSE 0
                       END,
            losses = losses +
                     CASE
                         WHEN team_1_goals < team_2_goals AND old_team_1_goals >= old_team_2_goals THEN 1
                         WHEN team_1_goals >= team_2_goals AND old_team_1_goals < old_team_2_goals THEN -1
                         ELSE 0
                         END,
            goals_scored = goals_scored + (team_1_goals - old_team_1_goals),
            goals_conceded = goals_conceded + (team_2_goals - old_team_2_goals)
        WHERE
            team_name = p_team_1_name
          AND league_name = var_league_name
          AND season = calc_season;

        -- Update Team 2
        UPDATE league_team
        SET
            wins = wins +
                   CASE
                       WHEN team_2_goals > team_1_goals AND old_team_2_goals <= old_team_1_goals THEN 1
                       WHEN team_2_goals <= team_1_goals AND old_team_2_goals > old_team_1_goals THEN -1
                       ELSE 0
                       END,
            losses = losses +
                     CASE
                         WHEN team_2_goals < team_1_goals AND old_team_2_goals >= old_team_1_goals THEN 1
                         WHEN team_2_goals >= team_1_goals AND old_team_2_goals < old_team_1_goals THEN -1
                         ELSE 0
                         END,
            goals_scored = goals_scored + (team_2_goals - old_team_2_goals),
            goals_conceded = goals_conceded + (team_1_goals - old_team_1_goals)
        WHERE
            team_name = p_team_2_name
          AND league_name = var_league_name
          AND season = calc_season;

        -- Handle DELETE operation: Revert the stats changes made earlier
    ELSEIF operation_type = 'DELETE' THEN
        -- Revert stats for Team 1
        UPDATE league_team
        SET
            matches_played = matches_played - 1,
            wins = wins - IF(old_team_1_goals > old_team_2_goals, 1, 0),
            losses = losses - IF(old_team_1_goals < old_team_2_goals, 1, 0),
            goals_scored = goals_scored - old_team_1_goals,
            goals_conceded = goals_conceded - old_team_2_goals
        WHERE
            team_name = p_team_1_name
          AND league_name = var_league_name
          AND season = calc_season;

        -- Revert stats for Team 2
        UPDATE league_team
        SET
            matches_played = matches_played - 1,
            wins = wins - IF(old_team_2_goals > old_team_1_goals, 1, 0),
            losses = losses - IF(old_team_2_goals < old_team_1_goals, 1, 0),
            goals_scored = goals_scored - old_team_2_goals,
            goals_conceded = goals_conceded - old_team_1_goals
        WHERE
            team_name = p_team_2_name
          AND league_name = var_league_name
          AND season = calc_season;

    END IF;

END $$
DELIMITER ;


DROP TABLE IF EXISTS player_stat_log;
CREATE TABLE player_stat_log (
                                 player_id INT,
                                 team_1_name VARCHAR(128),
                                 team_2_name VARCHAR(128),
                                 match_date DATE,
                                 goals_scored INT,
                                 yellow_card INT,
                                 red_card INT,
                                 operation_type ENUM('UPDATE', 'DELETE'),
                                 log_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
                                 PRIMARY KEY (player_id, team_1_name, team_2_name, match_date, log_timestamp)
);

DROP TRIGGER IF EXISTS before_player_stat_update;
DELIMITER $$
CREATE TRIGGER before_player_stat_update
    BEFORE UPDATE ON player_stat
    FOR EACH ROW
BEGIN
    INSERT INTO player_stat_log (
        player_id,
        team_1_name,
        team_2_name,
        match_date,
        goals_scored,
        yellow_card,
        red_card,
        operation_type
    )
    VALUES (
               OLD.player_id,
               OLD.team_1_name,
               OLD.team_2_name,
               OLD.match_date,
               OLD.goals_scored,
               OLD.yellow_card,
               OLD.red_card,
               'UPDATE'
           );
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS before_player_stat_delete;
DELIMITER $$
CREATE TRIGGER before_player_stat_delete
    BEFORE DELETE ON player_stat
    FOR EACH ROW
BEGIN
    INSERT INTO player_stat_log (
        player_id,
        team_1_name,
        team_2_name,
        match_date,
        goals_scored,
        yellow_card,
        red_card,
        operation_type
    )
    VALUES (
               OLD.player_id,
               OLD.team_1_name,
               OLD.team_2_name,
               OLD.match_date,
               OLD.goals_scored,
               OLD.yellow_card,
               OLD.red_card,
               'DELETE'
           );
END$$
DELIMITER ;

CALL update_league_team_stats_new('Portland Timbers', 'Seattle Sounders', '2023-02-07');












