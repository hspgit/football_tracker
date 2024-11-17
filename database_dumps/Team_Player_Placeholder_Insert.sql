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


INSERT INTO league_team (league_name, team_name, season)
VALUES
    -- Premier League teams
    ('Premier League', 'Manchester United', 2022),
    ('Premier League', 'Tottenham Hotspur', 2022),
    ('Premier League', 'Aston Villa', 2022),
    ('Premier League', 'Newcastle United', 2022),
    ('Premier League', 'Fulham', 2022),
    ('Premier League', 'Brentford', 2022),
    ('Premier League', 'Arsenal', 2022),
    ('Premier League', 'Liverpool', 2022),
    ('Premier League', 'Chelsea', 2022),
    ('Premier League', 'Manchester City', 2022),
    ('Premier League', 'Manchester United', 2023),
    ('Premier League', 'Tottenham Hotspur', 2023),
    ('Premier League', 'Aston Villa', 2023),
    ('Premier League', 'Newcastle United', 2023),
    ('Premier League', 'Fulham', 2023),
    ('Premier League', 'Brentford', 2023),
    ('Premier League', 'Arsenal', 2023),
    ('Premier League', 'Liverpool', 2023),
    ('Premier League', 'Chelsea', 2023),
    ('Premier League', 'Manchester City', 2023),
    ('Premier League', 'Manchester United', 2024),
    ('Premier League', 'Tottenham Hotspur', 2024),
    ('Premier League', 'Aston Villa', 2024),
    ('Premier League', 'Newcastle United', 2024),
    ('Premier League', 'Fulham', 2024),
    ('Premier League', 'Brentford', 2024),
    ('Premier League', 'Arsenal', 2024),
    ('Premier League', 'Liverpool', 2024),
    ('Premier League', 'Chelsea', 2024),
    ('Premier League', 'Manchester City', 2024),

    -- La Liga teams
    ('La Liga', 'Real Madrid', 2022),
    ('La Liga', 'Barcelona', 2022),
    ('La Liga', 'Atletico Madrid', 2022),
    ('La Liga', 'Sevilla', 2022),
    ('La Liga', 'Real Betis', 2022),
    ('La Liga', 'Real Sociedad', 2022),
    ('La Liga', 'Athletic Club', 2022),
    ('La Liga', 'Valencia', 2022),
    ('La Liga', 'Villarreal', 2022),
    ('La Liga', 'Espanyol', 2022),
    ('La Liga', 'Real Madrid', 2023),
    ('La Liga', 'Barcelona', 2023),
    ('La Liga', 'Atletico Madrid', 2023),
    ('La Liga', 'Sevilla', 2023),
    ('La Liga', 'Real Betis', 2023),
    ('La Liga', 'Real Sociedad', 2023),
    ('La Liga', 'Athletic Club', 2023),
    ('La Liga', 'Valencia', 2023),
    ('La Liga', 'Villarreal', 2023),
    ('La Liga', 'Espanyol', 2023),
    ('La Liga', 'Real Madrid', 2024),
    ('La Liga', 'Barcelona', 2024),
    ('La Liga', 'Atletico Madrid', 2024),
    ('La Liga', 'Sevilla', 2024),
    ('La Liga', 'Real Betis', 2024),
    ('La Liga', 'Real Sociedad', 2024),
    ('La Liga', 'Athletic Club', 2024),
    ('La Liga', 'Valencia', 2024),
    ('La Liga', 'Villarreal', 2024),
    ('La Liga', 'Espanyol', 2024),

    -- MLS teams
    ('MLS', 'LA Galaxy', 2022),
    ('MLS', 'DC United', 2022),
    ('MLS', 'New York Red Bulls', 2022),
    ('MLS', 'Seattle Sounders', 2022),
    ('MLS', 'Portland Timbers', 2022),
    ('MLS', 'Atlanta United', 2022),
    ('MLS', 'Orlando City SC', 2022),
    ('MLS', 'Toronto FC', 2022),
    ('MLS', 'Chicago Fire FC', 2022),
    ('MLS', 'Inter Miami CF', 2022),
    ('MLS', 'LA Galaxy', 2023),
    ('MLS', 'DC United', 2023),
    ('MLS', 'New York Red Bulls', 2023),
    ('MLS', 'Seattle Sounders', 2023),
    ('MLS', 'Portland Timbers', 2023),
    ('MLS', 'Atlanta United', 2023),
    ('MLS', 'Orlando City SC', 2023),
    ('MLS', 'Toronto FC', 2023),
    ('MLS', 'Chicago Fire FC', 2023),
    ('MLS', 'Inter Miami CF', 2023),
    ('MLS', 'LA Galaxy', 2024),
    ('MLS', 'DC United', 2024),
    ('MLS', 'New York Red Bulls', 2024),
    ('MLS', 'Seattle Sounders', 2024),
    ('MLS', 'Portland Timbers', 2024),
    ('MLS', 'Atlanta United', 2024),
    ('MLS', 'Orlando City SC', 2024),
    ('MLS', 'Toronto FC', 2024),
    ('MLS', 'Chicago Fire FC', 2024),
    ('MLS', 'Inter Miami CF', 2024);

