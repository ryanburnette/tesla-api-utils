# Tesla Fleet API Utilities for Home Assistant

This guide provides instructions on setting up utilities for the Tesla Fleet API integration with Home Assistant. These scripts help complete steps 3 and 4 of the Home Assistant Tesla setup.

## Prerequisites

Before running the scripts, you’ll need to install two dependencies: `dotenv` and `jq`. You can install them with `webi` as follows:

```bash
curl -sS https://webinstall.dev/jq | bash
curl -sS https://webinstall.dev/dotenv | bash
```

## Setup

### Environment Variables

Create a `.env` file in the same directory as the scripts to securely store your Tesla API credentials. The `.env` file should include:

```plaintext
CLIENT_ID=your_client_id_here
CLIENT_SECRET=your_client_secret_here
```

Replace `your_client_id_here` and `your_client_secret_here` with your actual Tesla client credentials.

## Scripts

### 1. `generate-partner-token.sh`

This script generates a partner token for authentication with Tesla’s Fleet API. It outputs the token to `partner-token.json`.

#### Usage

```bash
./generate-partner-token.sh > partner-token.json
```

This command requests an access token using your client credentials from the `.env` file and saves it in `partner-token.json`.

### 2. `register.sh`

This script registers a partner account with a specified domain, using the partner authentication token from `partner-token.json`.

#### Usage

```bash
./register.sh <domain>
```

Replace `<domain>` with your actual domain name. For example:

```bash
./register.sh example.com
```

If the token retrieval fails, the script will provide an error message. The script requires `jq` to extract the token from `partner-token.json`.

---

By following these steps, you’ll be able to integrate the Tesla Fleet API with your Home Assistant setup successfully.