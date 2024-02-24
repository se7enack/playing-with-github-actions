#!/usr/bin/env python3

from email.message import EmailMessage
import ssl
import smtplib
import sys

ssl._create_default_https_context = ssl._create_stdlib_context

# create pw here https://myaccount.google.com/u/4/apppasswords after you enable 2-factor
sender = sys.argv[1]
password = '\"sys.argv[2]\"'


def emailsend():
    global subject
    global receiver
    global body
    receiver = sys.argv[3]
    subject = f'\"{sys.argv[4]}\"'
    body = f'''
    \"{sys.argv[5]}\"
    '''

emailsend()
em = EmailMessage()
em['From'] = sender
em['To'] = receiver
em['Subject'] = subject
em.set_content(body)
context = ssl.create_default_context()

with smtplib.SMTP_SSL('smtp.gmail.com', 465, context=context) as smtp:
    smtp.login(sender, password)
    smtp.sendmail(sender, receiver, em.as_string())
