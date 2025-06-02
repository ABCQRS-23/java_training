DB_NAME = school_db


CREATE TABLE students(id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
enrollment_date DATE);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50),
    credits INT
);

------------------------------------------------------
INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('Ross', 'Geller', 'ross@example.com', '2024-09-01'),
('Joey', 'Tribbiani', 'joey@example.com', '2024-10-15'),
('Monica','Geller', 'monica@example.com', '2025-01-10'),
('Phoebe', 'Buffay', 'pheobeffay@example.com', '2025-02-20'),
('Eve', 'Adams', 'eve@example.com', '2025-03-05');



INSERT INTO courses(course_name, department, credits) VALUES
('MCA', 'Computer Science', 4),
('BCOM', 'Commerce', 3),
('Biotechnology', 'Science', 2);

------------------------------------------------------

UPDATE students
SET email = 'ross@example.com'
WHERE first_name = 'Ross' AND last_name = 'Geller';

-------------------------------------------------------
SELECT * FROM students WHERE enrollment_date > '2024-12-19' ;

--------------------------------------------------------
SELECT * FROM courses
WHERE department = 'Computer Science';

--------------------------------------------------------

DELETE FROM students
WHERE first_name = 'Ross' AND last_name = 'Geller';

---------------------------------------------------------
CREATE INDEX idx_students_email ON students(email);
----------------------------------------------------------