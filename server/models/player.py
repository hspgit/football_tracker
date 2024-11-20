class MiniPlayer:
    def __init__(self, player_id, first_name, last_name):
        self.player_id = player_id
        self.first_name = first_name
        self.last_name = last_name

class Player:
    def __init__(self, mini_player, dob, nationality, market_value, jersey_number, position_abb):
        self.mini_player = mini_player  # Composition
        self.dob = dob
        self.nationality = nationality
        self.market_value = market_value
        self.jersey_number = jersey_number
        self.position_abb = position_abb