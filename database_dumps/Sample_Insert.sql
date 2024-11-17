use football_tracker;

-- Sample data
INSERT INTO team (name, established_year) VALUES
    ("Manchester United", 1878),
    ("Tottenham Hotspur", 1882),
    ("Aston Villa", 1874),
    ("Newcastle United", 1892),
    ("Fulham", 1879),
    ("Brentford", 1889),
    ("Arsenal", 1886),
    ("Liverpool", 1892),
    ("Chelsea", 1905),
    ("Manchester City", 1880);
    
 INSERT INTO team (name, established_year) VALUES
    ("Real Madrid", 1902),
    ("Barcelona", 1899),
    ("Atletico Madrid", 1903),
    ("Sevilla", 1890),
    ("Real Betis", 1907),
    ("Real Sociedad", 1909),
    ("Athletic Club", 1898),
    ("Valencia", 1919),
    ("Villarreal", 1923),
    ("Espanyol", 1900);   
    
INSERT INTO team (name, established_year) VALUES
    ("LA Galaxy", 1994),
    ("DC United", 1994),
    ("New York Red Bulls", 1994),
    ("Seattle Sounders", 2007),
    ("Portland Timbers", 2009),
    ("Atlanta United", 2014),
    ("Orlando City", 2013),
    ("Toronto", 2005),
    ("Chicago Fire", 1997),
    ("Inter Miami", 2018);
    
INSERT INTO field_position (Abb, Name, Description) VALUES
	('GK', 'Goalkeeper', 'The player who guards the goal and is the only one allowed to handle the ball within the penalty area.'),
	('CB', 'Center Back', 'A defender who primarily stays in the central area of the field, focusing on defending against opposing attackers.'),
	('RB', 'Right Back', 'A defender positioned on the right side, tasked with stopping attacks from the left-wing and supporting the right-wing offense.'),
	('LB', 'Left Back', 'A defender positioned on the left side, tasked with stopping attacks from the right-wing and supporting the left-wing offense.'),
	('CM', 'Central Midfielder', 'A midfielder who plays centrally, involved in both defending and attacking roles, and connecting the defense and offense.'),
	('CDM', 'Central Defensive Midfielder', 'A midfielder focused on defending, often positioned in front of the center-backs to protect the defensive line.'),
	('CAM', 'Central Attacking Midfielder', 'An offensive midfielder positioned just behind the forwards, creating scoring opportunities.'),
	('RW', 'Right Winger', 'An attacker who plays on the right side, often attempting to cross the ball into the penalty area or cut inside to shoot.'),
	('LW', 'Left Winger', 'An attacker who plays on the left side, focusing on delivering crosses or cutting inside to create scoring chances.'),
	('ST', 'Striker', 'The main goal-scorer on the team, positioned close to the opponent’s goal to take shots and create scoring opportunities.');
    
    
INSERT INTO league (name, country) VALUES
('La Liga', 'Spain'),
('MLS', 'United States'),
('Premier League', 'England');

-- Insert Barclays into the sponsor table
INSERT INTO sponsor (name, country, industry, website_url) VALUES
    ('Barclays', 'England', 'Banking', 'https://www.barclays.co.uk');

-- Link Barclays to the Premier League in the sponsor_league table
INSERT INTO sponsor_league (sponsor_name, league_name, sponsorship_amount) VALUES
    ('Barclays', 'Premier League', 50000000.00);    
    
-- Delete the Premier League from the league table
-- DELETE FROM league WHERE name = 'Premier League'; 
-- DELETE FROM sponsor WHERE name = 'Barclays';    

-- Verify deletion in sponsor_league
SELECT * FROM sponsor_league WHERE league_name = 'Premier League';

INSERT INTO manager (First_Name, Last_Name, DOB, Nationality, team_name) VALUES
    ('Erik', 'ten Hag', '1970-02-02', 'Netherlands', 'Manchester United'),
    ('Mikel', 'Arteta', '1982-03-26', 'Spain', 'Arsenal'),
    ('Pep', 'Guardiola', '1971-01-18', 'Spain', 'Manchester City'),
    ('Jurgen', 'Klopp', '1967-06-16', 'Germany', 'Liverpool'),
    ('Mauricio', 'Pochettino', '1972-03-02', 'Argentina', 'Chelsea'),
    ('Eddie', 'Howe', '1977-11-29', 'England', 'Newcastle United'),
    ('Ange', 'Postecoglou', '1965-08-27', 'Australia', 'Tottenham Hotspur'),
    ('Unai', 'Emery', '1971-11-03', 'Spain', 'Aston Villa'),
    ('Marco', 'Silva', '1977-07-12', 'Portugal', 'Fulham'),
    ('Thomas', 'Frank', '1973-10-09', 'Denmark', 'Brentford');
    
