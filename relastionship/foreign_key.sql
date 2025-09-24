
------------------------  FOREIGN KEY Relationship  -------------------------


CREATE DATABASE collage;

USE collage;


--- class table
CREATE TABLE class(
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50) 
);


INSERT INTO class(class_id, class_name)
VALUES
(1, 'first year'),
(2, 'second year');







----  course table
CREATE TABLE course(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);


INSERT INTO course(course_id, course_name)
VALUES
(11, 'BIOLOGY'),
(12, 'Math'),
(13, 'Computer');





--  student table
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

 



 
  

  
 
----  junction for (M:M) relation
CREATE TABLE student_courses(
	student_id INT,
	course_id INT,    
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (course_id) REFERENCES course(course_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
 );
 
  
INSERT INTO student_courses (student_id, course_id)
 VALUES
 (1, 1),
 (1, 2),
 (2, 3),
 (3, 1),
 (4, 3),
 (5, 2);
 
 
SELECT * FROM student_courses; 