-- Players for Team: Manchester City
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ederson', 'Moraes', '1993-08-17', 'Brazil', 50000000.00, 31, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ruben', 'Dias', '1997-05-14', 'Portugal', 75000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('John', 'Stones', '1994-05-28', 'England', 45000000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kyle', 'Walker', '1990-05-28', 'England', 15000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Joao', 'Cancelo', '1994-05-27', 'Portugal', 50000000.00, 7, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rodri', 'Hernandez', '1996-06-22', 'Spain', 85000000.00, 16, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ilkay', 'Gundogan', '1990-10-24', 'Germany', 15000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kevin', 'De Bruyne', '1991-06-28', 'Belgium', 85000000.00, 17, 'CAM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Bernardo', 'Silva', '1994-08-10', 'Portugal', 80000000.00, 20, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jack', 'Grealish', '1995-09-10', 'England', 90000000.00, 10, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Erling', 'Haaland', '2000-07-21', 'Norway', 180000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester City', 2024);

-- Players for Team: Arsenal
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Aaron', 'Ramsdale', '1998-05-14', 'England', 25000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('William', 'Saliba', '2001-03-24', 'France', 35000000.00, 12, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ben', 'White', '1997-10-08', 'England', 50000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kieran', 'Tierney', '1997-06-05', 'Scotland', 30000000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Takehiro', 'Tomiyasu', '1998-11-05', 'Japan', 25000000.00, 18, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Thomas', 'Partey', '1993-06-13', 'Ghana', 45000000.00, 5, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Martin', 'Ødegaard', '1998-12-17', 'Norway', 70000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Bukayo', 'Saka', '2001-09-05', 'England', 100000000.00, 7, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gabriel', 'Martinelli', '2001-06-18', 'Brazil', 60000000.00, 11, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gabriel', 'Jesus', '1997-04-03', 'Brazil', 75000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kai', 'Havertz', '1999-06-11', 'Germany', 75000000.00, 29, 'CAM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Arsenal', 2024);

-- Players for Team: Manchester United
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('André', 'Onana', '1996-04-02', 'Cameroon', 35000000.00, 24, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Diogo', 'Dalot', '1999-03-18', 'Portugal', 25000000.00, 20, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raphaël', 'Varane', '1993-04-25', 'France', 40000000.00, 19, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Lisandro', 'Martínez', '1998-01-18', 'Argentina', 50000000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Luke', 'Shaw', '1995-07-12', 'England', 28000000.00, 23, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Casemiro', '', '1992-02-23', 'Brazil', 60000000.00, 18, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Bruno', 'Fernandes', '1994-09-08', 'Portugal', 75000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mason', 'Mount', '1999-01-10', 'England', 55000000.00, 7, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Marcus', 'Rashford', '1997-10-31', 'England', 90000000.00, 10, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Antony', 'Matheus', '2000-02-24', 'Brazil', 60000000.00, 21, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rasmus', 'Højlund', '2003-02-04', 'Denmark', 70000000.00, 11, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Manchester United', 2024);

-- Players for Team: Tottenham Hotspur
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Heung-Min', 'Son', '1992-07-08', 'South Korea', 45000000.00, 7, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('James', 'Maddison', '1996-11-23', 'England', 70000000.00, 10, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Cristian', 'Romero', '1998-04-27', 'Argentina', 65000000.00, 17, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Richarlison', '', '1997-05-10', 'Brazil', 35000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Tottenham Hotspur', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Yves', 'Bissouma', '1996-08-30','Ivory Coast', 35000000.00 ,8 ,'CM');
INSERT INTO player_team (player_id ,team_name ,season ) VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

INSERT INTO player(first_name ,last_name ,dob ,nationality ,market_value ,jersey_number ,position_abb )
VALUES('Guglielmo','Vicario','1996-10-07','Italy' ,35000000.00 ,1 ,'GK');
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

INSERT INTO player(first_name,last_name,dob,nationality ,market_value,jersey_number ,position_abb )
VALUES('Dejan','Kulusevski','2000-04-25','Sweden' ,55000000.00 ,21 ,'RW');
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

INSERT INTO player(first_name,last_name,dob,nationality,market_value,jersey_number,position_abb)
VALUES('Pedro','Porro','1999-09-13','Spain',45000000.00,'23','RB') ;
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Destiny', 'Udogie', '2002-11-28', 'Italy', 45000000.00, 13, 'LB');
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Rodrigo', 'Bentancur', '1997-06-25', 'Uruguay', 35000000.00 ,30 , 'CM');
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

INSERT INTO player (first_name,last_name,dob,nationality ,market_value ,jersey_number ,position_abb)
VALUES ('Micky','van de Ven','2001-04-19','Netherlands' ,55000000.00 ,37 ,'CB');
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2022 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2023 );
INSERT INTO player_team(player_id ,team_name ,season )VALUES(LAST_INSERT_ID() ,'Tottenham Hotspur' ,2024 );

