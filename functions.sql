
create or replace function fn_get_student_full_name(p_student_id number)
return varchar2 as
 v_full_name varchar2(100);
begin
 select first_name||' '||last_name
 into v_full_name
 from students11
 where student_id = p_student_id;
 
 return v_full_name;
 
exception 
 when no_data_found then
  return 'student not found';
end;
/

-- function to return department name based on department_id

create or replace function fn_get_department_name(p_department_id number) 
return varchar2 is
begin
 select department_name
 into v_department_name
 from departments11
 where department_id = p_department_id;
 
exception 
 when no_data_found then
  return 'department not found';
end;
/

-- check if a course has available seats based on it's capacity and current enrollment

create or replace function fn_check_course_availablity() 
return varchar2 as
 v_capacity number;
 v_enrolled number;
begin
 select capacity
 into v_capacity
 from courses11
 where course_id = p_course_id;
 
 select count(*)
 into v_enrolled
 from enrollments11
 where course_id = p_course_id;
 
 if v_enrolled < v_capcity then
  return 'seats available';
 else 
  return 'course full';
 end if;
 
exception
 when no_data_found then
  return 'course not found';
end;
/

-- return the number of courses assigned to a specifi faculty member

create or replace function fn_get_faculty_course(p_faculty_id number)
 v_course_count number;
return number as
begin
 select count(*)
 into v_course_count
 from courses11
 where faculty_id = p_faculty_id;
 
 return v_course_count;
 
exception 
 when no_data_found then
  return 0;
end;
/
