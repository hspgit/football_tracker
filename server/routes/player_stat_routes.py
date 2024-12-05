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
        player_stats = data.get('player_stats')

        # Extract team names and match date for the update procedure
        if len(player_stats) > 0:
            team_1_name = player_stats[0].get('team_1_name')
            team_2_name = player_stats[0].get('team_2_name')
            match_date = player_stats[0].get('match_date')
        else:
            team_1_name = data.get('team_1_name')
            team_2_name = data.get('team_2_name')
            match_date = data.get('match_date')

        # Validate team names and match date
        if not all([team_1_name, team_2_name, match_date]):
            return jsonify({'error': 'Missing required fields for match details'}), 400

        with connection.cursor() as cursor:
            # If player_stats is not empty, insert stats
            if len(player_stats) > 0:
                for stat in player_stats:
                    player_id = stat.get('player_id')
                    goals_scored = stat.get('goals_scored', 0)
                    yellow_card = stat.get('yellow_card', 0)
                    red_card = stat.get('red_card', 0)

                    # Validate required fields for each player stat
                    if not all([player_id, team_1_name, team_2_name, match_date]):
                        return jsonify({'error': 'Missing required fields for player stat'}), 400

                    # Call the stored procedure to insert player stats
                    cursor.callproc('update_player_stats', [player_id, team_1_name, team_2_name, match_date, goals_scored, yellow_card, red_card])

            # Call the procedure to update league team stats regardless of player stats
            cursor.callproc('update_league_team_stats', [team_1_name, team_2_name, match_date])

            # Commit the transaction after all operations
            connection.commit()

            return jsonify({'message': 'Player statistics and league team stats updated successfully'}), 200

    except Exception as e:
        # Handle any exceptions, including stored procedure errors
        return jsonify({'error': str(e)}), 500

    finally:
        # Close the database connection
        connection.close()

