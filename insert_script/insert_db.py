#!/usr/bin/env python3

import pymysql
from random import randint, sample

firewall_logs = [
    (
        f"{randint(2010, 2018)}-{str(randint(1, 28)).zfill(2)}-{str(randint(1, 28)).zfill(2)}", 
        "alert", 
        f"{randint(0, 255)}.{randint(0, 255)}.{randint(0, 255)}.{randint(0, 255)}",
        randint(0, 8080),
        f"{randint(0, 255)}.{randint(0, 255)}.{randint(0, 255)}.{randint(0, 255)}",
        randint(0, 8080)
    ) for _ in range(100)
]

if __name__=="__main__":
    connection = pymysql.connect(
        host='127.0.0.1',
        user='root',
        port=3306,
        password='',
        db='firewallLogs',
        autocommit=True,
        charset='utf8',
        cursorclass=pymysql.cursors.DictCursor,
        unix_socket=False)
    
    with connection.cursor() as cursor:
        for log in firewall_logs:
            cursor.execute(
                """
                INSERT IGNORE INTO events (
                    event_date, 
                    event_type, 
                    incoming_addr, 
                    incoming_port, 
                    outcoming_addr, 
                    outcoming_port
                ) VALUES (%s, %s, %s, %s, %s, %s)""", log)