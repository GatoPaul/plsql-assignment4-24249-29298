 Insert Students
INSERT INTO students (first_name, last_name, email) VALUES ('Alice', 'Mutesi', 'alice.m@example.com');
INSERT INTO students (first_name, last_name, email) VALUES ('Bob', 'Habimana', 'bob.h@example.com');
INSERT INTO students (first_name, last_name, email) VALUES ('Charlie', 'Uwase', 'charlie.u@example.com');
INSERT INTO students (first_name, last_name, email) VALUES ('Diana', 'Nkurunziza', 'diana.n@example.com');

-- Insert Courses
INSERT INTO courses (course_name, credits) VALUES ('Database Development with PL/SQL', 4);
INSERT INTO courses (course_name, credits) VALUES ('Java Programming', 3);
INSERT INTO courses (course_name, credits) VALUES ('Web Development', 3);
INSERT INTO courses (course_name, credits) VALUES ('Data Structures', 4);

-- Insert Enrollments (Some active, some graded)

INSERT INTO enrollments (student_id, course_id, grade, status) VALUES (1, 1, 85.5, 'COMPLETED');
INSERT INTO enrollments (student_id, course_id, grade, status) VALUES (1, 2, NULL, 'ACTIVE');


INSERT INTO enrollments (student_id, course_id, grade, status) VALUES (2, 1, 92.0, 'COMPLETED');


INSERT INTO enrollments (student_id, course_id, grade, status) VALUES (3, 3, 78.0, 'COMPLETED');

COMMIT;
