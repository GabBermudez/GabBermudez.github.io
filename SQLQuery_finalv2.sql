-- Check if database 'ecs_probation' already exists, If doesn't exist create new database
if not exists(select * 
                from sys.databases
               where name = 'ecs_probation')
     create database ecs_probation
GO
use ecs_probation
GO

-- Down - User Defined Function 
DROP FUNCTION IF EXISTS dbo.GetAppointmentCountForAdvisor;
DROP FUNCTION IF EXISTS dbo.GetProbationTypeForStudent;
GO

-- Drop foreign key constraints from the table ecs_student_probations
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_student_probations_ecs_student_probation_type_id')
BEGIN
    ALTER TABLE ecs_student_probations DROP CONSTRAINT fk_ecs_student_probations_ecs_student_probation_type_id;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_student_probations_term_id')
BEGIN
    ALTER TABLE ecs_student_probations DROP CONSTRAINT fk_ecs_student_probations_term_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_student_probations_ecs_su_student_id')
BEGIN
    ALTER TABLE ecs_student_probations DROP CONSTRAINT fk_ecs_student_probations_ecs_su_student_id;
END;

-- Drop foreign key constraints from the table probation_histories

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_probation_histories_probation_history_type_id')
BEGIN
    ALTER TABLE probation_histories DROP CONSTRAINT fk_probation_histories_probation_history_type_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_probation_histories_term_id')
BEGIN
    ALTER TABLE probation_histories DROP CONSTRAINT fk_probation_histories_term_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_probation_histories_ecs_su_student_id')
BEGIN
    ALTER TABLE probation_histories DROP CONSTRAINT fk_probation_histories_ecs_su_student_id;
END;

-- Drop foreign key constraints from the table advisor_student_performance_reviews_ASPiRe
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_advisor_student_performance_reviews_ASPiRe_rank_id')
BEGIN
    ALTER TABLE advisor_student_performance_reviews_ASPiRe DROP CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_rank_id;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_advisor_student_performance_reviews_ASPiRe_su_employee_id')
BEGIN
    ALTER TABLE advisor_student_performance_reviews_ASPiRe DROP CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_su_employee_id;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_advisor_student_performance_reviews_ASPiRe_term_id')
BEGIN
    ALTER TABLE advisor_student_performance_reviews_ASPiRe DROP CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_term_id;
END;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_advisor_student_performance_reviews_ASPiRe_ecs_student_id')
BEGIN
    ALTER TABLE advisor_student_performance_reviews_ASPiRe DROP CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_ecs_student_id;
END;

-- Drop foreign key constraints from the table ecs_students
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_students_probation_type_id')
BEGIN
    ALTER TABLE ecs_students DROP CONSTRAINT fk_ecs_students_probation_type_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_students_ecs_student_course_classification_id')
BEGIN
    ALTER TABLE ecs_students DROP CONSTRAINT fk_ecs_students_ecs_student_course_classification_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_students_ecs_student_grade_id')
BEGIN
    ALTER TABLE ecs_students DROP CONSTRAINT fk_ecs_students_ecs_student_grade_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_students_term_id')
BEGIN
    ALTER TABLE ecs_students DROP CONSTRAINT fk_ecs_students_term_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_students_ecs_su_student_id')
BEGIN
    ALTER TABLE ecs_students DROP CONSTRAINT fk_ecs_students_ecs_su_student_id;
END;

-- Drop foreign key constraints from the table communications
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_communications_communication_method_id')
BEGIN
    ALTER TABLE communications DROP CONSTRAINT fk_communications_communication_method_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_communications_ecs_su_student_id')
BEGIN
    ALTER TABLE communications DROP CONSTRAINT fk_communications_ecs_su_student_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_communications_ecs_su_employee_id')
BEGIN
    ALTER TABLE communications DROP CONSTRAINT fk_communications_ecs_su_employee_id;
END;


-- Drop foreign key constraints from the table ecs_advisors_advisor_types
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_advisors_advisor_type_ecs_advisor_type_id')
BEGIN
    ALTER TABLE ecs_advisors_advisor_types DROP CONSTRAINT fk_ecs_advisors_advisor_type_ecs_advisor_type_id;
