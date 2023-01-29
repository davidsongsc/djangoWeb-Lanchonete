import requests

url = 'http://127.0.0.1:8000/graphql?query={produtos{id}}'
response = requests.get(url)
print(response.json())