# server/routes/team_routes.py

from flask import Blueprint, jsonify
from server.db import get_db_connection

team_bp = Blueprint('team_bp', __name__)

@team_bp.route('/all', methods=['GET'])
def get_all_teams():
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            cursor.callproc('get_all_teams')  # Stored procedure to get all teams
            result = cursor.fetchall()
            return jsonify(result)  # Return result as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@team_bp.route('/<string:name>', methods=['GET'])
def get_team_by_name(name):
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            cursor.callproc('get_team_by_name', (name,))  # Stored procedure to get a team by Name
            result = cursor.fetchall()
            return jsonify(result)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()