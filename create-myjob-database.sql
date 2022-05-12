DROP DATABASE IF EXISTS `myjob`;
CREATE DATABASE `myjob`; 
USE `myjob`;

CREATE TABLE `ExperienceLevel` (
  `ExperienceLevelId` int NOT NULL,
  `LevelName` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`ExperienceLevelId`)
);
INSERT INTO `ExperienceLevel` VALUES (1,'Entry level',DEFAULT);
INSERT INTO `ExperienceLevel` VALUES (2,'Mid-level',DEFAULT);
INSERT INTO `ExperienceLevel` VALUES (3,'Senior level',DEFAULT);

CREATE TABLE `Benefits` (
  `BenefitsId` int NOT NULL,
  `BenefitsName` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`BenefitsId`)
);
INSERT INTO `Benefits` VALUES (1,'Health Insurance',DEFAULT);
INSERT INTO `Benefits` VALUES (2,'Vision Insurance',DEFAULT);
INSERT INTO `Benefits` VALUES (3,'Dental Insurance',DEFAULT);
INSERT INTO `Benefits` VALUES (4,'Life Insurance',DEFAULT);
INSERT INTO `Benefits` VALUES (5,'Pension',DEFAULT);
INSERT INTO `Benefits` VALUES (6,'401K',DEFAULT);

CREATE TABLE `EducationLevel` (
  `EducationLevelId` int NOT NULL,
  `Degree` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`EducationLevelId`)
);
INSERT INTO `EducationLevel` VALUES (1,'No Education Required',DEFAULT);
INSERT INTO `EducationLevel` VALUES (2,'High School Degree',DEFAULT);
INSERT INTO `EducationLevel` VALUES (3,'Associate\'s Degree',DEFAULT);
INSERT INTO `EducationLevel` VALUES (4,'Bachelor\'s Degree',DEFAULT);
INSERT INTO `EducationLevel` VALUES (5,'Master\'s Degree',DEFAULT);
INSERT INTO `EducationLevel` VALUES (6,'Doctoral Degree',DEFAULT);

CREATE TABLE `JobType` (
  `JobTypeId` int NOT NULL,
  `TypeName` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`JobTypeId`)
);
INSERT INTO `JobType` VALUES (1,'Full-Time',DEFAULT);
INSERT INTO `JobType` VALUES (2,'Part-Time',DEFAULT);
INSERT INTO `JobType` VALUES (3,'Contract',DEFAULT);
INSERT INTO `JobType` VALUES (4,'Temporary',DEFAULT);
INSERT INTO `JobType` VALUES (5,'Internship',DEFAULT);

CREATE TABLE `SalaryRange` (
  `SalaryRangeId` int NOT NULL,
  `RangeName` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`SalaryRangeId`)
);
INSERT INTO `SalaryRange` VALUES (1,'$35,000+',DEFAULT);
INSERT INTO `SalaryRange` VALUES (2,'$40,000+',DEFAULT);
INSERT INTO `SalaryRange` VALUES (3,'$50,000+',DEFAULT);
INSERT INTO `SalaryRange` VALUES (4,'$70,000+',DEFAULT);
INSERT INTO `SalaryRange` VALUES (5,'$100,000+',DEFAULT);

