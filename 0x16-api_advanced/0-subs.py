#!/usr/bin/python3
"""
A function that queries the Reddit API and returns the number of subscribers
(not active users, total subscribers) for a given subreddit. If an
invalid subreddit is given, the function should return 0.
"""
import requests


def number_of_subscribers(subreddit):
    response = requests.get(f"https://www.reddit.com/r/{subreddit}/about.json")
    if response.status_code == 200:
        data = response.json().get('data', {})
        total_subscribers = data.get("subscribers", 0)
        return total_subscribers
    else:
        return 0
