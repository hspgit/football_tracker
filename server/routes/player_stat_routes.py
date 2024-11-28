from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.player_stat import PlayerStat

player_stat_bp = Blueprint('player_stat_bp', __name__)

@player_stat_bp.route('/insert', methods=['POST'])
def insert_player_stat():
    # Get parameters from the request body
    connection = get_db_connection()
    try:
        data = request.get_json()
        print(data)

        # Check if 'player_stats' is provided in the request body
        player_stats = data.get('player_stats')
        if not player_stats or not isinstance(player_stats, list):
            return jsonify({'error': 'Invalid or missing player_stats list'}), 400

        # Extract team names and match date for the update procedure
        if len(player_stats) > 0:
            team_1_name = player_stats[0].get('team_1_name')
            team_2_name = player_stats[0].get('team_2_name')
            match_date = player_stats[0].get('match_date')
        else:
            return jsonify({'error': 'No player stats provided'}), 400

        with connection.cursor() as cursor:
            # Loop through the list of player stats and insert each one
            for stat in player_stats:
                player_id = stat.get('player_id')
                goals_scored = stat.get('goals_scored')
                yellow_card = stat.get('yellow_card')
                red_card = stat.get('red_card')

                # Validate required fields for each player stat
                if not all([player_id, team_1_name, team_2_name, match_date, goals_scored is not None, yellow_card is not None, red_card is not None]):
                    return jsonify({'error': 'Missing required fields for player stat'}), 400

                # Call the stored procedure to insert the player statistics for each player
                cursor.callproc('insert_player_stat', [player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card])

            # Call the update_league_team_stats procedure after all player stats are inserted
            cursor.callproc('update_league_team_stats', [team_1_name, team_2_name, match_date])

            # Commit the transaction after inserting all player stats and updating league stats
            connection.commit()

            return jsonify({'message': 'Player statistics and league team stats updated successfully'}), 200

    except Exception as e:
        # Handle any exceptions, including stored procedure errors
        return jsonify({'error': str(e)}), 500

    finally:
        # Close the database connection
        connection.close()