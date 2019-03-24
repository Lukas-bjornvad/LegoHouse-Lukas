create schema legohouse;

CREATE TABLE `legohouse`.`users` (
  `userid` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` tinyint(1)NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`));

CREATE TABLE `legohouse`.`orders` (
  `orderid` INT(11) NOT NULL AUTO_INCREMENT,
  `details` VARCHAR(45) NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
 `sent` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderid`),
 CONSTRAINT `useridFK`
  FOREIGN KEY (`userid`)
  REFERENCES `legohouse`.`users` (`userid`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);

Insert into users (password, email, role)values('admin', 'admin@mail.com', 1);