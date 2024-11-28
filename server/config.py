import os
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

class Config:
    MYSQL_HOST = os.getenv('MYSQL_HOST', 'localhost')
    MYSQL_USER = os.getenv('MYSQL_USER', 'root')
    MYSQL_PASSWORD = os.getenv('MYSQL_PASSWORD', 'hrishikesh')
    MYSQL_DB = os.getenv('MYSQL_DB', 'football_tracker')