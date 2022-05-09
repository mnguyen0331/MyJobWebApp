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
  `Qualifications` varchar(50) NOT NULL,
  `Responsibilities` varchar(50) NOT NULL,
  `EducationLevelId` int NOT NULL,
  `JobTypeId` int NOT NULL,
  `ContactDetaills` varchar(50) NOT NULL,
  `ExperienceLevelId` int NOT NULL,
  `SalaryRangeId` int NOT NULL,
  `DatePosted` Date NOT NULL,
  `Deadline` Date NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` char(2) NOT NULL,
  `Zipcode` char(5) NOT NULL,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`JobId`),
  FOREIGN KEY (`EducationLevelId`) REFERENCES `EducationLevel`(`EducationLevelId`),
  FOREIGN KEY (`JobTypeId`) REFERENCES `JobType`(`JobTypeId`),
  FOREIGN KEY (`SalaryRangeId`) REFERENCES `SalaryRange`(`SalaryRangeId`),
  FOREIGN KEY (`ExperienceLevelId`) REFERENCES `ExperienceLevel`(`ExperienceLevelId`)
);

CREATE TABLE `JobBenefits` (
  `JobId` int,
  `BenefitsId` int,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`JobId`, `BenefitsId`),
  FOREIGN KEY (`BenefitsId`) REFERENCES `Benefits`(`BenefitsId`),
  FOREIGN KEY (`JobId`) REFERENCES `Job`(`JobId`)
);

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
  `EmployerId` int,
  `UserId` int,
  `CompanyName` varchar(50),
  `CompanyEmail` varchar(50),
  `CompanyPhoneNumber` char(10),
  `AddressId` int,
  `RoleId` int,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`EmployerId`),
  FOREIGN KEY (`RoleId`) REFERENCES `EmployerRole`(`RoleId`)
);

CREATE TABLE `Employee` (
  `EmployeeId` int,
  `UserId` int,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`EmployeeId`)
);

CREATE TABLE `User` (
  `UserId` int,
  `Email` varchar(50),
  `FirstName` varchar(50),
  `LastName` varchar(50),
  `PhoneNumber` char(10),
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  `Password` varchar(50),
  PRIMARY KEY (`UserId`)
);

CREATE TABLE `Status` (
  `StatusId` int,
  `StatusName` varchar(50),
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`StatusId`)
);
INSERT INTO `Status` VALUES (1,'Applied',DEFAULT);
INSERT INTO `Status` VALUES (2,'Rejected',DEFAULT);
INSERT INTO `Status` VALUES (3,'Interviewed',DEFAULT);
INSERT INTO `Status` VALUES (4,'Accepted',DEFAULT);

CREATE TABLE `UserApplyJob` (
  `UserId` int,
  `JobId` int,
  `StatusId` int,
  `TimeStamp` TimeStamp DEFAULT current_timestamp ON UPDATE current_timestamp,
  PRIMARY KEY (`UserId`, `JobId`),
  FOREIGN KEY (`StatusId`) REFERENCES `Status`(`StatusId`),
  FOREIGN KEY (`JobId`) REFERENCES `Job`(`JobId`)
);