# @player_stat_bp.route('/insert', methods=['POST'])
# def update_game():
#     # Get parameters from the request body
#     connection = get_db_connection()
#     try:
#         data = request.get_json()
#         print(data)
#
#         # Extract the match details and player stats from the input
#         team_1_name = data.get('team_1_name')
#         team_2_name = data.get('team_2_name')
#         match_date = data.get('match_date')
#         player_stats = data.get('player_stats')
#         is_recalculated = data.get('is_recalculated', False)
#
#         # Validate required fields
#         if not all([team_1_name, team_2_name, match_date, player_stats]):
#             return jsonify({'error': 'Missing required fields'}), 400
#
#         # Initialize variables for current stats
#         team_1_goals = 0
#         team_2_goals = 0
#         prev_team_1_goals = 0
#         prev_team_2_goals = 0
#         prev_team_1_wins = 0
#         prev_team_2_wins = 0
#         prev_team_1_losses = 0
#         prev_team_2_losses = 0
#         prev_team_1_goals_scored = 0
#         prev_team_2_goals_scored = 0
#         prev_team_1_goals_conceded = 0
#         prev_team_2_goals_conceded = 0
#
#         # Open a database connection
#         with connection.cursor() as cursor:
#             # Step 1: Get the current league stats for both teams
#             cursor.execute("""
#                 SELECT
#                     matches_played, wins, losses, goals_scored, goals_conceded
#                 FROM
#                     league_team
#                 WHERE
#                     team_name = %s AND league_name = (SELECT league_name FROM league_team WHERE team_name = %s LIMIT 1)
#                     AND season = YEAR(%s)
#             """, (team_1_name, team_1_name, match_date))
#
#             # Fetch current stats for team_1
#             team_1_current_stats = cursor.fetchone()
#
#             cursor.execute("""
#                 SELECT
#                     matches_played, wins, losses, goals_scored, goals_conceded
#                 FROM
#                     league_team
#                 WHERE
#                     team_name = %s AND league_name = (SELECT league_name FROM league_team WHERE team_name = %s LIMIT 1)
#                     AND season = YEAR(%s)
#             """, (team_2_name, team_2_name, match_date))
#
#             # Fetch current stats for team_2
#             team_2_current_stats = cursor.fetchone()
#
#             # Step 2: Get the current player stats for the game (before update)
#             cursor.execute("""
#                 SELECT
#                     SUM(goals_scored) AS team_1_goals,
#                     SUM(goals_scored) AS team_2_goals
#                 FROM player_stat
#                 WHERE
#                     team_1_name = %s AND team_2_name = %s AND match_date = %s
#             """, (team_1_name, team_2_name, match_date))
#
#             game_stats = cursor.fetchone()
#             prev_team_1_goals = game_stats['team_1_goals']
#             prev_team_2_goals = game_stats['team_2_goals']
#
#             # Step 3: Compare input data with current data and calculate the difference
#             team_1_goals = sum(stat['goals_scored'] for stat in player_stats if stat['team_name'] == team_1_name)
#             team_2_goals = sum(stat['goals_scored'] for stat in player_stats if stat['team_name'] == team_2_name)
#
#             # Step 4: Update the league team stats for both teams based on the comparison
#             if team_1_goals > team_2_goals:
#                 wins_delta_1 = 1
#                 losses_delta_1 = 0
#             else:
#                 wins_delta_1 = 0
#                 losses_delta_1 = 1
#
#             if team_2_goals > team_1_goals:
#                 wins_delta_2 = 1
#                 losses_delta_2 = 0
#             else:
#                 wins_delta_2 = 0
#                 losses_delta_2 = 1
#
#             # Update team 1 stats
#             cursor.execute("""
#                 UPDATE league_team
#                 SET
#                     matches_played = matches_played + 1,
#                     wins = wins + %s,
#                     losses = losses + %s,
#                     goals_scored = goals_scored + %s,
#                     goals_conceded = goals_conceded + %s
#                 WHERE
#                     team_name = %s AND league_name = (SELECT league_name FROM league_team WHERE team_name = %s LIMIT 1)
#                     AND season = YEAR(%s)
#             """, (wins_delta_1, losses_delta_1, team_1_goals, team_2_goals, team_1_name, team_1_name, match_date))
#
#             # Update team 2 stats
#             cursor.execute("""
#                 UPDATE league_team
#                 SET
#                     matches_played = matches_played + 1,
#                     wins = wins + %s,
#                     losses = losses + %s,
#                     goals_scored = goals_scored + %s,
#                     goals_conceded = goals_conceded + %s
#                 WHERE
#                     team_name = %s AND league_name = (SELECT league_name FROM league_team WHERE team_name = %s LIMIT 1)
#                     AND season = YEAR(%s)
#             """, (wins_delta_2, losses_delta_2, team_2_goals, team_1_goals, team_2_name, team_2_name, match_date))
#
#             # Step 5: Update player stats in the player_stat table
#             for stat in player_stats:
#                 player_id = stat.get('player_id')
#                 goals_scored = stat.get('goals_scored', 0)
#                 yellow_card = stat.get('yellow_card', 0)
#                 red_card = stat.get('red_card', 0)
#
#                 cursor.execute("""
#                     UPDATE player_stat
#                     SET
#                         goals_scored = %s,
#                         yellow_card = %s,
#                         red_card = %s
#                     WHERE
#                         player_id = %s AND team_1_name = %s AND team_2_name = %s AND match_date = %s
#                 """, (goals_scored, yellow_card, red_card, player_id, team_1_name, team_2_name, match_date))
#
#             # Commit the transaction after all operations
#             connection.commit()
#
#             return jsonify({'message': 'Game and player stats updated successfully'}), 200
#
#     except Exception as e:
#         # Handle any exceptions, including stored procedure errors
#         return jsonify({'error': str(e)}), 500
#
#     finally:
#         # Close the database connection
#         connection.close()

