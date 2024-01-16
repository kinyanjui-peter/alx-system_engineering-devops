#!/usr/bin/python3
"""
A function that queries the Reddit API and returns the number of subscribers
(not active users, total subscribers) for a given subreddit. If an
invalid subreddit is given, the function should return 0.
"""
import requests


def number_of_subscribers(subreddit):
    response = requests.get("https://www.reddit.com/r/{subreddit}/about.json")
    if response.status_code == 200:
        data = response.json()
        total_subscribers = data["data"]["subscribers"]
        return total_subscribers
    elif response.status_code == 404:
        return f"data not found"
    else:
        return 0