-- Players for Team: Aston Villa
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Emiliano', 'Martínez', '1992-09-02', 'Argentina', 27000000.0, 23, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Matty', 'Cash', '1997-06-07', 'Poland', 65000000.0, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Lucas', 'Digne', '1993-07-20', 'France', 14000000.0, 12, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Tyrone', 'Mings', '1993-03-13', 'England', 15000000.0, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Diego', 'Carlos', '1992-03-30', 'Brazil', 12000000.0, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Ezri', 'Konsa', '1998-01-23', 'England', 23000000.0, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Pau', 'Torres', '1997-01-16', 'Spain', 23000000.0, 14, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('John', 'McGinn', '1994-10-18', 'Scotland', 30000000.0, 7, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb)
VALUES ('Douglas', 'Luiz', '1998-05-09', 'Brazil', 25000000.0 ,6 , 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player (first_name,last_name,dob,nationality ,market_value ,jersey_number ,position_abb )
VALUES('Leon','Bailey','1997-08-09','Jamaica' ,30000000.0 ,31 ,'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

INSERT INTO player(first_name,last_name,dob,nationality ,market_value ,jersey_number ,position_abb )
VALUES('Ollie','Watkins','1996-12-30','England' ,70000000.0 ,11 ,'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Aston Villa', 2024);

-- Players for Team: Newcastle United
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Nick', 'Pope', '1992-04-19', 'England', 35000000.00, 22, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kieran', 'Trippier', '1990-09-19', 'England', 12000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sven', 'Botman', '2000-01-12', 'Netherlands', 45000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Bruno', 'Guimarães', '1997-11-16', 'Brazil', 70000000.00, 39, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sandro', 'Tonali', '2000-05-08', 'Italy', 60000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Joelinton', '', '1996-08-14', 'Brazil', 50000000.00, 7, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Harvey', 'Barnes', '1997-12-09', 'England', 38000000.00, 15, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Miguel', 'Almirón', '1994-02-10', 'Paraguay', 22000000.00, 24, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Callum', 'Wilson', '1992-02-27', 'England', 10000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alexander', 'Isak', '1999-09-21', 'Sweden', 45000000.00, 14, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Anthony', 'Gordon', '2001-02-24', 'England', 30000000.00, 10, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Newcastle United', 2024);

-- Players for Team: Fulham
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Bernd', 'Leno', '1992-03-04', 'Germany', 12000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kenny', 'Tete', '1995-10-09', 'Netherlands', 8000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Issa', 'Diop', '1997-01-09', 'France', 15000000.00, 31, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Calvin', 'Bassey', '1999-12-31', 'Nigeria', 10000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Antonee', 'Robinson', '1997-08-08', 'United States', 8000000.00, 33, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Harrison', 'Reed', '1995-01-27', 'England', 7000000.00, 6, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Andreas', 'Pereira', '1996-01-01', 'Brazil', 10000000.00, 18, 'CAM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Harry', 'Wilson', '1997-03-22', 'Wales', 9000000.00, 8, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raúl', 'Jiménez', '1991-05-05', 'Mexico', 5000000.00, 7, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Carlos', 'Vinícius', '1995-03-22', 'Brazil', 6000000.00, 12, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('João', 'Palhinha', '1995-07-09', 'Portugal', 40000000.00, 26, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Fulham', 2024);

-- Players for Team: Brentford
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mark', 'Flekken', '1993-06-13', 'Netherlands', 12000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Aaron', 'Hickey', '2002-06-10', 'Scotland', 18000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ethan', 'Pinnock', '1993-05-29', 'Jamaica', 8000000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ben', 'Mee', '1989-09-21', 'England', 2000000.00, 16, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rico', 'Henry', '1997-07-08', 'England', 15000000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Christian', 'Nørgaard', '1994-03-10', 'Denmark', 16000000.00, 6, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mathias', 'Jensen', '1996-01-01', 'Denmark', 14000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Bryan', 'Mbeumo', '1999-08-07', 'Cameroon', 22000000.00, 19, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Yoane', 'Wissa', '1996-09-03', 'DR Congo', 15000000.00, 11, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kevin', 'Schade', '2001-11-27', 'Germany', 20000000.00, 7, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Igor', 'Thiago', '2001-06-26', 'Brazil', 25000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Brentford', 2024);

