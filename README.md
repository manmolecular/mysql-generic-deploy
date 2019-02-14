# mysql-generic-deploy
Create Docker from linux-generic MySQL

# Prerequisites
1. Download Linux-generic mysql-5.7.25-linux-glibc2.12-x86_64.tar.gz: 
[direct download link](https://dev.mysql.com/downloads/file/?id=482726), 
[download page](https://dev.mysql.com/downloads/mysql/5.7.html)  
2. Put that file in `distro` folder before building.
3. Install mysql client on host system (see your system recomendations on it)


# Building and running
Set executable rights for scripts:
```
chmod +x build.sh run.sh privilege_fix.sh connect.sh
```
Build docker image `ubuntusql` from mysql archive (you must put it in `distro` folder):
```
./build.sh
```
Initialize and run container `ubuntusql_container` from `ubuntusql` image (you can close that log-console, container will still go on):
```
./run.sh
```
Fix network privileges (to connect into docker mysql from host system, more: [stackoverflow answer](https://stackoverflow.com/questions/1559955/host-xxx-xx-xxx-xxx-is-not-allowed-to-connect-to-this-mysql-server))
```
./privilege_fix.sh
```
Connect from your host system into docker sql:
```
./connect.sh
```
And you will see:   
```
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 4
Server version: 5.7.25 MySQL Community Server (GPL)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```
Now you are connected to mysql in your docker container from host.
