import json
import pandas as pd

with open("weather_2024.json") as f:
    data = json.load(f)

df = pd.DataFrame({
    "time": data["hourly"]["time"],
    "temperature": data["hourly"]["temperature_2m"]
})

df["time"] = pd.to_datetime(df["time"])

daily = df.resample("D", on="time").mean()
daily = daily.reset_index()  # time becomes a real column here

print(daily.index)           # should print RangeIndex(...)
print(daily.columns.tolist()) # should print ['time', 'temperature']

daily.to_csv("daily_weather_2024.csv", index=False)