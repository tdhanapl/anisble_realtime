#!/usr/bin/env python3

import requests
import sys

api_key=sys.argv[1]

url = "https://pincode.p.rapidapi.com/"

payload = "{\n    \"searchBy\": \"pincode\",\n    \"value\": 400018\n}"
headers = {
    'content-type': "application/json",
    'x-rapidapi-key': str(api_key),
    'x-rapidapi-host': "pincode.p.rapidapi.com"
    }

response = requests.request("POST", url, data=payload, headers=headers)

print(response.text)
