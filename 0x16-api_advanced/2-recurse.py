#!/usr/bin/python3
"""
A function that queries the Reddit API and prints the
titles of the first 10 hot posts listed for a given subreddit.
"""
import requests


def recurse(subreddit, hot_list=[])
    """ A function that gets top 10 reddits"""
    url = f"https://www.reddit.com/{subreddit}/hot.json"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
            title = post.get("data", {}).get("title", "")
            print(title)
    while (hot_list != None):
        return (recurse + 1)
    elif response.status_code == 404:
        return f"None"
    else:
        return f"None"
