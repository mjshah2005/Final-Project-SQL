create database finalproject;
use finalproject;


create table students(
studentid int primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
birthdate date,
enrollmentdate date
);


create table instructions(
instructionid int primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
departmentid int,
salary decimal(10,2),
foreign key (departmentid) references departments (departmentid)
);


create table departments(
departmentid int primary key,
departmentname varchar(50)
);



create table courses(
courseid int primary key,
coursename varchar(50),
departmentid int,
credits int,
foreign key (departmentid) references departments (departmentid)
);

create table enrollments(
enrollmentid int primary key,
studentid int,
courseid int,
enrollmentdate date,
foreign key (studentid) references students (studentid),
foreign key (courseid) references courses (courseid)
);

insert into students values
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');

INSERT INTO departments (departmentid, departmentname) 
VALUES (1, 'Computer Science'), (2, 'Mathematics');


insert into instructions (instructionid, firstname, lastname, email, departmentid)
VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2);

insert into  courses values 
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);

insert into enrollments values 
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');

select * from students;

select * from departments;

select * from instructions;

select * from courses;

select * from enrollments;

#queries
#1 
#update
update students set email='new@gmail.com' where studentid=1;
#delete
delete from enrollments where enrollmentid='1';

#2
select * from students where enrollmentdate > '2022-12-31';

#3
select * from courses c join
departments d on c.departmentid = d.departmentid where  d.departmentname='Mathematics' limit 5;

#4
select courseid,count(studentid) as studentcount from enrollments
group by courseid having count(studentid)>5;

#5
select setudentid from enrollments where courseid = 101 
intersect
seelct studentid from enrollments where chourseid =102;

#6
SELECT DISTINCT StudentID FROM Enrollments 
WHERE CourseID IN (101, 102);

#7
SELECT avg(credits) from courses;

#8.
SELECT MAX(Salary) FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

#9
SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) 
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

#10
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

#11
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

#12
SELECT * FROM Students WHERE StudentID IN (
    SELECT StudentID FROM Enrollments GROUP BY CourseID HAVING COUNT(*) > 10
);

#13
SELECT StudentID, EXTRACT(YEAR FROM EnrollmentDate) as EnrollmentYear FROM Students;

