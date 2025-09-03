#!/usr/bin/env bash
set -euo pipefail
TEXT="${1:-${TWEET_TEXT:-Hello from Linux terminal via twurl!}}"

# Requires: gem install twurl && twurl authorize (one-time)
# This uses Twitter API v2 endpoint to create a Tweet.
# twurl handles OAuth headers after you authorize.

twurl -H api.twitter.com -X POST "/2/tweets" -d "$(jq -nc --arg t "$TEXT" '{text:$t}')"           | jq '.'
