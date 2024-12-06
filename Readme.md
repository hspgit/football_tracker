# Football Tracker

A web application for tracking football leagues, teams, matches, and player statistics. Built with Angular, Flask, and MySQL.

## Prerequisites
Make sure the following are installed on your system:
- **Angular v18**
- **npm v10.8.2**
- **Node v20.18.0**
- **Python 3.9**
- **pip v21.2.4**

## Database Setup
1. Open the football_tracker.sql dump file in MySql Workbench and run the entire file.

## Steps to Run the Project

### 1. Backend Setup (Flask)
- Navigate to the project root directory:
  ```bash
  cd football_tracker
  ```
- Remove the older virtual environment (if it exists):
  ```bash
  cd server
  rm -rf venv
  ```
- Create a new virtual environment:
  ```bash
  python3 -m venv venv
  ```
- Activate the virtual environment:
  ```bash
  source venv/bin/activate
  ```
- Install the required Python packages:
  ```bash
  pip install -r requirements.txt
  ```
- Set env variables (make sure you enter password for your root user):
  ```bash
  export MYSQL_HOST='localhost'
  export MYSQL_USER='root'
  export MYSQL_PASSWORD='********'
  export MYSQL_DB='football_tracker'
  ```  

- Start the Flask server:
  ```bash
  flask --app main run --port=5001
  ```

### 2. Frontend Setup (Angular)
- Open a new terminal window.

- Navigate to the main football_tracker directory:
  ```bash
  cd football_tracker
  ```
- Navigate to the client directory:
  ```bash
  cd client
  ```
- Install the required npm packages:
  ```bash
  npm install
  ```
- Start the Angular application:
  ```bash
  npm start
  ```

### Accessing the Application
- Once the backend and frontend are running, you can access the app in your web browser at `http://localhost:4200/home-page`.

## Project Structure
- **server/**: Contains the Flask backend code.
- **client/**: Contains the Angular frontend code.

## Additional Notes
- The backend Flask server runs on `http://localhost:5001` by default.
- The frontend Angular app runs on `http://localhost:4200`.
- Ensure that you update the Flask backend API URL in the Angular environment configuration if you change the backend port.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.