#!/usr/bin/python3
import sys
import requests

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
            employee_name = user_data.get('name')

            # Count completed and total tasks
            completed_tasks = sum(1 for task in todos_data if task['completed'])
            total_tasks = len(todos_data)

            # Display employee TODO list progress
            print(f"Employee {employee_name} is done with tasks ({completed_tasks}/{total_tasks}):")
            
            # Display titles of completed tasks
            for task in todos_data:
                if task['completed']:
                    print(f"\t{task['title']}")

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