create or replace package pkg_student_management as
 procedure add_student(p_student_id number, p_first_name varchar2, p_last_name varchar2, p_department_id number);
 procedure update_student(p_student_id number, p_first_name varchar2, p_last_name varchar2, p_department_id number);
 procedure delete_student(p_student_id number);
 procedure get_student_details(p_student_id number);
end pkg_student_management;
/

create or replace package body pkg_student_management as

 procedure add_student(p_student_id number, p_first_name varchar2, p_last_name varchar2, p_department_id number) is
 begin
  insert into students11(student_id, first_name, last_name, department_id)
  values (p_student_id, p_first_name, p_last_name, p_department_id);
  commit;
 end add_tudent;
 
 procedure update_student(p_student_id number, p_first_name varchar2, p_last_name varchar2, p_department_id number) is
 begin
  update students11
  set first_name = p_first_name,
      last_name = p_last_name,
      department_id = p_department_id
  where  student_id = p_student_id;
  commit;
 end update_student;
 
 procedure get_student_details(p_student_id number) is
 v_first_name varchar2(50);
 v_last_name varchar2(50);
 v_department_id number;
 
 begin
  select first_name, last_name, department_id
  into v_first_name, v_last_name, v_department_id
  from students11 where student_id = p_student_id;
  
  dbms_output.put_line('name: '|| v_first_name||' '||v_last_name||''||v_department_id);
  end get_student_details;
 end;
 
end;
/
