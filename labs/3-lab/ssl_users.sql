/*
mysql -P 3306 --protocol=tcp -u Admin --ssl-ca=./data/ca.pem --ssl-cert=./data/client-cert.pem --ssl-key=./data/client-key.pem -p
*/

ALTER USER 'Admin'@'%' REQUIRE ISSUER '/CN=MySQL_Server_5.7.25_Auto_Generated_CA_Certificate';
ALTER USER 'Admin'@'%' REQUIRE SUBJECT '/CN=MySQL_Server_5.7.25_Auto_Generated_Client_Certificate';

ALTER USER 'firewallAdmin'@'localhost' REQUIRE SSL;