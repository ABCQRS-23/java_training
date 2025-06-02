
************ SESSION 2 ****************


CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    grade CHAR(1)

);

--------------------------------------------------------------

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'C'),
(2, 3, 'B'),
(3, 2, 'A'),
(4, 1, 'D'),
(5, 3, 'A'),
(3, 1, 'B');

SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
INNER JOIN courses c ON c.id = e.course_id;

--------------------------------------------------------------

SELECT c.course_name, s.first_name, s.last_name
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
LEFT JOIN students s ON s.id = e.student_id;

--------------------------------------------------------------

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.course_name;
--------------------------------------------------------------

SELECT department, AVG(credits) AS avg_credits
FROM courses
GROUP BY department;

--------------------------------------------------------------
SELECT s.id, s.first_name, s.last_name, COUNT(e.course_id) AS courses_enrolled
FROM students s
JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id
HAVING COUNT(e.course_id) > 2;

--------------------------------------------------------------------------------

SELECT s.first_name, s.last_name, e.grade
FROM enrollments e
JOIN students s ON s.id = e.student_id
WHERE e.course_id = 1 AND e.grade = (
    SELECT MIN(grade) FROM enrollments WHERE course_id = 1
);

---------------------------------------------------------------------------------

WITH department_enrollment AS (
    SELECT c.department, e.student_id
    FROM courses c
    JOIN enrollments e ON c.id = e.course_id
)
SELECT department, COUNT(DISTINCT student_id) AS total_students
FROM department_enrollment
GROUP BY department;

------------------------------------------------------------------------------
SELECT s.first_name, s.last_name, c.course_name,
       e.grade,
       CASE
           WHEN e.grade IN ('A', 'B') THEN 'Pass'
           ELSE 'Fail'
       END AS result
FROM enrollments e
JOIN students s ON s.id = e.student_id
JOIN courses c ON c.id = e.course_id;
--------------------------------------------------------

SELECT * FROM enrollments ORDER BY grade ASC;

-------------------------------------------------------

SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name,
    e.grade,
    CASE 
        WHEN e.grade IN ('A', 'B') THEN 'Pass'
        ELSE 'Fail'
    END AS result
FROM enrollments e
JOIN students s ON s.id = e.student_id
JOIN courses c ON c.id = e.course_id;

----------------------------------------------------------

SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name,
    e.grade,
    CASE 
        WHEN e.grade IN ('A', 'B') THEN 'Pass'
        ELSE 'Fail'
    END AS result
FROM enrollments e
JOIN students s ON s.id = e.student_id
JOIN courses c ON c.id = e.course_id;

----------------------------------------------------------
