# app/__init__.py

from flask import Flask
from flask_cors import CORS
from server.config import Config
from server.routes import league_routes
from server.routes.league_routes import league_bp
from server.routes.player_stat_routes import player_stat_bp
from server.routes.stadium_routes import stadium_bp
from server.routes.team_routes import team_bp
from server.routes.game_routes import game_bp

def create_app():
    # Create the Flask app instance
    app = Flask(__name__)

    # Load configuration from config.py
    app.config.from_object(Config)

    # Initialize extensions with the app instance
    CORS(app)

    # Register Blueprints for routes
    app.register_blueprint(team_bp, url_prefix='/api/teams')
    app.register_blueprint(league_bp, url_prefix='/api/leagues')
    app.register_blueprint(stadium_bp, url_prefix='/api/stadiums')
    app.register_blueprint(game_bp, url_prefix='/api/games')
    app.register_blueprint(player_stat_bp, url_prefix='/api/player_stats')
    return app