-- Players for Team: Liverpool
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alisson', 'Becker', '1992-10-02', 'Brazil', 70000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Virgil', 'van Dijk', '1991-07-08', 'Netherlands', 55000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Trent', 'Alexander-Arnold', '1998-10-07', 'England', 80000000.00, 66, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mohamed', 'Salah', '1992-06-15', 'Egypt', 85000000.00, 11, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Luis', 'Díaz', '1997-01-13', 'Colombia', 45000000.00, 7, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Cody', 'Gakpo', '1999-05-07', 'Netherlands', 55000000.00, 18, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alexis', 'Mac Allister', '1998-12-24', 'Argentina', 40000000.00, 10, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dominik', 'Szoboszlai', '2000-10-25', 'Hungary', 70000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Diogo', 'Jota', '1996-12-04', 'Portugal', 45000000.00, 20, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Harvey', 'Elliott', '2003-04-04', 'England', 35000000.00, 19, 'CAM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Darwin', 'Núñez', '1999-06-24', 'Uruguay', 70000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Liverpool', 2024);

-- Players for Team: Chelsea
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Reece', 'James', '1999-12-08', 'England', 60000000.00, 24, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Enzo', 'Fernández', '2001-01-17', 'Argentina', 120000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mykhailo', 'Mudryk', '2001-01-05', 'Ukraine', 40000000.00, 10, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Christopher', 'Nkunku', '1997-11-14', 'France', 65000000.00, 18, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raheem', 'Sterling', '1994-12-08', 'England', 55000000.00, 17, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Marc', 'Cucurella', '1998-07-22', 'Spain', 40000000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Benoît', 'Badiashile', '2001-03-26', 'France', 35000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Conor', 'Gallagher', '2000-02-06', 'England', 40000000.00, 23, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Wesley', 'Fofana', '2000-12-17', 'France', 55000000.00, 33, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Thiago', 'Silva', '1984-09-22', 'Brazil', 5000000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Noni', 'Madueke', '2002-03-10', 'England', 30000000.00, 31, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chelsea', 2024);

-- Players for Team: Real Madrid
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Thibaut', 'Courtois', '1992-05-11', 'Belgium', 60000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dani', 'Carvajal', '1992-01-11', 'Spain', 25000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Eder', 'Militão', '1998-01-18', 'Brazil', 65000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('David', 'Alaba', '1992-06-24', 'Austria', 40000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ferland', 'Mendy', '1995-06-08', 'France', 25000000.00, 23, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Eduardo', 'Camavinga', '2002-11-10', 'France', 85000000.00, 12, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Federico', 'Valverde', '1998-07-22', 'Uruguay', 90000000.00, 15, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jude', 'Bellingham', '2003-06-29', 'England', 120000000.00, 5, 'CAM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rodrygo', 'Goes', '2001-01-09', 'Brazil', 80000000.00, 11, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Vinícius', 'Júnior', '2000-07-12', 'Brazil', 150000000.00, 7, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Joselu', '', '1990-03-27', 'Spain', 10000000.00, 14, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Madrid', 2024);

-- Players for Team: Barcelona
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Marc-André', 'ter Stegen', '1992-04-30', 'Germany', 45000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jules', 'Koundé', '1998-11-12', 'France', 60000000.00, 23, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ronald', 'Araújo', '1999-03-07', 'Uruguay', 70000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Andreas', 'Christensen', '1996-04-10', 'Denmark', 35000000.00, 15, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alejandro', 'Balde', '2003-10-18', 'Spain', 50000000.00, 28, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gavi', '', '2004-08-05', 'Spain', 90000000.00, 6, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pedri', 'González', '2002-11-25', 'Spain', 100000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Frenkie', 'de Jong', '1997-05-12', 'Netherlands', 85000000.00, 21, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raphinha', '', '1996-12-14', 'Brazil', 60000000.00, 22, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Robert', 'Lewandowski', '1988-08-21', 'Poland', 20000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ansu', 'Fati', '2002-10-31', 'Spain', 50000000.00, 10, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Barcelona', 2024);

