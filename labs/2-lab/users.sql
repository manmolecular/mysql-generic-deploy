/*
1) Пользователя для управления только данными во всех БД на сервере.
имя: admin
хост: любой хост
без права передавать привилегии
*/
CREATE USER 'Admin'@'%' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'Admin'@'%';

/*
2) Пользователя для управления схемой firewallLogs
имя: firewallAdmin
хост: localhost
с правом передавать привелегии
*/
CREATE USER 'firewallAdmin'@'localhost' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON `firewallLogs`.* TO 'firewallAdmin'@'localhost' WITH GRANT OPTION;

/*
3) Пользователя для загрузки данных в таблицы схемы passwordsHashes
имя: pwdLoader
хост: любой хост
без права передавать привилегии
*/
CREATE USER 'pwdLoader'@'%' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT INSERT, UPDATE ON `passwordsHashes`.* TO 'pwdLoader'@'%';

/*
4) Пользователя для анализа данных в схеме passwordsHashes
имя: pwdAnalyst
с правом передавать привилегии
*/
CREATE USER 'pwdAnalyst'@'%' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT SELECT ON `passwordsHashes`.* TO 'pwdAnalyst'@'%' WITH GRANT OPTION;

/*
5) Анонимного пользователя
без права передавать привелегии
*/
CREATE USER ''@'%';
GRANT USAGE ON *.* TO ''@'%';