import os, smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

smtp_server = os.getenv("SMTP_SERVER", "smtp.gmail.com")
smtp_port = int(os.getenv("SMTP_PORT", "587"))
smtp_user = os.getenv("SMTP_USER")
smtp_pass = os.getenv("SMTP_PASS")
email_from = os.getenv("EMAIL_FROM", smtp_user)
email_to = os.getenv("EMAIL_TO")

subject = "Test Email from Linux Terminal"
body = "Hello! This email was sent from a Python script via SMTP."

if not (smtp_user and smtp_pass and email_to):
    raise SystemExit("Missing SMTP_USER / SMTP_PASS / EMAIL_TO. Check your .env and source it.")

msg = MIMEMultipart()
msg["From"] = email_from
msg["To"] = email_to
msg["Subject"] = subject
msg.attach(MIMEText(body, "plain"))

context = ssl.create_default_context()

with smtplib.SMTP(smtp_server, smtp_port) as server:
    server.starttls(context=context)
    server.login(smtp_user, smtp_pass)
    server.sendmail(email_from, [email_to], msg.as_string())

print("Email sent successfully.")
