import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import joblib

# Load the data
data = pd.read_csv('./data/match_results.csv')

# Feature engineering
data['result_encoded'] = data['FTR'].map({'H': 0, 'D': 1, 'A': 2})

# Encode team names
from sklearn.preprocessing import LabelEncoder
encoder = LabelEncoder()
data['home_team_encoded'] = encoder.fit_transform(data['Home'])
data['away_team_encoded'] = encoder.fit_transform(data['Away'])

# Define features and target (no goal_difference)
features = ['home_team_encoded', 'away_team_encoded']
target = 'result_encoded'
X = data[features]
y = data[target]

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train the model
model = RandomForestClassifier(n_estimators=76, random_state=31)
model.fit(X_train, y_train)

# Evaluate the model
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")

# Save the model
joblib.dump(model, 'ml_model.pkl')
print("Model saved as 'ml_model.pkl'")

# Save the LabelEncoder
joblib.dump(encoder, 'label_encoder.pkl')
print("LabelEncoder saved as 'label_encoder.pkl'")

# import pandas as pd
# from sklearn.model_selection import train_test_split, GridSearchCV
# from sklearn.ensemble import RandomForestClassifier
# from sklearn.metrics import accuracy_score
# import joblib
#
# # Load the data
# data = pd.read_csv('./data/match_results.csv')
#
# # Feature engineering
# data['result_encoded'] = data['FTR'].map({'H': 0, 'D': 1, 'A': 2})
#
# # Encode team names
# from sklearn.preprocessing import LabelEncoder
# encoder = LabelEncoder()
# data['home_team_encoded'] = encoder.fit_transform(data['Home'])
# data['away_team_encoded'] = encoder.fit_transform(data['Away'])
#
# # Define features and target (no goal_difference)
# features = ['home_team_encoded', 'away_team_encoded']
# target = 'result_encoded'
# X = data[features]
# y = data[target]
#
# # Train-test split
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
#
# # Define the model
# model = RandomForestClassifier(random_state=42)
#
# # Define the parameter grid for GridSearchCV
# param_grid = {
#     'n_estimators': [100, 200, 300],
#     'max_depth': [None, 10, 20, 30],
#     'min_samples_split': [2, 5, 10],
#     'min_samples_leaf': [1, 2, 4],
#     'max_features': ['auto', 'sqrt', 'log2'],
# }
#
# # Perform GridSearchCV
# grid_search = GridSearchCV(estimator=model, param_grid=param_grid, cv=5, n_jobs=-1, verbose=2)
# grid_search.fit(X_train, y_train)
#
# # Get the best parameters from the GridSearchCV
# best_params = grid_search.best_params_
# print(f"Best Hyperparameters: {best_params}")
#
# # Train the model with the best parameters
# best_model = grid_search.best_estimator_
#
# # Evaluate the model
# y_pred = best_model.predict(X_test)
# accuracy = accuracy_score(y_test, y_pred)
# print(f"Model Accuracy: {accuracy * 100:.2f}%")
#
# # Save the best model
# joblib.dump(best_model, 'ml_model.pkl')
# print("Model saved as 'ml_model.pkl'")
#
# # Save the LabelEncoder
# joblib.dump(encoder, 'label_encoder.pkl')
# print("LabelEncoder saved as 'label_encoder.pkl'")