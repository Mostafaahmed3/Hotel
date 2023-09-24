-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `company` ;

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8 ;
USE `company` ;

-- -----------------------------------------------------
-- Table `company`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`person` (
  `ssn` VARCHAR(14) NOT NULL,
  `adrress` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`secratery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`secratery` (
  `type_speed` VARCHAR(45) NOT NULL,
  `person_ssn` VARCHAR(14) NOT NULL,
  INDEX `fk_secratery_person_idx` (`person_ssn` ASC),
  PRIMARY KEY (`person_ssn`),
  CONSTRAINT `fk_secratery_person`
    FOREIGN KEY (`person_ssn`)
    REFERENCES `company`.`person` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`manager` (
  `manage` VARCHAR(45) NOT NULL,
  `person_ssn` VARCHAR(14) NOT NULL,
  INDEX `fk_manager_person1_idx` (`person_ssn` ASC),
  PRIMARY KEY (`person_ssn`),
  CONSTRAINT `fk_manager_person1`
    FOREIGN KEY (`person_ssn`)
    REFERENCES `company`.`person` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`hotel` (
  `id` VARCHAR(14) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`room` (
  `number` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`reception`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`reception` (
  `id` VARCHAR(14) NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`customer` (
  `id` VARCHAR(14) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  `room_number` VARCHAR(14) NOT NULL,
  `reception_id` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_room1_idx` (`room_number` ASC),
  INDEX `fk_customer_reception1_idx` (`reception_id` ASC),
  CONSTRAINT `fk_customer_room1`
    FOREIGN KEY (`room_number`)
    REFERENCES `company`.`room` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_reception1`
    FOREIGN KEY (`reception_id`)
    REFERENCES `company`.`reception` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`work` (
  `hotel_id` VARCHAR(14) NOT NULL,
  `person_ssn` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`hotel_id`, `person_ssn`),
  INDEX `fk_hotel_has_person_person1_idx` (`person_ssn` ASC),
  INDEX `fk_hotel_has_person_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_hotel_has_person_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `company`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_person_person1`
    FOREIGN KEY (`person_ssn`)
    REFERENCES `company`.`person` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`own`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`own` (
  `room_number` VARCHAR(14) NOT NULL,
  `hotel_id` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`room_number`, `hotel_id`),
  INDEX `fk_room_has_hotel_hotel1_idx` (`hotel_id` ASC),
  INDEX `fk_room_has_hotel_room1_idx` (`room_number` ASC),
  CONSTRAINT `fk_room_has_hotel_room1`
    FOREIGN KEY (`room_number`)
    REFERENCES `company`.`room` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_has_hotel_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `company`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `company`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('123456789', 'cairo', 'male', 'mohamed');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('123456887', 'alex', 'male', 'ahmed');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('142566789', 'shobra', 'female', 'hager');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('123546781', 'giza', 'male', 'shady');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('897654301', 'cairo', 'female', 'yasmeen');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('987654321', 'monib', 'male', 'hossam');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('654321984', 'shobra masr', 'female', 'sandy');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('123986542', 'nasr city', 'female', 'roqia');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('987654312', 'monefia', 'male', 'mahmoud');
INSERT INTO `company`.`person` (`ssn`, `adrress`, `sex`, `name`) VALUES ('978654321', 'doky', 'female', 'sara');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`secratery`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`secratery` (`type_speed`, `person_ssn`) VALUES ('high', '897654301');
INSERT INTO `company`.`secratery` (`type_speed`, `person_ssn`) VALUES ('low', '987654321');
INSERT INTO `company`.`secratery` (`type_speed`, `person_ssn`) VALUES ('medium', '654321984');
INSERT INTO `company`.`secratery` (`type_speed`, `person_ssn`) VALUES ('low', '123986542');
INSERT INTO `company`.`secratery` (`type_speed`, `person_ssn`) VALUES ('medium', '987654312');
INSERT INTO `company`.`secratery` (`type_speed`, `person_ssn`) VALUES ('high', '978654321');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`manager`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`manager` (`manage`, `person_ssn`) VALUES ('ceo', '123456789');
INSERT INTO `company`.`manager` (`manage`, `person_ssn`) VALUES ('manage of rooms', '123456887');
INSERT INTO `company`.`manager` (`manage`, `person_ssn`) VALUES ('mange of servies  ', '142566789');
INSERT INTO `company`.`manager` (`manage`, `person_ssn`) VALUES ('manage of bussnies', '123546781');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`hotel` (`id`, `name`, `location`) VALUES ('1', 'hilton', 'alex');
INSERT INTO `company`.`hotel` (`id`, `name`, `location`) VALUES ('2', 'kempneski', 'cairo');
INSERT INTO `company`.`hotel` (`id`, `name`, `location`) VALUES ('3', 'season', 'sharm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`room`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`room` (`number`) VALUES ('12');
INSERT INTO `company`.`room` (`number`) VALUES ('2');
INSERT INTO `company`.`room` (`number`) VALUES ('125');
INSERT INTO `company`.`room` (`number`) VALUES ('10');
INSERT INTO `company`.`room` (`number`) VALUES ('4');
INSERT INTO `company`.`room` (`number`) VALUES ('5');
INSERT INTO `company`.`room` (`number`) VALUES ('8');
INSERT INTO `company`.`room` (`number`) VALUES ('9');
INSERT INTO `company`.`room` (`number`) VALUES ('189');
INSERT INTO `company`.`room` (`number`) VALUES ('90');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`reception`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('111', 'mohmaed', 'aly');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('112', 'ahmed', 'sima');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('113', 'ashraf', 'mohamed');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('115', 'mohamed', 'ibrahim');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('118', 'moemen', 'hossam');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('221', 'aly', 'mohamed');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('198', 'osama', 'yassen');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('152', 'alaa', 'abdalla');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('123', 'ibrahim', 'sayed');
INSERT INTO `company`.`reception` (`id`, `fname`, `lname`) VALUES ('132', 'gamal', 'mahmoud');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567891', '01158814259', 'info@medo_rec.com', 'ahmed', 'aly', '12', '111');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567890', '01158814268', 'info@gulf_rec.com', 'hassan', 'moharam', '2', '112');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567892', '01158814280', 'info@ipfgroup.net', 'mostafa', 'ahmed', '10', '113');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567893', '01224363464', 'info@sc.ae', 'mohamed', 'mohamed', '4', '115');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567894', '01113287766', 'info@mushrif.com', 'hossam', 'hassan', '5', '118');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567895', '01155824712', 'info@swisslinx.com', 'yara', 'hossam', '8', '221');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1239815786', '01153020117', 'info@brbmiersintl.com', 'ahmed', 'alaa', '9', '198');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567897', '01143728553', 'info@umegroup.net', 'shady', 'ahmed', '125', '152');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567898', '01145337298', 'info@prosearch.net', 'narmeen', 'hany', '189', '123');
INSERT INTO `company`.`customer` (`id`, `phone`, `email`, `fname`, `lname`, `room_number`, `reception_id`) VALUES ('1234567899', '01058814259', 'info@sultangroup.ae', 'hassan', 'mostafa', '90', '132');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`work`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('1', '123456887');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('2', '142566789');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('3', '123546781');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('2', '897654301');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('3', '987654321');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('1', '654321984');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('2', '123986542');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('3', '987654312');
INSERT INTO `company`.`work` (`hotel_id`, `person_ssn`) VALUES ('3', '978654321');

COMMIT;


-- -----------------------------------------------------
-- Data for table `company`.`own`
-- -----------------------------------------------------
START TRANSACTION;
USE `company`;
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('12', '1');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('2', '2');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('125', '3');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('10', '3');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('4', '1');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('5', '2');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('8', '1');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('9', '2');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('189', '2');
INSERT INTO `company`.`own` (`room_number`, `hotel_id`) VALUES ('90', '3');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
