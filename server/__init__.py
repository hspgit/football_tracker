# app/__init__.py

from flask import Flask
from flask_cors import CORS
from server.config import Config  # Import your configuration
from server.routes.team_routes import team_bp

def create_app():
    # Create the Flask app instance
    app = Flask(__name__)

    # Load configuration from config.py
    app.config.from_object(Config)

    # Initialize extensions with the app instance
    CORS(app)

    # Register Blueprints for routes
    # from .routes.league_routes import league_bp
    app.register_blueprint(team_bp, url_prefix='/api/teams')
    # app.register_blueprint(league_bp, url_prefix='/api/leagues')

    # Additional setup or extensions can be added here
    return app