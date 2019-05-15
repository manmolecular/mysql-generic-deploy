/*
2) passwordsHashes
Каждая таблица должна иметь 2 текстовых столбца достаточной длины. 
1 столбец для хранения email, 2 столбец для хранения хеша пароля в текстовом виде
table(email varchar(256), passwordHash(128))
Список таблиц: yandex, google, mail_ru
*/

CREATE DATABASE passwordsHashes CHARACTER SET utf8;

USE passwordsHashes;

CREATE TABLE yandex
(
    id              INT auto_increment NOT NULL,
    email           VARCHAR(255) NOT NULL,
    passwordHash    VARCHAR(128) NOT NULL,

    PRIMARY KEY     (id),
    UNIQUE KEY      (passwordHash)
);

CREATE TABLE google
(
    id              INT auto_increment NOT NULL,
    email           VARCHAR(255) NOT NULL,
    passwordHash    VARCHAR(128) NOT NULL,

    PRIMARY KEY     (id),
    UNIQUE KEY      (passwordHash)
);

CREATE TABLE mail_ru
(
    id              INT auto_increment NOT NULL,
    email           VARCHAR(255) NOT NULL,
    passwordHash    VARCHAR(128) NOT NULL,

    PRIMARY KEY     (id),
    UNIQUE KEY      (passwordHash)
);