-- Players for Team: Atletico Madrid
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jan', 'Oblak', '1993-01-07', 'Slovenia', 40000000.00, 13, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('José María', 'Giménez', '1995-01-20', 'Uruguay', 35000000.00, 2, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Stefan', 'Savic', '1991-01-08', 'Montenegro', 15000000.00, 15, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Reinildo', 'Mandava', '1994-01-21', 'Mozambique', 8000000.00, 23, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Nahuel', 'Molina', '1998-04-06', 'Argentina', 25000000.00, 16, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Koke', 'Resurrección', '1992-01-08', 'Spain', 15000000.00, 6, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rodrigo', 'De Paul', '1994-05-24', 'Argentina', 35000000.00, 5, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Yannick', 'Carrasco', '1993-09-04', 'Belgium', 25000000.00, 21, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Antoine', 'Griezmann', '1991-03-21', 'France', 25000000.00, 8, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ángel', 'Correa', '1995-03-09', 'Argentina', 30000000.00, 10, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Álvaro', 'Morata', '1992-10-23', 'Spain', 25000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atletico Madrid', 2024);

-- Players for Team: Sevilla
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Loïc', 'Badé', '2000-04-11', 'France', 15000000.00, 22, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kike', 'Salas', '2002-04-12', 'Spain', 3000000.00, 32, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Marcão', 'Laude', '1996-06-05', 'Brazil', 12000000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Tanguy', 'Nianzou', '2002-06-07', 'France', 15000000.00, 14, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Valentín', 'Barco', '2004-07-23', 'Argentina', 8000000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Adrià', 'Pedrosa', '1998-05-13', 'Spain', 7000000.00, 18, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Juanlu', 'Sánchez', '2003-05-06', 'Spain', 4000000.00, 25, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gonzalo', 'Montiel', '1997-01-01', 'Argentina', 12000000.00, 29, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jesús', 'Navas', '1985-11-21', 'Spain', 2000000.00, 16, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Lucien', 'Agoumé', '2002-02-09', 'France', 5000000.00, 20, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Youssef', 'En-Nesyri', '1997-06-01', 'Morocco', 25000000.00, 15, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Sevilla', 2024);

-- Players for Team: Real Betis
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rui', 'Silva', '1994-02-07', 'Portugal', 12000000.00, 13, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Youssouf', 'Sabaly', '1993-03-05', 'Senegal', 5000000.00, 23, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Marc', 'Bartra', '1991-01-15', 'Spain', 4000000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Diego', 'Llorente', '1993-08-16', 'Spain', 8000000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Romain', 'Perraud', '1997-09-22', 'France', 7000000.00, 15, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Johnny', 'Cardoso', '2001-09-20', 'USA', 5000000.00, 18, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sergi', 'Altimira', '2001-08-25', 'Spain', 3000000.00, 21, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pablo', 'Fornals', '1996-02-22', 'Spain', 15000000.00, 8, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ez', 'Abde', '2001-12-17', 'Morocco', 10000000.00, 11, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Vitor', 'Roque', '2005-02-28', 'Brazil', 25000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Cédric', 'Bakambu', '1991-04-11', 'DR Congo', 5000000.00, 17, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Betis', 2024);

-- Players for Team: Real Sociedad
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Álex', 'Remiro', '1995-03-24', 'Spain', 25000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Igor', 'Zubeldia', '1997-03-30', 'Spain', 22000000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jon', 'Pacheco', '2001-01-08', 'Spain', 15000000.00, 20, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Aritz', 'Elustondo', '1994-03-28', 'Spain', 5000000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sergio', 'Gómez', '2000-09-04', 'Spain', 10000000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Aihen', 'Muñoz', '1997-08-16', 'Spain', 8000000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Hamari', 'Traoré', '1992-01-27', 'Mali', 6000000.00, 18, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Martín', 'Zubimendi', '1999-02-02', 'Spain', 50000000.00, 4, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mikel', 'Merino', '1996-06-22', 'Spain', 50000000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Takefusa', 'Kubo', '2001-06-04', 'Japan', 30000000.00, 14, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mikel', 'Oyarzabal', '1997-04-21', 'Spain', 50000000.00, 10, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Real Sociedad', 2024);

-- Players for Team: Athletic Club
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Unai', 'Simón', '1997-06-11', 'Spain', 25000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Óscar', 'De Marcos', '1989-04-14', 'Spain', 2000000.00, 18, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dani', 'Vivian', '1999-07-05', 'Spain', 15000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Yeray', 'Álvarez', '1995-01-24', 'Spain', 20000000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Yuri', 'Berchiche', '1990-02-10', 'Spain', 3000000.00, 17, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mikel', 'Vesga', '1993-04-21', 'Spain', 8000000.00, 6, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Oihan', 'Sancet', '2000-04-25', 'Spain', 25000000.00, 8, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Iñaki', 'Williams', '1994-06-15', 'Spain', 25000000.00, 9, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Nico', 'Williams', '2002-07-12', 'Spain', 40000000.00, 11, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gorka', 'Guruzeta', '1996-09-12', 'Spain', 8000000.00, 12, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Iker', 'Muniain', '1992-12-19', 'Spain', 10000000.00, 10, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Athletic Club', 2024);


