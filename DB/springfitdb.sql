-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema springfitdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `springfitdb` ;

-- -----------------------------------------------------
-- Schema springfitdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `springfitdb` DEFAULT CHARACTER SET utf8 ;
USE `springfitdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `height_in_inches` INT NULL,
  `gender` VARCHAR(45) NULL,
  `date_of_birth` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise_type` ;

CREATE TABLE IF NOT EXISTS `exercise_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout` ;

CREATE TABLE IF NOT EXISTS `workout` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL,
  `published` TINYINT ZEROFILL NULL,
  `image_url` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_list_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_list_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `unit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `unit_type` ;

CREATE TABLE IF NOT EXISTS `unit_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exercise` ;

CREATE TABLE IF NOT EXISTS `exercise` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `instructions` VARCHAR(45) NULL,
  `exercise_type_id` INT NOT NULL,
  `calories_per_unit` INT NULL,
  `unit_type_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_exercise_exercise_type1_idx` (`exercise_type_id` ASC) VISIBLE,
  INDEX `fk_exercise_unit_type1_idx` (`unit_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_exercise_exercise_type1`
    FOREIGN KEY (`exercise_type_id`)
    REFERENCES `exercise_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exercise_unit_type1`
    FOREIGN KEY (`unit_type_id`)
    REFERENCES `unit_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `workout_exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout_exercise` ;

