import pandas as pd
from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.game import Game
import joblib

game_bp = Blueprint('game_bp', __name__)

@game_bp.route('/all', methods=['GET'])
def get_all_games():
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_all_games',)
            result = cursor.fetchall()  # Fetch all results

            games = [
                Game(
                    team_1_name=row['team_1_name'],
                    team_2_name=row['team_2_name'],
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

@game_bp.route('/team-games', methods=['GET'])
def get_team_games():
    # Get query parameters
    team_1_name = request.args.get('team_1_name')
    team_2_name = request.args.get('team_2_name')
    season = request.args.get('season', type=int)

    if not team_1_name or not team_2_name or not season:
        return jsonify({'error': 'Missing required query parameters: team_1_name, team_2_name, season'}), 400

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_team_games', (team_1_name, team_2_name, season))
            result = cursor.fetchall()  # Fetch all results

            # Transform the result into a list of dictionaries
            games = [
                Game(
                    team_1_name=row['team_1_name'],
                    team_2_name=row['team_2_name'],
                    stadium_name=row['stadium_name'],
                    match_date=row['match_date'],
                    attendance=row['attendance']
                ).__dict__ for row in result
            ]

            return jsonify(games)  # Return the result as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()


# model_path = "../ml_model/ml_model.pkl"
# with open(model_path, "rb") as file:
#     model = joblib.load(file)

model_path = "../ml_model/ml_model.pkl"
model = joblib.load(model_path)

# Load the LabelEncoder (you must save it in train_model.py)
encoder_path = "../ml_model/label_encoder.pkl"
encoder = joblib.load(encoder_path)

# Mapping for results: 0 = HomeWin, 1 = Draw, 2 = AwayWin
result_map = {0: "HomeWin", 1: "Draw", 2: "AwayWin"}

# Define the route for predictions
@game_bp.route('/predict', methods=['GET'])
def predict():
    # Get team names from the request
    home_team = request.args.get('home_team')
    away_team = request.args.get('away_team')

    # Check if team names are valid
    if home_team not in encoder.classes_ or away_team not in encoder.classes_:
        return jsonify({'error': 'Invalid team name'}), 400

    # Encode team names
    home_team_encoded = encoder.transform([home_team])[0]
    away_team_encoded = encoder.transform([away_team])[0]

    # Create input features as a DataFrame with feature names
    input_features = pd.DataFrame([{
        'home_team_encoded': home_team_encoded,
        'away_team_encoded': away_team_encoded
    }])

    # Predict using the loaded model
    prediction = model.predict(input_features)

    # Optionally get prediction probabilities for HomeWin, Draw, HomeLoss
    probabilities = model.predict_proba(input_features)

    # Return the prediction and probabilities
    response = {
        'prediction': int(prediction[0]),  # Convert to int for JSON compatibility
        'probabilities': probabilities.tolist()[0]  # Flatten the list for the response
    }

    # Map the predicted result to a more readable format (0 = HomeWin, 1 = Draw, 2 = AwayWin)
    response['prediction_label'] = result_map[response['prediction']]

    return jsonify(response)