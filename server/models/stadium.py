# server/models/stadium.py

class Stadium:
    def __init__(self, name, city, zip_code, capacity):
        self.name = name
        self.city = city
        self.zip_code = zip_code,
        self.capacity = capacity

    def __repr__(self):
        return f"Team(name={self.name}, city = {self.city})"