# @player_stat_bp.route('/insert', methods=['POST'])
# def insert_player_stat():
#     connection = get_db_connection()
#     try:
#         data = request.get_json()
#         player_stats = data.get('player_stats', [])
#         print(player_stats)
#
#         # Extract team names and match date
#         if player_stats:
#             team_1_name = player_stats[0].get('team_1_name')
#             team_2_name = player_stats[0].get('team_2_name')
#             match_date = player_stats[0].get('match_date')
#         else:
#             team_1_name = data.get('team_1_name')
#             team_2_name = data.get('team_2_name')
#             match_date = data.get('match_date')
#
#         # Validate required fields
#         if not all([team_1_name, team_2_name, match_date]):
#             return jsonify({'error': 'Missing required match details'}), 400
#
#         with connection.cursor() as cursor:
#             # Check if the match already exists
#             cursor.execute("""
#                 SELECT COUNT(*) as match_count
#                 FROM player_stat
#                 WHERE team_1_name = %s AND team_2_name = %s AND match_date = %s
#             """, (team_1_name, team_2_name, match_date))
#             match_exists = cursor.fetchone()['match_count'] > 0
#             print(match_exists)
#
#             # Insert or update player stats
#             if player_stats:
#                 for stat in player_stats:
#                     player_id = stat.get('player_id')
#                     goals_scored = stat.get('goals_scored', 0)
#                     yellow_card = stat.get('yellow_card', 0)
#                     red_card = stat.get('red_card', 0)
#
#                     # Validate required fields for each player stat
#                     if not all([player_id, team_1_name, team_2_name, match_date]):
#                         return jsonify({'error': 'Missing required fields for player stat'}), 400
#
#                     # Call the stored procedure to insert/update player stats
#                     cursor.callproc('update_player_stats', [
#                         player_id, team_1_name, team_2_name, match_date,
#                         goals_scored, yellow_card, red_card
#                     ])
#
#             # Call appropriate procedure based on match existence
#             if match_exists:
#                 cursor.callproc('update_existing_match_team_stats', [
#                     team_1_name, team_2_name, match_date
#                 ])
#             else:
#                 cursor.callproc('insert_new_match_team_stats', [
#                     team_1_name, team_2_name, match_date
#                 ])
#
#             # Commit the transaction
#             connection.commit()
#
#             return jsonify({
#                 'message': 'Player statistics and league team stats updated successfully',
#                 'match_status': 'Updated' if match_exists else 'Added'
#             }), 200
#
#     except Exception as e:
#         # Rollback in case of error
#         connection.rollback()
#         return jsonify({'error': str(e)}), 500
#
#     finally:
#         # Close the database connection
#         connection.close()

@player_stat_bp.route('/top_stat', methods=['GET'])
def get_top_stat():
    # Get parameters from the request arguments
    connection = get_db_connection()
    try:
        league_name = request.args.get('league_name')
        season = request.args.get('season')
        stat_name = request.args.get('stat_name')

        # Validate the required fields
        if not all([league_name, season, stat_name]):
            return jsonify({'error': 'Missing required query parameters: league_name, season, stat_name'}), 400

        with connection.cursor() as cursor:
            # Call the stored procedure to retrieve the top stats
            cursor.callproc('get_league_top_stat', [league_name, season, stat_name])
            results = cursor.fetchall()

            # Format the results into a JSON-friendly structure
            top_stats = [
                {
                    'player_id': row['player_id'],
                    'first_name': row['first_name'],
                    'last_name': row['last_name'],
                    'position_abb': row['position_abb'],
                    'team_name': row['team_name'],
                    'total_stat': row['total_stat']
                }
                for row in results
            ]

            return jsonify({'top_stats': top_stats}), 200

    except Exception as e:
        # Handle any exceptions, including stored procedure errors
        return jsonify({'error': str(e)}), 500

    finally:
        # Close the database connection
        connection.close()

@player_stat_bp.route('/for_seasons', methods=['GET'])
def get_stat_over_time():
    connection = get_db_connection()
    try:
        player_id = request.args.get('player_id')
        seasons = request.args.get('season')

        # Validate the required fields
        if not player_id or not seasons:
            return jsonify({'error': 'Missing required query parameters: player_id, seasons'}), 400

        with connection.cursor() as cursor:
            # Call the new procedure with player_id and seasons_str
            cursor.callproc('player_stats_across_seasons', [player_id, seasons])
            result = cursor.fetchall()  # Fetch the result from the procedure

        # Return the fetched result as JSON
        return jsonify(result), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        connection.close()

@player_stat_bp.route('/get', methods=['GET'])
def get_player_stats():
    connection = get_db_connection()
    try:
        team_1_name = request.args.get('team_1_name')
        team_2_name = request.args.get('team_2_name')
        match_date = request.args.get('match_date')

        if not all([team_1_name, team_2_name, match_date]):
            return jsonify({'error': 'Missing required fields for match details'}), 400

        with connection.cursor() as cursor:
            cursor.callproc('get_player_stats_for_game', [team_1_name, team_2_name, match_date])
            results = cursor.fetchall()

            player_stats = [
                PlayerStat(
                    player_id = row['player_id'],
                    team_1_name = row['team_1_name'],
                    team_2_name= row['team_2_name'],
                    match_date = row['match_date'],
                    goals_scored = row['goals_scored'],
                    yellow_card = row['yellow_card'],
                    red_card = row['red_card']

                ) for row in results
            ]

            player_stats_dict = [player_stat.__dict__ for player_stat in player_stats]
        return jsonify(player_stats_dict)

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()
