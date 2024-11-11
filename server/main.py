# main.py

from server import create_app

# Initialize the app with the desired configuration
app = create_app()

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == "__main__":
    # Run the app on localhost with debugging enabled (disable in production)
    app.run(host="0.0.0.0", port=5001, debug=True)