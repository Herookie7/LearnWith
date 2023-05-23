use Breedwise;
CREATE TABLE `AUTH_USER_GROUP` (
  `AUTH_USER_GROUP_ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) DEFAULT NULL,
  `AUTH_GROUP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUTH_USER_GROUP_ID`)
);

CREATE TABLE `tutor` (
  `tutorId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tutorId`)
);

CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `detail` varchar(1024) DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `tutorId` int NOT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE KEY `name` (`name`),
  KEY `tutorId` (`tutorId`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`tutorId`) REFERENCES `tutor` (`tutorId`) ON DELETE CASCADE
);

CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`)
);

CREATE TABLE `enrollment` (
  `enrollmentId` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `userId` int NOT NULL,
  `courseId` int NOT NULL,
  PRIMARY KEY (`enrollmentId`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`)
);