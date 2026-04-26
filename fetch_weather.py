import requests

url = "https://archive-api.open-meteo.com/v1/era5"
params = {
    "latitude": 52.52,
    "longitude": 13.41,
    "start_date": "2024-01-01",
    "end_date": "2024-12-31",
    "hourly": "temperature_2m",
    "timezone": "auto"
}

response = requests.get(url, params=params)
data = response.json()