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
BEFORE INSERT ON fixture
FOR EACH ROW
BEGIN
    IF NEW.team_1_name = NEW.team_2_name THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Team 1 and Team 2 must be different';
    END IF;
END; //

DELIMITER ;

Select * from player;

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
    SET calc_season = CASE 
        WHEN MONTH(p_match_date) > 7 THEN YEAR(p_match_date) + 1
        ELSE YEAR(p_match_date)
    END;

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