END;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'fk_ecs_advisors_advisor_type_ecs_su_employee_id')
BEGIN
    ALTER TABLE ecs_advisors_advisor_types DROP CONSTRAINT fk_ecs_advisors_advisor_type_ecs_su_employee_id;
END;


-- Drop tables in reverse order of creation

-- Drop table advisor_student_performance_reviews_ASPiRe
DROP TABLE IF EXISTS advisor_student_performance_reviews_ASPiRe;

-- Drop table communications
DROP TABLE IF EXISTS communications;

-- Drop table ecs_students
DROP TABLE IF EXISTS ecs_students;

-- Drop table probation_histories
DROP TABLE IF EXISTS probation_histories;

-- Drop table ecs_student_probations
DROP TABLE IF EXISTS ecs_student_probations;

-- Drop table ecs_advisors_advisor_types
DROP TABLE IF EXISTS ecs_advisors_advisor_types;

-- Drop table ecs_advisors
DROP TABLE IF EXISTS ecs_advisors;

-- Drop table communication_methods
DROP TABLE IF EXISTS communication_methods;

-- Drop table aspire_ranks
DROP TABLE IF EXISTS aspire_ranks;

-- Drop table grades
DROP TABLE IF EXISTS grades;

-- Drop table probation_types
DROP TABLE IF EXISTS probation_types;

-- Drop table advisor_types
DROP TABLE IF EXISTS advisor_types;

-- Drop table course_classifications
DROP TABLE IF EXISTS course_classifications;

-- Drop table terms
DROP TABLE IF EXISTS terms;

---- Up Meta & Up Data –--- 

--Lookup Table: Terms
create table terms (
    term_id int not null,
    term_semester char(10) not null,
    term_year int not null
    CONSTRAINT pk_terms_term_id primary key(term_id),
    CONSTRAINT u_terms_semester_year unique ( term_semester, term_year)
)
Go
INSERT INTO terms( term_id, term_semester, term_year)
VALUES  
    (1241 ,'fall',2022),
    (1242,'spring',2022),
    (1251,'fall',2023),
    (1252,'spring',2023),
    (1261,'fall',2024)
GO
select*from terms
Go

--Lookup Table: Course Classifications
create table course_classifications (
    course_classification_id int identity not null,   
    classification_name varchar (30) not null,
    constraint pk_course_classification primary key (course_classification_id),
    constraint u_course_classifications_classification_name unique(classification_name)
 )
GO
INSERT INTO course_classifications (classification_name)
VALUES
('major_core'),
('major_elective'),
('pure_elective'),
('social_science_selection'),
('humanities_selection');
GO

select*from course_classifications
Go

--Lookup Table: Advisor_Types
create table advisor_types (
    advisor_type_id INT identity not null,   
    advisor_type varchar (50) not null,
constraint pk_advisor_types_advisor_type_id primary key (advisor_type_id),
constraint u_advisor_types_advisor_type unique (advisor_type)
)
GO
INSERT INTO advisor_types (advisor_type)
VALUES
   ('faculty_major_advisor'),
   ('success_advisor'),
   ('career_advisor');
GO    
select* from advisor_types
GO

--Lookup Table: Probation_Types
create table probation_types (
    probation_type_id INT identity not null,   
    probation_type varchar (50) not null,
constraint pk_probation_types_probation_type_id primary key (probation_type_id),
constraint u_probation_types_probation_type unique (probation_type)
)
Go
INSERT INTO probation_types (probation_type)
VALUES
    ('academic suspension'),
    ('academic suspension with appeal'),
    ('college probation COP'),
    ('probation one semester trial PST'),
    ('probation with advice to withdraw PAW')
GO
select * from probation_types
Go

--Lookup Table: Grades
CREATE TABLE grades (
    grade_id INT identity not null,   
    grade varchar (2) not null,
constraint pk_grades_grade_id primary key (grade_id),
constraint u_grade_grade unique (grade)
)
Go
INSERT INTO grades (grade)
VALUES 
 ('A'),
 ('B'),
 ('C'),
 ('D'),
 ('F')

GO
SELECT * from grades

