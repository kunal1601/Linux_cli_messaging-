#!/usr/bin/env bash
set -euo pipefail
MSG="${1:-Hello from Linux terminal via WhatsApp!}"

: "${TWILIO_ACCOUNT_SID:?Set TWILIO_ACCOUNT_SID}"
: "${TWILIO_AUTH_TOKEN:?Set TWILIO_AUTH_TOKEN}"
: "${WHATSAPP_FROM:?Set WHATSAPP_FROM (e.g., whatsapp:+14155238886)}"
: "${WHATSAPP_TO:?Set WHATSAPP_TO (e.g., whatsapp:+91xxxxxxxxxx)}"

curl -X POST "https://api.twilio.com/2010-04-01/Accounts/${TWILIO_ACCOUNT_SID}/Messages.json"           --data-urlencode "From=${WHATSAPP_FROM}"           --data-urlencode "To=${WHATSAPP_TO}"           --data-urlencode "Body=${MSG}"           -u "${TWILIO_ACCOUNT_SID}:${TWILIO_AUTH_TOKEN}"
