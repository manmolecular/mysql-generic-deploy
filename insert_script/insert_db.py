#!/usr/bin/env python3

import pymysql

firewall_logs = [
    ('1900-01-01', 'error', '8.8.8.8', 80, '8.8.8.8', 80)
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