--Lookup Table: ASPiRe Rank
CREATE TABLE aspire_ranks (
    rank_id INT identity not null,   
    rank varchar (20) not null,
constraint pk_aspire_ranks_rank_id primary key (rank_id),
constraint u_aspire_ranks_rank unique (rank)
)
Go
INSERT INTO aspire_ranks (rank)
VALUES 
    ('excellent'),
    ('fair'),
    ('good'),
    ('poor')
GO
SELECT * from aspire_ranks

--Lookup Table: Communication Method
CREATE TABLE communication_methods (
    communication_method_id INT identity not null,   
    method varchar (20) not null,
constraint pk_communication_methods_method_id primary key (communication_method_id),
constraint u_communication_methods_method unique (method)
)
Go
INSERT INTO communication_methods (method)
VALUES 
    ('email'),
    ('letter'),
    ('phone')
GO
SELECT * from communication_methods


--Table: ECS_Advisors
create table ecs_advisors (
    ecs_su_employee_id varchar(9) not null,   
    ecs_advisor_firstname varchar (20) not null,
    ecs_advisor_lastname varchar (20) not null,
    ecs_advisor_email varchar (50) not null,
    ecs_advisor_phone_number varchar(15) not null,
    constraint pk_ecs_advisor_su_employee_id primary key (ecs_su_employee_id)
)
Go 
INSERT INTO ecs_advisors (ecs_su_employee_id, ecs_advisor_firstname, ecs_advisor_lastname, ecs_advisor_email,ecs_advisor_phone_number)
VALUES 
    (   417625125   ,   'doug', 'young',    'dyoung@syr.edu',   '(315)-443-2211'),
    (   632678276   ,   'gabi', 'bermudez', 'gbermude@syr.edu', '(315)-443-1189'),
    (   221267274   ,   'chelsey',  'franza',   'cfranza@syr.edu',  '(315)-443-2222'),
    (   547219793   ,   'malea',    'perkins',  'mdperk01@syr.edu', '(315)-443-4444'),
    (   151179136   ,   'mia',  'funderburg',   'mfunderburg@syr.edu',  '(315)-443-8888'),
    (   575303167   ,   'john', 'isik', 'jisik@syr.edu',    '(315)-443-6666')
GO
select* from ecs_advisors
GO

-- Bridge Table ECS_Advisors_Advisor_Types
CREATE TABLE ecs_advisors_advisor_types (
    ecs_su_employee_id VARCHAR(9) NOT NULL,
    ecs_advisor_type_id INT IDENTITY NOT NULL,
    CONSTRAINT pk_ecs_advisors_advisor_types PRIMARY KEY (ecs_su_employee_id, ecs_advisor_type_id)
);
GO

INSERT INTO ecs_advisors_advisor_types (ecs_su_employee_id)
VALUES
    (   417625125 ),
    (   632678276 ),
    (   221267274 ),
    (   547219793 ),
    (   151179136 ),
    (   575303167 )
GO
-- Add foreign key constraints to ecs_advisors_advisor_type table
ALTER TABLE ecs_advisors_advisor_type
	ADD CONSTRAINT fk_ecs_advisors_advisor_type_ecs_su_employee_id FOREIGN KEY (ecs_su_employee_id)
	REFERENCES ecs_advisors(ecs_su_employee_id);

ALTER TABLE ecs_advisors_advisor_type
	ADD CONSTRAINT fk_ecs_advisors_advisor_type_ecs_advisor_type_id FOREIGN KEY (ecs_advisor_type_id)
	REFERENCES advisor_type(advisor_type_id);
select* from ecs_advisors_advisor_types

-- Bridge Table ECS_Student_Probations
create table ecs_student_probations (
    ecs_su_student_id int not null,  
    term_id int not null,
    ecs_student_probation_type_id int not null,
    constraint pk_ecs_student_probations_id_term primary key (ecs_su_student_id,term_id)
)
Go
INSERT INTO ecs_student_probations (ecs_su_student_id,term_id, ecs_student_probation_type_id)
VALUES
    (   724217254   ,   1241, 1),
    (   220538945   ,   1242, 2 ),
    (   221267274   ,   1251, 3),
    (   698759956   ,   1252, 3),
    (   945138207   ,   1241, 2),
    (   646315859   ,   1242, 1 )
