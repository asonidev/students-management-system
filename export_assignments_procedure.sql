DELIMITER $$
CREATE PROCEDURE export_assignments()
BEGIN
    SELECT 
        sd.id AS assignment_id,
        s.id AS student_id,
        CONCAT(s.first_name, ' ', s.last_name) AS student_name,
        d.id AS department_id,
        d.name AS department_name,
        sd.joining_date
    FROM student_department sd
    JOIN student s ON sd.student_id = s.id
    JOIN department d ON sd.department_id = d.id
    ORDER BY sd.id ASC;
END $$
DELIMITER ;
