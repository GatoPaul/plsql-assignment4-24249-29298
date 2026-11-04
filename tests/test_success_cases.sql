SET SERVEROUTPUT ON;


DECLARE
    v_avg NUMBER;
BEGIN
    v_avg := get_student_average(1);
    DBMS_OUTPUT.PUT_LINE('Alice''s Average Grade is: ' || v_avg);
END;
/


BEGIN
    generate_course_report(1);
END;
/


BEGIN
    enroll_student(3, 2);
END;
/


BEGIN
    apply_grade_curve(5);
END;
/
