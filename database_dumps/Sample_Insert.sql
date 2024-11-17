-- Sample data
USE football_tracker;


-- Insert Barclays into the sponsor table
INSERT INTO sponsor (name, country, industry, website_url) VALUES
    ('Barclays', 'England', 'Banking', 'https://www.barclays.co.uk');

-- Link Barclays to the Premier League in the sponsor_league table
INSERT INTO sponsor_league (sponsor_name, league_name, sponsorship_amount) VALUES
    ('Barclays', 'Premier League', 50000000.00);    



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

 -- Error Code: 1054. Unknown column 'g.season' in 'field list'
 
 -- Error Code: 1048. Column 'league_name' cannot be null



    