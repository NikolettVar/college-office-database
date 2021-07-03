/*PART 1: DATA DEFINITION LANGUAGE(DDL)*/
/*show existing databases*/
SHOW DATABASES;
/*in case collegedb already exist, we delete it*/
DROP DATABASE IF EXISTS COLLEGEDB;
/*create our database*/
CREATE DATABASE COLLEGEDB;            
/*check successful creation of db*/
SHOW DATABASES;
/*pick db we wish to work with*/
USE COLLEGEDB;          
/*ensure db is empty*/
SHOW TABLES;
/*create our tables with attributes, data types, PK, INDEX, FK*/

CREATE TABLE COLLEGE(
	COLLEGE_NAME varchar(45) PRIMARY KEY NOT NULL,
	DEAN_STAFF_ID varchar(30) NOT NULL,
	ADDRESS varchar (255),
	PHONE_NO varchar(12),
	OPEN_WKDAYS varchar(30),
	OPEN_WKENDS varchar(30),
	OPEN_TO_VISITORS varchar(30),
	INDEX(COLLEGE_NAME),
	INDEX(DEAN_STAFF_ID)
	);
	


CREATE TABLE DEPARTMENT(
	DEPT_ID varchar(45) PRIMARY KEY NOT NULL,
	DEPT_NAME varchar(45)NOT NULL,
	HEAD_OF_DEPT_STAFF_ID varchar(30) NOT NULL, 
	DEPT_PHONE varchar(12) NOT NULL,
	COLLEGE_NAME varchar(45) NOT NULL,
	INDEX(DEPT_ID),
	INDEX(COLLEGE_NAME),
	INDEX(HEAD_OF_DEPT_STAFF_ID),
	CONSTRAINT CL_NAME FOREIGN KEY(COLLEGE_NAME) REFERENCES college(COLLEGE_NAME)
);



