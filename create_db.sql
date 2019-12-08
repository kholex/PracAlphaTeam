-- MySQL Script generated by MySQL Workbench
-- Вс 08 дек 2019 17:39:31
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema s_gr3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema s_gr3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `s_gr3`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`User` (
  `UserID` INT(11) NOT NULL,
  `FullName` TEXT NOT NULL,
  `e-mail` TEXT NOT NULL,
  `UserStatus` TINYINT(1) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Group` (
  `GroupID` INT(11) NOT NULL,
  `GroupName` TEXT NULL,
  `CreatorID` INT(11) NULL,
  PRIMARY KEY (`GroupID`),
  INDEX `fk_Group_User1_idx` (`CreatorID` ASC),
  CONSTRAINT `fk_Group_User1`
    FOREIGN KEY (`CreatorID`)
    REFERENCES `s_gr3`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Assignment` (
  `AssignmentID` INT(11) NOT NULL,
  `Description` LONGTEXT NULL,
  `GroupID` INT(11) NOT NULL,
  `DueDate` DATETIME NULL,
  PRIMARY KEY (`AssignmentID`),
  INDEX `fk_Assigmnet_Group1_idx` (`GroupID` ASC),
  CONSTRAINT `fk_Assigmnet_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `s_gr3`.`Group` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Task` (
  `TaskID` INT(11) NOT NULL,
  `AssignmentID` INT(11) NOT NULL,
  `Description` LONGTEXT NULL,
  PRIMARY KEY (`TaskID`),
  INDEX `fk_Task_Course1_idx` (`AssignmentID` ASC),
  CONSTRAINT `fk_Task_Course1`
    FOREIGN KEY (`AssignmentID`)
    REFERENCES `s_gr3`.`Assignment` (`AssignmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Students` (
  `StudentID` INT(11) NOT NULL AUTO_INCREMENT,
  `UserID` INT(11) NOT NULL,
  `GroupID` INT(11) NOT NULL,
  INDEX `fk_Participants_Group1_idx` (`GroupID` ASC),
  INDEX `fk_Participants_User2_idx` (`UserID` ASC),
  PRIMARY KEY (`UserID`, `GroupID`),
  UNIQUE INDEX `StudentID_UNIQUE` (`StudentID` ASC),
  CONSTRAINT `fk_Participants_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `s_gr3`.`Group` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Participants_User2`
    FOREIGN KEY (`UserID`)
    REFERENCES `s_gr3`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Submissions` (
  `SubmissionID` INT(11) NOT NULL AUTO_INCREMENT,
  `TaskID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  `Date` DATETIME NOT NULL,
  `Content` LONGTEXT NOT NULL,
  INDEX `fk_Solution_Task1_idx` (`TaskID` ASC),
  INDEX `fk_Submissions_Participants1_idx` (`StudentID` ASC),
  PRIMARY KEY (`TaskID`, `StudentID`),
  UNIQUE INDEX `SubmissionID_UNIQUE` (`SubmissionID` ASC),
  CONSTRAINT `fk_Solution_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `s_gr3`.`Task` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Submissions_Participants1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `s_gr3`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Teachers` (
  `TeacherID` INT(11) NOT NULL AUTO_INCREMENT,
  `UserID` INT(11) NOT NULL,
  `GroupID` INT(11) NOT NULL,
  INDEX `fk_Teachers_Group1_idx` (`GroupID` ASC),
  PRIMARY KEY (`UserID`, `GroupID`),
  UNIQUE INDEX `TeacherID_UNIQUE` (`TeacherID` ASC),
  CONSTRAINT `fk_Teachers_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `s_gr3`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `s_gr3`.`Group` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Supervisors` (
  `SupervisorID` INT(11) NOT NULL AUTO_INCREMENT,
  `TeacherID` INT(11) NOT NULL,
  `SubmissionID` INT(11) NOT NULL,
  INDEX `fk_Supervisors_Submissions1_idx` (`SubmissionID` ASC),
  UNIQUE INDEX `SupervisorID_UNIQUE` (`SupervisorID` ASC),
  PRIMARY KEY (`TeacherID`, `SubmissionID`),
  CONSTRAINT `fk_Supervisors_Teachers1`
    FOREIGN KEY (`TeacherID`)
    REFERENCES `s_gr3`.`Teachers` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supervisors_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `s_gr3`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`Grades` (
  `GradeID` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `Grade` INT(11) NOT NULL,
  `Date` DATETIME NOT NULL,
  INDEX `fk_Grades_Supervisors1_idx` (`SupervisorID` ASC),
  PRIMARY KEY (`GradeID`),
  CONSTRAINT `fk_Grades_Supervisors1`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `s_gr3`.`Supervisors` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`SupervisorComment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`SupervisorComment` (
  `CommentID` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `Date` DATETIME NOT NULL,
  `Comment` LONGTEXT NOT NULL,
  PRIMARY KEY (`CommentID`),
  INDEX `fk_SupervisorComment_Supervisors1_idx` (`SupervisorID` ASC),
  CONSTRAINT `fk_SupervisorComment_Supervisors1`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `s_gr3`.`Supervisors` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `s_gr3`.`StudentComment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `s_gr3`.`StudentComment` (
  `CommentID` INT(11) NOT NULL,
  `SubmissionID` INT(11) NOT NULL,
  `Date` DATETIME NOT NULL,
  `Comment` LONGTEXT NULL,
  INDEX `fk_StudentComment_Submissions1_idx` (`SubmissionID` ASC),
  PRIMARY KEY (`CommentID`),
  CONSTRAINT `fk_StudentComment_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `s_gr3`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;