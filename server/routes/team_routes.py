# server/routes/team_routes.py
from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.player import Player
from server.models.team import Team

team_bp = Blueprint('team_bp', __name__)


@team_bp.route('/all', methods=['GET'])
def get_teams():
    team_name = request.args.get('team_name', '')
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Call the stored procedure
        cursor.callproc('search_team', [team_name])

        results = cursor.fetchall()

        teams = [
            Team(
                name=row['name'],
                established_year=row['established_year']
            )
            for row in results
        ]

        teams_dict = [player.__dict__ for player in teams]
        return jsonify(teams_dict)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        cursor.close()
        conn.close()

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
                Player(
                    player_id=row['player_id'],
                    first_name=row['first_name'],
                    last_name=row['last_name'],
                    dob= row['dob'],
                    nationality = row['nationality'],
                    market_value = row['market_value'],
                    jersey_number = row['jersey_number'],
                    position_abb = row['position_abb']

                ).__dict__ for row in result
            ]

            return jsonify(players)  # Return the players as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@team_bp.route('/details', methods=['GET'])
def get_team_details():
    team_name = request.args.get('team_name')
    season = request.args.get('season')
    connection = get_db_connection()
    if not team_name:
        return jsonify({'error': 'Missing required query parameter: team_name'}), 400
    if not season:
        season = 2024

    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_team_details', (team_name, season))
            results = cursor.fetchall()  # Fetch all results

            # Assuming the stored procedure returns one row
            if results:
                team_details = [
                    {
                        'manager_id': row['manager_id'],
                        'first_name': row['first_name'],
                        'last_name': row['last_name'],
                        'team_name': row['team_name'],
                        'dob': row['dob'],
                        'nationality': row['nationality'],
                        'league_name': row['league_name'],
                        'stadium_name': row['stadium_name'],
                        'total_team_value': row['total_team_value']
                    }
                    for row in results
                ]

                return jsonify(team_details)  # Return the details as JSON
            else:
                return jsonify({'message': 'No data found for the given team and season'}), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@team_bp.route('/insert', methods=['POST'])
def insert_team():
    data = request.get_json()
    print(data)

    league_name = data.get('leagueName')
    seasons = data.get('seasons')
    team_data = data.get('team')
    stadium_data = data.get('stadium')
    manager_data = data.get('manager')
    players_data = data.get('players')

    if not all([league_name, seasons, team_data, stadium_data, manager_data, players_data]):
        return jsonify({'error': 'Missing required data'}), 400

    team_name = team_data.get('name')
    established_year = team_data.get('established_year')

    stadium_name = stadium_data.get('name')
    city = stadium_data.get('city')
    zip_code = stadium_data.get('zip_code')
    capacity = stadium_data.get('capacity')

    # Extract manager data
    manager_first_name = manager_data.get('first_name')
    manager_last_name = manager_data.get('last_name')
    manager_dob = manager_data.get('dob')
    manager_nationality = manager_data.get('nationality')

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Start transaction
            # Ensure the league exists
            cursor.execute("SELECT COUNT(*) AS cnt FROM league WHERE name = %s", (league_name,))
            result = cursor.fetchone()
            if result['cnt'] == 0:
                return jsonify({'error': f'League \"{league_name}\" does not exist.'}), 400

            # Insert team
            cursor.callproc('insert_team', [team_name, established_year])

            # Insert stadium
            cursor.callproc('insert_stadium', [stadium_name, city, zip_code, capacity, team_name])

            # Insert manager
            cursor.callproc('insert_manager', [manager_first_name, manager_last_name, manager_dob, manager_nationality, team_name])

            # Insert into league_team for each season
            for season in seasons:
                cursor.callproc('insert_league_team', [league_name, team_name, season])

            # Insert players and player_team entries
            for player_data in players_data:
                # Skip players with missing required fields
                required_player_fields = ['first_name', 'last_name', 'dob', 'nationality', 'jersey_number', 'position_abb']
                if not all(player_data.get(field) for field in required_player_fields):
                    continue  # Skip this player

                first_name = player_data.get('first_name')
                last_name = player_data.get('last_name')
                dob = player_data.get('dob')
                nationality = player_data.get('nationality')
                market_value = player_data.get('market_value') or 0.0
                jersey_number = player_data.get('jersey_number')
                position_abb = player_data.get('position_abb')

                # Insert player
                cursor.callproc('insert_player', [first_name, last_name, dob, nationality, market_value, jersey_number, position_abb])

                # Get the last inserted player_id
                cursor.execute('SELECT LAST_INSERT_ID() AS player_id')
                result = cursor.fetchone()
                player_id = result['player_id']

                # Insert into player_team for each season
                for season in seasons:
                    cursor.callproc('insert_player_team', [player_id, team_name, season])

            # Commit transaction
            connection.commit()

        return jsonify({'message': 'Team inserted successfully'}), 200

    except Exception as e:
        # Rollback in case of error
        connection.rollback()
        print(f"An error occurred: {e}")  # Print the exception for debugging
        return jsonify({'error': str(e)}), 500

    finally:
        connection.close()


@team_bp.route('/latest-season', methods=['GET'])
def latest_season():
    team_name = request.args.get('team_name')

    if not team_name:
        return jsonify({'error': 'Team Name is required'}), 400


    conn = get_db_connection()
    cursor = conn.cursor()  # Use dictionary cursor to get column names

    try:
        # Call the stored procedure
        cursor.callproc('get_latest_season_by_team', [team_name])

        # Fetch results from the procedure
        results = cursor.fetchone()

        # Check if a team was found
        if results and results['season'] is not None:
            return jsonify({
                'league_name': results['league_name'],
                'season': results['season']
            })
        else:
            return jsonify({
                'league_name': None,
                'season': None
            }), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500

    finally:
        cursor.close()
        conn.close()


@team_bp.route('/delete', methods=['DELETE'])
def delete_team():
    team_name = request.args.get('team_name')
    team_name = request.args.get('team_name')
    connection = get_db_connection()

    try:
        with connection.cursor() as cursor:
            cursor.callproc('delete_team_and_recalculate', [team_name])
            result = cursor.fetchall()
            connection.commit()

            return jsonify({'message': 'Team deleted successfully'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()
