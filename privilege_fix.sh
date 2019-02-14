#!/bin/bash

docker exec -it ubuntusql_container ./bin/mysql -h localhost -P 3306 --protocol=tcp -uroot --default-character-set=utf8 --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION; CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"