use online_courses;

-- Опишите схему таблицу "расписание занятий"
create table lesson_plan(
lesson_id integer primary key auto_increment,
classroom_id integer not null,
teacher_id integer not null,
group_id integer not null
);

-- Опишите схему таблицы "преподаватели"
create table teachers(
teacher_id integer primary key auto_increment,
fullname varchar(64) not null,
email varchar(64) unique
);

-- Вывести имена студентов и названия групп, в которых они состоят
select students.fullname, `groups`.name
from students
inner join student_attachments
on students.student_id = student_attachments.student_id
inner join `groups`
on student_attachments.group_id = `groups`.group_id;

select * from `groups`;
select * from student_attachments;
select * from students;
select * from teachers;
select * from lesson_plan;