CREATE TABLE STAFF(
	STAFF_ID varchar(45) PRIMARY KEY NOT NULL, 
	DEPT_ID varchar(45) NOT NULL,
	STAFF_FIRST_NAME varchar(30) NOT NULL,
	STAFF_LAST_NAME varchar(30) NOT NULL,
	DATE_OF_BIRTH date NOT NULL,
	JOB_TITLE varchar(45) NOT NULL,
	LENGTH_OF_SERVICE varchar(30) NOT NULL,
	EMAIL varchar(30) NOT NULL,
	DAYS_OFF_TAKEN integer,
	INDEX(STAFF_ID),
	INDEX(DEPT_ID),
	CONSTRAINT D_ID FOREIGN KEY(DEPT_ID) REFERENCES department(DEPT_ID)ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE COURSE(
	COURSE_ID varchar(45)PRIMARY KEY NOT NULL,
	COURSE_NAME varchar(45) NOT NULL,
	DEPT_ID varchar(45) NOT NULL,
	COURSE_TITLE varchar(45) NOT NULL,
	COURSE_LEVEL integer NOT NULL,
	COURSE_DURATION integer NOT NULL,
	DELIVERY_METHOD varchar(30) NOT NULL,
	PARTICIPANTS_PER_CLASS integer NOT NULL,
	INDEX(COURSE_ID),
	INDEX(DEPT_ID),
	CONSTRAINT DPT_ID FOREIGN KEY(DEPT_ID) REFERENCES department(DEPT_ID)ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE STUDENT(
	STUDENT_ID varchar(45)PRIMARY KEY NOT NULL,	
	DEPT_ID varchar(45) NOT NULL,
	S_FIRST_NAME varchar(30) NOT NULL,
	S_LAST_NAME varchar(30) NOT NULL,
	ADDRESS varchar (255) NOT NULL,
	EMAIL varchar(30) NOT NULL,
	S_PHONE varchar(12) NOT NULL,
	DATE_OF_BIRTH date NOT NULL,
	CURRENT_ACADEMIC_YR varchar(10) NOT NULL,
	FEES_PAID date NOT NULL,
	OVERALL_GRADE varchar(5),	
	INDEX(STUDENT_ID),
	INDEX(DEPT_ID),
	CONSTRAINT DEPART_ID FOREIGN KEY(DEPT_ID) REFERENCES department(DEPT_ID) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE STUDENT_COURSE(
	STUDENT_ID varchar(45) NOT NULL,
	COURSE_ID varchar(45) NOT NULL,	
	CONSTRAINT SC_ID PRIMARY KEY(STUDENT_ID, COURSE_ID),
	INDEX(COURSE_ID),
	INDEX(STUDENT_ID),
	CONSTRAINT STUD_ID FOREIGN KEY(STUDENT_ID) REFERENCES student(STUDENT_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT COR_ID FOREIGN KEY(COURSE_ID) REFERENCES course(COURSE_ID) ON UPDATE CASCADE ON DELETE CASCADE
	
);




CREATE TABLE EXAM_RESULTS(
	STUDENT_ID varchar(45) NOT NULL, 
	COURSE_ID varchar(45) NOT NULL,
	GRADE_YR1 varchar(5),
	GRADE_YR2 varchar(5),
	GRADE_YR3 varchar(5),
	GRADE_YR4 varchar(5),
	GRADE_YR5 varchar(5),
	OVERALL_GRADE varchar(5),
	CONSTRAINT SCD_ID PRIMARY KEY(STUDENT_ID, COURSE_ID),
	INDEX(STUDENT_ID),
	INDEX(COURSE_ID),	
	CONSTRAINT COURSE_ID FOREIGN KEY(COURSE_ID) REFERENCES course(COURSE_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT DEPO_ID FOREIGN KEY(STUDENT_ID) REFERENCES student(STUDENT_ID)ON UPDATE CASCADE ON DELETE CASCADE
);



/*check if all tables are successfully created*/

SHOW TABLES;

/*check structure of each table*/
DESCRIBE COLLEGE;
DESCRIBE DEPARTMENT;
DESCRIBE STAFF;
DESCRIBE COURSE;
DESCRIBE STUDENT;
DESCRIBE STUDENT_COURSE;
DESCRIBE EXAM_RESULTS;

/*PART 2: DATA MANIPULATION LANGUAGE(DML)*/
/*insert rows into each table*/
INSERT INTO COLLEGE VALUES('University of Waterford', 'STAFF31', '100 Cork Road, Waterford City, X91XYX6', '+35351302000', '9am to 8pm', '12am to 6pm', 'open to visitors');
SELECT * FROM COLLEGE;

/*insert rows into DEPARTMENT table*/

INSERT INTO DEPARTMENT VALUES('DEPT01', 'School of Computing', 'STAFF01', '+35351405678', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT02', 'School of Law', 'STAFF04', '+35351765999', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT03', 'School of Business Studies', 'STAFF07', '+35351405679', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT04', 'School of Health Sciences', 'STAFF10', '+35351405680', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT05', 'School of Humanities', 'STAFF13', '+35351405681', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT06', 'School of Engineering', 'STAFF16', '+35351405682', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT07', 'School of Natural Sciences', 'STAFF19', '+35351405683', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT08', 'Registrars Office', 'STAFF22', '+35351405684', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT09', 'Human Resources', 'STAFF25', '+35351405685', 'University of Waterford');

INSERT INTO DEPARTMENT VALUES('DEPT10', 'Exams Office', 'STAFF28', '+35351405686', 'University of Waterford');
SELECT * FROM DEPARTMENT;

/*insert rows into STAFF table*/

INSERT INTO STAFF VALUES('STAFF01', 'DEPT01', 'Cillian', 'OHagan', STR_TO_DATE('05-01-1986', '%m-%d-%Y'), 'Head of Department', '3 years', 'cohagan@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF02', 'DEPT01', 'Mary', 'OSullivan', STR_TO_DATE('06-01-1984', '%m-%d-%Y'), 'Office worker', '3 years', 'mosullivan@uow.ie', 10);

INSERT INTO STAFF VALUES('STAFF03', 'DEPT01', 'Lisa', 'Murphy', STR_TO_DATE('06-14-1986', '%m-%d-%Y'), 'Lecturer', '2 years', 'lmurphy@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF04', 'DEPT02', 'Adrian', 'Power', STR_TO_DATE('04-14-1982', '%m-%d-%Y'), 'Head of Department', '6 years', 'apower@uow.ie', 6);

INSERT INTO STAFF VALUES('STAFF05', 'DEPT02', 'James', 'Ryan', STR_TO_DATE('04-04-1980', '%m-%d-%Y'), 'Lecturer', '6 years', 'jryan@uow.ie', 8);

INSERT INTO STAFF VALUES('STAFF06', 'DEPT02', 'Joan', 'Andrews', STR_TO_DATE('02-24-1986', '%m-%d-%Y'), 'Administration Support', '7 years', 'jandrews@uow.ie', 12);

INSERT INTO STAFF VALUES('STAFF07', 'DEPT03', 'Steven', 'Farley', STR_TO_DATE('09-23-1977', '%m-%d-%Y'), 'Head of Department', '4 years', 'sfarley@uow.ie', 13);

INSERT INTO STAFF VALUES('STAFF08', 'DEPT03', 'Vijay', 'Anamandin', STR_TO_DATE('03-13-1965', '%m-%d-%Y'), 'Lecturer', '16 years', 'vanamandin@uow.ie', 4);

INSERT INTO STAFF VALUES('STAFF09', 'DEPT03', 'Sarah', 'Dollard', STR_TO_DATE('09-25-1994', '%m-%d-%Y'), 'Accounts Assistant', '4 years', 'sdollard@uow.ie', 23);

INSERT INTO STAFF VALUES('STAFF10', 'DEPT04', 'Patricia', 'OSullivan', STR_TO_DATE('03-02-1981', '%m-%d-%Y'), 'Head of Department', '4 years', 'posullivan@uow.ie', 6);

INSERT INTO STAFF VALUES('STAFF11', 'DEPT04', 'Susan', 'Davenport', STR_TO_DATE('06-02-1987', '%m-%d-%Y'), 'Lecturer', '3 years', 'sdavenport@uow.ie', 6);

INSERT INTO STAFF VALUES('STAFF12', 'DEPT04', 'Antony', 'Bridgerton', STR_TO_DATE('10-02-1988', '%m-%d-%Y'), 'Lecturer', '3 years', 'abridgerton@uow.ie', 2);

INSERT INTO STAFF VALUES('STAFF13', 'DEPT05', 'Niamh', 'Kelly', STR_TO_DATE('06-12-1987', '%m-%d-%Y'), 'Head of Department', '2 years', 'nkelly@uow.ie', 6);

INSERT INTO STAFF VALUES('STAFF14', 'DEPT05', 'Sarah', 'Davies', STR_TO_DATE('07-02-1984', '%m-%d-%Y'), 'Lecturer', '3 years', 'sdavies@uow.ie', 6);

INSERT INTO STAFF VALUES('STAFF15', 'DEPT05', 'Padma', 'Verma', STR_TO_DATE('03-31-1982', '%m-%d-%Y'), 'Office worker', '12 years', 'pverma@uow.ie', 2);

INSERT INTO STAFF VALUES('STAFF16', 'DEPT06', 'Michael', 'Kennedy', STR_TO_DATE('07-16-1970', '%m-%d-%Y'), 'Head of Department', '8 years', 'mkennedy@uow.ie', 3);

INSERT INTO STAFF VALUES('STAFF17', 'DEPT06', 'John', 'Newport', STR_TO_DATE('07-06-1972', '%m-%d-%Y'), 'Lecturer', '6 years', 'jnewport@uow.ie', 3);

INSERT INTO STAFF VALUES('STAFF18', 'DEPT06', 'Lawrence', 'Szanto', STR_TO_DATE('04-30-1975', '%m-%d-%Y'), 'Lecturer', '7 years', 'lszanto@uow.ie', 14);

INSERT INTO STAFF VALUES('STAFF19', 'DEPT07', 'Padraig', 'Doyle', STR_TO_DATE('03-16-1972', '%m-%d-%Y'), 'Head of Department', '2 years', 'pdoyle@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF20', 'DEPT07', 'Cillian', 'OKelly', STR_TO_DATE('02-16-1970', '%m-%d-%Y'), 'Lecturer', '1 years', 'cokelly@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF21', 'DEPT07', 'Jonathan', 'Biden', STR_TO_DATE('07-23-1968', '%m-%d-%Y'), 'Lecturer', '6 years', 'jbiden@uow.ie', 4);

INSERT INTO STAFF VALUES('STAFF22', 'DEPT08', 'Seamus', 'Ryan', STR_TO_DATE('11-06-1970', '%m-%d-%Y'), 'Head of Department', '7 years', 'sryan@uow.ie', 2);

INSERT INTO STAFF VALUES('STAFF23', 'DEPT08', 'Adrian', 'McCoy', STR_TO_DATE('01-06-1972', '%m-%d-%Y'), 'Office worker', '8 years', 'amccoy@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF24', 'DEPT08', 'Katherine', 'Coldhand', STR_TO_DATE('03-06-1979', '%m-%d-%Y'), 'Consultant', '4 years', 'kcoldhand@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF25', 'DEPT09', 'Lisa', 'OConnor', STR_TO_DATE('04-22-1983', '%m-%d-%Y'), 'Head of Department', '6 years', 'loconnor@uow.ie', 2);

INSERT INTO STAFF VALUES('STAFF26', 'DEPT09', 'Emma', 'Murphy', STR_TO_DATE('04-12-1989', '%m-%d-%Y'), 'Administrator', '8 years', 'emurphy@uow.ie', 12);

INSERT INTO STAFF VALUES('STAFF27', 'DEPT09', 'Adriana', 'Permier', STR_TO_DATE('04-19-1986', '%m-%d-%Y'), 'HR Specialist', '2 years', 'apermier@uow.ie', 3);

INSERT INTO STAFF VALUES('STAFF28', 'DEPT10', 'Aoife', 'Dunphy', STR_TO_DATE('06-27-1978', '%m-%d-%Y'), 'Head of Department', '5 years', 'adunphy@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF29', 'DEPT10', 'Diana', 'Spencer', STR_TO_DATE('06-17-1978', '%m-%d-%Y'), 'Office worker', '5 years', 'dspencer@uow.ie', 0);

INSERT INTO STAFF VALUES('STAFF30', 'DEPT10', 'Rosemary', 'Windsor', STR_TO_DATE('04-25-1970', '%m-%d-%Y'), 'Accounts Assistant', '12 years', 'rwindsor@uow.ie', 16);

INSERT INTO STAFF VALUES('STAFF31', 'DEPT08', 'John', 'Murphy', STR_TO_DATE('04-22-1965', '%m-%d-%Y'), 'Dean', '12 years', 'jmurphy@uow.ie', 8);
SELECT * FROM STAFF;

/*insert into COURSE table*/

INSERT INTO COURSE VALUES('COMP01', 'Applied Computing', 'DEPT01', 'BSc(Hons)', 8, 8, 'Classroom', 20);

INSERT INTO COURSE VALUES('COMP02', 'Computer Science', 'DEPT01', 'Masters', 9, 10, 'Classroom', 15);

INSERT INTO COURSE VALUES('LAW01', 'Law and Political Science', 'DEPT02', 'BSc(Hons)', 8, 8, 'Classroom', 25);

INSERT INTO COURSE VALUES('LAW02', 'Law and Foreign Relations', 'DEPT02', 'PhD', 10, 2, 'Online', 10);

INSERT INTO COURSE VALUES('BUS01', 'Business Administration', 'DEPT03', 'BSc(Hons)', 8, 8, 'Classroom', 25);

INSERT INTO COURSE VALUES('BUS02', 'Project Management', 'DEPT03', 'Certificate', 6, 1, 'Classroom', 20);

INSERT INTO COURSE VALUES('HS01', 'MSc in Nursing', 'DEPT04', 'Masters', 9, 2, 'Classroom', 25);

INSERT INTO COURSE VALUES('HS02', 'Cognitive Behaviour Therapy', 'DEPT04', 'BSc(Hons)', 8, 8, 'Classroom', 25);

INSERT INTO COURSE VALUES('HUM01', 'Hospitality Studies', 'DEPT05', 'Higher Certificate', 6, 4, 'Online', 15);

INSERT INTO COURSE VALUES('HUM02', 'Bachelor of Arts', 'DEPT05', 'BSc(Hons)', 8, 6, 'Classroom', 15);

INSERT INTO COURSE VALUES('EN01', 'Sustainable Energy Engineering', 'DEPT06', 'Masters', 9, 4, 'Online', 15);

INSERT INTO COURSE VALUES('EN02', 'Manufacturing Engineering', 'DEPT06', 'BSc(Hons)', 8, 8, 'Classroom', 20);

INSERT INTO COURSE VALUES('NS01', 'Botany', 'DEPT07', 'PhD', 10, 2, 'Online', 15);

INSERT INTO COURSE VALUES('NS02', 'Biodiversity', 'DEPT07', 'Masters', 9, 2, 'Online', 20);
SELECT * FROM COURSE ORDER BY DEPT_ID;

/*populate student table*/

INSERT INTO STUDENT VALUES('S001', 'DEPT01', 'Lucy', 'Andrews', '98 Clarke Road, Waterford, X91CTC6', 'landrews@gmail.com', '0855672345', STR_TO_DATE('06-12-2001', '%m-%d-%Y'), '1', STR_TO_DATE('01-01-2021', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S002', 'DEPT01', 'Mary', 'Butler', '67 Saints Terrace, Waterford, X91CTG8', 'mbutler@gmail.com', '0865672344', STR_TO_DATE('04-11-2000', '%m-%d-%Y'), '2', STR_TO_DATE('01-01-2020', '%m-%d-%Y'), '78%');

INSERT INTO STUDENT VALUES('S003', 'DEPT01', 'John', 'Cullen', '12 Morgan Street, Waterford, X91CTJ9', 'jcullen@gmail.com', '0835672345', STR_TO_DATE('11-11-2002', '%m-%d-%Y'), '1', STR_TO_DATE('01-01-2021', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S004', 'DEPT01', 'Anita', 'Stokes', '40 Custom House Road, Waterford, X91CTC6', 'astokes@gmail.com', '0855672325', STR_TO_DATE('04-09-2000', '%m-%d-%Y'), '2', STR_TO_DATE('12-20-2020', '%m-%d-%Y'), '87%');

INSERT INTO STUDENT VALUES('S005', 'DEPT01', 'Jack', 'Dorsey', '25 Ashe Road, Waterford, X91XTC8', 'jdorsey@gmail.com', '0875682325', STR_TO_DATE('02-24-2000', '%m-%d-%Y'), '2', STR_TO_DATE('11-20-2020', '%m-%d-%Y'), '92%');

INSERT INTO STUDENT VALUES('S006', 'DEPT01', 'Patricia', 'Eilish', '42 McDonagh Road, Waterford, X91XZC9', 'peilish@gmail.com', '0875682325', STR_TO_DATE('03-25-2000', '%m-%d-%Y'), '2', STR_TO_DATE('10-23-2020', '%m-%d-%Y'), '78%');

INSERT INTO STUDENT VALUES('S007', 'DEPT02', 'John', 'McCabe', '11 McDonagh Road, Waterford, X91XZC8', 'jmccabe@gmail.com', '0875681325', STR_TO_DATE('04-25-1999', '%m-%d-%Y'), '2', STR_TO_DATE('10-24-2020', '%m-%d-%Y'), '65%');

INSERT INTO STUDENT VALUES('S008', 'DEPT02', 'Andrew', 'Winfred', '4 Windbreaker Road, Waterford, X91XZK8', 'awinfred@gmail.com', '0865681325', STR_TO_DATE('03-29-2001', '%m-%d-%Y'), '1', STR_TO_DATE('12-24-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S009', 'DEPT02', 'Molly', 'Brown', '43 OConnell Street, Waterford, X91XYK4', 'mbrown@gmail.com', '0865681445', STR_TO_DATE('02-03-1997', '%m-%d-%Y'), '1', STR_TO_DATE('10-18-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S10', 'DEPT03', 'Moira', 'Ryan', '99 Sunset Street, Waterford, X91XYN4', 'mryan@gmail.com', '0855001445', STR_TO_DATE('12-03-2002', '%m-%d-%Y'), '1', STR_TO_DATE('12-30-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S11', 'DEPT03', 'Maria', 'Goldsmith', '113 Arundel Square, Waterford, X91XYP6', 'mgoldsmith@gmail.com', '0875001115', STR_TO_DATE('03-23-1996', '%m-%d-%Y'), '1', STR_TO_DATE('11-29-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S12', 'DEPT04', 'Golda', 'Lucas', '44 Cork Road, Waterford, X91XYX6', 'glucas@gmail.com', '0865001215', STR_TO_DATE('12-11-1998', '%m-%d-%Y'), '3', STR_TO_DATE('07-11-2020', '%m-%d-%Y'), '82%');

INSERT INTO STUDENT VALUES('S13', 'DEPT04', 'Mary-Ann', 'Presley', '10 Cork Road, Waterford, X91XYX0', 'mnpresley@gmail.com', '0865201205', STR_TO_DATE('12-21-2001', '%m-%d-%Y'), '1', STR_TO_DATE('07-12-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S14', 'DEPT04', 'Aishling', 'Doyle', '45 The Friars, Waterford, X91XYH3', 'adoyle@gmail.com', '0865341205', STR_TO_DATE('03-29-2001', '%m-%d-%Y'), '1', STR_TO_DATE('05-11-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S15', 'DEPT05', 'Ciara', 'Murphy', '20 The Mill, Waterford, X91XZH3', 'cmurphy@gmail.com', '0865341244', STR_TO_DATE('04-29-1998', '%m-%d-%Y'), '1', STR_TO_DATE('05-12-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S16', 'DEPT05', 'Roisin', 'Daly', '34 Cleaboy Road, Waterford, X91XDH3', 'rdaly@gmail.com', '0850041244', STR_TO_DATE('01-29-1998', '%m-%d-%Y'), '2', STR_TO_DATE('01-12-2021', '%m-%d-%Y'), '88%');

INSERT INTO STUDENT VALUES('S17', 'DEPT05', 'Orla', 'Davies', '13 Barrack Street, Waterford, X91XDA3', 'odavies@gmail.com', '0830044540', STR_TO_DATE('01-22-2000', '%m-%d-%Y'), '3', STR_TO_DATE('02-12-2021', '%m-%d-%Y'), '80%');

INSERT INTO STUDENT VALUES('S18', 'DEPT06', 'Liam', 'Power', '13 Hennessy Road, Waterford, X91XBA9', 'lpower@gmail.com', '0860495243', STR_TO_DATE('07-22-1996', '%m-%d-%Y'), '3', STR_TO_DATE('03-01-2021', '%m-%d-%Y'), '82%');

INSERT INTO STUDENT VALUES('S19', 'DEPT06', 'Patrick', 'Kelly', '123 Tycor Road, Waterford, X91XCA4', 'pkelly@gmail.com', '0860249343', STR_TO_DATE('09-12-1998', '%m-%d-%Y'), '2', STR_TO_DATE('02-14-2021', '%m-%d-%Y'), '60%');

INSERT INTO STUDENT VALUES('S20', 'DEPT06', 'Sean', 'Dalton', '12 Mount Sion Avenue, Waterford, X91XBA8', 'sdalton@gmail.com', '0870249653', STR_TO_DATE('09-23-1998', '%m-%d-%Y'), '4', STR_TO_DATE('02-26-2021', '%m-%d-%Y'), '75%');

INSERT INTO STUDENT VALUES('S21', 'DEPT06', 'Darragh', 'OBrien', '67 Newport Terrace, Waterford, X91XYY9', 'dobrien@gmail.com', '0860248658', STR_TO_DATE('07-13-1998', '%m-%d-%Y'), '4', STR_TO_DATE('02-02-2021', '%m-%d-%Y'), '85%');

INSERT INTO STUDENT VALUES('S22', 'DEPT07', 'Conor', 'Morton', '4 Bath Street, Waterford, X91XAY9', 'cmorton@gmail.com', '0830996358', STR_TO_DATE('09-13-1995', '%m-%d-%Y'), '1', STR_TO_DATE('12-04-2020', '%m-%d-%Y'), '0%');

INSERT INTO STUDENT VALUES('S23', 'DEPT07', 'Niall', 'Lawlor', '22 Manor Hill, Waterford, X91XX09', 'nlawlor@gmail.com', '0850886358', STR_TO_DATE('04-20-1994', '%m-%d-%Y'), '1', STR_TO_DATE('12-13-2020', '%m-%d-%Y'), '0%');
SELECT * FROM STUDENT;

/*insert into the STUDENT_COURSE table*/

INSERT INTO STUDENT_COURSE VALUES('S001', 'COMP01');

INSERT INTO STUDENT_COURSE VALUES('S002', 'COMP01');

INSERT INTO STUDENT_COURSE VALUES('S003', 'COMP01');

INSERT INTO STUDENT_COURSE VALUES('S004', 'COMP02');

INSERT INTO STUDENT_COURSE VALUES('S005', 'COMP02');

INSERT INTO STUDENT_COURSE VALUES('S006', 'COMP02');

INSERT INTO STUDENT_COURSE VALUES('S007', 'LAW01');

INSERT INTO STUDENT_COURSE VALUES('S008', 'LAW01');

INSERT INTO STUDENT_COURSE VALUES('S009', 'LAW02');

INSERT INTO STUDENT_COURSE VALUES('S10', 'BUS01');

INSERT INTO STUDENT_COURSE VALUES('S11', 'BUS02');

INSERT INTO STUDENT_COURSE VALUES('S12', 'HS01');

INSERT INTO STUDENT_COURSE VALUES('S13', 'HS01');

INSERT INTO STUDENT_COURSE VALUES('S14', 'HS02');

INSERT INTO STUDENT_COURSE VALUES('S15', 'HUM01');

INSERT INTO STUDENT_COURSE VALUES('S16', 'HUM01');

INSERT INTO STUDENT_COURSE VALUES('S17', 'HUM02');

INSERT INTO STUDENT_COURSE VALUES('S18', 'EN01');

INSERT INTO STUDENT_COURSE VALUES('S19', 'EN01');

INSERT INTO STUDENT_COURSE VALUES('S20', 'EN02');

INSERT INTO STUDENT_COURSE VALUES('S21', 'EN02');

INSERT INTO STUDENT_COURSE VALUES('S22', 'NS01');

INSERT INTO STUDENT_COURSE VALUES('S23', 'NS02');

SELECT * FROM STUDENT_COURSE ORDER BY STUDENT_ID;

/*insert into exam_results table*/

INSERT INTO EXAM_RESULTS VALUES('S001','COMP01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S002','COMP01', '78%', '', '', '', '', '78%');

INSERT INTO EXAM_RESULTS VALUES('S003','COMP01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S004','COMP02', '87%', '', '', '', '', '87%');

INSERT INTO EXAM_RESULTS VALUES('S005','COMP02', '92%', '', '', '', '', '92%');

INSERT INTO EXAM_RESULTS VALUES('S006','COMP02', '78%', '', '', '', '', '78%');

INSERT INTO EXAM_RESULTS VALUES('S007','LAW01', '65%', '', '', '', '', '65%');

INSERT INTO EXAM_RESULTS VALUES('S008','LAW01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S009','LAW02', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S10','BUS01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S11','BUS02', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S12','HS01', '87%', '76%', '', '', '', '82%');

INSERT INTO EXAM_RESULTS VALUES('S13','HS01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S14','HS02', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S15','HUM01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S16','HUM01', '88%', '', '', '', '', '88%');

INSERT INTO EXAM_RESULTS VALUES('S17','HUM02', '90%', '70%', '', '', '', '80%');

INSERT INTO EXAM_RESULTS VALUES('S18','EN01', '90%', '73%', '', '', '', '82%');

INSERT INTO EXAM_RESULTS VALUES('S19','EN01', '60%', '', '', '', '', '60%');

INSERT INTO EXAM_RESULTS VALUES('S20','EN02', '72%', '68%', '81%', '82%', '', '75%');

INSERT INTO EXAM_RESULTS VALUES('S21','EN02', '88%', '92%', '85%', '76%', '', '85%');

INSERT INTO EXAM_RESULTS VALUES('S22','NS01', '0%', '', '', '', '', '0%');

INSERT INTO EXAM_RESULTS VALUES('S23','NS02', '0%', '', '', '', '', '0%');

SELECT * FROM EXAM_RESULTS;

/*PART 3: DML, QUERY THE DATASET*/
/*1. Change all students in year one of any course to year two.*/  
UPDATE STUDENT SET CURRENT_ACADEMIC_YR = '2' WHERE CURRENT_ACADEMIC_YR = '1'; SELECT * FROM STUDENT;

/*2. Modify the status of any student in year 4 of all courses to indicate that they have now completed the course*/ 
UPDATE STUDENT SET CURRENT_ACADEMIC_YR = 'completed' WHERE CURRENT_ACADEMIC_YR = '4';
SELECT * FROM STUDENT;

/*3. Delete all students who have outstanding fees which have not been paid for more than 6 months.*/ 
DELETE FROM STUDENT WHERE FEES_PAID < DATE_SUB(NOW() , INTERVAL 6 MONTH);
SELECT * FROM STUDENT;

/*4. Display the first name surname and grade of all students sorting the results so the highest grades are first.*/ 
SELECT S_FIRST_NAME, S_LAST_NAME, OVERALL_GRADE FROM STUDENT ORDER BY OVERALL_GRADE DESC;

/*5. add one new record to each table*/
/*Here we need to ensure that mySQL autocommit functionality is disabled temporarily as the changes we are about the make must be rolled back at question 6.*/ 
SET AUTOCOMMIT = 0;
START TRANSACTION; 
INSERT INTO DEPARTMENT VALUES('DEPT11', 'School of Religion', 'STAFF32', '+35351405687', 'University of Waterford');
INSERT INTO STAFF VALUES('STAFF32', 'DEPT11', 'David', 'Mitchell', STR_TO_DATE('04-24-1976', '%m-%d-%Y'), 'Head of Department', '10 years', 'dmitchell@uow.ie', 2);
INSERT INTO COURSE VALUES('RE01', 'Religion', 'DEPT11', 'B.A. Hons', 8, 8, 'Classroom', 20);
INSERT INTO STUDENT VALUES('S24', 'DEPT11', 'Oisin', 'Murphy', '29 Manor Hill, Waterford, X91XZ9', 'omurphy@gmail.com', '0850884358', STR_TO_DATE('04-20-1997', '%m-%d-%Y'), '1', STR_TO_DATE('12-19-2020', '%m-%d-%Y'), '0%');
INSERT INTO STUDENT_COURSE VALUES('S24', 'RE01');
INSERT INTO EXAM_RESULTS VALUES('S24','RE01', '0%', '', '', '', '', '0%');
/*confirm latest insertions*/
SELECT * FROM DEPARTMENT;
SELECT * FROM COURSE;
SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM STUDENT_COURSE;
SELECT * FROM EXAM_RESULTS;  

/* 6.Delete the record added in 5 from all tables.*/ 
ROLLBACK; 
/*Ensure autocommit is active again before moving on*/ 
 SET AUTOCOMMIT = 1;

/*7. Find the total number of days off taken for all staff, order this by fewest days off by staff member.*/
SELECT * FROM STAFF ORDER BY DAYS_OFF_TAKEN ASC;
 
/*8. Count how many students are doing a business course.*/
SELECT * FROM STUDENT_COURSE; SELECT COUNT(STUDENT_ID)FROM STUDENT_COURSE WHERE COURSE_ID LIKE 'BUS%';
 
/* 9. Change the role of all staff who have a job title Office worker to Administrator.*/ 
SELECT * FROM STAFF;
UPDATE STAFF SET JOB_TITLE = 'Administrator' WHERE JOB_TITLE = 'Office worker';
SELECT * FROM STAFF;
 
/*10. Change all courses entitled PHD to Doctoral.*/
SELECT * FROM COURSE;
UPDATE COURSE SET COURSE_TITLE = 'Doctoral' WHERE COURSE_TITLE = 'PhD';
SELECT * FROM COURSE;
 
/*11. Set the delivery method of all courses to online.*/
SELECT * FROM COURSE;
UPDATE COURSE SET DELIVERY_METHOD = 'Online' WHERE DELIVERY_METHOD = 'Classroom';
SELECT * FROM COURSE;
 
/*12. Update the opening times of the college to say closed to visitors.*/ 
SELECT * FROM COLLEGE;
UPDATE COLLEGE SET OPEN_TO_VISITORS = 'Closed to visitors' WHERE OPEN_TO_VISITORS = 'open to visitors';
SELECT * FROM COLLEGE;

/*13. Drop all information contained in the Course relation.*/
DELETE FROM COURSE; 
SELECT * FROM COURSE;
 
/*Repopulate COURSE relation with data again*/

INSERT INTO COURSE VALUES('COMP01', 'Applied Computing', 'DEPT01', 'BSc(Hons)', 8, 8, 'Classroom', 20);

INSERT INTO COURSE VALUES('COMP02', 'Computer Science', 'DEPT01', 'Masters', 9, 10, 'Classroom', 15);

INSERT INTO COURSE VALUES('LAW01', 'Law and Political Science', 'DEPT02', 'BSc(Hons)', 8, 8, 'Classroom', 25);

INSERT INTO COURSE VALUES('LAW02', 'Law and Foreign Relations', 'DEPT02', 'PhD', 10, 2, 'Online', 10);

INSERT INTO COURSE VALUES('BUS01', 'Business Administration', 'DEPT03', 'BSc(Hons)', 8, 8, 'Classroom', 25);

INSERT INTO COURSE VALUES('BUS02', 'Project Management', 'DEPT03', 'Certificate', 6, 1, 'Classroom', 20);

INSERT INTO COURSE VALUES('HS01', 'MSc in Nursing', 'DEPT04', 'Masters', 9, 2, 'Classroom', 25);

INSERT INTO COURSE VALUES('HS02', 'Cognitive Behaviour Therapy', 'DEPT04', 'BSc(Hons)', 8, 8, 'Classroom', 25);

INSERT INTO COURSE VALUES('HUM01', 'Hospitality Studies', 'DEPT05', 'Higher Certificate', 6, 4, 'Online', 15);

INSERT INTO COURSE VALUES('HUM02', 'Bachelor of Arts', 'DEPT05', 'BSc(Hons)', 8, 6, 'Classroom', 15);

INSERT INTO COURSE VALUES('EN01', 'Sustainable Energy Engineering', 'DEPT06', 'Masters', 9, 4, 'Online', 15);

INSERT INTO COURSE VALUES('EN02', 'Manufacturing Engineering', 'DEPT06', 'BSc(Hons)', 8, 8, 'Classroom', 20);

INSERT INTO COURSE VALUES('NS01', 'Botany', 'DEPT07', 'PhD', 10, 2, 'Online', 15);

INSERT INTO COURSE VALUES('NS02', 'Biodiversity', 'DEPT07', 'Masters', 9, 2, 'Online', 20);

/*14. Delete all courses from the database with an academic level of 6 or less.*/
SELECT * FROM COURSE;
DELETE FROM COURSE WHERE COURSE_LEVEL <= 6;
SELECT * FROM COURSE;

/*15. Set the college phone number to be 01-7654321.*/
SELECT * FROM COLLEGE;
UPDATE COLLEGE SET PHONE_NO = '01-7654321' WHERE PHONE_NO = '+35351302000';
SELECT * FROM COLLEGE;

/*16. Set the dean of the college to be called Michael Dean.*/
UPDATE STAFF SET STAFF_FIRST_NAME = 'Michael' WHERE STAFF_ID = 'STAFF31';
UPDATE STAFF SET STAFF_LAST_NAME = 'Dean' WHERE STAFF_ID = 'STAFF31';
SELECT * FROM STAFF;

/*17. Show all staff members who have been working there for longer than 4 years.*/
SELECT * FROM STAFF;
SELECT STAFF_ID, STAFF_FIRST_NAME, STAFF_LAST_NAME, LENGTH_OF_SERVICE FROM STAFF WHERE LENGTH_OF_SERVICE > '4 years';

/*18. Show all courses that the college offers which run over 3 semesters and have a minimum of 20 participants per class.*/
SELECT *FROM COURSE;
SELECT COURSE_NAME, COURSE_DURATION, PARTICIPANTS_PER_CLASS FROM COURSE WHERE COURSE_DURATION >= 3 AND PARTICIPANTS_PER_CLASS >= 20;
  
/*19. Identify how many students have the word road in their address.*/ 
SELECT COUNT(STUDENT_ID) FROM STUDENT WHERE ADDRESS LIKE '%Road%';
 
/*20. Create a view that will show the result of a query drawing information from three tables at once. Explain why you chose these 3 tables.*/ 
CREATE VIEW STUDENTS_COURSES_DEPARTMENTS 
AS SELECT COURSE.COURSE_NAME, COURSE.COURSE_ID, STUDENT.S_FIRST_NAME, STUDENT.S_LAST_NAME, DEPARTMENT.DEPT_NAME FROM
((COURSE INNER JOIN STUDENT ON COURSE.DEPT_ID = STUDENT.DEPT_ID)
INNER JOIN DEPARTMENT ON COURSE.DEPT_ID = DEPARTMENT.DEPT_ID);
    
/*The following command will list all students, their respective courses and the name of department that runs their course, using the view we have just created above. Our view contains a 3 table join and act as a saved query now. */
SELECT * FROM STUDENTS_COURSES_DEPARTMENTS;
 

 