GO

-- Add foreign key constraints to ecs_student_probations table
ALTER TABLE ecs_student_probations
	ADD CONSTRAINT fk_ecs_student_probations_ecs_su_student_id FOREIGN KEY (ecs_su_student_id)
	REFERENCES probation_histories(ecs_su_student_id);

ALTER TABLE ecs_student_probations
	ADD CONSTRAINT fk_ecs_student_probations_term_id FOREIGN KEY (term_id)
	REFERENCES probation_histories(term_id);

ALTER TABLE ecs_student_probations
	ADD CONSTRAINT fk_ecs_student_probations_ecs_student_probation_type_id FOREIGN KEY (ecs_student_probation_type_id)
	REFERENCES probation_types(probation_type_id);

Select * from ecs_student_probations
GO


-- Table: Probation Histories
create table probation_histories(
    ecs_su_student_id int not null,   
    term_id int not null,
    probation_history_type_id varchar(20) not null,
    first_probation_term int not null,
    first_probation_type VARCHAR (80) not null,
    last_probation_term int not null,
    last_probation_type VARCHAR (80) not null,
    probation_history_count int not null,
    constraint pk_probation_histories_id primary key (ecs_su_student_id,term_id)
 )
 Go
INSERT INTO probation_histories (ecs_su_student_id, term_id, probation_history_type_id, first_probation_term,first_probation_type, 
last_probation_term, last_probation_type, probation_history_count )
VALUES
(724217254,	1241,	3,	1241,	'probation_one_semester_trial_PST', 	1242, 'college_probation_COP', 	1),
(220538945,	1242,	2,	1242,	'college_probation_COP', 1243,	'college_probation_COP', 	1),
(875010833,	1243,	4,	1243,	'academic_suspension_with_appeal',	1244,	'college_probation_COP', 	1),
(698759956,	1244,	4,	1244,	'probation_one_semester_trial_PST',  	1245,	'college_probation_COP', 	1),
(945138207,	1245,	5,	1245,	'probation_one_semester_trial_PST',  	1246,	'college_probation_COP', 	1),
(646315859,	1246,	5,	1246,	'probation_with_advice_to_withdraw_PAW', 	1247,	'probation_with_advice_to_withdraw_PAW', 	1),
(775460781,	1247,	5,	1247,	'probation_with_advice_to_withdraw_PAW', 	1248,	'probation_with_advice_to_withdraw_PAW', 	1),
(269533438,	1248,	5,	1248,	'probation_with_advice_to_withdraw_PAW', 	1249,	'probation_with_advice_to_withdraw_PAW', 	1),
(772437110,	1249,	5,	1249,	'probation_with_advice_to_withdraw_PAW', 	1250,	'probation_with_advice_to_withdraw_PAW', 	1),
(805986418,	1250,	5,	1250,	'probation_with_advice_to_withdraw_PAW', 	1251,	'probation_with_advice_to_withdraw_PAW', 	1),
(282157335,	1251,	4,	1251,	'probation_one_semester_trial_PST',  	1252,	'probation_one_semester_trial_PST',  	1),
(495422392,	1252,	4,	1252,	'probation_one_semester_trial_PST',  	1253,	'probation_one_semester_trial_PST',  	1),
(302754821,	1253,	4,	1253,	'probation_one_semester_trial_PST',  	1254,	'probation_one_semester_trial_PST',  	1),
(332973767,	1254,	4,	1254,	'probation_one_semester_trial_PST',  	1255,	'probation_one_semester_trial_PST',  	1),
(715874153,	1255,	4,	1255,	'probation_one_semester_trial_PST',  	1256,	'probation_one_semester_trial_PST',  	1),
(913936704,	1256,	3,	1256,	'probation_one_semester_trial_PST',  	1257,	'probation_one_semester_trial_PST',  	1),
(855430832,	1257,	3,	1257,	'college_probation_COP', 	1258,	'college_probation_COP', 	1),
(712489572,	1258,	3,	1258,	'college_probation_COP', 	1259,	'college_probation_COP', 	1),
(904457619,	1259,	3,	1259,	'college_probation_COP', 	1260,	'college_probation_COP', 	1),
(539292934,	1260,	3,	1260,	'college_probation_COP', 	1266,	'college_probation_COP', 	6),
(541081914,	1261,	2,	1261,	'college_probation_COP', 	1265,	'college_probation_COP', 	5),
(756135065,	1262,	2,	1262,	'college_probation_COP', 	1264,	'college_probation_COP', 	3),
(344724063,	1263,	2,	1263,	'college_probation_COP', 	1265,	'college_probation_COP', 	3),
(670676582,	1264,	2,	1264,	'college_probation_COP', 	1266,	'college_probation_COP', 	3)

