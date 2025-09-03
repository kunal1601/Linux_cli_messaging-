Linux Terminal Messaging Examples
Send Email, WhatsApp, Tweet, and SMS right from your Linux terminal using simple scripts.

Structure
linux-cli-messaging/
├─ README.md
├─ .env.example        # Copy to .env and fill secrets
├─ load_env.sh         # Helper to source env vars
├─ email/
│  └─ send_email_smtp.py
├─ whatsapp/
│  └─ send_whatsapp_twilio.sh
├─ sms/
│  └─ send_sms_twilio.sh
└─ twitter/
   └─ post_tweet_twurl.sh
Quick Start
Copy .env.example to .env and edit values:
cp .env.example .env
nano .env
Load environment variables:
source load_env.sh
Email via SMTP (Python)
Requirements: Python 3

python3 email/send_email_smtp.py
WhatsApp via Twilio (curl)
Prereq: Twilio account + WhatsApp Sandbox enabled.

bash whatsapp/send_whatsapp_twilio.sh "Your message from Linux terminal"
SMS via Twilio (curl)
Prereq: Twilio phone number enabled for SMS.

bash sms/send_sms_twilio.sh "Your SMS from Linux terminal"
Tweet via twurl (X/Twitter)
Prereq:

Install Ruby (if needed) and gem install twurl
Authorize once:
twurl authorize --consumer-key <CK> --consumer-secret <CS>
# Then follow the PIN flow to connect your Twitter account
Post a tweet:
bash twitter/post_tweet_twurl.sh "Tweet from Linux terminal 🚀"
Notes
Never commit .env with real secrets to GitHub.
Twilio: set WHATSAPP_FROM, WHATSAPP_TO, TWILIO_SMS_FROM, SMS_TO correctly (E.164 format, e.g., +9198xxxxxxx).
Gmail SMTP: use an App Password if you have 2FA enabled.
Twitter API: twurl handles OAuth on your machine; this script wraps the call.
linux_cli_messaging
