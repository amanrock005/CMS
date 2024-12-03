--Write a PL/SQL block that declares
--an explicit cursor to retrieve 
--and display all student names and 
--their department names from the 
--students11 and departments11
--tables using a join.

declare
 cursor student_cursor is 
  select s.first_name, s.last_name, d.department_name
  from students11 s
  join departments11 d
  on s.department_id = d.department_id;
begin

 for student_rec in stuent_cursor 
 loop
  dbms_output.put_line('Student: '||student_rec.first_name||' '||student_rec.last_name||' ,department: '|| student_rec.department_name);
 end loop;
end;
/

-- use of cursor attributes such as 
-- %FOUND, %NOTFOUND, %ROWCOUNT, 
-- and %ISOPEN. Write a PL/SQL 
-- block using these attributes 
-- to fetch and display all courses 
-- from the courses11 table and 
-- demonstrate how %ROWCOUNT can 
-- be used to count the number of fetched rows.

declare
 cursor course_cursor is
  select course_id, course_name from courses11;
 v_course_rec course_cursor%rowtype;
 v_count number := 0;
begin
 open course_cursor;
 loop
  fetch course_cursor 
  into v_course_rec;
  
  exit when course_cursor%notfound;
  
  v_count := course_cursor%rowcount;
  dbms_output.put_line('course id: '||v_course_rec.course_id || ', course name: '|| v_course_rec.course_name);
 end loop;
 close course_cursor;
 dbms_output.put_line('total courses fetched: '||v_count);
end;
/


--Write a PL/SQL block using a 
--cursor with a FOR LOOP to retrieve
--and display the enrollment details 
--(student ID, course ID, and enrollment date) 
--from the enrollments11 table.

declare
 cursor enrollment_cursor is 
  select student_id, course_id, enrollment_date 
  from enrollments11;
begin
 for enrollment_rec in enrollment_cursor 
 loop
  dbms_output.put_line('student id'||enrollment_rec.student_id||', course id: '|| enrollment_rec.course_id || ', enrollment date: '|| to_char(enrollment_rec.enrollment_date, 'yyyy-mm-dd'));
 end loop;
end;
/


--Create a parameterized cursor that takes
--a department ID as input and retrieves 
--all faculty members from the faculty11
--table who belong to that department.
--Demonstrate this with a PL/SQL block.

declare
 cursor faculty_cursor(p_department_id number) is
  select faculty_id, first_name, last_name
  from faculty11
  where department_id = p_department_id;
  
 v_department_id number := 101;
begin
 for faculty_rec in faculty_cursor(v_department_id)
 loop
  dbms_output.put_line('facult id; '||faculty_rec.faculty_id||', name: '||faculty_rec.first_name||' '||faculty_rec.last_name);
 end loop;
end;
/

--Write a PL/SQL block using a
--cursor to update the grades11 
--table. For all students in a 
--specific course (e.g., course 
--ID = 4), increase their grade 
--to 'B. Use a cursor to fetch the 
--relevant student records and update 
--the grades accordingly.

declare
 cursor grade_cursor is
  select student_id, grade
  from grades11
  where course_id = 4;
begin
 for grade_rec in grade_cursor
 loop
  update grades11
  set grade = 'B'
  where student_id = grade_rec.student_id 
  and course_id = 4;
 end loop;
 
 commit;
 dbms_output.put_line('grades updated successfully');
end;
/
