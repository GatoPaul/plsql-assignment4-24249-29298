# Implementation Summary
* **Records:** We used `%ROWTYPE` in `generate_course_report.sql` to hold the explicit cursor data, and a user-defined `RECORD` type in `apply_grade_curve.sql` to structure the collection data.
* **Collections:** We used an Associative Array (Index-By Table) `t_enrollment_tab` in `apply_grade_curve.sql` to hold multiple enrollment records in memory.
* **Cursors:** Implicit cursors are used for `INSERT`/`UPDATE` with `SQL%ROWCOUNT` checked. Explicit cursors are used in `generate_course_report.sql` with the `OPEN`, `FETCH`, `CLOSE` syntax.
* **Exception Handling:** We utilized `NO_DATA_FOUND`, user-defined exceptions (`e_already_enrolled`), and `RAISE_APPLICATION_ERROR` to return meaningful error codes (e.g., ORA-20005).
* **Stored Procedures & Functions:** All business logic is encapsulated in the database layer, making it reusable and secure.

* ## Performance Considerations for Bulk Processing
In `apply_grade_curve.sql`, we use **BULK COLLECT** to fetch all active enrollments into a collection in a single context switch between the PL/SQL engine and the SQL engine. 
We then use **FORALL** to update all the grades in a single database call. 
*Row-by-row processing* (using a standard `FOR` loop) requires a context switch for every single row, which is very slow for large datasets. *Bulk processing* dramatically improves performance by reducing context switches. We also included `SAVE EXCEPTIONS` with `FORALL` to ensure that if one row fails during the bulk update, the rest still succeed, and we can track the specific errors.