-- Manchester City Players
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES
    ('Ederson', 'Moraes', '1993-08-17', 'Brazil', 50000000.00, 31, 'GK'),
    ('Ruben', 'Dias', '1997-05-14', 'Portugal', 75000000.00,3, 'CB'),
    ('John', 'Stones', '1994-05-28', 'England', 45000000.00, 5, 'CB'),
    ('Kyle', 'Walker', '1990-05-28', 'England', 15000000.00, 2, 'RB'),
    ('Joao', 'Cancelo', '1994-05-27', 'Portugal', 50000000.00, 7, 'LB'),
    ('Rodri', 'Hernandez', '1996-06-22', 'Spain', 85000000.00, 16, 'CDM'),
    ('Ilkay', 'Gundogan', '1990-10-24', 'Germany', 15000000.00, 8, 'CM'),
    ('Kevin', 'De Bruyne', '1991-06-28', 'Belgium', 85000000.00, 17, 'CAM'),
    ('Bernardo', 'Silva', '1994-08-10', 'Portugal', 80000000.00, 20, 'RW'),
    ('Jack', 'Grealish', '1995-09-10', 'England', 90000000.00, 10, 'LW'),
    ('Erling', 'Haaland', '2000-07-21', 'Norway', 180000000.00, 9, 'ST');

-- Arsenal Players
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES
    ('Aaron', 'Ramsdale', '1998-05-14', 'England', 25000000.00, 1, 'GK'),
    ('William', 'Saliba', '2001-03-24', 'France', 35000000.00, 12, 'CB'),
    ('Ben', 'White', '1997-10-08', 'England', 50000000.00, 4, 'CB'),
    ('Kieran', 'Tierney', '1997-06-05', 'Scotland', 30000000.00, 3, 'LB'),
    ('Tomiyasu', 'Takehiro', '1998-11-05', 'Japan', 25000000.00, 18, 'RB'),
    ('Thomas', 'Partey', '1993-06-13', 'Ghana', 45000000.00, 5, 'CDM'),
    ('Martin', 'Ødegaard', '1998-12-17', 'Norway', 70000000.00, 8, 'CM'),
    ('Bukayo', 'Saka', '2001-09-05', 'England', 100000000.00, 7, 'RW'),
    ('Gabriel', 'Martinelli', '2001-06-18', 'Brazil', 60000000.00, 11, 'LW'),
    ('Gabriel', 'Jesus', '1997-04-03', 'Brazil', 75000000.00, 9, 'ST'),
    ('Kai', 'Havertz', '1999-06-11', 'Germany', 75000000.00, 29, 'CAM');  
    
Alter table player DROP column transfer_date;
    
-- Manchester City Players in the 2022 Season
INSERT INTO player_team (player_id, team_name, season) VALUES
    (1, 'Manchester City', 2022),
    (2, 'Manchester City', 2022),
    (3, 'Manchester City', 2022),
    (4, 'Manchester City', 2022),
    (5, 'Manchester City', 2022),
    (6, 'Manchester City', 2022),
    (7, 'Manchester City', 2022),
    (8, 'Manchester City', 2022),
    (9, 'Manchester City', 2022),
    (10, 'Manchester City', 2022),
    (11, 'Manchester City', 2022),
    (1, 'Manchester City', 2023),
    (2, 'Manchester City', 2023),
    (3, 'Manchester City', 2023),
    (4, 'Manchester City', 2023),
    (5, 'Manchester City', 2023),
    (6, 'Manchester City', 2023),
    (7, 'Manchester City', 2023),
    (8, 'Manchester City', 2023),
    (9, 'Manchester City', 2023),
    (10, 'Manchester City', 2023),
    (11, 'Manchester City', 2023);

-- Arsenal Players in the 2022 Season
INSERT INTO player_team (player_id, team_name, season) VALUES
    (12, 'Arsenal', 2022),
    (13, 'Arsenal', 2022),
    (14, 'Arsenal', 2022),
    (15, 'Arsenal', 2022),
    (16, 'Arsenal', 2022),
    (17, 'Arsenal', 2022),
    (18, 'Arsenal', 2022),
    (19, 'Arsenal', 2022),
    (20, 'Arsenal', 2022),
    (21, 'Arsenal', 2022),
    (22, 'Arsenal', 2022),
    (12, 'Arsenal', 2023),
    (13, 'Arsenal', 2023),
    (14, 'Arsenal', 2023),
    (15, 'Arsenal', 2023),
    (16, 'Arsenal', 2023),
    (17, 'Arsenal', 2023),
    (18, 'Arsenal', 2023),
    (19, 'Arsenal', 2023),
    (20, 'Arsenal', 2023),
    (21, 'Arsenal', 2023),
    (22, 'Arsenal', 2023);
    