CREATE TABLE `Job` (
  `JobId` int NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` char(2) NOT NULL,
  `Zipcode` char(5) NOT NULL,
  `Qualifications` varchar(50) NOT NULL,
  `Responsibilities` varchar(50) NOT NULL,
  `EducationLevelId` int NOT NULL,
  `JobTypeId` int NOT NULL,
  `ContactDetaills` varchar(50) NOT NULL,
  `ExperienceLevelId` int NOT NULL,
  `SalaryRangeId` int NOT NULL,
  `DatePosted` Date NOT NULL,
  `Deadline` Date NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`JobId`),
  FOREIGN KEY (`EducationLevelId`) REFERENCES `EducationLevel`(`EducationLevelId`),
  FOREIGN KEY (`JobTypeId`) REFERENCES `JobType`(`JobTypeId`),
  FOREIGN KEY (`SalaryRangeId`) REFERENCES `SalaryRange`(`SalaryRangeId`),
  FOREIGN KEY (`ExperienceLevelId`) REFERENCES `ExperienceLevel`(`ExperienceLevelId`)
);
INSERT INTO job(JobId,Title,Description,Address,City,State,Zipcode,
				Qualifications,Responsibilities,EducationLevelId,
                JobTypeId,ContactDetaills,ExperienceLevelId,SalaryRangeId,
                DatePosted,Deadline,TimeStamp)
VALUES
	(1,'Web Developer','Web Dev for Bernhard-Lowe','869 Canal Ave.','Wayne','NJ','07470',
		'Good at PHP','Design websites',4,
         1,'Contact email bernhard@lowe.com',1,3,
         '2022-05-11','2022-05-31',DEFAULT),
    (2,'Database Designer','Database designer for Denesik-Group', '36 Carriage Rd.','El Paso','TX','79930',
		'Good at SQL','Design databases',4,
        1,'Contact email denesik@group.biz',2,4,
        '2022-05-11','2022-05-31',DEFAULT),
	(3,'Software Engineer','Software engineer for Hermiston-Brakus','1606 Bluff Street','Beltsville','MD','20705',
       'Good at Python,C++','Make new software',5,
       2,'Contact 1597532584',1,4,
		'2022-05-11','2022-05-31',DEFAULT),
	(4,'Data Scientist','Data Scientist for Hermiston-Brakus','1606 Bluff Street','Beltsville','MD','20705',
       'Machine learning, math skills','Make new data model',6,
       1,'Contact 1597532584',2,5,
		'2022-05-11','2022-05-31',DEFAULT),
	(5,'Data analyst','Data analyst for Hermiston-Brakus','1606 Bluff Street','Beltsville','MD','20705',
       'Visualization,Analysis','Analyze trends',5,
       1,'Contact 1597532584',1,3,
		'2022-05-11','2022-05-31',DEFAULT),
	(6,'General Manager','General Manager at ABC bank','2568 Timber Ridge Rd.','Citrus Heights','CA','95610',
		'Management skill','Manage a team of 10 people',5,
        1,'Contact abcbank@gmail.com',3,5,
        '2022-05-11','2022-05-31',DEFAULT),
	(7,'Salesman','Salesman for DEF car','3228 Roy Alley','Denver','CO','80218',
		'Persuasive skill','Sell car',2,
        3,'Contact defcar@hotmail.com',1,1,
        '2022-05-11','2022-05-31',DEFAULT);

CREATE TABLE `JobBenefits` (
  `JobId` int NOT NULL,
  `BenefitsId` int NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`JobId`, `BenefitsId`),
  FOREIGN KEY (`BenefitsId`) REFERENCES `Benefits`(`BenefitsId`),
  FOREIGN KEY (`JobId`) REFERENCES `Job`(`JobId`)
);
INSERT INTO JobBenefits(JobId,BenefitsId,TimeStamp) VALUES
	(1,1,DEFAULT),
    (2,2,DEFAULT),
    (3,3,DEFAULT),
    (4,4,DEFAULT),
    (5,5,DEFAULT),
    (6,6,DEFAULT),
    (7,1,DEFAULT),
    (7,2,DEFAULT);

CREATE TABLE `User` (
  `UserId` int NOT NULL,
  `Email` varchar(50) unique NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` char(10) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`UserId`)
);
INSERT INTO user (UserId,Email,FirstName,LastName,PhoneNumber,Password,Timestamp)
VALUES
(1, 'rickeyc@gmail.com','Rickey','Cordova','1234567890','Rickey1!',DEFAULT),
(2, 'brycez@gmail.com','Bryce','Zuniga','1234567891','Bryce2@',DEFAULT),
(3, 'heribertom@gmail.com','Heriberto','Mccall','1234567892','Heriberto3#',DEFAULT),
(4, 'bradleyh@gmail.com','Bradley','Hampton','1234567893','Bradley4$',DEFAULT),
(5, 'gailo@gmail.com','Gail','Oconnell','1234567894', 'Gailoc5%',DEFAULT),
(6, 'jamies@gmail.com','Jamie','Small','1234567895','Jamiesm6^',DEFAULT);

