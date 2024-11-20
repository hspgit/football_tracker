# server/routes/team_routes.py
from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.player import MiniPlayer


team_bp = Blueprint('team_bp', __name__)



@team_bp.route('/players', methods=['GET'])
def get_team_players_for_season():
    # Get query parameters
    team_name = request.args.get('team_name')
    season = request.args.get('season')

    # Validate query parameters

    if not team_name or not season:
        return jsonify({'error': 'Missing required query parameters: team_name and season'}), 400

    try:
        # Convert season to an integer
        season = int(season)
    except ValueError:
        return jsonify({'error': 'Season must be an integer'}), 400

    connection = get_db_connection()  # Assume this gets your database connection
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_team_players_for_season', (team_name, season))
            result = cursor.fetchall()  # Fetch all results

            # Format the result into a list of MiniPlayer objects
            players = [
                MiniPlayer(
                    player_id=row['player_id'],
                    first_name=row['first_name'],
                    last_name=row['last_name']
                ).__dict__ for row in result
            ]

            return jsonify(players)  # Return the players as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()
