from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.player import Player

player_bp = Blueprint('player_bp', __name__)

@player_bp.route('/all', methods=['GET'])
def get_players():
    player_name = request.args.get('player_name', '')  # Get 'player_name' from query parameters, default to empty string
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Call the stored procedure
        cursor.callproc('search_player', [player_name])

        # Fetch results from the procedure
        results = cursor.fetchall()

        # Map results to Player objects
        players = [
            Player(
                player_id=row['player_id'],
                first_name=row['first_name'],
                last_name=row['last_name'],
                dob=row['dob'],
                nationality=row['nationality'],
                market_value=row['market_value'],
                jersey_number=row['jersey_number'],
                position_abb=row['position_abb'],
            )
            for row in results
        ]

        # Convert Player objects to dictionaries for JSON serialization
        players_dict = [player.__dict__ for player in players]
        return jsonify(players_dict)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        cursor.close()
        conn.close()