# Football Tracker

A web application for tracking football leagues, teams, matches, and player statistics. Built with Angular, Flask, and MySQL.

## Prerequisites
Make sure the following are installed on your system:
- **Angular 17**
- **npm**
- **Node.js**
- **Python 3.9**
- **pip**

## Database Setup
1. Ensure that you have created your MySQL database and set up all required tables and stored procedures.

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
- Go back to the root directory:
  ```bash
  cd ..
  ```
- Install the required Python packages:
  ```bash
  pip install -r requirements.txt
  ```
- Start the Flask server:
  ```bash
  flask --app server.main run --port=5001
  ```

### 2. Frontend Setup (Angular)
- Open a new terminal window.
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
- Once the backend and frontend are running, you can access the app in your web browser at `http://localhost:4200`.

## Project Structure
- **server/**: Contains the Flask backend code.
- **client/**: Contains the Angular frontend code.

## Additional Notes
- The backend Flask server runs on `http://localhost:5001` by default.
- The frontend Angular app runs on `http://localhost:4200`.
- Ensure that you update the Flask backend API URL in the Angular environment configuration if you change the backend port.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.