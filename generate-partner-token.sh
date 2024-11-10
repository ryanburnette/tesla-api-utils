#!/usr/bin/env bash

curl -X POST https://auth.tesla.com/oauth2/v3/token \
    -H "Content-Type: application/json" \
    -d '{
    "grant_type": "client_credentials",
    "client_id": "'"$CLIENT_ID"'",
    "client_secret": "'"$CLIENT_SECRET"'",
    "audience": "https://fleet-api.prd.na.vn.cloud.tesla.com",
    "scope": "openid user_data vehicle_device_data"
  }'
