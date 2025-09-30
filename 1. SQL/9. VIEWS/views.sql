----------------------------------  VIEW  -----------------------------------
--  A view is a named, saved virtual table in database.  



CREATE DATABASE IF NOT EXISTS collage;

USE collage;

CREATE TABLE IF NOT EXISTS students (
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE,
    marks INT NOT NULL,
    city VARCHAR(20)
);

INSERT INTO students(id, name, email, marks, city) 
VALUES
(1, 'Aftab', 'aftab@gmail.com', 99, 'Islamabad'),
(2, 'Ali', 'ali@gmail.com', 98, 'Lahore'),
(3, 'kashif', 'kashif@gmail.com', 96, 'Lahore'),
(4, 'Zakria', 'Zakria@gmail.com', 94, 'Lahore'),
(5, 'Taha', 'Taha@gmail.com', 92, 'Islamabad'),




--  creating view named student
CREATE VIEW student AS
SELECT name, marks
FROM students; 




--------  Quering view
SELECT * FROM student;

SELECT * FROM student 
WHERE marks > 90