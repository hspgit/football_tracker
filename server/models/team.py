# server/models/team.py

class Team:
    def __init__(self, name, established_year):
        self.name = name
        self.established_year = established_year

    def __repr__(self):
        return f"Team(name={self.name}, established_year = {self.established_year})"