create database branch;
use branch;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Department (dept_id, dept_name) VALUES
(101, 'Computer Sci'),
(102, 'IT'),
(103, 'ECE');

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Students (student_id, name, dept_id, marks) VALUES
(1, 'Rahul', 101, 85),
(2, 'Priya', 102, 92),
(3, 'Karthik', 101, 76),
(4, 'Meena', 103, 88);
SELECT dept_id, AVG(marks) AS avg_marks
FROM Students
GROUP BY dept_id;

SELECT s.name AS student_name, d.dept_name
FROM Students s
JOIN Department d ON s.dept_id = d.dept_id;

SELECT name, marks
FROM Students
WHERE marks > (SELECT AVG(marks) FROM Students);

DELIMITER //
CREATE PROCEDURE GetTopStudents()
BEGIN
    SELECT * 
    FROM Students
    WHERE marks > 85;
END//