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