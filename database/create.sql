DROP DATABASE IF EXISTS football_tracker;
CREATE DATABASE football_tracker;
USE football_tracker;

CREATE TABLE team (
    name VARCHAR(128) PRIMARY KEY,
    established_year INT NOT NULL
);

CREATE TABLE league (
    name VARCHAR(128) PRIMARY KEY,
    country VARCHAR(128) NOT NULL
);

CREATE TABLE stadium (
    name VARCHAR(128) PRIMARY KEY,
    city VARCHAR(128) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    capacity INT NOT NULL DEFAULT 0,
    team_name VARCHAR(128) NOT NULL,
    FOREIGN KEY (team_name) REFERENCES team(name)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    UNIQUE (city, zip_code)
);

CREATE TABLE player (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    dob DATE NOT NULL,
    nationality VARCHAR(128) NOT NULL,
    market_value DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    jersey_number INT NOT NULL,
    position_abb VARCHAR(10) NOT NULL
);

CREATE TABLE league_team (
    league_name VARCHAR(128),
    team_name VARCHAR(128),
    season INT,
    matches_played INT NOT NULL DEFAULT 0,
    wins INT NOT NULL DEFAULT 0,
    losses INT NOT NULL DEFAULT 0,
    goals_scored INT NOT NULL DEFAULT 0,
    goals_conceded INT NOT NULL DEFAULT 0,
    PRIMARY KEY (league_name, team_name, season),
    FOREIGN KEY (league_name) 
        REFERENCES league(name) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    FOREIGN KEY (team_name) 
        REFERENCES team(name) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
    -- point, draws, goal_difference are derived attributes        
);

CREATE TABLE player_team (
    player_id INT,
    team_name VARCHAR(128),
    season INT,
    PRIMARY KEY (player_id, team_name, season),
    FOREIGN KEY (player_id) REFERENCES player(player_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (team_name) REFERENCES team(name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE manager (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    dob DATE NOT NULL,
    nationality VARCHAR(128) NOT NULL,
    team_name VARCHAR(128),
    FOREIGN KEY (team_name) 
        REFERENCES team(name) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

CREATE TABLE game (
    team_1_name VARCHAR(128),
    team_2_name VARCHAR(128),
    stadium_name VARCHAR(128) NOT NULL,
    match_date DATE NOT NULL,
    attendance INT NOT NULL DEFAULT 0,
    PRIMARY KEY (team_1_name, team_2_name, match_date),
    FOREIGN KEY (team_1_name) 
        REFERENCES team(name) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    FOREIGN KEY (team_2_name) 
        REFERENCES team(name) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    FOREIGN KEY (stadium_name) 
        REFERENCES stadium(name) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

CREATE TABLE player_stat (
     player_id INT NOT NULL,
     team_1_name VARCHAR(128) NOT NULL,
     team_2_name VARCHAR(128) NOT NULL,
     match_date DATE NOT NULL,
     goals_scored INT NOT NULL DEFAULT 0,
     yellow_card INT NOT NULL DEFAULT 0,
     red_card INT NOT NULL DEFAULT 0,
     PRIMARY KEY (player_id, team_1_name, team_2_name, match_date),
     FOREIGN KEY (player_id)
         REFERENCES player(player_id)
         ON UPDATE CASCADE
         ON DELETE CASCADE,
     FOREIGN KEY (team_1_name, team_2_name, match_date)
         REFERENCES game(team_1_name, team_2_name, match_date)
         ON UPDATE CASCADE
         ON DELETE CASCADE
);

CREATE TABLE sponsor (
                         name VARCHAR(128) PRIMARY KEY,
                         country VARCHAR(128) NOT NULL,
                         industry VARCHAR(128) NOT NULL DEFAULT 'Other',
                         website_url VARCHAR(128) NOT NULL
);

CREATE TABLE sponsor_league (
                                sponsor_name VARCHAR(128),
                                league_name VARCHAR(128),
                                sponsorship_amount BIGINT NOT NULL DEFAULT 0,
                                PRIMARY KEY (sponsor_name, league_name),
                                FOREIGN KEY (sponsor_name)
                                    REFERENCES sponsor(name)
                                    ON UPDATE CASCADE
                                    ON DELETE CASCADE,
                                FOREIGN KEY (league_name)
                                    REFERENCES league(name)
                                    ON UPDATE CASCADE
                                    ON DELETE CASCADE
);



        