-- Add foreign key constraints to probation_histories table
ALTER TABLE probation_histories 
	ADD CONSTRAINT fk_probation_histories_ecs_su_student_id FOREIGN KEY (ecs_su_student_id) 
	REFERENCES ecs_students(ecs_su_student_id);

ALTER TABLE probation_histories 
	ADD CONSTRAINT fk_probation_histories_term_id FOREIGN KEY (term_id) 
	REFERENCES terms(term_id);

ALTER TABLE probation_histories 
	ADD CONSTRAINT fk_probation_histories_probation_history_type_id FOREIGN KEY (probation_history_type_id) 
	REFERENCES probation_types(probation_type_id);

select* from probation_histories
GO

-- Table: ECS_Student
create table ecs_students (
        ecs_su_student_id int not null,
        term_id int not null,
        ecs_student_course_catalog_number INT not null,
        ecs_student_grade_id INT not null,
        ecs_student_course_classification_id varchar not null,
        ecs_student_semester_gpa Float not null,
        ecs_student_grade_points Float not null,
        probation_type_id int not null, 
        CONSTRAINT pk_ecs_students_ecs_su_student_id primary key (ecs_su_student_id,term_id))
GO
INSERT INTO ecs_students(ecs_su_student_id, term_id, ecs_student_course_catalog_number, ecs_student_grade_id, 
    ecs_student_course_classification_id, ecs_student_semester_gpa, ecs_student_grade_points,probation_type_id)
VALUES
    (   724217254,  1241,   37174,  1   ,   2   ,   2.511,  22.0022 ,   1   )   ,
    (   220538945,  1241,   37172,  2   ,   3   ,   1.556,  23.0022 ,   3   )   ,
    (   875010833,  1241,   37173,  3   ,   4   ,   1.578,  24.0022 ,   2   )   ,
    (   698759956,  1252,   37182,  3   ,   5   ,   1.639,  25.0022 ,   4   )   ,
    (   945138207,  1252,   37183,  4   ,   3   ,   1.756,  26.0022 ,   4   )   ,
    (   646315859,  1252,   37184,  5   ,   3   ,   1.717,  27.0022 ,   5   )   ,
    (   775460781,  1252,   37185,  5   ,   3   ,   1.99,   28.0022 ,   5   )   ,
    (   269533438,  1252,   37186,  5   ,   3   ,   2.54,   29.0022 ,   5   )   ,
    (   772437110,  1252,   37187,  5   ,   3   ,   1.943,  30.0022 ,   5   )   ,
    (   805986418,  1241,   37175,  5   ,   1   ,   1.646,  31.0022 ,   5   )   ,
    (   282157335,  1241,   37176,  5   ,   1   ,   2.633,  32.0022 ,   4   )   ,
    (   495422392,  1241,   37177,  5   ,   1   ,   1.356,  33.0022 ,   4   )   ,
    (   302754821,  1251,   37178,  5   ,   1   ,   2.707,  34.0022 ,   4   )   ,
    (   332973767,  1242,   37179,  4   ,   1   ,   1.857,  35.0022 ,   4   )   ,   
    (   715874153,  1252,   37180,  4   ,   1   ,   2.389,  36.0022 ,   4   )   ,
    (   913936704,  1252,   37181,  4   ,   1   ,   2.444,  37.0022 ,   4   )   ,
    (   855430832,  1242,   37188,  4   ,   1   ,   1.449,  38.0022 ,   3   )   ,
    (   712489572,  1242,   37189,  4   ,   2   ,   2.383,  39.0022 ,   3   )   ,
    (   904457619,  1242,   37190,  4   ,   2   ,   1.373,  40.0022 ,   3   )   ,
    (   539292934,  1241,   37191,  4   ,   2   ,   2.341,  41.0022 ,   3   )   ,
    (   541081914,  1241,   37192,  4   ,   2   ,   1.958,  42.0022 ,   3   )   ,
    (   756135065,  1251,   37193,  3   ,   2   ,   2.645,  43.0022 ,   3   )   ,
    (   344724063,  1261,   37194,  3   ,   2   ,   2.537,  44.0022 ,   3   )   ,
    (   670676582,  1261,   37195,  3   ,   2   ,   1.262,  45.0022 ,   2   )   ,
    (   274635925,  1261,   37196,  3   ,   2   ,   0.81,   46.0022 ,   2   )   ,
    (   220538945,  1242,   37194,  1   ,   1   ,   2.645,  22.0022 ,   3   )   ,
    (   875010833,  1242,   37195,  2   ,   2   ,   1.262,  23.0022 ,   2   )   