-- Players for Team: Valencia
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Giorgi', 'Mamardashvili', '2000-09-29', 'Georgia', 45000000.00, 25, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Cristhian', 'Mosquera', '2004-06-27', 'Spain', 30000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Yarek', 'Gasiorowski', '2005-01-10', 'Spain', 15000000.00, 24, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('César', 'Tárrega', '2002-01-31', 'Spain', 4000000.00, 15, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mouctar', 'Diakhaby', '1996-12-19', 'Guinea', 15000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Luis', 'Rioja', '1993-10-16', 'Spain', 4000000.00, 22, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Diego', 'López', '2002-02-13', 'Spain', 12000000.00, 16, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Fran', 'Pérez', '2002-08-12', 'Spain', 6000000.00, 23, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sergi', 'Canós', '1997-02-02', 'Spain', 2500000.00, 7, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Germán', 'Valera', '2002-03-16', 'Spain', 2000000.00, 30, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Hugo', 'Duro', '1999-11-10', 'Spain', 5000000.00, 19, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Valencia', 2024);

-- Players for Team: Villarreal
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pepe', 'Reina', '1982-08-31', 'Spain', 1000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kiko', 'Femenía', '1991-02-02', 'Spain', 3000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raúl', 'Albiol', '1985-09-04', 'Spain', 1000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jorge', 'Cuenca', '1999-11-17', 'Spain', 5000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alberto', 'Moreno', '1992-07-05', 'Spain', 3000000.00, 18, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dani', 'Parejo', '1989-04-16', 'Spain', 5000000.00, 10, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Etienne', 'Capoue', '1988-07-11', 'France', 3000000.00, 6, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Álex', 'Baena', '2001-07-20', 'Spain', 25000000.00, 16, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ilias', 'Akhomach', '2004-04-16', 'Spain', 3000000.00, 11, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ayoze', 'Pérez', '1993-07-29', 'Spain', 8000000.00, 22, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Thierno', 'Barry', '2002-01-12', 'Guinea', 6000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Villarreal', 2024);

-- Players for Team: Espanyol
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Joan', 'García', '2001-05-04', 'Spain', 10000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Omar', 'El Hilali', '2003-09-12', 'Morocco', 5000000.00, 23, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Leandro', 'Cabrera', '1991-06-17', 'Uruguay', 1200000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sergi', 'Gómez', '1992-03-28', 'Spain', 1000000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Brian', 'Oliván', '1994-04-01', 'Spain', 2000000.00, 14, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pol', 'Lozano', '1999-10-06', 'Spain', 4000000.00, 10, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pere', 'Milla', '1992-09-23', 'Spain', 3000000.00, 11, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jofre', 'Carreras', '2001-06-17', 'Spain', 2000000.00, 17, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Javier', 'Puado', '1998-05-25', 'Spain', 8000000.00, 7, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alejo', 'Veliz', '2003-09-19', 'Argentina', 15000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Martin', 'Braithwaite', '1991-06-05', 'Denmark', 8000000.00, 12, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Espanyol', 2024);

-- Players for Team: LA Galaxy
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jonathan', 'Bond', '1993-05-19', 'England', 1000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Julián', 'Aude', '2003-03-24', 'Argentina', 3500000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gastón', 'Brugman', '1992-09-07', 'Uruguay', 2000000.00, 5, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Martín', 'Cáceres', '1987-04-07', 'Uruguay', 400000.00, 22, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mark', 'Delgado', '1995-05-16', 'USA', 1500000.00, 8, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Riqui', 'Puig', '1999-08-13', 'Spain', 5000000.00, 6, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Douglas', 'Costa', '1990-09-14', 'Brazil', 3000000.00, 10, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Chicharito', 'Hernández', '1988-06-01', 'Mexico', 4000000.00, 14, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dejan', 'Joveljić', '1999-08-07', 'Serbia', 2500000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Efraín', 'Álvarez', '2002-06-19', 'Mexico', 1200000.00, 26, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Julian', 'Araujo', '2001-08-13', 'USA', 3000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'LA Galaxy', 2024);

-- Players for Team: DC United
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Christian', 'Benteke', '1990-12-03', 'Belgium', 4687500.00, 20, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mateusz', 'Klich', '1990-06-13', 'Poland', 2093588.00, 43, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gabriel', 'Pirani', '2002-04-12', 'Brazil', 731700.00, 10, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pedro', 'Santos', '1988-04-22', 'Portugal', 490000.00, 7, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Russell', 'Canouse', '1995-06-11', 'USA', 650000.00, 6, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jared', 'Stroud', '1996-07-10', 'USA', 272500.00, 8, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Aaron', 'Herrera', '1997-06-06', 'Guatemala', 845220.00, 22, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Lucas', 'Bartlett', '1996-07-26', 'USA', 89716.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('David', 'Schnegg', '1998-09-29', 'Austria', 506250.00, 28, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Tyler', 'Miller', '1993-03-12', 'USA', 450000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Derrick', 'Williams', '1993-01-17', 'Ireland', 700000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'DC United', 2024);

