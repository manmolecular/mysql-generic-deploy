/*
check:
mysql -P 3306 --protocol=tcp -u Admin --ssl-ca=./db_data/ca.pem --ssl-cert=./db_data/client-cert.pem --ssl-key=./db_data/client-key.pem -p

check ssl disabled:
mysql -P 3306 --protocol=tcp -u firewallAdmin -p --ssl-mode=DISABLED

check ssl enabled:
mysql -P 3306 --protocol=tcp -u firewallAdmin -p --ssl-mode=REQUIRED

generate cert:
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

get cert issuer:
openssl x509 -in client-cert.pem -issuer
*/

/*
Требуется развернуть инфраструктуру открытых ключей на основе удостоверяющего центра CA.
Сервер MySQL должен быть настроен на использование электронного сертификата
Необходимо создать следующих пользователей.
1) admin@'%' - требуется подтверждение владельца и издателя сертификата
2) firewallAdmin@'%' - требуется только защищённое соединение
3) pwdAnalyst@'%' - требуется подтверждение: использование любого валидного электронного сертификата в рамках инфраструктуры открытых ключей
4) pwdLoader@'%' - требуется подтверждение издателя сертификата, причём издатель должен быть другим нежели чем издатель для сертификата сервера MySQL
 */

/* 1) admin@'%' - требуется подтверждение владельца и издателя сертификата */
/* CONNECT:
mysql -P 3306 --protocol=tcp -u Admin --ssl-ca=./db_data/ca.pem --ssl-cert=./db_data/client-cert.pem --ssl-key=./db_data/client-key.pem -p
*/
ALTER USER 'Admin'@'%' REQUIRE SSL;
ALTER USER 'Admin'@'%' REQUIRE ISSUER '/CN=MySQL_Server_5.7.25_Auto_Generated_CA_Certificate';
ALTER USER 'Admin'@'%' REQUIRE SUBJECT '/CN=MySQL_Server_5.7.25_Auto_Generated_Client_Certificate';

/* 2) firewallAdmin@'%' - требуется только защищённое соединение */
/* CONNECT:
mysql -P 3306 --protocol=tcp -u firewallAdmin -p --ssl-mode=REQUIRED
*/
ALTER USER 'firewallAdmin'@'%' REQUIRE SSL;

/* 3) pwdAnalyst@'%' - требуется подтверждение: использование любого валидного электронного сертификата в рамках инфраструктуры открытых ключей */
ALTER USER 'pwdAnalyst'@'%' REQUIRE X509;

/* 4) pwdLoader@'%' - требуется подтверждение издателя сертификата, причём издатель должен быть другим нежели чем издатель для сертификата сервера MySQL */
/* CONNECT : 
mysql -P 3306 --protocol=tcp -u pwdLoader --ssl-cert=./db_data/data/client-cert.pem --ssl-key=./db_data/data/client-key.pem -p 
*/
ALTER USER 'pwdLoader'@'%' REQUIRE SSL;
ALTER USER 'pwdLoader'@'%' REQUIRE ISSUER '/CN=client';