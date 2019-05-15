/*
Необходимо создать следующие схемы.
1) firewallLogs
Таблица со столбцами соответствующими некоторому плоскому файлу
Варианты выбора плоского файла:
а) Текстовый лог-файл, в котором хранятся журнальные записи персонального сетевого 
экрана из операционных систем семейства Windows.
б) Текстовый лог-файл, в котором хранятся журнальные записи персонального сетевого 
экрана из операционных систем семейства Linux.
в) Текстовый лог-файл, содержащий плоский файл и полученный самостоятельно с количеством 
полей не менее двух и возможностью получения строк в количестве порядка 1e+2. Например 
с полями: (Дата события), (Тип события), (Входящий адрес), (Входящий порт), 
(Исходящий адрес), (Исходящий порт).
*/

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