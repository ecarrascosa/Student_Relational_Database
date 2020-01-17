create database Schedule;
use Schedule;

--Create Course table;
create table Course_t
(CourseNumber integer not null,
CourseName varchar(50),
CreditHours decimal(3,2) not null,
Classroom varchar(50),
InstructorFirsttName varchar(50),
InstructorLastName varchar(50),
ISBN varchar(50),
constraint CourseNumber_PK primary key (CourseNumber),
constraint ISBN_FK1 foreign key (ISBN) references Book_t(ISBN),
constraint InstructorFirsttName_FK2 foreign key (InstructorFirsttName) references Instructor_t(InstructorFirsttName),
constraint InstructorLastName_FK3 foreign key (InstructorLastName) references Instructor_t(InstructorLastName));

--Create Book table;
create table Book_t
(ISBN varchar(50) not null
BookName varchar(50) not null,
Publisher varchar(50),
constraint Book_PK primary key (ISBN));

--Create Instructor's table;
create table Instructor_t
(InstructorFirstName varchar(50) not null,
InstructorLastName varchar(50) not null,
InstructorOffice varchar(30),
constraint Instructor_PK primary key (InstructorFirstName, InstructorLastName));

--Create Grade table;
create table Grade_t
(NetID integer not null,
CourseNumber integer not null
Grade varchar(1),
constraint Grade_PK primary key (NetID, CourseNumber),
constraint Grade_FK1 foreign key (NetID) references Student_t(NetID),
constraint Grade_FK2 foreign key (CourseNumber) references Course_t(CourseNumber));


--Create Student table;
create table Student_t
(NetID integer not null,
StudentFirstName varchar(20),
StudentLastName varchar(20),
Major varchar(20),
GradDate date,
constraint Student_PK primary key (NetID));


-- Insert into table
insert into Course_t values
(1,'BAN 601','Technology Fundamentals for Analytics','3.00','VBT 0222','Jiming','Wu','ISBN326012871'),
(2,'BAN 602','Quantitative Fundamentals for Analytics','3.00','Online','Chonqgi', 'Wu', 'ISBN750947743'),
(3,'BAN 610','Database Management and Applications','3.00','Meiklejohn Hall, Rm. 2038', 'Ray', 'Jyotishka','ISBN122091125'),
(4,'BAN 612','Data Analytics','3.00','Science Building N119','Lan', 'Wang','ISBN070083188'),
(5,'BAN 620','Data Mining','3.00','VBT 0219', 'Zinovy', 'Radovilsky','ISBN942064056'),
(6,'BAN 630','Optimization Methods for Analytics','3.00','VBT 137','Chonqgi', 'Wu','ISBN805144432'),
(7,'BAN 632','Big Data Technology and Applications','3.00','VBT 219', 'Jiming', 'Wu', 'ISBN844034432'),
(8,'BAN 675','Text Mining and Social Media Analytics','3.00','Art and Education, Rm 0137', 'Peng', 'Xie', 'ISBN969157754'),
(9,'ECON 610','Advanced Econometrics','3.00','Science Building N110', 'Ryan', 'Lampe', 'ISBN346202314');

insert into Book_t values
(1,'ISBN326012871','Java for Beginners','Packt Publishing Ltd'),
(2,'ISBN750947743','Statistics for Business and Economics','Cengage Learning'),
(3,'ISBN122091125','Modern Database Management','Pearson'),
(4,'ISBN070083188','Python for Data Analysis','OReilly Media Inc'),
(5,'ISBN942064056','Data Mining for Business Analytics','John Wiley & Sons'),
(6,'ISBN805144432','Practical Management Science','Cengage Learning'),
(7,'ISBN844034432','Hadoop: The Definitive Guide', 'OReilly Media Inc'),
(8,'ISBN969157754','Natural Language Processing with Python','OReilly Media, Inc'),
(9,'ISBN346202314','Introductory Econometrics A Modern Approach','Cengage Learning'));

insert into Instructor_t values
('Jiming','Wu','VBT355'),
('Chongqi','Wu', 'VBT 406-B'),
('Ray','Jyotishka', 'VBT 342'),
('Lan','Wang','VBT 345'),
('Zinovy','Radovilsky', 'VBT 421'),
('Ryan','Lampe', 'VBT 324'),
('Sina','Damangir','SFSU DTC 355'),
('Peng','Xie', 'VBT 433');

insert into Grade_t values
('GS6262','BAN 601', 'A'),
('GS6262','BAN 602', 'A'),
('GS6262','BAN 610', 'A'),
('GS6262','BAN 612', 'A'),
('GS6262','BAN 620', 'A'),
('XZ2433','BAN 601', 'A'),
('XZ2433','BAN 602', 'A'),
('XZ2433','BAN 610', 'A'),
('XZ2433','BAN 612', 'A'),
('XZ2433','BAN 630', 'A'),
('XZ2433','ECON 610', 'A'),
('ZW7657', 'BAN 601', 'A'),
('ZW7657', 'BAN 602', 'A'),
('ZW7657', 'BAN 610', 'A'),
('ZW7657', 'BAN 620', 'A'),
('HB9456', 'BAN 601', 'A'),
('HB9456', 'BAN 602', 'A'),
('HB9456', 'BAN 610', 'A'),
('HB9456', 'BAN 620', 'A'),
('HB9456', 'BAN 675', 'A'),
('SP6566','BAN 601', 'A'),
('SP6566','BAN 602', 'A'),
('SP6566','BAN 610', 'A'),
('SP6566','BAN 620', 'A'),
('SP6566','BAN 612', 'A'),
('SP6566','BAN 630', 'A'),
('SP6566','BAN 632', 'A');

inset into Student_t values
('GS6262', 'Valerie', 'Jarret', 'MSBA', 'Spring 2020'),
('XZ2433', 'Dominic', 'Thiem', 'MSBA', 'Spring 2020'),
('ZW7657', 'Beatriz', 'Solorzano', 'MSBA', 'Spring 2020'),
('HB9456', 'Eduardo', 'Carrascosa', 'MSBA', 'Spring 2020'),
('SP6566', 'Marie', 'Ruby', 'MSBA', 'Fall 2019');
 
 --Query 1 counts the number of students graduating per semester
Select GradDate, Count(*) as Total
From Student_t
Group By GradDate;
 
--Query 2 displays the student's name and major who have taken a specific course
 Select StudentFirstName, StudentLastName, Major
 From Student_t, Grade_t
 Where Student_t.NetID = Grade_t.NetID
 AND CourseNumber = 'BAN 610';
 
--Query 3 displays the NetID and Student name of the students who have taken more 
--than 5 courses
 Select Student_t.NetID, StudentFirstName, StudentLastName
 From Student_t, Grade_t
 Where Student_t.NetID = Grade_t.NetID
 Group By Student_t.NetID, StudentFirstName, StudentLastName
 Having Count(Grade) > 5;
 
 --Query 4 displays the NetID and the total credit hours taken by each student in 2018
 Select NetID, Sum(CreditHours) as 'Total Credits'
 From Grade_t, Course_t
 Where Grade_t.CourseNumber = Course_t.CourseNumber
 Group By NetID, CreditHours;
 
 --Query 5 displays the instructor's name and the number of book prescribed by each instructor
 Select InstructorFirstName, InstructorLastName, Count(Course_t.InstructorID) as 'Number of Books'
 From Course_t, Instructor_t
 Where Course_t.InstructorID = Instructor_t.InstructorID
 Group By InstructorFirstName, InstructorLastName
 
