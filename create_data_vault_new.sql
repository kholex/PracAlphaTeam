-- MySQL Script generated by MySQL Workbench
-- Вт 10 дек 2019 00:46:32
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema data_vault
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema data_vault
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `data_vault` DEFAULT CHARACTER SET utf8 ;
USE `data_vault` ;

-- -----------------------------------------------------
-- Table `data_vault`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users` (
  `UserID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Student` (
  `StudentID` VARCHAR(45) NOT NULL,
  `GroupID` INT(11) NULL,
  `UserID` INT(11) NOT NULL,
  INDEX `fk_Students_Users_idx` (`UserID` ASC),
  PRIMARY KEY (`StudentID`, `UserID`),
  CONSTRAINT `fk_Students_Users`
    FOREIGN KEY (`UserID`)
    REFERENCES `data_vault`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Groups` (
  `GroupID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`GroupID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Assignments` (
  `AssignmentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`AssignmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Tasks` (
  `TaskID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`TaskID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Submissions` (
  `SubmissionID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`SubmissionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Students` (
  `StudentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`StudentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Grades` (
  `GradesID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`GradesID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Teachers` (
  `TeacherID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`TeacherID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`SupervisorsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`SupervisorsComments` (
  `CommentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`CommentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`StudentsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`StudentsComments` (
  `CommentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`CommentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Supervisors` (
  `SupervisorID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  PRIMARY KEY (`SupervisorID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_Users` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `UserID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `FullName` TEXT NOT NULL,
  `UserStatus` TINYINT(1) NOT NULL,
  `e-mail` TEXT NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `UserID`),
  INDEX `fk_sat_Users_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_sat_Users_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `data_vault`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_Assignments` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `AssignmentID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `DueDate` DATETIME NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `AssignmentID`),
  INDEX `fk_sat_Assignment_Assignment1_idx` (`AssignmentID` ASC),
  CONSTRAINT `fk_sat_Assignment_Assignment1`
    FOREIGN KEY (`AssignmentID`)
    REFERENCES `data_vault`.`Assignments` (`AssignmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_Groups` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `GroupID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `GroupName` TEXT NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `GroupID`),
  INDEX `fk_sat_Group_Group1_idx` (`GroupID` ASC),
  CONSTRAINT `fk_sat_Group_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `data_vault`.`Groups` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_Grades` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `GradesID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `Grade` INT(11) NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `GradesID`),
  INDEX `fk_sat_Grades_Grades1_idx` (`GradesID` ASC),
  CONSTRAINT `fk_sat_Grades_Grades1`
    FOREIGN KEY (`GradesID`)
    REFERENCES `data_vault`.`Grades` (`GradesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_SupervisorsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_SupervisorsComments` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `CommentID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `Comment` LONGTEXT NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `CommentID`),
  INDEX `fk_sat_SupervisorComment_SupervisorComment1_idx` (`CommentID` ASC),
  CONSTRAINT `fk_sat_SupervisorComment_SupervisorComment1`
    FOREIGN KEY (`CommentID`)
    REFERENCES `data_vault`.`SupervisorsComments` (`CommentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Users_Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users_Students` (
  `UserID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_User-Students_User1_idx` (`UserID` ASC),
  INDEX `users_students_index` (`StudentID` ASC),
  CONSTRAINT `fk_User-Students_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `data_vault`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users-Students_Students1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `data_vault`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Students_Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Students_Submissions` (
  `StudentID` INT(11) NOT NULL,
  `SubmissionID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Students-Submissions_Students1_idx` (`StudentID` ASC),
  INDEX `students_submitions_index` (`SubmissionID` ASC),
  CONSTRAINT `fk_Students-Submissions_Students1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `data_vault`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students-Submissions_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `data_vault`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Submissions_StudentsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Submissions_StudentsComments` (
  `SubmissionID` INT(11) NOT NULL,
  `CommentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Submissions-Comments_Submissions1_idx` (`SubmissionID` ASC),
  INDEX `index_submussion_commets` (`CommentID` ASC),
  CONSTRAINT `fk_Submissions-Comments_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `data_vault`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Submissions-StudentsComments_StudentsComments1`
    FOREIGN KEY (`CommentID`)
    REFERENCES `data_vault`.`StudentsComments` (`CommentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Users_Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users_Teachers` (
  `UserID` INT(11) NOT NULL,
  `TeacherID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_User-Teachers_User1_idx` (`UserID` ASC),
  INDEX `teacher_id` (`TeacherID` ASC),
  CONSTRAINT `fk_User-Teachers_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `data_vault`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users-Teachers_Teachers1`
    FOREIGN KEY (`TeacherID`)
    REFERENCES `data_vault`.`Teachers` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Users_Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users_Groups` (
  `UserID` INT(11) NOT NULL,
  `GroupID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_User-Group_User1_idx` (`UserID` ASC),
  INDEX `index` (`GroupID` ASC),
  CONSTRAINT `fk_User-Group_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `data_vault`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users-Group_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `data_vault`.`Groups` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Students_Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Students_Groups` (
  `StudentID` INT(11) NOT NULL,
  `GroupID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Students-Group_Group1_idx` (`GroupID` ASC),
  INDEX `student_group_index` (`StudentID` ASC),
  CONSTRAINT `fk_Students-Group_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `data_vault`.`Groups` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students-Group_Students1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `data_vault`.`Students` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Teachers_Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Teachers_Groups` (
  `GroupID` INT(11) NOT NULL,
  `TeacherID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Teachers-Group_Group1_idx` (`GroupID` ASC),
  INDEX `Indez` (`TeacherID` ASC),
  CONSTRAINT `fk_Teachers-Group_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `data_vault`.`Groups` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers-Group_Teachers1`
    FOREIGN KEY (`TeacherID`)
    REFERENCES `data_vault`.`Teachers` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Groups_Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Groups_Assignments` (
  `GroupID` INT(11) NOT NULL,
  `AssignmentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Group-Assignment_Group1_idx` (`GroupID` ASC),
  INDEX `Assigment-iD` (`AssignmentID` ASC),
  CONSTRAINT `fk_Group-Assignment_Group1`
    FOREIGN KEY (`GroupID`)
    REFERENCES `data_vault`.`Groups` (`GroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group-Assignment_Assignment1`
    FOREIGN KEY (`AssignmentID`)
    REFERENCES `data_vault`.`Assignments` (`AssignmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Teachers_Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Teachers_Supervisors` (
  `TeacherID` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Teachers-Supervisors_Teachers1_idx` (`TeacherID` ASC),
  INDEX `index_teachers_supervisors` (`SupervisorID` ASC),
  CONSTRAINT `fk_Teachers-Supervisors_Teachers1`
    FOREIGN KEY (`TeacherID`)
    REFERENCES `data_vault`.`Teachers` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teachers-Supervisors_Supervisors1`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `data_vault`.`Supervisors` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Supervisors_SupervisorsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Supervisors_SupervisorsComments` (
  `SupervisorID` INT(11) NOT NULL,
  `CommentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Supervisors-SupervisorComment_Supervisors1_idx` (`SupervisorID` ASC),
  INDEX `index_comment_id` (`CommentID` ASC),
  CONSTRAINT `fk_Supervisors-SupervisorComment_Supervisors1`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `data_vault`.`Supervisors` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supervisors-SupervisorsComments_SupervisorsComments1`
    FOREIGN KEY (`CommentID`)
    REFERENCES `data_vault`.`SupervisorsComments` (`CommentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Assignments_Tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Assignments_Tasks` (
  `AssignmentID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Assignment-Task_Assignment1_idx` (`AssignmentID` ASC),
  INDEX `Index_assignment_task` (`TaskID` ASC),
  CONSTRAINT `fk_Assignment-Task_Assignment1`
    FOREIGN KEY (`AssignmentID`)
    REFERENCES `data_vault`.`Assignments` (`AssignmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignment-Tasks_Tasks1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `data_vault`.`Tasks` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Tasks_Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Tasks_Submissions` (
  `SubmissionID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Task-Submissions_Submissions1_idx` (`SubmissionID` ASC),
  INDEX `fk_Task-Submissions_Task1_idx` (`TaskID` ASC),
  CONSTRAINT `fk_Task-Submissions_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `data_vault`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Task-Submissions_Task1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `data_vault`.`Tasks` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Supervisors_Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Supervisors_Grades` (
  `SupervisorID` INT(11) NOT NULL,
  `GradesID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Supervisor-Grades_Supervisors1_idx` (`SupervisorID` ASC),
  INDEX `index_supervisor_grades` (`GradesID` ASC),
  CONSTRAINT `fk_Supervisor-Grades_Supervisors1`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `data_vault`.`Supervisors` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supervisors-Grades_Grades1`
    FOREIGN KEY (`GradesID`)
    REFERENCES `data_vault`.`Grades` (`GradesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Submissions_Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Submissions_Supervisors` (
  `SubmissionID` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `submissions_supervisors_index` (`SubmissionID` ASC),
  CONSTRAINT `fk_Submissions-Supervisors_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `data_vault`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Submissions-Supervisors_Supervisors1`
    FOREIGN KEY (`SupervisorID`)
    REFERENCES `data_vault`.`Supervisors` (`SupervisorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_Submissions` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `SubmissionID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Content` LONGTEXT NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `SubmissionID`),
  INDEX `submissionid_index` (`SubmissionID` ASC),
  CONSTRAINT `fk_sat_Submissions_Submissions1`
    FOREIGN KEY (`SubmissionID`)
    REFERENCES `data_vault`.`Submissions` (`SubmissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_StudentsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_StudentsComments` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `CommentID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `Comment` LONGTEXT NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `CommentID`),
  INDEX `index_commentid` (`CommentID` ASC),
  CONSTRAINT `fk_sat_StudentsComments_StudentsComments1`
    FOREIGN KEY (`CommentID`)
    REFERENCES `data_vault`.`StudentsComments` (`CommentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`sat_Tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`sat_Tasks` (
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `TaskID` INT(11) NOT NULL,
  `RecordSource` TEXT NOT NULL,
  `Description` LONGTEXT NOT NULL,
  PRIMARY KEY (`LoadDateTimeStamp`, `TaskID`),
  INDEX `index_task` (`TaskID` ASC),
  CONSTRAINT `fk_sat_Tasks_Tasks1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `data_vault`.`Tasks` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;