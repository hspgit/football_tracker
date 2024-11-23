from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.broadcaster import Broadcaster

broadcaster_bp = Blueprint('broadcaster_bp', __name__)

@broadcaster_bp.route('/all', methods=['GET'])
def get_all_broadcasters():
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            cursor.callproc('get_all_broadcasters',)
            result = cursor.fetchall()  # Fetch all results

            broadcasters = [
                Broadcaster(
                    channel_name=row['channel_name'],
                    streaming_link=row['streaming_link'],
                ).__dict__ for row in result
            ]

            return jsonify(broadcasters)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()
