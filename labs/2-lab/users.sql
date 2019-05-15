CREATE USER 'Admin'@'%' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'Admin'@'%';

CREATE USER 'firewallAdmin'@'localhost' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT USAGE ON *.* TO 'firewallAdmin'@'localhost' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON `firewallLogs`.* TO 'firewallAdmin'@'localhost';

CREATE USER 'pwdLoader'@'%' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT USAGE ON *.* TO 'pwdLoader'@'%';
GRANT INSERT, UPDATE ON `passwordsHashes`.* TO 'pwdLoader'@'%';

CREATE USER 'pwdAnalyst'@'%' IDENTIFIED WITH mysql_native_password AS '1234';
GRANT USAGE ON *.* TO 'pwdAnalyst'@'%' WITH GRANT OPTION;
GRANT SELECT ON `passwordsHashes`.* TO 'pwdAnalyst'@'%';

CREATE USER ''@'%';
GRANT USAGE ON *.* TO ''@'%';