CREATE TABLE IF NOT EXISTS `workout_exercise` (
  `id` INT NOT NULL,
  `units` INT NULL,
  `sets` INT NULL,
  `notes` TEXT NULL,
  `workout_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_exercise_workout1_idx` (`workout_id` ASC) VISIBLE,
  INDEX `fk_workout_exercise_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_exercise_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_exercise_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nutrition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nutrition` ;

CREATE TABLE IF NOT EXISTS `nutrition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `date_eaten` DATETIME NULL,
  `grams_carbohydrates` INT NULL,
  `grams_fat` INT NULL,
  `grams_protien` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nutrition_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_nutrition_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `body_weight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `body_weight` ;

CREATE TABLE IF NOT EXISTS `body_weight` (
  `id` INT NOT NULL,
  `weight_lbs` INT NULL,
  `date_weighed` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_body_weight_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_body_weight_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liked_exercise`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liked_exercise` ;

CREATE TABLE IF NOT EXISTS `liked_exercise` (
  `user_id` INT NOT NULL,
  `exercise_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `exercise_id`),
  INDEX `fk_user_has_exercise_exercise1_idx` (`exercise_id` ASC) VISIBLE,
  INDEX `fk_user_has_exercise_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_exercise_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_exercise_exercise1`
    FOREIGN KEY (`exercise_id`)
    REFERENCES `exercise` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `liked_workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liked_workout` ;

CREATE TABLE IF NOT EXISTS `liked_workout` (
  `user_id` INT NOT NULL,
  `workout_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `workout_id`),
  INDEX `fk_user_has_workout_workout1_idx` (`workout_id` ASC) VISIBLE,
  INDEX `fk_user_has_workout_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_workout_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_workout_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `workout_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `workout_comment` ;

CREATE TABLE IF NOT EXISTS `workout_comment` (
  `id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `content` TEXT NULL,
  `in_reply_to_id` INT NULL,
  `enabled` TINYINT NULL,
  `user_id` INT NOT NULL,
  `workout_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_workout_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_workout_comment_workout1_idx` (`workout_id` ASC) VISIBLE,
  INDEX `fk_workout_comment_workout_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  CONSTRAINT `fk_workout_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_comment_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_comment_workout_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `workout_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `routine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `routine` ;

CREATE TABLE IF NOT EXISTS `routine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_routine_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_routine_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `routine_workout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `routine_workout` ;

CREATE TABLE IF NOT EXISTS `routine_workout` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `day_number` INT NULL,
  `workout_sequence` INT NULL,
  `workout_id` INT NOT NULL,
  `routine_id` INT NOT NULL,
  INDEX `fk_workout_has_routine_routine1_idx` (`routine_id` ASC) VISIBLE,
  INDEX `fk_workout_has_routine_workout1_idx` (`workout_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_workout_has_routine_workout1`
    FOREIGN KEY (`workout_id`)
    REFERENCES `workout` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_workout_has_routine_routine1`
    FOREIGN KEY (`routine_id`)
    REFERENCES `routine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS springfituser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'springfituser'@'localhost' IDENTIFIED BY 'springfituser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'springfituser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `email`, `height_in_inches`, `gender`, `date_of_birth`) VALUES (1, 'admin', 'test', 1, 'na', 'na', 'na', NULL, 'na', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `first_name`, `last_name`, `email`, `height_in_inches`, `gender`, `date_of_birth`) VALUES (2, 'kevine', 'test', 1, 'kevin', 'esfahani', 'abcd@gmail.com', 70, 'male', '1954-03-13');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exercise_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `exercise_type` (`id`, `name`) VALUES (1, 'legs');
INSERT INTO `exercise_type` (`id`, `name`) VALUES (2, 'arms');
INSERT INTO `exercise_type` (`id`, `name`) VALUES (3, 'chest');
INSERT INTO `exercise_type` (`id`, `name`) VALUES (4, 'back');
INSERT INTO `exercise_type` (`id`, `name`) VALUES (5, 'core');
INSERT INTO `exercise_type` (`id`, `name`) VALUES (6, 'cardio');

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `workout` (`id`, `name`, `description`, `create_date`, `last_update`, `enabled`, `published`, `image_url`, `user_id`) VALUES (1, 'Chest Workout', 'upperbody', '2024/08/23', '2024/08/03', 1, 1, 'https://fitnessfit.com.au/wp-content/uploads/2020/11/chest-workout-for-men-1.jpg', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `unit_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `unit_type` (`id`, `name`, `description`) VALUES (1, 'Repetition', 'na');
INSERT INTO `unit_type` (`id`, `name`, `description`) VALUES (2, 'Minute', NULL);
INSERT INTO `unit_type` (`id`, `name`, `description`) VALUES (3, 'Mile', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exercise`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `exercise` (`id`, `name`, `instructions`, `exercise_type_id`, `calories_per_unit`, `unit_type_id`, `image_url`) VALUES (1, 'Pushups', 'na', 1, 3, 1, 'https://www.fitnesseducation.edu.au/wp-content/uploads/2017/03/Pushups.jpg');
INSERT INTO `exercise` (`id`, `name`, `instructions`, `exercise_type_id`, `calories_per_unit`, `unit_type_id`, `image_url`) VALUES (2, 'Crunches', 'na', 5, 2, 1, 'na');
INSERT INTO `exercise` (`id`, `name`, `instructions`, `exercise_type_id`, `calories_per_unit`, `unit_type_id`, `image_url`) VALUES (3, 'Burpees', 'na', 6, 10, 1, 'na');

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout_exercise`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `workout_exercise` (`id`, `units`, `sets`, `notes`, `workout_id`, `exercise_id`) VALUES (1, 10, 2, 'User enters ', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `nutrition`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `nutrition` (`id`, `name`, `date_eaten`, `grams_carbohydrates`, `grams_fat`, `grams_protien`, `user_id`) VALUES (1, 'Meal 1', '2024/08/23', 100, 100, 150, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `body_weight`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `body_weight` (`id`, `weight_lbs`, `date_weighed`, `user_id`) VALUES (1, 180, '2024-08-23', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `liked_exercise`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `liked_exercise` (`user_id`, `exercise_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `liked_workout`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `liked_workout` (`user_id`, `workout_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `workout_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `workout_comment` (`id`, `create_date`, `content`, `in_reply_to_id`, `enabled`, `user_id`, `workout_id`) VALUES (1, '2024-08-23', 'comment stuff', NULL, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `routine`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `routine` (`id`, `name`, `description`, `image_url`, `user_id`) VALUES (1, 'Muscle Gaining Routine', 'Bulk workout routine', 'na', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `routine_workout`
-- -----------------------------------------------------
START TRANSACTION;
USE `springfitdb`;
INSERT INTO `routine_workout` (`id`, `day_number`, `workout_sequence`, `workout_id`, `routine_id`) VALUES (1, 1, 1, 1, 1);

COMMIT;