GO

-- Add foreign key constraint to ecs_students table
ALTER TABLE ecs_students
	ADD CONSTRAINT fk_ecs_students_ecs_su_student_id FOREIGN KEY (ecs_su_student_id) 
	REFERENCES ecs_student_probations (ecs_su_student_id);

ALTER TABLE ecs_students
	ADD CONSTRAINT fk_ecs_students_term_id FOREIGN KEY (term_id) 
	REFERENCES ecs_student_probations (term_id);

ALTER TABLE ecs_students
	ADD CONSTRAINT fk_ecs_students_ecs_student_grade_id FOREIGN KEY (ecs_student_grade_id) 
	REFERENCES grades (ecs_student_grade_id);

ALTER TABLE ecs_students
	ADD CONSTRAINT fk_ecs_students_ecs_student_course_class_id FOREIGN KEY (ecs_student_course_classification_id) 
	REFERENCES course_classification (ecs_student_course_classification_id);

ALTER TABLE ecs_students
	ADD CONSTRAINT fk_ecs_students_probation_type_id FOREIGN KEY (probation_type_id) 
	REFERENCES probation_types (probation_type_id);
select* from ecs_students
GO

--Bridge Table: Communication
create table communications (
ecs_su_employee_id int not null,   
ecs_su_student_id int not null,
communication_date date not null,
communicataion_method_id INT NOT NULL,
constraint pk_comunications_su_student_employee_id primary key (ecs_su_student_id, ecs_su_employee_id, communication_date)
)
GO
-- Insert data into communications table
INSERT INTO communications (ecs_su_employee_id, ecs_su_student_id, communication_date, communicataion_method_id)
VALUES 
(646315859, 724217254, '01-13-2024', 1),
(269533438, 222053894, '01-13-2024', 2),
(775460781, 875010833, '01-13-2024', 2),
(772437110, 698759956, '01-13-2024', 1),
(805986418, 945138207, '01-13-2024', 1);

-- Add foreign key communications table
ALTER TABLE communications
	ADD CONSTRAINT fk_communications_ecs_su_employee_id FOREIGN KEY (ecs_su_employee_id) 
	REFERENCES advisor_student_performance_reviews_ASPiRe (ASPiRe_ecs_su_employee_id);

ALTER TABLE communications
	ADD CONSTRAINT fk_communications_ecs_su_student_id FOREIGN KEY (ecs_su_student_id) 
	REFERENCES advisor_student_performance_reviews_ASPiRe (ASPiRe_ecs_su_student_id);

ALTER TABLE communications
	ADD CONSTRAINT fk_communications_communication_method_id FOREIGN KEY (communication_method_id) 
	REFERENCES communication_methods (communication_method_id);

select* from communications
GO

--Table:Advisor Student Performance Reviews-ASPiRe

