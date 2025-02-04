SELECT * from student JOIN takes on student.ID = takes.ID ;

SELECT * FROM student LEFT OUTER JOIN takes ON student.ID = takes.ID WHERE takes.course_id IS NULL; 

SELECT * FROM takes RIGHT OUTER JOIN student ON student.ID = takes.ID WHERE takes.course_id IS NULL;

SELECT * FROM 
(SELECT * FROM student s WHERE s.dept_name = 'Comp. Sci.') st
FULL OUTER JOIN 
(SELECT * FROM takes t WHERE t.semester = 'Spring' and t.[year] = 2009) ta ON st.ID = ta.ID;

SELECT ID, name, dept_name FROM instructor;

CREATE VIEW faculty AS SELECT ID, name, dept_name FROM instructor;

SELECT name FROM faculty WHERE dept_name = 'Biology';

CREATE VIEW departments_total_salary (dept_name, total_salary) as
SELECT dept_name, sum(salary)
FROM instructor
GROUP BY dept_name;

CREATE VIEW geology_fall_2009 as
SELECT
	course.course_id, sec_id, building, room_number
FROM
	course, section
WHERE
	course.course_id = section.course_id
	and course.dept_name = 'Geology'
	and section.semester = 'Fall'
	and section.year = 2009;

CREATE VIEW geology_fall_2009_Whitman as
    SELECT course_id, room_number FROM geology_fall_2009 WHERE building = 'Whitman';

SELECT * FROM geology_fall_2009_Whitman;

CREATE VIEW geology_fall_2009_Whitman as
(SELECT a.course_id, a.room_number
FROM (SELECT course.course_id, building, room_number
          FROM course, section
          WHERE course.course_id = section.course_id
               AND course.dept_name = 'Geology'
               AND section.semester = 'Fall'
               AND section.year = 2009) a
WHERE a.building = 'Whitman';




