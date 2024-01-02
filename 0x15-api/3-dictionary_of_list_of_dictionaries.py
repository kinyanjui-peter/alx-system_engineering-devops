#!/usr/bin/python3
"""Export data in JSON format for all tasks from all employees."""

import json
import requests

if __name__ == "__main__":
    base_url = "https://jsonplaceholder.typicode.com"
    
    # Fetch user data
    users_response = requests.get(f"{base_url}/users")
    users_data = users_response.json()

    # Create a dictionary to store tasks for all users
    all_user_tasks = {}

    # Iterate through all users and fetch their tasks
    for user in users_data:
        user_id = str(user["id"])
        
        # Fetch tasks data for the current user
        tasks_response = requests.get(f"{base_url}/todos?userId={user_id}")
        tasks_data = tasks_response.json()

        # Populate the dictionary with tasks data for the current user
        all_user_tasks[user_id] = []
        for task in tasks_data:
            task_dict = {
                "username": user["username"],
                "task": task["title"],
                "completed": task["completed"]
            }
            all_user_tasks[user_id].append(task_dict)

    # Export data to JSON file
    json_filename = "todo_all_employees.json"
    with open(json_filename, "w") as json_file:
        json.dump(all_user_tasks, json_file, indent=2)

    print(f"Data exported to {json_filename}")