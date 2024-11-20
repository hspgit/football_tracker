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