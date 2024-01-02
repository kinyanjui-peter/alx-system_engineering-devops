#!/usr/bin/python3
import sys
import requests
import json

def gather_data(employee_id):
    # URL for the JSONPlaceholder API's user endpoint
    url_user = f'https://jsonplaceholder.typicode.com/users/{employee_id}'
    
    # URL for the JSONPlaceholder API's todos endpoint
    url_todos = f'https://jsonplaceholder.typicode.com/todos?userId={employee_id}'

    try:
        # Make a GET request to the user endpoint
        response_user = requests.get(url_user)
        response_todos = requests.get(url_todos)

        # Check if the requests are successful
        if response_user.status_code == 200 and response_todos.status_code == 200:
            # Parse the JSON responses
            user_data = response_user.json()
            todos_data = response_todos.json()

            # Extract relevant user information
            user_id = user_data.get('id')
            user_name = user_data.get('name')

            # Create JSON file with the format {"USER_ID": [{"task": "TASK_TITLE", "completed": TASK_COMPLETED_STATUS, "username": "USERNAME"}, ...]}
            json_filename = f'{user_id}.json'
            with open(json_filename, mode='w') as json_file:
                # Construct JSON data
                json_data = {str(user_id): [{"task": task['title'], "completed": task['completed'], "username": user_name} for task in todos_data]}
                json.dump(json_data, json_file, indent=2)

            print(f"Data exported to {json_filename}")

        else:
            print(f"Error: Unable to fetch data. Status code: {response_user.status_code} (user), {response_todos.status_code} (todos)")

    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 script_name.py <employee_id>")
        sys.exit(1)

    employee_id_to_fetch = int(sys.argv[1])
    gather_data(employee_id_to_fetch)