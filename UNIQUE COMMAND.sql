CREATE DATABASE CUSTOMER;
USE CUSTOMER;
#CREATE TABLE
CREATE TABLE STUDENT(
ID INT NOT NULL,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
AGE INT
);
DESC STUDENT;
#MODIFY TABLE USING ALTER TABLE
ALTER TABLE STUDENT MODIFY AGE INT NOT NULL;
#UNIQUE FUNCTION (CREATE NEW TABLE)
CREATE TABLE PERSON(
ID INT NOT NULL,
FIRST_NAME VARCHAR(25) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
AGE INT,
check(age<40),
UNIQUE(ID)
);
DESC PERSON;
INSERT INTO PERSON VALUES (5,'SATYAM','KUMAR',45);
SELECT * FROM PERSON;
INSERT INTO PERSON VALUES (2,'SATYAM1','KUMAR',29);

ALTER TABLE PERSON ADD UNIQUE (FIRST_NAME);
DESC PERSON;
show databases;
use customer;
show tables;

drop database customer;

CREATE TABLE locations_new (
	location_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);
CREATE TABLE departments_new (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);
INSERT INTO employees
VALUES (
	207,208,
	'satyam' ,'shilpa',
	'kushwaha', 'devi',
	'satyam525','shilpa522',
	'51hr5.123.8182','51hr5.123.8182',
	STR_TO_DATE('07-JUN-1995', '%d-%M-%Y'),('07-JUN-1996', '%d-%M-%Y'),
	'AC_ACCOUNT','IT_PROG',
	8300,
	NULL,
	205,Null,
	115,116
	);

ALTER TABLE departments_new ADD FOREIGN KEY (location_id) REFERENCES locations_new(location_id);