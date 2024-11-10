#!/usr/bin/env bash

# Check if domain is provided as the first argument
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1

# Extract the partner authentication token from partner-token.json
TESLA_AUTH_TOKEN=$(jq -r .access_token ./partner-token.json)

# Verify if token extraction was successful
if [ -z "$TESLA_AUTH_TOKEN" ]; then
    echo "Error: Failed to retrieve the partner authentication token from partner-token.json"
    exit 1
fi

# Perform the registration request
curl -X POST https://fleet-api.prd.na.vn.cloud.tesla.com/api/1/partner_accounts \
    -H "Authorization: Bearer $TESLA_AUTH_TOKEN" \
    -H "Content-Type: application/json" \
    --data '{
       "domain": "'"$DOMAIN"'"
     }'
