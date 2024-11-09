
CREATE TABLE IF NOT EXISTS `CourseRegistry` (
  `ClassCode` INT NOT NULL AUTO_INCREMENT,
  `Department` CHAR(4) NOT NULL,
  `CreditHours` INT NOT NULL,
  `Description` TEXT NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ClassCode`, `Department`)
);
CREATE TABLE IF NOT EXISTS `DegreeRequirements` (
  `MajorCode` INT NOT NULL AUTO_INCREMENT,
  `ElectiveCode` INT NULL,
  `CoreCode` INT NULL,
  `DegreeRequirementsCol` VARCHAR(45) NULL,
  PRIMARY KEY (`MajorCode`),
  FOREIGN KEY (`ElectiveCode`) REFERENCES `CourseRegistry`(`ClassCode`) ON DELETE SET NULL,
  FOREIGN KEY (`CoreCode`) REFERENCES `CourseRegistry`(`ClassCode`) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS `User` (
  `UserId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` BINARY(64) NOT NULL,
  `Degree` VARCHAR(45) NOT NULL,
  `Major` VARCHAR(45) NOT NULL,
  `Minor` VARCHAR(45) NULL,
  `MajorCode` INT NOT NULL,
  `MinorCode` INT NULL,
  PRIMARY KEY (`UserId`),
  FOREIGN KEY (`MajorCode`) REFERENCES `DegreeRequirements`(`MajorCode`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `Prerequisite` (
  `PrerequisiteID` INT NOT NULL AUTO_INCREMENT,
  `CourseCode` INT NOT NULL, 
  `PrerequisiteCourseCode` INT NOT NULL, 
  `PrerequisiteCourseDepartment` CHAR(4),
  PRIMARY KEY (`PrerequisiteID`),
  FOREIGN KEY (`CourseCode`) REFERENCES `CourseRegistry`(`ClassCode`) ON DELETE CASCADE,
  FOREIGN KEY (`PrerequisiteCourseCode`) REFERENCES `CourseRegistry`(`ClassCode`) ON DELETE CASCADE
);
