-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: collegedb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `collegedb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `collegedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `collegedb`;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `COLLEGE_NAME` varchar(45) NOT NULL,
  `DEAN_STAFF_ID` varchar(30) NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `PHONE_NO` varchar(12) DEFAULT NULL,
  `OPEN_WKDAYS` varchar(30) DEFAULT NULL,
  `OPEN_WKENDS` varchar(30) DEFAULT NULL,
  `OPEN_TO_VISITORS` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`COLLEGE_NAME`),
  KEY `COLLEGE_NAME` (`COLLEGE_NAME`),
  KEY `DEAN_STAFF_ID` (`DEAN_STAFF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('University of Waterford','STAFF31','100 Cork Road, Waterford City, X91XYX6','+35351302000','9am to 8pm','12am to 6pm','open to visitors');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `COURSE_ID` varchar(45) NOT NULL,
  `COURSE_NAME` varchar(45) NOT NULL,
  `DEPT_ID` varchar(45) NOT NULL,
  `COURSE_TITLE` varchar(45) NOT NULL,
  `COURSE_LEVEL` int NOT NULL,
  `COURSE_DURATION` int NOT NULL,
  `DELIVERY_METHOD` varchar(30) NOT NULL,
  `PARTICIPANTS_PER_CLASS` int NOT NULL,
  PRIMARY KEY (`COURSE_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  KEY `DEPT_ID` (`DEPT_ID`),
  CONSTRAINT `DPT_ID` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`DEPT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BUS01','Business Administration','DEPT03','BSc(Hons)',8,8,'Classroom',25),('BUS02','Project Management','DEPT03','Certificate',6,1,'Classroom',20),('COMP01','Applied Computing','DEPT01','BSc(Hons)',8,8,'Classroom',20),('COMP02','Computer Science','DEPT01','Masters',9,10,'Classroom',15),('EN01','Sustainable Energy Engineering','DEPT06','Masters',9,4,'Online',15),('EN02','Manufacturing Engineering','DEPT06','BSc(Hons)',8,8,'Classroom',20),('HS01','MSc in Nursing','DEPT04','Masters',9,2,'Classroom',25),('HS02','Cognitive Behaviour Therapy','DEPT04','BSc(Hons)',8,8,'Classroom',25),('HUM01','Hospitality Studies','DEPT05','Higher Certificate',6,4,'Online',15),('HUM02','Bachelor of Arts','DEPT05','BSc(Hons)',8,6,'Classroom',15),('LAW01','Law and Political Science','DEPT02','BSc(Hons)',8,8,'Classroom',25),('LAW02','Law and Foreign Relations','DEPT02','PhD',10,2,'Online',10),('NS01','Botany','DEPT07','PhD',10,2,'Online',15),('NS02','Biodiversity','DEPT07','Masters',9,2,'Online',20);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DEPT_ID` varchar(45) NOT NULL,
  `DEPT_NAME` varchar(45) NOT NULL,
  `HEAD_OF_DEPT_STAFF_ID` varchar(30) NOT NULL,
  `DEPT_PHONE` varchar(12) NOT NULL,
  `COLLEGE_NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`DEPT_ID`),
  KEY `DEPT_ID` (`DEPT_ID`),
  KEY `COLLEGE_NAME` (`COLLEGE_NAME`),
  KEY `HEAD_OF_DEPT_STAFF_ID` (`HEAD_OF_DEPT_STAFF_ID`),
  CONSTRAINT `CL_NAME` FOREIGN KEY (`COLLEGE_NAME`) REFERENCES `college` (`COLLEGE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('DEPT01','School of Computing','STAFF01','+35351405678','University of Waterford'),('DEPT02','School of Law','STAFF04','+35351765999','University of Waterford'),('DEPT03','School of Business Studies','STAFF07','+35351405679','University of Waterford'),('DEPT04','School of Health Sciences','STAFF10','+35351405680','University of Waterford'),('DEPT05','School of Humanities','STAFF13','+35351405681','University of Waterford'),('DEPT06','School of Engineering','STAFF16','+35351405682','University of Waterford'),('DEPT07','School of Natural Sciences','STAFF19','+35351405683','University of Waterford'),('DEPT08','Registrars Office','STAFF22','+35351405684','University of Waterford'),('DEPT09','Human Resources','STAFF25','+35351405685','University of Waterford'),('DEPT10','Exams Office','STAFF28','+35351405686','University of Waterford');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_results` (
  `STUDENT_ID` varchar(45) NOT NULL,
  `COURSE_ID` varchar(45) NOT NULL,
  `GRADE_YR1` varchar(5) DEFAULT NULL,
  `GRADE_YR2` varchar(5) DEFAULT NULL,
  `GRADE_YR3` varchar(5) DEFAULT NULL,
  `GRADE_YR4` varchar(5) DEFAULT NULL,
  `GRADE_YR5` varchar(5) DEFAULT NULL,
  `OVERALL_GRADE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`,`COURSE_ID`),
  KEY `STUDENT_ID` (`STUDENT_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  CONSTRAINT `COURSE_ID` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `DEPO_ID` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_results`
--

LOCK TABLES `exam_results` WRITE;
/*!40000 ALTER TABLE `exam_results` DISABLE KEYS */;
INSERT INTO `exam_results` VALUES ('S001','COMP01','0%','','','','','0%'),('S002','COMP01','78%','','','','','78%'),('S003','COMP01','0%','','','','','0%'),('S004','COMP02','87%','','','','','87%'),('S005','COMP02','92%','','','','','92%'),('S006','COMP02','78%','','','','','78%'),('S007','LAW01','65%','','','','','65%'),('S008','LAW01','0%','','','','','0%'),('S009','LAW02','0%','','','','','0%'),('S10','BUS01','0%','','','','','0%'),('S11','BUS02','0%','','','','','0%'),('S12','HS01','87%','76%','','','','82%'),('S13','HS01','0%','','','','','0%'),('S14','HS02','0%','','','','','0%'),('S15','HUM01','0%','','','','','0%'),('S16','HUM01','88%','','','','','88%'),('S17','HUM02','90%','70%','','','','80%'),('S18','EN01','90%','73%','','','','82%'),('S19','EN01','60%','','','','','60%'),('S20','EN02','72%','68%','81%','82%','','75%'),('S21','EN02','88%','92%','85%','76%','','85%'),('S22','NS01','0%','','','','','0%'),('S23','NS02','0%','','','','','0%');
/*!40000 ALTER TABLE `exam_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `STAFF_ID` varchar(45) NOT NULL,
  `DEPT_ID` varchar(45) NOT NULL,
  `STAFF_FIRST_NAME` varchar(30) NOT NULL,
  `STAFF_LAST_NAME` varchar(30) NOT NULL,
  `DATE_OF_BIRTH` date NOT NULL,
  `JOB_TITLE` varchar(45) NOT NULL,
  `LENGTH_OF_SERVICE` varchar(30) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `DAYS_OFF_TAKEN` int DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `STAFF_ID` (`STAFF_ID`),
  KEY `DEPT_ID` (`DEPT_ID`),
  CONSTRAINT `D_ID` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`DEPT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('STAFF01','DEPT01','Cillian','OHagan','1986-05-01','Head of Department','3 years','cohagan@uow.ie',0),('STAFF02','DEPT01','Mary','OSullivan','1984-06-01','Office worker','3 years','mosullivan@uow.ie',10),('STAFF03','DEPT01','Lisa','Murphy','1986-06-14','Lecturer','2 years','lmurphy@uow.ie',0),('STAFF04','DEPT02','Adrian','Power','1982-04-14','Head of Department','6 years','apower@uow.ie',6),('STAFF05','DEPT02','James','Ryan','1980-04-04','Lecturer','6 years','jryan@uow.ie',8),('STAFF06','DEPT02','Joan','Andrews','1986-02-24','Administration Support','7 years','jandrews@uow.ie',12),('STAFF07','DEPT03','Steven','Farley','1977-09-23','Head of Department','4 years','sfarley@uow.ie',13),('STAFF08','DEPT03','Vijay','Anamandin','1965-03-13','Lecturer','16 years','vanamandin@uow.ie',4),('STAFF09','DEPT03','Sarah','Dollard','1994-09-25','Accounts Assistant','4 years','sdollard@uow.ie',23),('STAFF10','DEPT04','Patricia','OSullivan','1981-03-02','Head of Department','4 years','posullivan@uow.ie',6),('STAFF11','DEPT04','Susan','Davenport','1987-06-02','Lecturer','3 years','sdavenport@uow.ie',6),('STAFF12','DEPT04','Antony','Bridgerton','1988-10-02','Lecturer','3 years','abridgerton@uow.ie',2),('STAFF13','DEPT05','Niamh','Kelly','1987-06-12','Head of Department','2 years','nkelly@uow.ie',6),('STAFF14','DEPT05','Sarah','Davies','1984-07-02','Lecturer','3 years','sdavies@uow.ie',6),('STAFF15','DEPT05','Padma','Verma','1982-03-31','Office worker','12 years','pverma@uow.ie',2),('STAFF16','DEPT06','Michael','Kennedy','1970-07-16','Head of Department','8 years','mkennedy@uow.ie',3),('STAFF17','DEPT06','John','Newport','1972-07-06','Lecturer','6 years','jnewport@uow.ie',3),('STAFF18','DEPT06','Lawrence','Szanto','1975-04-30','Lecturer','7 years','lszanto@uow.ie',14),('STAFF19','DEPT07','Padraig','Doyle','1972-03-16','Head of Department','2 years','pdoyle@uow.ie',0),('STAFF20','DEPT07','Cillian','OKelly','1970-02-16','Lecturer','1 years','cokelly@uow.ie',0),('STAFF21','DEPT07','Jonathan','Biden','1968-07-23','Lecturer','6 years','jbiden@uow.ie',4),('STAFF22','DEPT08','Seamus','Ryan','1970-11-06','Head of Department','7 years','sryan@uow.ie',2),('STAFF23','DEPT08','Adrian','McCoy','1972-01-06','Office worker','8 years','amccoy@uow.ie',0),('STAFF24','DEPT08','Katherine','Coldhand','1979-03-06','Consultant','4 years','kcoldhand@uow.ie',0),('STAFF25','DEPT09','Lisa','OConnor','1983-04-22','Head of Department','6 years','loconnor@uow.ie',2),('STAFF26','DEPT09','Emma','Murphy','1989-04-12','Administrator','8 years','emurphy@uow.ie',12),('STAFF27','DEPT09','Adriana','Permier','1986-04-19','HR Specialist','2 years','apermier@uow.ie',3),('STAFF28','DEPT10','Aoife','Dunphy','1978-06-27','Head of Department','5 years','adunphy@uow.ie',0),('STAFF29','DEPT10','Diana','Spencer','1978-06-17','Office worker','5 years','dspencer@uow.ie',0),('STAFF30','DEPT10','Rosemary','Windsor','1970-04-25','Accounts Assistant','12 years','rwindsor@uow.ie',16),('STAFF31','DEPT08','John','Murphy','1965-04-22','Dean','12 years','jmurphy@uow.ie',8);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `STUDENT_ID` varchar(45) NOT NULL,
  `DEPT_ID` varchar(45) NOT NULL,
  `S_FIRST_NAME` varchar(30) NOT NULL,
  `S_LAST_NAME` varchar(30) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `S_PHONE` varchar(12) NOT NULL,
  `DATE_OF_BIRTH` date NOT NULL,
  `CURRENT_ACADEMIC_YR` varchar(10) NOT NULL,
  `FEES_PAID` date NOT NULL,
  `OVERALL_GRADE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`),
  KEY `STUDENT_ID` (`STUDENT_ID`),
  KEY `DEPT_ID` (`DEPT_ID`),
  CONSTRAINT `DEPART_ID` FOREIGN KEY (`DEPT_ID`) REFERENCES `department` (`DEPT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('S001','DEPT01','Lucy','Andrews','98 Clarke Road, Waterford, X91CTC6','landrews@gmail.com','0855672345','2001-06-12','1','2021-01-01','0%'),('S002','DEPT01','Mary','Butler','67 Saints Terrace, Waterford, X91CTG8','mbutler@gmail.com','0865672344','2000-04-11','2','2020-01-01','78%'),('S003','DEPT01','John','Cullen','12 Morgan Street, Waterford, X91CTJ9','jcullen@gmail.com','0835672345','2002-11-11','1','2021-01-01','0%'),('S004','DEPT01','Anita','Stokes','40 Custom House Road, Waterford, X91CTC6','astokes@gmail.com','0855672325','2000-04-09','2','2020-12-20','87%'),('S005','DEPT01','Jack','Dorsey','25 Ashe Road, Waterford, X91XTC8','jdorsey@gmail.com','0875682325','2000-02-24','2','2020-11-20','92%'),('S006','DEPT01','Patricia','Eilish','42 McDonagh Road, Waterford, X91XZC9','peilish@gmail.com','0875682325','2000-03-25','2','2020-10-23','78%'),('S007','DEPT02','John','McCabe','11 McDonagh Road, Waterford, X91XZC8','jmccabe@gmail.com','0875681325','1999-04-25','2','2020-10-24','65%'),('S008','DEPT02','Andrew','Winfred','4 Windbreaker Road, Waterford, X91XZK8','awinfred@gmail.com','0865681325','2001-03-29','1','2020-12-24','0%'),('S009','DEPT02','Molly','Brown','43 OConnell Street, Waterford, X91XYK4','mbrown@gmail.com','0865681445','1997-02-03','1','2020-10-18','0%'),('S10','DEPT03','Moira','Ryan','99 Sunset Street, Waterford, X91XYN4','mryan@gmail.com','0855001445','2002-12-03','1','2020-12-30','0%'),('S11','DEPT03','Maria','Goldsmith','113 Arundel Square, Waterford, X91XYP6','mgoldsmith@gmail.com','0875001115','1996-03-23','1','2020-11-29','0%'),('S12','DEPT04','Golda','Lucas','44 Cork Road, Waterford, X91XYX6','glucas@gmail.com','0865001215','1998-12-11','3','2020-07-11','82%'),('S13','DEPT04','Mary-Ann','Presley','10 Cork Road, Waterford, X91XYX0','mnpresley@gmail.com','0865201205','2001-12-21','1','2020-07-12','0%'),('S14','DEPT04','Aishling','Doyle','45 The Friars, Waterford, X91XYH3','adoyle@gmail.com','0865341205','2001-03-29','1','2020-05-11','0%'),('S15','DEPT05','Ciara','Murphy','20 The Mill, Waterford, X91XZH3','cmurphy@gmail.com','0865341244','1998-04-29','1','2020-05-12','0%'),('S16','DEPT05','Roisin','Daly','34 Cleaboy Road, Waterford, X91XDH3','rdaly@gmail.com','0850041244','1998-01-29','2','2021-01-12','88%'),('S17','DEPT05','Orla','Davies','13 Barrack Street, Waterford, X91XDA3','odavies@gmail.com','0830044540','2000-01-22','3','2021-02-12','80%'),('S18','DEPT06','Liam','Power','13 Hennessy Road, Waterford, X91XBA9','lpower@gmail.com','0860495243','1996-07-22','3','2021-03-01','82%'),('S19','DEPT06','Patrick','Kelly','123 Tycor Road, Waterford, X91XCA4','pkelly@gmail.com','0860249343','1998-09-12','2','2021-02-14','60%'),('S20','DEPT06','Sean','Dalton','12 Mount Sion Avenue, Waterford, X91XBA8','sdalton@gmail.com','0870249653','1998-09-23','4','2021-02-26','75%'),('S21','DEPT06','Darragh','OBrien','67 Newport Terrace, Waterford, X91XYY9','dobrien@gmail.com','0860248658','1998-07-13','4','2021-02-02','85%'),('S22','DEPT07','Conor','Morton','4 Bath Street, Waterford, X91XAY9','cmorton@gmail.com','0830996358','1995-09-13','1','2020-12-04','0%'),('S23','DEPT07','Niall','Lawlor','22 Manor Hill, Waterford, X91XX09','nlawlor@gmail.com','0850886358','1994-04-20','1','2020-12-13','0%');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `STUDENT_ID` varchar(45) NOT NULL,
  `COURSE_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`STUDENT_ID`,`COURSE_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  KEY `STUDENT_ID` (`STUDENT_ID`),
  CONSTRAINT `COR_ID` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `STUD_ID` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`STUDENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
INSERT INTO `student_course` VALUES ('S10','BUS01'),('S11','BUS02'),('S001','COMP01'),('S002','COMP01'),('S003','COMP01'),('S004','COMP02'),('S005','COMP02'),('S006','COMP02'),('S18','EN01'),('S19','EN01'),('S20','EN02'),('S21','EN02'),('S12','HS01'),('S13','HS01'),('S14','HS02'),('S15','HUM01'),('S16','HUM01'),('S17','HUM02'),('S007','LAW01'),('S008','LAW01'),('S009','LAW02'),('S22','NS01'),('S23','NS02');
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-04 19:48:20
