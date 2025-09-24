
------------------------  FOREIGN KEY Relationship  -------------------------
CREATE DATABASE collage;
USE collage;

--------------- class table
CREATE TABLE class(
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50) 
);

INSERT INTO class(class_id, class_name)
VALUES
(1, 'first year'),
(2, 'second year');



---------------  course table
CREATE TABLE course(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO course(course_id, course_name)
VALUES
(11, 'BIOLOGY'),
(12, 'Math'),
(13, 'Computer');



--------------- student table
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    class_id INT,
    course_id INT, 
    FOREIGN KEY (class_id) REFERENCES class(class_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

    FOREIGN KEY(course_id) REFERENCES course(course_id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE    
);

INSERT INTO student(student_id, name)
VALUES
(21, 'Aftab', 1),
(22, 'Ali', , 11),
(23, 'Ahmad', 2, 12)

 



 
  

  
---------------------------------  JOINS  ------------------------------------
--  A join in SQL  is used to combine rows from two or more tables based on related columns(usually foreign keys)

--  There are following types of JOINS


--------------------------------- INNER JOINS  ------------------------------------
--  Gives only matching rows between two tables

--  For Two tables;
SELECT * 
FROM student s
INNER JOIN class c
ON s.class_id = c.class_id;


--  FOR Three tables
SELECT s.student_id, s.name AS student_name, c.class_name, cr.course_name
FROM student s
INNER JOIN class c ON s.class_id = c.class_id
INNER JOIN course cr ON s.course_id = cr.course_id;






--------------------------------- LEFT JOINS  ------------------------------------
--  Gives all the rows of Left table and matching rows of right table

--  all columns
SELECT * 
FROM student s
LEFT JOIN class c ON s.class_id = c.class_id;



--  specific columns
SELECT s.student_id, s.name AS student_name, c.class_id, c.class_name
FROM student s
LEFT JOIN class c ON s.class_id = c.class_id;




--  on three tables
SELECT s.student_id, s.name AS student_name, c.class_name, cr.course_name 
FROM student s
LEFT JOIN class c ON s.class_id = c.class_id
LEFT JOIN course cr ON s.course_id = cr.course_id;






--------------------------------- RIGHT JOINS  ------------------------------------
-- Gives all the rows of right table and matching rows of left table.


--  for all columns
SELECT * 
FROM student s 
RIGHT JOIN course cr ON s.course_id = cr.course_id;


--  for specific columns
SELECT s.student_id, s.name AS student_name, c.class_name
FROM student s 
RIGHT JOIN class c ON s.class_id = c.class_id;



--  FOR three tables
SELECT s.student_id, s.name AS student_name, c.class_name, cr.course_name 
FROM student s
LEFT JOIN class c ON s.class_id = c.class_id
LEFT JOIN course cr ON s.course_id = cr.course_id;







--------------------------------- FULL JOINS  ------------------------------------
-- Gives all the rows from both tables, matching and non mathcing.
-- there is no direct mathod for FULL JOIN  in  SQL, first we take LEFT JOIN, then RIGHT JOIN and UNION them.

--  for two tables
SELECT s.student_id, s.name AS student_name, c.class_name
FROM student s 
LEFT JOIN class c ON s.class_id = c.class_id
UNION
SELECT s.student_id, s.name AS student_name, c.class_name
FROM student s 
RIGHT JOIN class c ON s.class_id = c.class_id;


--  for three tables
SELECT s.student_id, s.name AS student_name, c.class_name, cr.course_name
FROM student s 
LEFT JOIN class c ON s.class_id = c.class_id
LEFT JOIN course cr ON s.course_id = cr.course_id
UNION
SELECT s.student_id, s.name AS student_name, c.class_name, cr.course_name
FROM student s 
LEFT JOIN class c ON s.class_id = c.class_id
LEFT JOIN course cr ON s.course_id = cr.course_id;
