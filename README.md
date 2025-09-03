# Linux Terminal Messaging Examples

Send **Email**, **WhatsApp**, **Tweet**, and **SMS** right from your Linux terminal using simple scripts.

## Structure
```
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
```

## Quick Start
1) Copy `.env.example` to `.env` and edit values:
```bash
cp .env.example .env
nano .env
```
2) Load environment variables:
```bash
source load_env.sh
```

---
## Email via SMTP (Python)
Requirements: Python 3
```bash
python3 email/send_email_smtp.py
```

---
## WhatsApp via Twilio (curl)
Prereq: Twilio account + WhatsApp Sandbox enabled.
```bash
bash whatsapp/send_whatsapp_twilio.sh "Your message from Linux terminal"
```

---
## SMS via Twilio (curl)
Prereq: Twilio phone number enabled for SMS.
```bash
bash sms/send_sms_twilio.sh "Your SMS from Linux terminal"
```
![IMG_4087](https://github.com/user-attachments/assets/86d86590-7f76-433e-a77c-f7a4ab417836)

---
## Tweet via twurl (X/Twitter)
Prereq:
- Install Ruby (if needed) and `gem install twurl`
- Authorize once:
  ```bash
  twurl authorize --consumer-key <CK> --consumer-secret <CS>
  # Then follow the PIN flow to connect your Twitter account
  ```
- Post a tweet:
  ```bash
  bash twitter/post_tweet_twurl.sh "Tweet from Linux terminal 🚀"
  ```

### Notes
- **Never commit `.env`** with real secrets to GitHub.
- Twilio: set `WHATSAPP_FROM`, `WHATSAPP_TO`, `TWILIO_SMS_FROM`, `SMS_TO` correctly (E.164 format, e.g., +9198xxxxxxx).
- Gmail SMTP: use an App Password if you have 2FA enabled.
- Twitter API: `twurl` handles OAuth on your machine; this script wraps the call.
# linux_cli_messaging