create table  advisor_student_performance_reviews_ASPiRe (
ASPiRe_ecs_su_employee_id INT primary key not null,
ASPiRe_ecs_su_student_id INT not null,
ASPiRe_communications_method varchar(30) not null,
ASPiRe_semester_appointments_count INT not null,
ASPiRe_student_enrollment_status varchar (50) not null,
ASPiRe_term_id INT not null, 
ASPiRe_rank_id int not null, 
ASPiRe_advisor_notes varchar(100) null,
CONSTRAINT uc_advisor_student_performance_reviews_ASPiRe_unique_entry UNIQUE (ASPiRe_ecs_su_student_id, ASPiRe_ecs_su_employee_id, ASPiRe_term_id)

)
go
-- Insert data into advisor_student_performance_reviews_ASPiRe table with unique IDs
INSERT INTO advisor_student_performance_reviews_ASPiRe (ASPiRe_ecs_su_employee_id, ASPiRe_ecs_su_student_id, ASPiRe_communications_method, 
ASPiRe_semester_appointments_count, ASPiRe_student_enrollment_status, ASPiRe_term_id, ASPiRe_rank_id,ASPiRe_advisor_notes)
VALUES 
(839005613, 724217254,'email', 5, 'Enrolled', 1241, 3, 'student using resources'),
(837775613, 220538945,'letter', 3, 'Enrolled', 1241, 2, null),
(657456789, 875010833,'letter', 7, 'Enrolled', 1251, 1, null),
(599356789, 269533438,'email', 2, 'Enrolled', 1242, 4, 'student using resources'),
(123456789, 495422392,'letter', 6, 'Enrolled', 1261, 3, null);
GO

-- Add foreign key constraints to advisor_student_performance_reviews_ASPiRe table
ALTER TABLE advisor_student_performance_reviews_ASPiRe 
	ADD CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_ecs_student_id FOREIGN KEY (ASPiRe_ecs_su_student_id) 
	REFERENCES ecs_students(ecs_su_student_id);

ALTER TABLE advisor_student_performance_reviews_ASPiRe 
	ADD CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_su_employee_id FOREIGN KEY (ASPiRe_ecs_su_employee_id) 
	REFERENCES ecs_advisors(esc_su_employee_id);

ALTER TABLE advisor_student_performance_reviews_ASPiRe 
	ADD CONSTRAINT fk_advisor_student_performance_reviews_ASPiRe_term_id FOREIGN KEY (ASPiRe_term_id) 
	REFERENCES terms(term_id);

select * from advisor_student_performance_reviews_ASPiRe
GO

--Query that provides a probation history count by student, along with the first and last term on probation (probation histories)
select distinct ecs_su_student_id, term_id, ecs_student_probation_type_id, min(term_id) over (partition by ecs_su_student_id) as first_probation_term,
        case when term_id=(select min(term_id) from
            ecs_student_probations where ecs_su_student_id= p.ecs_su_student_id) then ecs_student_probation_type_id
            ELSE 'Review History'
        END AS first_probation_type,
         max(term_id) over (partition by ecs_su_student_id) as last_probation_term,
        case when term_id=(select max(term_id) from
            ecs_student_probations where ecs_su_student_id= p.ecs_su_student_id) then ecs_student_probation_type_id
            ELSE 'Review History'
        END AS last_probation_type,
        count(*) over(partition by ecs_su_student_id) as probation_history_count
into probation_histories
from ecs_student_probations p
group by ecs_su_student_id, term_id, ecs_student_probation_type_id
GO
select* from probation_histories
Alter table probation_histories add constraint pk_probation_histories_ecs_student_id primary key (ecs_su_student_id,term_id)
GO
SELECT * FROM probation_histories;
GO
 