-- Players for Team: New York Red Bulls
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Carlos', 'Coronel', '1997-12-29', 'Brazil', 800000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kyle', 'Duncan', '1997-08-08', 'USA', 1200000.00, 6, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sean', 'Nealis', '1997-04-13', 'USA', 2000000.00, 15, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Andrés', 'Reyes', '1999-09-08', 'Colombia', 9600000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('John', 'Tolkin', '2002-07-31', 'USA', 32000000.00, 47, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Daniel', 'Edelman', '2003-04-28', 'USA', 14400000.00, 75, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Peter', 'Stroud', '2002-04-23', 'USA', 3200000.00, 5, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Lewis', 'Morgan', '1996-09-30', 'Scotland', 1425000.00, 11, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dante', 'Vanzeir', '1998-04-16', 'Belgium', 1489767.00, 13, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Julian', 'Hall', '2008-03-24', 'USA', 182241.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Cameron', 'Harper', '2001-11-19', 'USA', 800000.00, 17, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'New York Red Bulls', 2024);

-- Players for Team: Seattle Sounders
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Stefan', 'Frei', '1986-04-20', 'Switzerland', 300000.00, 24, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Yeimar', 'Gómez Andrade', '1992-06-30', 'Colombia', 2500000.00, 28, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jackson', 'Ragen', '1998-09-24', 'USA', 2000000.00, 25, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Nouhou', 'Tolo', '1997-06-23', 'Cameroon', 2000000.00, 5, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Alex', 'Roldan', '1996-07-28', 'El Salvador', 1500000.00, 16, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('João', 'Paulo', '1991-03-08', 'Brazil', 3000000.00, 6, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Albert', 'Rusnák', '1994-07-07', 'Slovakia', 4000000.00, 11, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Cristian', 'Roldan', '1995-06-03', 'USA', 2500000.00, 7, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jordan', 'Morris', '1994-10-26', 'USA', 3000000.00, 13, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raúl', 'Ruidíaz', '1990-07-25', 'Peru', 4000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Obed', 'Vargas', '2005-08-05', 'USA', 1500000.00, 73, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Seattle Sounders', 2024);

-- Players for Team: Portland Timbers
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Aljaz', 'Ivacic', '1993-12-29', 'Slovenia', 800000.00, 31, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Miguel', 'Araujo', '1994-10-24', 'Peru', 850000.00, 2, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Dario', 'Zuparic', '1992-05-03', 'Croatia', 1200000.00, 13, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Claudio', 'Bravo', '1997-03-13', 'Argentina', 3000000.00, 5, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Juan', 'Mosquera', '2002-01-01', 'Colombia', 1500000.00, 29, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Diego', 'Chará', '1986-04-05', 'Colombia', 500000.00, 21, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Cristhian', 'Paredes', '1998-05-18', 'Paraguay', 1400000.00, 22, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sebastian', 'Blanco', '1988-03-15', 'Argentina', 750000.00, 10, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Santiago', 'Moreno', '2000-04-21', 'Colombia', 4000000.00, 30, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Felipe', 'Mora', '1993-08-02', 'Chile', 2000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Franck', 'Boli', '1993-12-07', 'Ivory Coast', 3500000.00, 99, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Portland Timbers', 2024);

-- Players for Team: Atlanta United
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Brad', 'Guzan', '1984-09-09', 'USA', 100000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ronald', 'Hernández', '1997-09-21', 'Venezuela', 450000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Derrick', 'Williams', '1993-01-17', 'Ireland', 500000.00, 3, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Luis', 'Abram', '1996-02-27', 'Peru', 3000000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Andrew', 'Gutman', '1996-10-02', 'USA', 900000.00, 15, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Santiago', 'Sosa', '1999-05-03', 'Argentina', 2500000.00, 5, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Thiago', 'Almada', '2001-04-26', 'Argentina', 18000000.00, 23, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Brooks', 'Lennon', '1997-09-22', 'USA', 1500000.00, 11, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Giorgos', 'Giakoumakis', '1994-12-09', 'Greece', 8000000.00, 7, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Edwin', 'Mosquera', '2001-07-27', 'Colombia', 1200000.00, 21, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Machop', 'Chol', '1998-11-15', 'USA', 500000.00, 30, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Atlanta United', 2024);

