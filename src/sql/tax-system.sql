SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `tax_system`;

CREATE DATABASE  IF NOT EXISTS `tax_system` DEFAULT CHARACTER SET utf8;
USE `tax_system`;


CREATE TABLE IF NOT EXISTS `user`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`login` VARCHAR(30) NOT NULL,
`password` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `inspector`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`user_inspector_id`INT(11) NOT NULL,
`name` VARCHAR (30) NOT NULL,
`surname` VARCHAR(30) NOT NULL,
`email` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`),
INDEX `FK_userInspectorID` (`user_inspector_id` ASC),
CONSTRAINT `FK_userInspectorID` FOREIGN KEY (`user_inspector_id`) REFERENCES `tax_system`.`user`(`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE table if not exists `taxpayer_type`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`type` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `taxpayer`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`user_id` INT(11) NOT NULL,
`taxpayer_type_id` INT(11) NOT NULL,
`inspector_id` INT(11) NOT NULL,
`name` VARCHAR (30) NOT NULL,
`surname` VARCHAR(30) NOT NULL,
`email` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`),
INDEX `FK_userID` (`user_id` ASC),
 INDEX `FK_taxpayerTypeId` (`taxpayer_type_id` ASC),  
  INDEX `FK_inspectorId` (`inspector_id` ASC),
  CONSTRAINT `FK_userID` FOREIGN KEY (`user_id`) REFERENCES `tax_system`.`user`(`id`),
  CONSTRAINT `FK_taxpayerTypeId`
    FOREIGN KEY (`taxpayer_type_id`)
    REFERENCES `tax_system`.`taxpayer_type` (`id`),
  CONSTRAINT `FK_inspectorId`
    FOREIGN KEY (`inspector_id`)
    REFERENCES `tax_system`.`inspector` (`user_inspector_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `taxreport_form`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`form` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `taxreport_type`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`type_number` VARCHAR(255) NOT NULL,
