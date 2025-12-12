show databases;
create database Project1;
use project1;
create table College(
college_id int primary key,
college_name varchar(150),
city varchar(150),
adoption_year int,
ai_platform varchar(100));
select * from College;

create table Student(
student_id int primary key,
student_name varchar(150),
college_id int,
department varchar(50),
year_of_study int,
gender varchar(10),
foreign key(college_id) references College(college_id));
select * from Student;

create table Performance(
performance_id int primary key,
student_id int,
semester varchar(50),
gpa_before_ai decimal(10,2),
gpa_after_ai decimal(10,2),
attendance_before_ai int,
attendance_after_ai int,
foreign key(student_id) references Student(student_id));
select * from Performance;

create table Edtech_usage(
usage_id int primary key,
student_id int,
months varchar(60),
hours_spent int,
quizzes_taken int,
ai_recommendations_accepted int,
foreign key(student_id) references Student(student_id));
select * from Edtech_usage;

--List all colleges that adopted AI in 2024 --
select college_id, college_name, adoption_year
from College
where adoption_year=2024;


--Find number of Students in each department--
select department, count(*) as department_student
from Student
group by department
order by department_student desc;

--Average Gpa before and after AI adoption for each college--
select c.college_name, avg(p.gpa_after_ai) as After_AI, avg(p.gpa_before_ai) as Before_AI
from College c
join Student s
on s.college_id=s.college_id
join Performance p on
s.student_id=p.student_id
group by c.college_name;

--Top 10 students with the highest hours_spent on Edtech platform--
select s.student_name, s.student_id, sum(e.hours_spent) as Total_hour
from Student s
join Edtech_usage e on
e.student_id=s.student_id
group by s.student_id
order by Total_hour desc
limit 10;

--The correlation pattern:Student who accepted more AI recomendation vs change in Gpa--
select s.student_id, e.ai_recommendations_accepted,
(p.gpa_after_ai - p.gpa_before_ai) as Gpa_change
from Student s
join Edtech_usage e on
e.student_id=s.student_id
join Performance p on
p.student_id=s.student_id
order by e.ai_recommendations_accepted asc;

--Attendance imporvement for each student--
select s.student_id,
s.student_name,
p.attendance_after_ai,
p.attendance_before_ai,
(p.attendance_after_ai - p.attendance_before_ai) as Attendance_change
from Student s
join performance p on
p.student_id=s.student_id;
 
 --AI platform resulted in the highest average Gpa improvement--
 select c.ai_platform,
 avg(p.gpa_after_ai - p.gpa_before_ai) as avg_gpa_improvement
 from Performance p
 join Student s on
 p.student_id=s.student_id
 join College c on
 s.college_id=c.college_id
 group by c.ai_platform
 order by avg_gpa_improvement desc;
 
 --Identify most benifited Department from AI adoption(highest gpa improvements)--
select s.department,
    sum(p.gpa_after_ai - p.gpa_before_ai) AS avg_gpa_improvement
from Student s
join Performance p 
on s.student_id = p.student_id
group by s.department
order by avg_gpa_improvement DESC;


--Increase usage hous lead to better quiz performance--
select s.student_id, SUM(ed.hours_spent) as Total_hour_spent, SUM(ed.quizzes_taken) as Total_quizzes, (SUM(ed.hours_spent)
 - SUM(ed.quizzes_taken)) as compare
from college c
join student s on c.college_id = s.college_id
join edtech_usage ed ON s.student_id = ed.student_id
group by s.student_id
order by Total_hour_spent asc;


--Compare Gpa improvement between first_year and final_year--
select s.year_of_study,
avg(p.gpa_after_ai - p.gpa_before_ai) as Gap_improvement
from Student s
join Performance p on
p.student_id=s.student_id
where s.year_of_study in(1,4)
group by s.year_of_study
order by Gap_improvement desc;









