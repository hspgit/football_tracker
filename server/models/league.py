# server/models/league.py

class League:
    def __init__(self, name, country):
        self.name = name
        self.country = country

    def __repr__(self):
        return f"Team(name={self.name}, country = {self.country})"