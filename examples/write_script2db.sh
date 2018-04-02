#!/bin/bash

API_KEY="0RGT13IOZE4YBXKAMV5NPL2CWJD9QUH7"

project_id=$1
bot_script=$2

echo '{
    "projectId": "'$project_id'",
    "promotions": [
        {
            "query": "",
            "url": "https://www.amazon.co.uk/gp/product/B0001IX13Y/",
            "quantity": 1,
            "promoType": 131,
            "text": "'`cat $bot_script | base64 | tr '\n' ' '`'"
        }
    ]
}' > /tmp/bj

curl -X POST -v -H "Content-Type: application/json" -H "X-SERVICE-KEY:$API_KEY" "https://api.trafficstore.com/promotion/add" -d @/tmp/bj