-- Manchester City Captain for 2022 Season
INSERT INTO team_captain (captain_id, team_name, season) VALUES
    (8, 'Manchester City', 2022),
    (8, 'Manchester City', 2023); -- Kevin De Bruyne

-- Arsenal Captain for 2022 Season
INSERT INTO team_captain (captain_id, team_name, season) VALUES
    (18, 'Arsenal', 2022),
    (18, 'Arsenal', 2023); -- Martin Ødegaard    
    
    
INSERT INTO stadium (Name, City, Zip_Code, Capacity) VALUES
    ('Old Trafford', 'Manchester', 'M16 0RA', 74879),
    ('Emirates Stadium', 'London', 'N5 1BU', 60260),
    ('Etihad Stadium', 'Manchester', 'M11 3FF', 53600),
    ('Anfield', 'Liverpool', 'L4 0TH', 54074),
    ('Stamford Bridge', 'London', 'SW6 1HS', 40742),
    ('Villa Park', 'Birmingham', 'B6 6HE', 42682),
    ('St James Park', 'Newcastle upon Tyne', 'NE1 4ST', 52305),
    ('Craven Cottage', 'London', 'SW6 6HH', 25700),
    ('Brentford Community Stadium', 'London', 'TW8 0NT', 17250),
    ('London Stadium', 'London', 'E20 2ST', 60000);
    
INSERT INTO broadcaster (Channel_Name, Commentator, Streaming_Link) VALUES
    ('Sky Sports', 'Martin Tyler', 'https://www.sky.com/sports'),
    ('BBC Sport', 'Gary Lineker', 'https://www.bbc.co.uk/sport'),
    ('NBC Sports', 'Arlo White', 'https://www.nbcsports.com'); 
    
DELETE from game;

INSERT INTO league_team (league_name, team_name, season)
VALUES
    ('Premier League', "Manchester United", 2023),
    ('Premier League', "Tottenham Hotspur", 2023),
    ('Premier League', "Aston Villa", 2023),
    ('Premier League', "Newcastle United", 2023),
    ('Premier League', "Fulham", 2023),
    ('Premier League', "Brentford", 2023),
    ('Premier League', "Arsenal", 2023),
    ('Premier League', "Liverpool", 2023),
    ('Premier League', "Chelsea", 2023),
    ('Premier League', "Manchester City", 2023),
    ('Premier League', "Manchester United", 2022),
    ('Premier League', "Tottenham Hotspur", 2022),
    ('Premier League', "Aston Villa", 2022),
    ('Premier League', "Newcastle United", 2022),
    ('Premier League', "Fulham", 2022),
    ('Premier League', "Brentford", 2022),
    ('Premier League', "Arsenal", 2022),
    ('Premier League', "Liverpool", 202),
    ('Premier League', "Chelsea", 2022),
    ('Premier League', "Manchester City", 2022);
    -- Error Code: 1062. Duplicate entry 'Premier League-Manchester City-2022' for key 'league_team.PRIMARY'


    
INSERT INTO game (team_1_name, team_2_name, team_1_goals, team_2_goals, stadium_name, broadcaster_channel_name, broadcaster_commentator, match_date, attendance) VALUES
('Arsenal', 'Manchester City', 1, 2, 'Emirates Stadium', 'BBC Sport', 'Gary Lineker', '2022-01-01 15:00:00', 59757);    

-- Saka stats
INSERT INTO player_stat (player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card) VALUES
 (19, 'Arsenal', 'Manchester City', '2022-01-01 15:00:00', 1, 1, 0),
-- Gabriel stats
 (20, 'Arsenal', 'Manchester City', '2022-01-01 15:00:00', 0, 0, 1),
-- Rodri stats
 (6, 'Arsenal', 'Manchester City', '2022-01-01 15:00:00', 1, 1, 0),
-- Haaland stats
 (11, 'Arsenal', 'Manchester City', '2022-01-01 15:00:00', 1, 0, 0),
-- Bernardo Silva stats
 (9, 'Arsenal', 'Manchester City', '2022-01-01 15:00:00', 0, 1, 0);
 
 
 
 -- Error Code: 1054. Unknown column 'g.season' in 'field list'
 
 -- Error Code: 1048. Column 'league_name' cannot be null



    