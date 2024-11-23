# server/models/broadcaster.py

class Broadcaster:
    def __init__(self, channel_name, streaming_link):
        self.channel_name = channel_name
        self.streaming_link = streaming_link

    def __repr__(self):
        return f"Broadcaster(name={self.channel_name}, streaming_link = {self.streaming_link})"