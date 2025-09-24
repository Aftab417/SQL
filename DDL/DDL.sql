--------------------------------   DDL (Data Defination Language)  -------------------------------
--  Use to Define the Database schema/design  like  creating database or table or altering tables etc..



--------------------  Database related commands  --------------------

CREATE DATABASE company;      --> create a database named 'company'

CREATE DATABASE IF NOT EXISTS company;  --> first it will check if company database not exists the it will create it

SHOW DATABASE;  --> show all available databases

USE DATABASE company;   --> use company database

DROP DATABASE company;  --> delete database 

DROP DATABASE IF EXISTS company;  --> first check if company database exist then delete it









--------------------  Tables related commands  --------------------

--  This will create a table named 'employes'
CREATE TABLE students (
    column_name1 datatype constriants,
    column_name2 datatype constriants,
    column_name3 datatype constriants
);


-- Example:
CREATE TABLE students (
    id INT PRIMARY KEY,             --> unique identifier  
    name VARCHAR(20) NOT NULL,      --> can not be empty 
    email VARCHAR(50) UNIQUE,       --> must be unique  
    age INT CHECK(age >= 16),       --> validation rule 
    admission_date DATE DEFAULT CURRENT_DATE,  --> default value
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(id)  --> relationship
);



CREATE TABLE IF NOT EXISTS students ();     --> first check then create table named 'students'



SHOW TABLES;   --> show all the existing tables in database




ALTER TABLE students ADD gender VARCHAR(10);   --> add column to table

ALTER TABLE students DROP COLUMN age;          --> drop column from tble

ALTER TABLE students RENAME name TO username;  --> rename column in the table

ALTER TABLE students MODIFY age SMALLINT;      --> change datatype of column 

RENAME TABLE students TO lerners;             --> rename table





TRUNCATE students;             --> drop all the rows in the table but table exists

DROP TABLE students;           --> drop table completely

DROP TABLE IF EXISTS students;  --> first checks and then delete the table 

DESCRIBE students;     --> describle the table