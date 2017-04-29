# import
import smtplib
import subprocess
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


def sendEmail():
    sendFrom = 'main@abc.xyz'  # 寄件者
    sendTo = ['user1@abc.xyz', 'user2@abc.xyz']  # 收件者
    subject = 'Hello World'  # 主旨
    mailText = 'text'  # 內文

    # set mail format
    mail = MIMEMultipart()
    mail['Subject'] = subject
    mail['From'] = sendFrom
    for to in sendTo:
        mail['To'] = to

    # mail text
    mail.attach(MIMEText(mailText, 'plain', 'utf-8'))

    # mail html
    html = '<h1>Hello Python</h1>'
    mail.attach(MIMEText(html, 'html', 'utf-8'))

    # mail csv file
    att_1 = MIMEText(openFile('file path', 'r').read(), 'base64', 'utf-8')  # change [file path] to the file you want to open
    att_1["Content-Type"] = 'application/octet-stream'
    att_1["Content-Disposition"] = 'attachment; filename=name.txt'
    mail.attach(att_1)

    # send
    try:
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.ehlo()
        server.starttls()
        server.ehlo()
        server.login('main@abc.xyz', 'password')  # change username and password
        server.sendmail(sendFrom, sendTo, mail.as_string())
        server.quit()
    except Exception, e:
        print 'send mail error'
        exit()
