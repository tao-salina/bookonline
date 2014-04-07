
CREATE USER 'studentDbUser'@'localhost' IDENTIFIED BY 'spring';
GRANT ALL PRIVILEGES ON studentdb.* TO 'studentDbUser'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'studentDbUser'@'localhost';



CREATE SCHEMA IF NOT EXISTS `studentdb` ;
USE `studentdb` ;
DROP TABLE IF EXISTS `studentdb`.`student`;

CREATE  TABLE IF NOT EXISTS `studentdb`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `lastName` VARCHAR(45) NOT NULL ,
  `age` INT ZEROFILL NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) );
  

  
  