`type_name` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `taxreport_status`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`status` VARCHAR(30) NOT NULL,
PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `taxreport`(
`id` INT(11) NOT NULL AUTO_INCREMENT,
`taxpayer_id` INT(11) NOT NULL,
`taxpayer_inspector_id` INT(11) NOT NULL,
`form_id` INT(11) NOT NULL,
`type_id` INT(11) NOT NULL,
`status_id` INT(11) NOT NULL,
`message` VARCHAR(3000),
`date` TIMESTAMP NOT NULL,
PRIMARY KEY (`id`),
INDEX `FK_taxpayerId` (`taxpayer_id` ASC),
INDEX `FK_taxpayerInspectorId` (`taxpayer_inspector_id`ASC),
INDEX `FK_formId` (`form_id` ASC),
INDEX `FK_typeId` (`type_id` ASC),
INDEX `FK_statusId` (`status_id` ASC),
CONSTRAINT `FK_taxpayerId`
    FOREIGN KEY (`taxpayer_id`)
    REFERENCES `tax_system`.`taxpayer` (`user_id`),
CONSTRAINT `FK_taxpayerInspectorId`
    FOREIGN KEY (`taxpayer_inspector_id`)
    REFERENCES `tax_system`.`inspector` (`user_inspector_id`),
CONSTRAINT `FK_formId`
    FOREIGN KEY (`form_id`)
    REFERENCES `tax_system`.`taxreport_form` (`id`),
CONSTRAINT `FK_typeId`
    FOREIGN KEY (`type_id`)
    REFERENCES `tax_system`.`taxreport_type` (`id`),
CONSTRAINT `FK_statusId`
    FOREIGN KEY (`status_id`)
    REFERENCES `tax_system`.`taxreport_status` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Filling in table `tax_system`.`inspector`
-- -----------------------------------------------------

INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (1,'535248','qwerty1');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (2,'655624','ytrewq2');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (3,'86551624','qwerty8');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (4,'81234564','g54g54g');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (5,'89542315','645gvbe');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (6,'80123458','gergerg');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (7,'87564315','jhfjfer4');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (8,'81546452','577ybhfg');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (9,'86542156','ktuyj654');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (10,'82165754','878hferf');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (11,'89855421','bnnfgg4');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (12,'1023156462','qwerty8');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (13,'1065135131','ajfghjh');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (14,'1041234159','gdfge4');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (15,'1000215347','ahlghj');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (16,'1098594114','ght5578h');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (17,'1054654126','kghgt6r');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (18,'1012341564','5gdee');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (19,'1087564123','ujfgd');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (20,'1065421786','565gefg');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (21,'1096354141','45gfgd');
INSERT INTO `tax_system`.`user` (`id`,`login`,`password`) VALUES (22,'1012345646','756hfhre');

INSERT INTO `tax_system`.`inspector` (`id`,`user_inspector_id`,`name`,`surname`,`email`) VALUES (1, 1,'M.O.','Velichko','Velich@i.ua');
INSERT INTO `tax_system`.`inspector` (`id`,`user_inspector_id`,`name`,`surname`,`email`) VALUES (2, 2,'S.I.','Gigaryan','Gigar@i.ua');

-- -----------------------------------------------------
-- Filling in table `tax_system`.`taxpayer_type`
-- -----------------------------------------------------

INSERT INTO `tax_system`.`taxpayer_type` (`id`,`type`) VALUES (1,'legal entity'); 
INSERT INTO `tax_system`.`taxpayer_type` (`id`,`type`) VALUES (2,'individual'); 

-- -----------------------------------------------------
-- Filling in table `tax_system`.`taxpayer`
-- -----------------------------------------------------

INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (1,3,1,1,'K.I.','Boyko','BoykoLTD@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (2,4,1,2,'H.U.','Cheranev','Cheran@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (3,5,1,1,'K.O.','Yakhno','Yak@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (4,6,1,2,'J.N.','Sinica','Sinic@i.ua');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (5,7,1,1,'I.K.','Korchevoy','Korch6@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (6,8,1,2,'F.E.','Lastochkin','Lastochk@i.ua');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (7,9,1,1,'T.I.','Arsentjev','ARS@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (8,10,1,2,'V.K.','Golybev','golyb@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (9,11,1,1,'D.T.','Bukova','Bukov@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (10,12,1,2,'K.O.','Tarabanchyk','Taraban@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (11,13,2,1,'I.K.','Deev','deeev@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (12,14,2,2,'E.T.','Orlov','orlov@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (13,15,2,1,'P.I.','Kibalenko','Kibalchish@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (14,16,2,2,'L.I.','Galeckaya','Gal@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (15,17,2,1,'E.L.','Marinchenko','Marin@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (16,18,2,2,'K.L.','Palchuk','Palch@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (17,19,2,1,'G.O.','Kitugin','Kit@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (18,20,2,2,'K.G.','Gorovoy','Gor@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (19,21,2,1,'O.L.','Anischenko','Anisch@gmail.com');
INSERT INTO `tax_system`.`taxpayer` (`id`,`user_id`,`taxpayer_type_id`,`inspector_id`,`name`,`surname`,`email`) VALUES (20,22,2,2,'P.P.','Chumak','Chumak@gmail.com');

-- -----------------------------------------------------
-- Filling in table `tax_system`.`taxreport_form`
-- -----------------------------------------------------

INSERT INTO `tax_system`.`taxreport_form` (`id`,`form`) VALUES (1,'legal entity');
INSERT INTO `tax_system`.`taxreport_form` (`id`,`form`) VALUES (2,'individual');

-- -----------------------------------------------------
-- Filling in table `tax_system`.`taxreport_type`
-- -----------------------------------------------------

INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (1,'L_Corporate income tax return №897)','Corporate Income Tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (2,'I_№1 DF)','personal income tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (3,'L_value added tax return)','value added tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (4,'I_value added tax return)','value added tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (5,'I_excise tax return)','excise tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (6,'L_excise tax return)','excise tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (7,'I_environmental tax return)','environmental tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (8,'L_environmental tax return)','environmental tax');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (9,'L_rent for the use of the radio frequency resource of Ukraine return)','rent for the use of the radio frequency resource of Ukraine');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (10,'I_rent for the use of the radio frequency resource of Ukraine return)','rent for the use of the radio frequency resource of Ukraine');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (11,'L_rent for special water use return)','rent for special water use');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (12,'I_rent for special water use return)','rent for special water use');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (13,'L_rent for special use of forest resources return)','rent for special use of forest resources');
INSERT INTO `tax_system`.`taxreport_type` (`id`,`type_number`,`type_name`) VALUES (14,'I_rent for special use of forest resources return)','rent for special use of forest resources');

-- -----------------------------------------------------
-- Filling in table `tax_system`.`taxreport_status`
-- -----------------------------------------------------

INSERT INTO `tax_system`.`taxreport_status` (`id`,`status`) VALUES (1,'Created');
INSERT INTO `tax_system`.`taxreport_status` (`id`,`status`) VALUES (2,'On consideration');
INSERT INTO `tax_system`.`taxreport_status` (`id`,`status`) VALUES (3,'Edited');
INSERT INTO `tax_system`.`taxreport_status` (`id`,`status`) VALUES (4,'Rejected');
INSERT INTO `tax_system`.`taxreport_status` (`id`,`status`) VALUES (5,'Approved');

-- -----------------------------------------------------
-- Filling in table `tax_system`.`taxreport`
-- -----------------------------------------------------
	
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (1,1,1,1,1,1,NULL,'2019-06-04 08:00:52');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (2,1,1,3,1,2,NULL,'2019-06-04 09:20:13');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (3,1,1,6,1,3,'change smth','2019-06-04 10:10:02');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (4,1,1,8,1,4,'too late','2019-06-04 12:00:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (5,1,1,9,1,2,NULL,'2019-06-04 12:45:54');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (6,1,1,11,1,5,NULL,'2019-06-05 15:10:30');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (7,1,1,13,1,5,NULL,'2019-06-06 15:35:21');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (8,1,2,6,1,1,NULL,'2019-06-07 21:21:32');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (9,2,2,1,1,1,NULL,'2019-06-07 22:20:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (10,2,2,3,1,1,NULL,'2019-06-08 09:02:00');

INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (11,2,2,6,1,2,NULL,'2019-06-08 09:22:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (12,2,2,8,1,1,NULL,'2019-06-08 12:20:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (13,3,1,1,1,5,NULL,'2019-06-09 22:05:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (14,3,1,8,1,4,'everything wrong','2019-06-10 12:20:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (15,3,1,8,1,2,NULL,'2019-06-10 13:10:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (16,4,2,11,1,2,NULL,'2019-06-10 15:10:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (17,4,2,13,1,3,'edit name','2019-06-11 02:14:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (18,4,2,1,1,5,NULL,'2019-06-11 12:52:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (19,4,2,6,1,1,NULL,'2019-06-11 16:10:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (20,5,1,3,1,2,NULL,'2019-06-11 17:30:00');

INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (21,5,1,11,1,5,NULL,'2019-06-12 12:00:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (22,5,1,8,1,1,NULL,'2019-06-12 14:02:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (23,11,1,2,2,2,NULL,'2019-06-13 10:02:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (24,11,1,4,2,3,'change smth','2019-06-14 08:02:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (25,11,1,5,2,5,NULL,'2019-06-14 12:02:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (26,11,1,7,2,4,NULL,'2019-06-14 12:20:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (27,12,2,10,2,4,NULL,'2019-06-14 13:21:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (28,12,2,12,2,5,NULL,'2019-06-14 14:10:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (29,12,2,14,2,1,NULL,'2019-06-14 14:21:00');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (30,13,1,2,2,5,NULL,'2019-06-14 15:00:20');

INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (31,13,1,12,2,5,NULL,'2019-06-14 15:02:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (32,13,1,4,2,3,'WTF???','2019-06-14 15:05:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (33,13,1,7,2,2,NULL,'2019-06-14 15:10:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (34,13,1,10,2,2,NULL,'2019-06-14 15:12:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (35,13,1,12,2,2,NULL,'2019-06-14 15:14:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (36,13,1,14,2,2,NULL,'2019-06-14 15:25:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (37,13,1,4,2,4,NULL,'2019-06-14 15:27:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (38,13,1,10,2,5,NULL,'2019-06-14 15:29:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (39,13,1,14,2,5,NULL,'2019-06-14 15:34:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (40,13,1,7,2,4,NULL,'2019-06-14 15:39:20');

INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (41,13,1,5,2,2,NULL,'2019-06-14 15:41:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (42,13,2,2,2,4,NULL,'2019-06-15 08:46:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (43,13,2,4,2,4,NULL,'2019-06-15 09:00:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (44,13,2,7,2,4,NULL,'2019-06-15 09:40:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (45,13,2,10,2,4,NULL,'2019-06-15 09:55:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (46,13,2,12,2,4,NULL,'2019-06-15 10:00:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (47,13,2,14,2,4,NULL,'2019-06-15 10:01:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (48,13,1,2,2,1,NULL,'2019-06-15 11:05:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (49,13,1,4,2,1,NULL,'2019-06-15 11:12:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (50,13,1,7,2,1,NULL,'2019-06-15 11:30:20');

INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (51,13,1,10,2,1,NULL,'2019-06-15 12:00:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (52,13,1,12,2,1,NULL,'2019-06-15 12:20:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (53,13,1,14,2,1,NULL,'2019-06-15 12:32:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (54,13,1,4,2,5,NULL,'2019-06-15 13:04:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (55,13,1,4,2,5,NULL,'2019-06-15 13:07:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (56,13,1,7,2,5,NULL,'2019-06-15 13:10:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (57,13,1,2,2,5,NULL,'2019-06-15 13:12:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (58,13,1,10,2,5,NULL,'2019-06-15 14:24:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (59,13,1,14,2,5,NULL,'2019-06-15 15:02:20');
INSERT INTO `tax_system`.`taxreport` (`id`,`taxpayer_id`,`taxpayer_inspector_id`,`form_id`,`type_id`,`status_id`,`message`,`date`) VALUES (60,13,1,12,2,5,NULL,'2019-06-15 15:10:20');




