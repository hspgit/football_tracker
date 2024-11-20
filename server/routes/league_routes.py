from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.league import League
from server.models.team import Team

league_bp = Blueprint('league_bp', __name__)

@league_bp.route('/all', methods=['GET'])
def get_all_leagues():
    connection = get_db_connection()  # Assume this gets your database connection
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_all_leagues',)
            result = cursor.fetchall()  # Fetch all results

            # Format the result into a list of MiniPlayer objects
            leagues = [
                League(
                    name=row['name'],
                    country=row['country']
                ).__dict__ for row in result
            ]

            return jsonify(leagues)  # Return the players as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@league_bp.route('/teams', methods=['GET'])
def get_all_teams():
    # Get query parameters
    league_name = request.args.get('league_name')
    season = request.args.get('season')
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            cursor.callproc('get_league_teams_for_season', (league_name, season))  # Stored procedure to get all teams
            result = cursor.fetchall()
            # Transform database results into Team objects
            teams = [Team(name=row['name'], established_year=row['established_year']) for row in result]
            # Convert Team objects to dictionaries for JSON serialization
            teams_dict = [team.__dict__ for team in teams]
            print(teams_dict)

            return jsonify(teams_dict)  # Return the serialized result as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()
