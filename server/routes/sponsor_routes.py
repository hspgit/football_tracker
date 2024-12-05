from flask import Blueprint, jsonify, request
from server.db import get_db_connection
from server.models.sponsor import Sponsor
from server.models.sponsor_league import SponsorLeague

sponsor_bp = Blueprint('sponsor', __name__)

@sponsor_bp.route('/all', methods=['GET'])
def get_all_sponsors():
    # Normalize inputs
    league_names = request.args.get('league_name', '').strip()  # Default to empty string
    print(league_names)

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call stored procedure
            cursor.callproc('get_all_filtered_sponsors', [league_names])
            result = cursor.fetchall()

            # Format response
            sponsors = [
                Sponsor(
                    name=row['name'],
                    country=row['country'],
                    industry=row['industry'],
                    website_url=row['website_url']
                ).__dict__ for row in result
            ]
            return jsonify(sponsors)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@sponsor_bp.route('/delete', methods=['DELETE'])
def delete_sponsor():
    connection = get_db_connection()
    sponsor_name = request.args.get('sponsor_name')

    try:
        with connection.cursor() as cursor:
            cursor.callproc('delete_sponsor', [sponsor_name])
            result = cursor.fetchall()
            connection.commit()

            return jsonify({'message': 'Sponsor deleted successfully'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@sponsor_bp.route('/detail', methods=['GET'])
def get_sponsor_detail():
    sponsor_name = request.args.get('sponsor_name')

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call stored procedure
            cursor.callproc('get_sponsor_league_details', [sponsor_name])
            result = cursor.fetchall()

            # Format response
            sponsor_league = [
                SponsorLeague(
                    sponsor_name=row['sponsor_name'],
                    league_name=row['league_name'],
                    sponsorship_amount=int(row['sponsorship_amount']),
                ).__dict__ for row in result
            ]
            return jsonify(sponsor_league)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@sponsor_bp.route('/detailByLeague', methods=['GET'])
def get_sponsor_detail_by_league():
    league_name = request.args.get('league_name')

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call stored procedure
            cursor.callproc('get_sponsor_league_details_for_league', [league_name])
            result = cursor.fetchall()

            # Format response
            sponsor_league = [
                SponsorLeague(
                    sponsor_name=row['sponsor_name'],
                    league_name=row['league_name'],
                    sponsorship_amount=int(row['sponsorship_amount']),
                ).__dict__ for row in result
            ]
            return jsonify(sponsor_league)
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@sponsor_bp.route('/update', methods=['POST'])
def add_or_update_sponsor_league():
    data = request.json  # Get the JSON payload
    if not data or not isinstance(data, list):
        return jsonify({'error': 'Invalid input, expected a list of sponsor-league details'}), 400

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            for item in data:
                # Extract fields from each object
                sponsor_name = item.get('sponsor_name')
                league_name = item.get('league_name')
                sponsorship_amount = item.get('sponsorship_amount')

                # Validate the required fields
                if not sponsor_name or not league_name or sponsorship_amount is None:
                    return jsonify({'error': 'Each entry must include sponsor_name, league_name, and sponsorship_amount'}), 400

                # Call the procedure for each entry
                cursor.callproc('update_sponsor_league_details', [
                    sponsor_name, league_name, sponsorship_amount
                ])

            # Commit the transaction
            connection.commit()

        return jsonify({'message': 'Sponsor league details added/updated successfully'}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

@sponsor_bp.route('/create', methods=['POST'])
def add_sponsor():
    data = request.json
    if not data or not isinstance(data, dict):
        return jsonify({'error': 'Invalid input, expected a dictionary of sponsor details'}), 400

    # Extract sponsor details
    sponsor_name = data.get('name')
    sponsor_country = data.get('country')
    sponsor_website = data.get('website_url')
    sponsor_industry = data.get('industry')

    # Check for mandatory fields
    if not sponsor_name or not sponsor_country or not sponsor_website or not sponsor_industry:
        return jsonify({'error': 'Sponsor name, country, industry, website are required'}), 400

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Call stored procedure
            cursor.callproc('add_sponsor', [sponsor_name, sponsor_country, sponsor_website, sponsor_industry])
            connection.commit()
            return jsonify({'message': 'Sponsor added successfully'}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    finally:
        connection.close()

