from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.stadium import Stadium

stadium_bp = Blueprint('stadium_bp', __name__)

@stadium_bp.route('/all', methods=['GET'])
def get_all_stadiums():
    connection = get_db_connection()  # Assume this gets your database connection
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_all_stadiums',)
            result = cursor.fetchall()  # Fetch all results

            # Format the result into a list of MiniPlayer objects
            stadiums = [
                Stadium(
                    name=row['name'],
                    city=row['city'],
                    zip_code=['zip_code'],
                    capacity=['capacity'],
                ).__dict__ for row in result
            ]

            return jsonify(stadiums)  # Return the players as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@stadium_bp.route('/byTeams', methods=['GET'])
def get_stadium_for_teams():
    team_names = request.args.get('team_names')  # Get the comma-separated list of team names
    if not team_names:
        return jsonify({'error': 'Missing team_names parameter'}), 400

    connection = get_db_connection()  # Assume this gets your database connection
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the team names list
            cursor.callproc('get_stadiums_by_teams_list', [team_names])
            result = cursor.fetchall()  # Fetch all results

            # Format the result into a list of stadium objects
            stadiums = [
                {
                    'name': row['name'],
                    'city': row['city'],
                    'zip_code': row['zip_code'],
                    'capacity': row['capacity']
                }
                for row in result
            ]

            return jsonify(stadiums)  # Return the stadiums as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()