-- Players for Team: Orlando City
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Pedro', 'Gallese', '1990-02-23', 'Peru', 2000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Robin', 'Jansson', '1991-11-15', 'Sweden', 1000000.00, 6, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rodrigo', 'Schlegel', '1997-04-03', 'Argentina', 800000.00, 15, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rafael', 'Santos', '1998-04-07', 'Brazil', 600000.00, 3, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kyle', 'Smith', '1992-01-09', 'USA', 500000.00, 24, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('César', 'Araújo', '2001-04-02', 'Uruguay', 3000000.00, 5, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Mauricio', 'Pereyra', '1990-03-15', 'Uruguay', 1500000.00, 10, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Facundo', 'Torres', '2000-04-13', 'Uruguay', 12000000.00, 17, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Iván', 'Angulo', '1999-03-22', 'Colombia', 2000000.00, 77, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Ercan', 'Kara', '1996-01-03', 'Austria', 3500000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Duncan', 'McGuire', '2000-11-06', 'USA', 800000.00, 13, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Orlando City', 2024);

-- Players for Team: Toronto
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sean', 'Johnson', '1989-05-31', 'USA', 500000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Richie', 'Laryea', '1995-01-07', 'Canada', 2000000.00, 22, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sigurd', 'Rosted', '1994-07-22', 'Norway', 1000000.00, 17, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Raoul', 'Petretta', '1997-03-24', 'Italy', 800000.00, 28, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jonathan', 'Osorio', '1992-06-12', 'Canada', 3000000.00, 21, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Michael', 'Bradley', '1987-07-31', 'USA', 1200000.00, 4, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Federico', 'Bernardeschi', '1994-02-16', 'Italy', 8000000.00, 10, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Lorenzo', 'Insigne', '1991-06-04', 'Italy', 15000000.00, 24, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Deandre', 'Kerr', '2003-11-29', 'Canada', 1000000.00, 29, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Adama', 'Diomande', '1990-02-14', 'Norway', 700000.00, 99, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kosi', 'Thompson', '2003-01-01', 'Canada', 600000.00, 47, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Toronto', 2024);

-- Players for Team: Chicago Fire
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Chris', 'Brady', '2004-03-03', 'USA', 1000000.00, 34, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Arnaud', 'Souquet', '1992-02-12', 'France', 800000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Rafael', 'Czichos', '1990-05-14', 'Germany', 1200000.00, 5, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Carlos', 'Terán', '2000-09-24', 'Colombia', 1500000.00, 4, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Miguel', 'Navarro', '1999-02-26', 'Venezuela', 1000000.00, 6, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Gaston', 'Gimenez', '1991-07-27', 'Paraguay', 2000000.00, 30, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Brian', 'Gutierrez', '2003-06-19', 'USA', 5000000.00, 17, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Xherdan', 'Shaqiri', '1991-10-10', 'Switzerland', 7500000.00, 10, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Maren', 'Haile-Selassie', '1999-03-13', 'Switzerland', 1500000.00, 77, 'RW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kei', 'Kamara', '1984-09-01', 'Sierra Leone', 200000.00, 23, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Kacper', 'Przybylko', '1993-03-25', 'Poland', 800000.00, 11, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Chicago Fire', 2024);

-- Players for Team: Inter Miami
INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Drake', 'Callender', '1997-10-07', 'USA', 2000000.00, 1, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('DeAndre', 'Yedlin', '1993-07-09', 'USA', 3000000.00, 2, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sergii', 'Kryvtsov', '1991-03-15', 'Ukraine', 1500000.00, 27, 'CB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Jordi', 'Alba', '1989-03-21', 'Spain', 5000000.00, 18, 'LB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Sergio', 'Busquets', '1988-07-16', 'Spain', 7000000.00, 5, 'CDM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Benjamin', 'Cremaschi', '2005-03-02', 'USA', 1000000.00, 30, 'CM');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Facundo', 'Farías', '2002-08-28', 'Argentina', 8000000.00, 11, 'RB');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Robert', 'Taylor', '1994-10-21', 'Finland', 1500000.00, 16, 'LW');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Lionel', 'Messi', '1987-06-24', 'Argentina', 50000000.00, 10, 'GK');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Leonardo', 'Campana', '2000-07-24', 'Ecuador', 4000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);

INSERT INTO player (first_name, last_name, dob, nationality, market_value, jersey_number, position_abb) VALUES ('Luis', 'Suárez', '1987-01-24', 'Uruguay', 6000000.00, 9, 'ST');
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2022);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2023);
INSERT INTO player_team (player_id, team_name, season) VALUES (LAST_INSERT_ID(), 'Inter Miami', 2024);
