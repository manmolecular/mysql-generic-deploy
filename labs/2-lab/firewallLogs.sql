CREATE DATABASE firewallLogs CHARACTER SET utf8; 

USE firewallLogs;

CREATE TABLE events
(
    id              INT auto_increment NOT NULL,
    event_date      DATE NOT NULL,
    event_type      VARCHAR(255) NOT NULL,
    incoming_addr   VARCHAR(15) NOT NULL,
    incoming_port   INT NOT NULL,
    outcoming_addr  VARCHAR(15) NOT NULL,
    outcoming_port  INT NOT NULL,

    PRIMARY KEY     (id)
);