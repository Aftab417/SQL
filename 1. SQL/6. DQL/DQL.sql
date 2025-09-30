--------------------------------  DQL (Data Query Language)  ----------------------------------
--  These commands are used to querying the database.

-- SELECT

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
(1, 'Aftab', 'aftab@gmail.com', 100, 'Islamabd'),
(2, 'Ali', 'ali@gmail.com', 96, 'Karachi'),
(3, 'Kashif', 'kashif@gmail.com', 81, 'Lahore'),
(4, 'Zakria', 'zakria@gmail.com', 78, 'Lahore'),
(5, 'Taha', 'taha@gmail.com', 92, 'Islamabd');



--------------------------------  Basic SELECT  ----------------------------------

SELECT * FROM students;     -- select all columns from the students table 

SELECT id, name, marks FROM students;    -- select specific columns





--------------------------------  DISTINCT Clause  ----------------------------------
-- DISTINT clause remove duplicate values.

SELECT DISTINCT city FROM students;



--------------------------------  WHERE Clause (Filtering)  ----------------------------------
-- Used to filter rows, or to get rows according to applied condition;

SELECT * FROM students WHERE marks > 80

SELECT * FROM students WHERE city = 'Lahore'

SELECT * FROM students WHERE marks > 80 AND city = 'Lahore'

SELECT * FROM students WHERE marks <= 90 OR city != 'Kirachi'

SELECT * FROM students WHERE marks BETWEEN 80 AND 90

SELECT * FROM students WHERE city IN ('Lahore', 'Kirachi')

SELECT * FROM students WHERE city NOT IN ('Lahore', 'Kirachi')

SELECT * FROM students WHERE name LIKE '%A';






--------------------------------  ORDER BY  clause  ----------------------------------
-- It sorts the result in ascending or descending order


SELECT * FROM students ORDER BY city ASC;        -- List all rows in ascending order  

SELECT * FROM students ORDER BY marks DESC;      -- List all rows in descending order




--------------------------------  LIMIT  clause  ----------------------------------
--  It control the numbers of rows


SELECT * FROM students LIMIT 3;           --  first 3 rows

SELECT * FROM students LIMIT 2 OFFSET 3;  --- rows from 4 - 5





--------------------------------  Aggregate Functions() )  ----------------------------------

-- Following are the aggregate function that are used for calculations.

-- COUNT(): 
SELECT COUNT(*) FROM students;


-- SUM():
SELECT SUM(marks) FROM students;


-- AVG():
SELECT AVG(marks) FROM students;


-- MIN(), MAX():
SELECT MIN(marks), MAX(marks) FROM students;






--------------------------------  GROUP BY   Clause  ----------------------------------
--  Use for grouping

SELECT city, COUNT(*) 
FROM students
GROUP BY city; 



SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;







--------------------------------  HAVING   Clause  ----------------------------------
-- Use for filtering groups (works like WHERE but for GROUPS);

SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city
HAVING COUNT(*) >= 2  









--------------------------------  ALIASES(AS)  ----------------------------------
-- rename columns or tables

SELECT name AS username,
marks AS grades
city AS house
FROM students AS s;






--------------------------------  SUBQUERIES (Nested SELECT) ----------------------------------

SELECT name, marks
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);





--------------------------------  SET OPERATIONS  ----------------------------------

-- Combines results for multiple queries.

--  UNION        --> combines rows and remove duplicates
--  UNION ALL    --> combines rows and keep duplicates 
--  INTERSECT    --> gives common rows



SELECT * FROM students
UNION
SELECT * FROM teachers;



SELECT * FROM students
INTERSECT
SELECT * FROM tearchers;