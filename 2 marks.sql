create database std;
use std;
-- question no 1
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

-- question no 2
INSERT INTO Students (id, name, marks)
VALUES (1, 'Rahul', 85);

-- question no 3
UPDATE Students
SET marks = 90
WHERE id = 1;

-- question no 4
SELECT *
FROM Students
WHERE marks > 75;

-- question no 5
SELECT AVG(marks) AS average_marks
FROM Students;

-- question no 6
SELECT MAX(marks) AS second_highest
FROM Students
WHERE marks < (SELECT MAX(marks) FROM Students);

-- question no 7
SELECT NOW() AS current_datetime;

-- question no 8
SELECT s.id, s.name, s.marks, c.course_name
FROM Students s
LEFT JOIN Courses c ON s.id = c.id;

-- question no 9
CREATE VIEW TopStudents AS
SELECT *
FROM Students
WHERE marks > 80;

-- question no 10
DELIMITER //
CREATE TRIGGER check_marks_before_insert
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 THEN
        SET NEW.marks = 0;
    END IF;
END //
DELIMITER ;