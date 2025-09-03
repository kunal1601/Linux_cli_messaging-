#!/usr/bin/env bash
set -euo pipefail
MSG="${1:-Hello from Linux terminal via SMS!}"

: "${TWILIO_ACCOUNT_SID:?Set TWILIO_ACCOUNT_SID}"
: "${TWILIO_AUTH_TOKEN:?Set TWILIO_AUTH_TOKEN}"
: "${TWILIO_SMS_FROM:?Set TWILIO_SMS_FROM (your Twilio number, e.g., +1xxxxxxxxxx)}"
: "${SMS_TO:?Set SMS_TO (e.g., +91xxxxxxxxxx)}"

curl -X POST "https://api.twilio.com/2010-04-01/Accounts/${TWILIO_ACCOUNT_SID}/Messages.json"           --data-urlencode "From=${TWILIO_SMS_FROM}"           --data-urlencode "To=${SMS_TO}"           --data-urlencode "Body=${MSG}"           -u "${TWILIO_ACCOUNT_SID}:${TWILIO_AUTH_TOKEN}"
