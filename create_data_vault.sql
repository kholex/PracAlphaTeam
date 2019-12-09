-- MySQL Script generated by MySQL Workbench
-- Tue Dec 10 00:05:48 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
  INDEX `fk_sat_Users_User1_idx` (`UserID` ASC) VISIBLE,
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
  INDEX `fk_sat_Assignment_Assignment1_idx` (`AssignmentID` ASC) VISIBLE,
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
  INDEX `fk_sat_Group_Group1_idx` (`GroupID` ASC) VISIBLE,
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
  INDEX `fk_sat_Grades_Grades1_idx` (`GradesID` ASC) VISIBLE,
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
  INDEX `fk_sat_SupervisorComment_SupervisorComment1_idx` (`CommentID` ASC) VISIBLE,
  CONSTRAINT `fk_sat_SupervisorComment_SupervisorComment1`
    FOREIGN KEY (`CommentID`)
    REFERENCES `data_vault`.`SupervisorsComments` (`CommentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_vault`.`Users-Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users-Students` (
  `UserID` INT(11) NOT NULL,
  `StudentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_User-Students_User1_idx` (`UserID` ASC) VISIBLE,
  INDEX `users_students_index` (`StudentID` ASC) VISIBLE,
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
-- Table `data_vault`.`Students-Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Students-Submissions` (
  `StudentID` INT(11) NOT NULL,
  `SubmissionID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Students-Submissions_Students1_idx` (`StudentID` ASC) VISIBLE,
  INDEX `students_submitions_index` (`SubmissionID` ASC) VISIBLE,
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
-- Table `data_vault`.`Submissions-StudentsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Submissions-StudentsComments` (
  `SubmissionID` INT(11) NOT NULL,
  `CommentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Submissions-Comments_Submissions1_idx` (`SubmissionID` ASC) VISIBLE,
  INDEX `index_submussion_commets` (`CommentID` ASC) VISIBLE,
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
-- Table `data_vault`.`Users-Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users-Teachers` (
  `UserID` INT(11) NOT NULL,
  `TeacherID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_User-Teachers_User1_idx` (`UserID` ASC) VISIBLE,
  INDEX `teacher_id` (`TeacherID` ASC) VISIBLE,
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
-- Table `data_vault`.`Users-Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Users-Groups` (
  `UserID` INT(11) NOT NULL,
  `GroupID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_User-Group_User1_idx` (`UserID` ASC) VISIBLE,
  INDEX `index` (`GroupID` ASC) VISIBLE,
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
-- Table `data_vault`.`Students-Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Students-Groups` (
  `StudentID` INT(11) NOT NULL,
  `GroupID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Students-Group_Group1_idx` (`GroupID` ASC) VISIBLE,
  INDEX `student_group_index` (`StudentID` ASC) VISIBLE,
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
-- Table `data_vault`.`Teachers-Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Teachers-Groups` (
  `GroupID` INT(11) NOT NULL,
  `TeacherID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Teachers-Group_Group1_idx` (`GroupID` ASC) VISIBLE,
  INDEX `Indez` (`TeacherID` ASC) VISIBLE,
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
-- Table `data_vault`.`Groups-Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Groups-Assignments` (
  `GroupID` INT(11) NOT NULL,
  `AssignmentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Group-Assignment_Group1_idx` (`GroupID` ASC) VISIBLE,
  INDEX `Assigment-iD` (`AssignmentID` ASC) VISIBLE,
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
-- Table `data_vault`.`Teachers-Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Teachers-Supervisors` (
  `TeacherID` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Teachers-Supervisors_Teachers1_idx` (`TeacherID` ASC) VISIBLE,
  INDEX `index_teachers_supervisors` (`SupervisorID` ASC) VISIBLE,
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
-- Table `data_vault`.`Supervisors-SupervisorsComments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Supervisors-SupervisorsComments` (
  `SupervisorID` INT(11) NOT NULL,
  `CommentID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Supervisors-SupervisorComment_Supervisors1_idx` (`SupervisorID` ASC) VISIBLE,
  INDEX `index_comment_id` (`CommentID` ASC) VISIBLE,
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
-- Table `data_vault`.`Assignments-Tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Assignments-Tasks` (
  `AssignmentID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Assignment-Task_Assignment1_idx` (`AssignmentID` ASC) VISIBLE,
  INDEX `Index_assignment_task` (`TaskID` ASC) VISIBLE,
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
-- Table `data_vault`.`Tasks-Submissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Tasks-Submissions` (
  `SubmissionID` INT(11) NOT NULL,
  `TaskID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Task-Submissions_Submissions1_idx` (`SubmissionID` ASC) VISIBLE,
  INDEX `fk_Task-Submissions_Task1_idx` (`TaskID` ASC) VISIBLE,
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
-- Table `data_vault`.`Supervisors-Grades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Supervisors-Grades` (
  `SupervisorID` INT(11) NOT NULL,
  `GradesID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `fk_Supervisor-Grades_Supervisors1_idx` (`SupervisorID` ASC) VISIBLE,
  INDEX `index_supervisor_grades` (`GradesID` ASC) VISIBLE,
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
-- Table `data_vault`.`Submissions-Supervisors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_vault`.`Submissions-Supervisors` (
  `SubmissionID` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `LoadDateTimeStamp` DATETIME NOT NULL,
  `RecordSource` TEXT NOT NULL,
  INDEX `submissions_supervisors_index` (`SubmissionID` ASC) VISIBLE,
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
  INDEX `submissionid_index` (`SubmissionID` ASC) VISIBLE,
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
  INDEX `index_commentid` (`CommentID` ASC) VISIBLE,
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
  INDEX `index_task` (`TaskID` ASC) VISIBLE,
  CONSTRAINT `fk_sat_Tasks_Tasks1`
    FOREIGN KEY (`TaskID`)
    REFERENCES `data_vault`.`Tasks` (`TaskID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
