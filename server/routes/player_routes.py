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

@player_bp.route('/latest-team', methods=['GET'])
def get_latest_team_by_player_id():
    player_id = request.args.get('player_id')  # Get 'player_id' from query parameters

    # Validate player_id
    if not player_id:
        return jsonify({'error': 'Player ID is required'}), 400

    try:
        player_id = int(player_id)  # Ensure player_id is an integer
    except ValueError:
        return jsonify({'error': 'Invalid player ID'}), 400

    conn = get_db_connection()
    cursor = conn.cursor()  # Use dictionary cursor to get column names

    try:
        # Call the stored procedure
        cursor.callproc('get_latest_team_by_player_id', [player_id])

        # Fetch results from the procedure
        results = cursor.fetchone()

        # Check if a team was found
        if results and results['team_name'] is not None:
            return jsonify({
                'team_name': results['team_name'],
                'season': results['season']
            })
        else:
            return jsonify({
                'team_name': None,
                'season': None
            }), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        cursor.close()
        conn.close()