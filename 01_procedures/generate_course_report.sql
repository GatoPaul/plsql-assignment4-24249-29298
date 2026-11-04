
CREATE OR REPLACE PROCEDURE generate_course_report (p_course_id IN NUMBER) IS
    
    CURSOR c_student_grades IS
        SELECT s.first_name, s.last_name, e.grade
        FROM students s
        JOIN enrollments e ON s.student_id = e.student_id
        WHERE e.course_id = p_course_id;
        
    v_record c_student_grades%ROWTYPE;
    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Grade Report for Course ID: ' || p_course_id || ' ---');
    
    
    OPEN c_student_grades;
    LOOP
        FETCH c_student_grades INTO v_record;
        EXIT WHEN c_student_grades%NOTFOUND;
        
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(v_record.first_name || ' ' || v_record.last_name || ' -> Grade: ' || NVL(TO_CHAR(v_record.grade), 'Not Graded'));
    END LOOP;
    CLOSE c_student_grades;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No students found for this course.');
    END IF;
END;
/
