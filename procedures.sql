-- procedure to insert a new student into the students11 table 

create or replace procedure insert_student(
 p_student_id in number,
 p_first_name in varchar2,
 p_last_name in varchar2,
 p_dob in date,
 p_department_id in number
) as
begin
 insert into students11 (student_id, first_name, last_name, dob, department_id)
 values (p_student_id, p_first_name, p_last_name, p_dob, p_department_id);
 commit;
end;
/


-- procedure updates the email address of a faculty memeber in the faculty11 table
create or replace procedure update_faculty_email(
 p_faculty_id in number,
 p_new_email in varchar2
) as
begin
 update faculty11
 set email = p_new_email
 where faculty_id = p_faculty_id;
 
 commit;
end;
/

-- procedure to retrieves department information by department_id

create or replace procedure get_department_details(
 p_department_id in number
) as 
 v_department_name varchar2(100);
 v_faculty_count number;
begin 
 select department_name 
 into v_department_name
 from departments11 
 where department_id = p_department_id;
 
 select count(*) 
 into v_faculty_count 
 from faculty11 
 where department_id = p_department_id;
 
 dbms_output.put_line('department name: '||v_department_name);
 dbms_output.put_line('number of faculty memebers: '||v_faculty_count);
end;
/


-- this procedure calculate the attendance percetage for a student 

create or replace procedure calculate_attendance(
 p_student_id in number,
 p_course_id in number
) as
 v_total_classes number;
 v_attended_classes number;
 v_attendance_percentage number;
begin

 select count(*)
 into v_total_classes
 from attendance13
 where course_id = p_course_id;
 
 select count(*)
 into v_total_classes
 from attendance13 
 where student_id = p_student_id and course_id = p_course_id and status = 'Present';
 
 v_attendance_percentage := (v_attended_classes / v_total_classes) * 100;
 dbms_output.put_line('attendance percentage: '||v_attendance_percentage || '%');
end;
/