-- Up script for functions
-- Function to retrieve student probation type
IF OBJECT_ID('dbo.GetProbationTypeForStudent') IS NULL
BEGIN
    EXEC('
    CREATE FUNCTION dbo.GetProbationTypeForStudent (@ecs_su_student_id INT)
    RETURNS VARCHAR(20)
    AS
    BEGIN
        DECLARE @probation_type VARCHAR(20);

        SELECT @probation_type = probation_type
        FROM probation_histories
        WHERE ecs_su_student_id = @ecs_su_student_id;

        RETURN @probation_type;
    END;
    ');
END
GO

-- Function to retrieve the number of appointments for an advisor
IF OBJECT_ID('dbo.GetAppointmentCountForAdvisor') IS NULL
BEGIN
    EXEC('
    CREATE FUNCTION dbo.GetAppointmentCountForAdvisor (@ecs_su_employee_id INT)
    RETURNS INT
    AS
    BEGIN
        DECLARE @appointment_count INT;

        SELECT @appointment_count = COUNT(*)
        FROM advisor_student_performance_reviews_ASPiRe
        WHERE ASPiRe_ecs_su_employee_id = @ecs_su_employee_id;

        RETURN @appointment_count;
    END;
    ');
END
GO

-- Create view for advisor_student_performance_reviews_ASPiRe
drop view if exists v_advisor_performance_reviews
go
CREATE VIEW v_advisor_performance_reviews AS
SELECT 
    ASPiRe_ecs_su_employee_id AS Advisor_ID,
    ASPiRe_communications_method AS Communication_Sent,
    ASPiRe_semester_appointments_count AS Semester_Appointments_Count,
    ASPiRe_student_enrollment_status AS Enrollment_Status,
    ASPiRe_term_id AS Term_ID,
    ASPiRe_rank_id AS Progress_Rank
	
FROM advisor_student_performance_reviews_ASPiRe;
GO

select * from v_advisor_performance_reviews

-- Create view for probation_histories
drop view if exists v_probation_histories
go

CREATE VIEW v_probation_histories AS
SELECT 
    ecs_su_student_id AS Student_ID,
    term_id AS Term_ID,
    probation_history_type_id AS Probation_History_Type,
    probation_history_count AS Probation_Count,
    first_probation_term AS Probation_Start_Term,
    first_probation_type as Probation_start_Type,
    last_probation_term as Probation_End_Term,
    last_probation_type as probation_End_Type
FROM probation_histories;
GO
select * from v_probation_histories

-- Create view for communications
drop view if exists v_communications
go
CREATE VIEW v_communications AS
SELECT 
    ecs_su_employee_id AS Employee_ID,
    ecs_su_student_id AS Student_ID,
    communication_date AS Communication_Date
FROM communications;
GO

select * from v_communications
go

-- Create view for course_classifications
CREATE VIEW v_course_classifications AS
SELECT 
    course_classification_id AS Classification_ID,
    classification_name AS Classification_Name
FROM course_classifications;
GO
select * from v_course_classifications
go
-- Create view for grades
CREATE VIEW v_grades AS
SELECT 
    grade_id AS Grade_ID,
    grade AS Grade
FROM grades;
GO
select * from v_grades
GO

-- Create view for advisor_types
CREATE VIEW v_advisor_types AS
SELECT 
    advisor_type_id AS Advisor_Type_ID,
    advisor_type AS Advisor_Type
FROM advisor_types;
GO
select * from v_advisor_types

-- Create view for probation_types
CREATE VIEW v_probation_types AS
SELECT 
    probation_type_id AS Probation_Type_ID,
    probation_type AS Probation_Type
FROM probation_types;
GO

select * from v_probation_types 

-- Create view for ecs_advisors
CREATE VIEW v_ecs_advisors AS
SELECT 
    ecs_su_employee_id AS Advisor_ID,
    ecs_advisor_firstname AS Advisor_Firstname,
    ecs_advisor_lastname AS Advisor_Lastname,
    ecs_advisor_email AS Advisor_Email,
    ecs_advisor_phone_number AS Advisor_Phone_Number
FROM ecs_advisors;
GO
select *from v_ecs_advisors

GO


--Verify
SELECT * FROM advisor_student_performance_reviews_ASPiRe;
SELECT * FROM ecs_advisors;
SELECT * FROM aspire_ranks
SELECT * FROM probation_types;
SELECT * FROM advisor_types;
SELECT * FROM grades;
SELECT * FROM course_classifications;
SELECT * FROM communications;
SELECT * FROM probation_histories;
SELECT * FROM ecs_students;
SELECT * FROM terms;
SELECT * FROM ecs_student_probations;
SELECT * FROM communication_methods
SELECT * FROM ecs_advisors_advisor_types


