#!/usr/bin/env python3

import json
import os
import requests
from dotenv import load_dotenv, dotenv_values


icons = {
    "01d": "",
    "01n": "",
    "02d": "",
    "02n": "",
    "03d": "",
    "03n": "",
    "04d": "",
    "04n": "",
    "09d": "",
    "09n": "",
    "10d": "",
    "10n": "",
    "11d": "",
    "11n": "",
    "13d": "",
    "13n": "",
    "50d": "",
    "50n": "",
    "wind0": "",
    "wind1": "",
    "wind2": "",
    "wind3": "",
    "wind4": "",
    "wind5": "",
    "wind6": "",
    "wind7": "",
    "wind8": "",
    "wind9": "",
    "wind10": "",
    "wind11": "",
    "wind12": "",
}

def windScale(speed):
    if speed <= 0.2:
        return icons.get("wind0")
    if speed <=1.5:
        return icons.get("wind1")
    if speed <= 3.3:
        return icons.get("wind2")
    if speed <= 5.4:
        return icons.get("wind3")
    if speed <= 7.9:
        return icons.get("wind4")
    if speed <= 10.7:
        return icons.get("wind5")
    if speed <= 13.8:
        return icons.get("wind6")
    if speed <= 17.1:
        return icons.get("wind7")
    if speed <= 20.7:
        return icons.get("wind8")
    if speed <= 24.4:
        return icons.get("wind9")
    if speed <=28.4:
        return icons.get("wind10")
    if speed <= 32.6:
        return icons.get("wind11")
    return icons.get("wind12")

therm = ""

load_dotenv()

key = os.getenv("WEATHER_KEY")
lat = os.getenv("LAT")
lng = os.getenv("LNG")

weatherUrl = "https://api.openweathermap.org/data/2.5/weather?"
fullWeatherUrl = weatherUrl + "lat=" + lat + "&lon=" + lng + "&appid=" + key

weatherResponse = requests.get(fullWeatherUrl, timeout=5).json()

temp = 99
weather = "none"
icon= icons.get("01d")
scale=icons.get("wind0")
if weatherResponse["cod"] != "404":
    temp = int(weatherResponse["main"]["temp"] -273)
    weather = weatherResponse["weather"][0]["main"]
    icoCode = weatherResponse["weather"][0]["icon"]
    icon = icons.get(icoCode)
    scale = windScale(weatherResponse["wind"]["speed"])

print(f"{scale} | {icon} {temp}°C")