CREATE TABLE `EmployerRole` (
  `RoleId` int NOT NULL,
  `Title` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`RoleId`)
);
INSERT INTO `EmployerRole` VALUES (1,'Owner',DEFAULT);
INSERT INTO `EmployerRole` VALUES (2,'CEO',DEFAULT);
INSERT INTO `EmployerRole` VALUES (3,'Assistant or Manager',DEFAULT);
INSERT INTO `EmployerRole` VALUES (4,'Human Resources Generalist',DEFAULT);
INSERT INTO `EmployerRole` VALUES (5,'Hiring Manager',DEFAULT);
INSERT INTO `EmployerRole` VALUES (6,'Recruiter',DEFAULT);
INSERT INTO `EmployerRole` VALUES (7,'Other',DEFAULT);

CREATE TABLE `Employer` (
  `UserId` int NOT NULL,
  `CompanyName` varchar(50) NOT NULL,
  `CompanyEmail` varchar(50) NOT NULL,
  `CompanyPhoneNumber` char(10) NOT NULL,
  `Address` varchar(50),
  `City` varchar(50),
  `State` char(2),
  `Zipcode` char(5),
  `RoleId` int NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`UserId`),
  FOREIGN KEY (`RoleId`) REFERENCES `EmployerRole`(`RoleId`),
  FOREIGN KEY (`UserId`) REFERENCES `User`(`UserId`)
);
INSERT INTO employer(UserId, CompanyName,CompanyEmail,CompanyPhoneNumber,Address,City,State,Zipcode,RoleId,TimeStamp)
VALUES
	(1,'Bernhard-Lowe','bernhard@lowe.com','1472583690','869 Canal Ave.','Wayne','NJ','07470',3,DEFAULT),
    (2,'Denesik-Group','denesik@group.biz','2583691478','36 Carriage Rd.','El Paso','TX','79930',4,DEFAULT),
    (3,'Hermiston-Brakus','hermiston@brakus.com','1597532584',NULL,NULL,NULL,NULL,5,DEFAULT);

CREATE TABLE `Employee` (
  `UserId` int NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`UserId`),
  FOREIGN KEY (`UserId`) REFERENCES `User`(`UserId`)
);
INSERT INTO employee (UserId, TimeStamp)
VALUES
	(1, DEFAULT),
    (2, DEFAULT),
    (3, DEFAULT),
    (4, DEFAULT),
    (5, DEFAULT),
    (6, DEFAULT);

CREATE TABLE `Status` (
  `StatusId` int NOT NULL,
  `StatusName` varchar(50) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`StatusId`)
);
INSERT INTO `Status` VALUES (1,'Applied',DEFAULT);
INSERT INTO `Status` VALUES (2,'Rejected',DEFAULT);
INSERT INTO `Status` VALUES (3,'Interviewed',DEFAULT);
INSERT INTO `Status` VALUES (4,'Accepted',DEFAULT);

CREATE TABLE `UserApplyJob` (
  `UserId` int NOT NULL,
  `JobId` int NOT NULL,
  `StatusId` int NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`UserId`, `JobId`),
  FOREIGN KEY (`UserId`) REFERENCES `User`(`UserId`),
  FOREIGN KEY (`JobId`) REFERENCES `Job`(`JobId`),
  FOREIGN KEY (`StatusId`) REFERENCES `Status`(`StatusId`)
);
INSERT INTO userapplyjob VALUES
	(5,1,1,DEFAULT),
    (6,2,1,DEFAULT),
	(4,1,1,DEFAULT),
    (4,2,1,DEFAULT);

CREATE TABLE `EmployerPostJob` (
  `UserId` int NOT NULL,
  `JobId` int NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`UserId`, `JobId`),
  FOREIGN KEY (`UserId`) REFERENCES `Employer`(`UserId`),
  FOREIGN KEY (`JobId`) REFERENCES `Job`(`JobId`)
);
INSERT INTO employerpostjob VALUES
	(1,1,DEFAULT),
    (2,2,DEFAULT),
    (3,3,DEFAULT),
    (3,4,DEFAULT),
    (3,5,DEFAULT),
    (3,6,DEFAULT);