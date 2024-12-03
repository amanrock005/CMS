--Create a view named student_summary that displays 
--the first_name, last_name, email, and department_name
--of each student. Ensure the view joins data from both 
--the students11 and departments11 tables.

create or replace view student_summary as
select s.first_name, s.last_name, s.email, d.department_name
from students11 s
join departments11 d
on s.department_id = d.department_id;

select * from student_summary;


-- Create a view named department_student_count that shows each department's 
-- department_name and the total number of students enrolled (student_count).

create or replace view department_student_count as
select d.department_name, count(s.student_id) as student_count --- you must have alias when using views 
from students11 s
right join departments11 d
on s.department_id = d.department_id
group by d.department_name;

--create a view named faculty_contact_info that displays
--faculty_id, first_name, last_name, and phone_number from the faculty11 table,

create or replace view faculty_contact_info as
select 
 faculty_id,
 first_name,
 last_name,
 phone_number
from faculty11;

select * from faculty_contact_info;
set phone_number = '1231231231'
where faculty_id = 1;

--Create a view named recent_students that
--shows details (student_id, first_name, 
--last_name, enrollment_date) of students
--who enrolled after January 1, 2018.

create or replace view recent_students as
select 
 student_id,
 first_name,
 last_name,
 enrollment_date
from students11
where enrollment_date > '18-01-2018'
order by enrollment_date;

--Create a view named faculty_department_overview
--that displays each faculty member's first_name,
--last_name, department_name, and the number of
--students enrolled in their department.
create or replace view facutly_department_overview as
select f.first_name||' '||f.last_name as full_name, d.department_name, count(s.student_id) as no_of_stu_enrolled
from faculty11 f
join departments11 d
on f.department_id = d.department_id
left join students11 s
on f.department_id = s.department_id
group by f.first_name||' '||f.last_name, d.department_name;

select * from facutly_department_overview;
