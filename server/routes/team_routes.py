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
    return jsonify({'message': 'Data received '}), 200