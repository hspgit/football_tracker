class LeagueTableRow:
    def __init__(self, league_name, team_name, season, matches_played, wins, losses, draws, goals_scored, goals_conceded, goal_difference, points):
        self.league_name = league_name
        self.team_name = team_name
        self.season = season
        self.matches_played = matches_played
        self.wins = wins
        self.losses = losses
        self.draws = draws #derived
        self.goals_scored = goals_scored
        self.goals_conceded = goals_conceded
        self.goal_difference = goal_difference #derived
        self.points = points #derived
