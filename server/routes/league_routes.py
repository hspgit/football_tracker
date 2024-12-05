from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.league import League
from server.models.league_table import LeagueTableRow
from server.models.team import Team

league_bp = Blueprint('league_bp', __name__)

@league_bp.route('/all', methods=['GET'])
def get_all_leagues():
    connection = get_db_connection()  # Assume this gets your database connection
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure with the provided parameters
            cursor.callproc('get_all_leagues',)
            result = cursor.fetchall()  # Fetch all results

            leagues = [
                League(
                    name=row['name'],
                    country=row['country']
                ).__dict__ for row in result
            ]

            return jsonify(leagues)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@league_bp.route('/teams', methods=['GET'])
def get_all_teams():
    # Get query parameters
    league_name = request.args.get('league_name')
    season = request.args.get('season')
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            cursor.callproc('get_league_teams_for_season', (league_name, season))  # Stored procedure to get all teams
            result = cursor.fetchall()
            # Transform database results into Team objects
            teams = [
                Team(
                    name=row['name'],
                    established_year=row['established_year']
                ).__dict__ for row in result
            ]
            # Convert Team objects to dictionaries for JSON serialization
            return jsonify(teams)  # Return the serialized result as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@league_bp.route('/table', methods=['GET'])
def get_league_table():
    # Get query parameters
    league_name = request.args.get('league_name')
    season = request.args.get('season')
    sort_column = request.args.get('sort_column', 'points')  # Default to 'points'
    sort_order = request.args.get('sort_order', 'DESC')  # Default to 'DESC'

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure to get the league table
            cursor.callproc('get_league_table', (league_name, season, sort_column, sort_order))
            result = cursor.fetchall()

            # Transform database results into LeagueTable objects
            league_table = [
                LeagueTableRow(
                    league_name=row['league_name'],
                    team_name=row['team_name'],
                    season=row['season'],
                    matches_played=row['matches_played'],
                    wins=row['wins'],
                    losses=row['losses'],
                    goals_scored=row['goals_scored'],
                    goals_conceded=row['goals_conceded'],
                    points=row['points'],
                    goal_difference=row['goal_difference'],
                    draws=row['draws']
                )
                for row in result
            ]

            # Convert LeagueTable objects to dictionaries for JSON serialization
            league_table_dict = [entry.__dict__ for entry in league_table]

            return jsonify(league_table_dict)  # Return the serialized result as JSON
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@league_bp.route('/team_rank', methods=['GET'])
def get_team_rank():
    # Get query parameters
    league_name = request.args.get('league_name')
    season = request.args.get('season')
    team_name = request.args.get('team_name')
    sort_column = request.args.get('sort_column', 'points')  # Default to 'points'
    sort_order = request.args.get('sort_order', 'DESC')  # Default to 'DESC'

    # Ensure that the required parameters are provided
    if not league_name or not season or not team_name:
        return jsonify({'error': 'Missing required parameters'}), 400

    # Connect to the database
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure to get the league table
            cursor.callproc('get_league_table', (league_name, season, sort_column, sort_order))
            result = cursor.fetchall()

            # Transform database results into a list of dictionaries (LeagueTableRow)
            league_table = [
                {
                    'league_name': row['league_name'],
                    'team_name': row['team_name'],
                    'season': row['season'],
                    'matches_played': row['matches_played'],
                    'wins': row['wins'],
                    'losses': row['losses'],
                    'goals_scored': row['goals_scored'],
                    'goals_conceded': row['goals_conceded'],
                    'points': row['points'],
                    'goal_difference': row['goal_difference'],
                    'draws': row['draws']
                }
                for row in result
            ]

            # Find the rank for the input team_name
            rank = 0
            for idx, team in enumerate(league_table, start=1):
                if team['team_name'] == team_name:
                    rank = idx
                    break

            if rank == 0:
                return jsonify({'error': 'Team not found in the league table'}), 404

            # Find the team data based on the rank
            team_data = next((team for team in league_table if team['team_name'] == team_name), None)

            return jsonify({
                'team_rank': rank,
                'league_name': team_data['league_name'],
                'team_name': team_data['team_name'],
                'season': team_data['season'],
                'matches_played': team_data['matches_played'],
                'wins': team_data['wins'],
                'losses': team_data['losses'],
                'goals_scored': team_data['goals_scored'],
                'goals_conceded': team_data['goals_conceded'],
                'points': team_data['points'],
                'goal_difference': team_data['goal_difference'],
                'draws': team_data['draws']
            })
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@league_bp.route('/home', methods=['GET'])
def get_league_with_ranks():
    # Get query parameters
    league_name = request.args.get('league_name')
    season = request.args.get('season')
    sort_column = request.args.get('sort_column', 'points')  # Default to 'points'
    sort_order = request.args.get('sort_order', 'DESC')  # Default to 'DESC'

    # Ensure that the required parameters are provided
    if not league_name or not season:
        return jsonify({'error': 'Missing required parameters'}), 400

    # Connect to the database
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call the stored procedure to get the league table
            cursor.callproc('get_league_table', (league_name, season, sort_column, sort_order))
            result = cursor.fetchall()

            # Transform database results into a list of dictionaries (LeagueTableRow)
            league_table = [
                {
                    'league_name': row['league_name'],
                    'team_name': row['team_name'],
                    'season': row['season'],
                    'matches_played': row['matches_played'],
                    'wins': row['wins'],
                    'losses': row['losses'],
                    'goals_scored': row['goals_scored'],
                    'goals_conceded': row['goals_conceded'],
                    'points': row['points'],
                    'goal_difference': row['goal_difference'],
                    'draws': row['draws']
                }
                for row in result
            ]

            # Add team_rank to each team
            for idx, team in enumerate(league_table, start=1):
                team['team_rank'] = idx

            return jsonify(league_table)  # Return the updated league table with ranks
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()