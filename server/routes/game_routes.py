from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.game import Game

game_bp = Blueprint('game_bp', __name__)

@game_bp.route('/all', methods=['GET'])
def get_all_games():
    connection = get_db_connection()
    try:
        connection = get_db_connection()
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_all_games',)
            result = cursor.fetchall()  # Fetch all results

            games = [
                Game(
                    team_1_name=row['name'],
                    team_2_name=row['country'],
                    stadium_name=row['stadium_name'],
                    match_date=row['match_date'],
                    attendance=row['attendance']
                ).__dict__ for row in result
            ]

            return jsonify(games)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@game_bp.route('/insert', methods=['POST'])
def insert_game():
    # Get parameters from the request body
    connection = get_db_connection()
    try:
        data = request.get_json()
        print(data)

        team_1_name = data.get('team_1_name')
        team_2_name = data.get('team_2_name')
        stadium_name = data.get('stadium_name')
        match_date = data.get('match_date')
        attendance = data.get('attendance')

        if not all([team_1_name, team_2_name, stadium_name, match_date, attendance]):
            return jsonify({'error': 'Missing required fields'}), 400

        with connection.cursor() as cursor:
            # Call the stored procedure to insert the game
            cursor.callproc('insert_game', [team_1_name, team_2_name, stadium_name, match_date, attendance])

            # Commit the transaction (if no errors)
            connection.commit()

            return jsonify({'message': 'Game inserted successfully'}), 200

    except Exception as e:
        # Handle any exceptions, including stored procedure errors
        return jsonify({'error': str(e)}), 500

    finally:
        # Close the database connection
        connection.close()
