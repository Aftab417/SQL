-----------------------------  DML (Data Manipulation Language)  -------------------------------

-- Use for inserting, updating or deleting data inside rows.



CREATE DATABASE IF NOT EXISTS collage;

USE collage;

CREATE TABLE IF NOT EXISTS students (
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE,
    marks INT NOT NULL,
    city VARCHAR(20)
);




----------------------------  Inserting Data  --------------------------
--  INSERT


-- inserting in specific columns

INSERT INTO students (id, name, email, marks, city)
VALUES
(1, 'Aftab', 'aftab@gmail.com', 99, 'Islamabad');



-- inserting in complete table
INSERT INTO students
VALUES
(2, 'Ali', 'ali@gmail.com', 98, 'Lahore');



-- inserting multiple values
INSERT INTO students(id, name, email, marks, city) 
VALUES
(3, 'kashif', 'kashif@gmail.com', 96, 'Lahore')
(4, 'Zakria', 'Zakria@gmail.com', 94), 'Lahore'
(5, 'Taha', 'Taha@gmail.com', 92, 'Islamabad');






----------------------------  UPDATING Data  --------------------------
--  UPDATE


--  update sigle column
UPDATE students
SET marks = 94
WHERE name = 'Taha';


--  update multiple columns
UPDATE students
SET marks = 100, city = 'Karachi'
WHERE id = 4;






----------------------------  DELETING Data  --------------------------


--  DELETE


-- delete specific row
DELETE FROM students
WHERE id = 3;



-- delete all rows table remain
DELETE FROM students;

















