-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "authors" --------------------------------------
CREATE TABLE `authors` ( 
	`author_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`author_name_id` Int( 11 ) NOT NULL,
	`author_surname_id` Int( 11 ) NULL,
	PRIMARY KEY ( `author_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- -------------------------------------------------------------


-- CREATE TABLE "book" -----------------------------------------
CREATE TABLE `book` ( 
	`book_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`book_title` VarChar( 250 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`book_isbn` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`book_publisher_id` Int( 11 ) NOT NULL,
	`change_date` DateTime NULL,
	PRIMARY KEY ( `book_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 6;
-- -------------------------------------------------------------


-- CREATE TABLE "book_author" ----------------------------------
CREATE TABLE `book_author` ( 
	`ba_book_id` Int( 11 ) NOT NULL,
	`ba_author_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `ba_book_id`, `ba_author_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "book_copy" ------------------------------------
CREATE TABLE `book_copy` ( 
	`bc_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`bc_book_id` Int( 11 ) NOT NULL,
	`bc_library_number` Int( 11 ) NOT NULL,
	`bc_book_status` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `bc_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- -------------------------------------------------------------


-- CREATE TABLE "book_description" -----------------------------
CREATE TABLE `book_description` ( 
	`bd_book_id` Int( 11 ) NOT NULL,
	`bd_book_description` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`change_date` DateTime NULL,
	PRIMARY KEY ( `bd_book_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "book_history" ---------------------------------
CREATE TABLE `book_history` ( 
	`book_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`book_title` VarChar( 250 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`book_isbn` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`book_publisher_id` Int( 11 ) NOT NULL,
	`change_date` DateTime NULL,
	`updated_book` Int( 11 ) NULL,
	PRIMARY KEY ( `book_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- CREATE TABLE "book_status" ----------------------------------
CREATE TABLE `book_status` ( 
	`bs_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`bs_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY ( `bs_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- CREATE TABLE "category" -------------------------------------
CREATE TABLE `category` ( 
	`category_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`category_name` VarChar( 30 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`category_parent_id` Int( 11 ) NULL,
	PRIMARY KEY ( `category_id` ),
	CONSTRAINT `category_name` UNIQUE( `category_name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- -------------------------------------------------------------


-- CREATE TABLE "category_book" --------------------------------
CREATE TABLE `category_book` ( 
	`cb_book_id` Int( 11 ) NOT NULL,
	`cb_category_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `cb_book_id`, `cb_category_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "person_name" ----------------------------------
CREATE TABLE `person_name` ( 
	`pn_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`pn_name` VarChar( 30 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY ( `pn_id` ),
	CONSTRAINT `pn_name` UNIQUE( `pn_name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 13;
-- -------------------------------------------------------------


-- CREATE TABLE "person_surname" -------------------------------
CREATE TABLE `person_surname` ( 
	`ps_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`ps_surname` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY ( `ps_id` ),
	CONSTRAINT `pn_surname` UNIQUE( `ps_surname` ),
	CONSTRAINT `ps_id` UNIQUE( `ps_id` ),
	CONSTRAINT `ps_surname` UNIQUE( `ps_surname` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 13;
-- -------------------------------------------------------------


-- CREATE TABLE "publisher" ------------------------------------
CREATE TABLE `publisher` ( 
	`publisher_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`publisher_name` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY ( `publisher_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
-- -------------------------------------------------------------


-- CREATE TABLE "rent_history" ---------------------------------
CREATE TABLE `rent_history` ( 
	`rh_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`rh_user_id` Int( 11 ) NOT NULL,
	`rh_book_copy_id` Int( 11 ) NOT NULL,
	`rh_rent_date` DateTime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`rh_return_date` DateTime NULL,
	PRIMARY KEY ( `rh_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users` ( 
	`user_id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_name` VarChar( 30 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`user_name_id` Int( 11 ) NOT NULL,
	`user_surname_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `user_id` ),
	CONSTRAINT `user_name` UNIQUE( `user_name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 14;
-- -------------------------------------------------------------


-- Dump data of "authors" ----------------------------------
INSERT INTO `authors`(`author_id`,`author_name_id`,`author_surname_id`) VALUES 
( '1', '5', '1' ),
( '2', '6', '2' ),
( '3', '6', '3' ),
( '4', '7', '4' ),
( '5', '8', '8' );
-- ---------------------------------------------------------


-- Dump data of "book" -------------------------------------
INSERT INTO `book`(`book_id`,`book_title`,`book_isbn`,`book_publisher_id`,`change_date`) VALUES 
( '1', 'Ciekawa ksiazka1', '9830985asd', '2', '2018-11-07 10:15:23' ),
( '2', 'Ciekawa ksiazka2', '808592401l', '1', '2018-11-07 10:49:17' ),
( '3', 'Kolejna ksiazka3', 'k10940klk234412', '1', NULL ),
( '4', 'Ciekawa ksiazka4', '122342ww34679', '2', NULL ),
( '5', 'Ciekawa ksiazka5', '12234244kk079', '3', NULL );
-- ---------------------------------------------------------


-- Dump data of "book_author" ------------------------------
INSERT INTO `book_author`(`ba_book_id`,`ba_author_id`) VALUES 
( '1', '1' ),
( '1', '2' ),
( '2', '4' ),
( '3', '1' ),
( '3', '4' ),
( '4', '3' ),
( '5', '4' );
-- ---------------------------------------------------------


-- Dump data of "book_copy" --------------------------------
INSERT INTO `book_copy`(`bc_id`,`bc_book_id`,`bc_library_number`,`bc_book_status`) VALUES 
( '3', '1', '12345', '1' ),
( '4', '1', '12346', '2' ),
( '5', '1', '12347', '1' ),
( '6', '2', '234567', '1' ),
( '7', '2', '234568', '1' ),
( '8', '3', '345678', '3' ),
( '9', '3', '345679', '1' ),
( '10', '4', '456789', '3' ),
( '11', '4', '456780', '1' ),
( '12', '5', '567890', '1' ),
( '13', '5', '567891', '3' );
-- ---------------------------------------------------------


-- Dump data of "book_description" -------------------------
INSERT INTO `book_description`(`bd_book_id`,`bd_book_description`,`change_date`) VALUES 
( '1', 'jakis nowy opis', '2018-11-07 09:59:55' ),
( '2', 'jakis opis drugi', NULL ),
( '3', 'Jakis inny opis poprawiony nastepny', NULL ),
( '4', 'kolejny opis', NULL ),
( '5', 'nastepny opis', NULL );
-- ---------------------------------------------------------


-- Dump data of "book_history" -----------------------------
INSERT INTO `book_history`(`book_id`,`book_title`,`book_isbn`,`book_publisher_id`,`change_date`,`updated_book`) VALUES 
( '1', 'Ciekawa ksiazka2', 'klajs0-239832232', '1', '2018-11-07 10:49:17', '2' );
-- ---------------------------------------------------------


-- Dump data of "book_status" ------------------------------
INSERT INTO `book_status`(`bs_id`,`bs_name`) VALUES 
( '1', 'Dostępna' ),
( '2', 'Zarezerwowana' ),
( '3', 'Wypożyczona' );
-- ---------------------------------------------------------


-- Dump data of "category" ---------------------------------
INSERT INTO `category`(`category_id`,`category_name`,`category_parent_id`) VALUES 
( '1', 'Dramat', NULL ),
( '2', 'Historyczny', NULL ),
( '3', 'Romans', NULL ),
( '4', 'Fantastyka', NULL ),
( '5', 'Horror', NULL ),
( '6', 'Kryminał', NULL );
-- ---------------------------------------------------------


-- Dump data of "category_book" ----------------------------
-- ---------------------------------------------------------


-- Dump data of "person_name" ------------------------------
INSERT INTO `person_name`(`pn_id`,`pn_name`) VALUES 
( '11', 'Adam' ),
( '6', 'Andrzej' ),
( '8', 'Anna' ),
( '5', 'Jaroslaw' ),
( '7', 'Maja Lidia' ),
( '9', 'Maria' ),
( '10', 'Weronika' ),
( '12', 'Wojciech' );
-- ---------------------------------------------------------


-- Dump data of "person_surname" ---------------------------
INSERT INTO `person_surname`(`ps_id`,`ps_surname`) VALUES 
( '1', 'Grzedowicz' ),
( '10', 'Jacaszek' ),
( '4', 'Kossakowska' ),
( '8', 'Kowalska' ),
( '11', 'Moreski' ),
( '9', 'Nowak' ),
( '3', 'Pilipiuk' ),
( '2', 'Sapkowski' ),
( '12', 'Ździebor' );
-- ---------------------------------------------------------


-- Dump data of "publisher" --------------------------------
INSERT INTO `publisher`(`publisher_id`,`publisher_name`) VALUES 
( '1', 'czarne' ),
( '2', 'Fabryka Slow' ),
( '3', 'PWN' );
-- ---------------------------------------------------------


-- Dump data of "rent_history" -----------------------------
INSERT INTO `rent_history`(`rh_id`,`rh_user_id`,`rh_book_copy_id`,`rh_rent_date`,`rh_return_date`) VALUES 
( '3', '6', '3', '2018-11-07 14:27:58', '2018-11-07 14:53:04' ),
( '4', '8', '5', '2018-11-07 14:28:47', '2018-11-07 14:55:31' );
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
INSERT INTO `users`(`user_id`,`user_name`,`user_name_id`,`user_surname_id`) VALUES 
( '6', 'ktos', '5', '3' ),
( '7', 'drugiktos', '6', '1' ),
( '8', 'trzeciktos', '7', '2' ),
( '9', 'czwartyktos', '8', '4' ),
( '12', 'piatyktos', '6', '1' ),
( '13', 'szostyktos', '11', '8' );
-- ---------------------------------------------------------


-- CREATE INDEX "author_name_id" -------------------------------
CREATE INDEX `author_name_id` USING BTREE ON `authors`( `author_name_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "author_surname_id" ----------------------------
CREATE INDEX `author_surname_id` USING BTREE ON `authors`( `author_surname_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "book_publisher_id" ----------------------------
CREATE INDEX `book_publisher_id` USING BTREE ON `book`( `book_publisher_id` );
-- -------------------------------------------------------------



delimiter $$$ 
-- CREATE TRIGGER "trg_book_before_update" ---------------------
CREATE DEFINER=`vwandalka`@`%` trigger trg_book_before_update
before update on book for each row
begin
insert book_history (book_title, book_isbn, book_publisher_id, updated_book, change_date)
values (old.book_title, old.book_isbn, old.book_publisher_id, old.book_id, now());
set NEW.change_date = now();
end;
-- -------------------------------------------------------------

$$$ delimiter ;


-- CREATE INDEX "ba_author_id" ---------------------------------
CREATE INDEX `ba_author_id` USING BTREE ON `book_author`( `ba_author_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "bc_book_id" -----------------------------------
CREATE INDEX `bc_book_id` USING BTREE ON `book_copy`( `bc_book_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "bc_book_status" -------------------------------
CREATE INDEX `bc_book_status` USING BTREE ON `book_copy`( `bc_book_status` );
-- -------------------------------------------------------------



delimiter $$$ 
-- CREATE TRIGGER "trg_book_description_before_update" ---------
CREATE DEFINER=`vwandalka`@`%` trigger trg_book_description_before_update
before update on book_description for each row
set NEW.change_date = now();
-- -------------------------------------------------------------

$$$ delimiter ;


-- CREATE INDEX "book_publisher_id" ----------------------------
CREATE INDEX `book_publisher_id` USING BTREE ON `book_history`( `book_publisher_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "updated_book" ---------------------------------
CREATE INDEX `updated_book` USING BTREE ON `book_history`( `updated_book` );
-- -------------------------------------------------------------


-- CREATE INDEX "category_parent_id" ---------------------------
CREATE INDEX `category_parent_id` USING BTREE ON `category`( `category_parent_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "cb_category_id" -------------------------------
CREATE INDEX `cb_category_id` USING BTREE ON `category_book`( `cb_category_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "rh_book_copy_id" ------------------------------
CREATE INDEX `rh_book_copy_id` USING BTREE ON `rent_history`( `rh_book_copy_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "rh_user_id" -----------------------------------
CREATE INDEX `rh_user_id` USING BTREE ON `rent_history`( `rh_user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_name_id" ---------------------------------
CREATE INDEX `user_name_id` USING BTREE ON `users`( `user_name_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "user_surname_id" ------------------------------
CREATE INDEX `user_surname_id` USING BTREE ON `users`( `user_surname_id` );
-- -------------------------------------------------------------


-- CREATE LINK "authors_ibfk_1" --------------------------------
ALTER TABLE `authors`
	ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY ( `author_name_id` )
	REFERENCES `person_name`( `pn_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "authors_ibfk_2" --------------------------------
ALTER TABLE `authors`
	ADD CONSTRAINT `authors_ibfk_2` FOREIGN KEY ( `author_name_id` )
	REFERENCES `person_name`( `pn_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "authors_ibfk_3" --------------------------------
ALTER TABLE `authors`
	ADD CONSTRAINT `authors_ibfk_3` FOREIGN KEY ( `author_surname_id` )
	REFERENCES `person_surname`( `ps_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_ibfk_1" -----------------------------------
ALTER TABLE `book`
	ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY ( `book_publisher_id` )
	REFERENCES `publisher`( `publisher_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_author_ibfk_1" ----------------------------
ALTER TABLE `book_author`
	ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY ( `ba_book_id` )
	REFERENCES `book`( `book_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_author_ibfk_2" ----------------------------
ALTER TABLE `book_author`
	ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY ( `ba_author_id` )
	REFERENCES `authors`( `author_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_copy_ibfk_1" ------------------------------
ALTER TABLE `book_copy`
	ADD CONSTRAINT `book_copy_ibfk_1` FOREIGN KEY ( `bc_book_id` )
	REFERENCES `book`( `book_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_copy_ibfk_2" ------------------------------
ALTER TABLE `book_copy`
	ADD CONSTRAINT `book_copy_ibfk_2` FOREIGN KEY ( `bc_book_status` )
	REFERENCES `book_status`( `bs_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_description_ibfk_1" -----------------------
ALTER TABLE `book_description`
	ADD CONSTRAINT `book_description_ibfk_1` FOREIGN KEY ( `bd_book_id` )
	REFERENCES `book`( `book_id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "book_history_ibfk_1" ---------------------------
ALTER TABLE `book_history`
	ADD CONSTRAINT `book_history_ibfk_1` FOREIGN KEY ( `updated_book` )
	REFERENCES `book`( `book_id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "category_ibfk_1" -------------------------------
ALTER TABLE `category`
	ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY ( `category_parent_id` )
	REFERENCES `category`( `category_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "category_book_ibfk_1" --------------------------
ALTER TABLE `category_book`
	ADD CONSTRAINT `category_book_ibfk_1` FOREIGN KEY ( `cb_book_id` )
	REFERENCES `book`( `book_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "category_book_ibfk_2" --------------------------
ALTER TABLE `category_book`
	ADD CONSTRAINT `category_book_ibfk_2` FOREIGN KEY ( `cb_category_id` )
	REFERENCES `category`( `category_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "rent_history_ibfk_1" ---------------------------
ALTER TABLE `rent_history`
	ADD CONSTRAINT `rent_history_ibfk_1` FOREIGN KEY ( `rh_book_copy_id` )
	REFERENCES `book_copy`( `bc_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "rent_history_ibfk_2" ---------------------------
ALTER TABLE `rent_history`
	ADD CONSTRAINT `rent_history_ibfk_2` FOREIGN KEY ( `rh_user_id` )
	REFERENCES `users`( `user_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "users_ibfk_1" ----------------------------------
ALTER TABLE `users`
	ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY ( `user_name_id` )
	REFERENCES `person_name`( `pn_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------


-- CREATE LINK "users_ibfk_2" ----------------------------------
ALTER TABLE `users`
	ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY ( `user_surname_id` )
	REFERENCES `person_surname`( `ps_id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- -------------------------------------------------------------



delimiter $$$ 
-- CREATE FUNCTION "f_insert_person_name" ----------------------
CREATE DEFINER=`vwandalka`@`%` FUNCTION `f_insert_person_name`(personName varchar(30) ) RETURNS int(11)
begin
    insert ignore into person_name(pn_name) values(personName);
    return (select pn_id from person_name where pn_name = personName);
end;
-- -------------------------------------------------------------

$$$ delimiter ;



delimiter $$$ 
-- CREATE FUNCTION "f_insert_person_surname" -------------------
CREATE DEFINER=`vwandalka`@`%` FUNCTION `f_insert_person_surname`(personSurname varchar(150) ) RETURNS int(11)
begin
    insert ignore into person_surname(ps_surname) values(personSurname);
    return (select ps_id from person_surname where ps_surname = personSurname);
end;
-- -------------------------------------------------------------

$$$ delimiter ;



delimiter $$$ 
-- CREATE FUNCTION "f_rent_a_book" -----------------------------
CREATE DEFINER=`vwandalka`@`%` FUNCTION `f_rent_a_book`(userId int, bookCopy int) RETURNS tinyint(1)
begin 
    select bc_book_status into @bookStatus from book_copy where bc_id = bookCopy;
    if (@bookStatus > 1) then
        return false;
    end if;
    
    insert rent_history (rh_book_copy_id, rh_user_id)
    values (bookCopy, userId);
    update book_copy set bc_book_status = 3 where bc_id = bookCopy;
    return true;
end;
-- -------------------------------------------------------------

$$$ delimiter ;



delimiter $$$ 
-- CREATE FUNCTION "f_return_a_book" ---------------------------
CREATE DEFINER=`vwandalka`@`%` FUNCTION `f_return_a_book`(bookCopy int) RETURNS tinyint(1)
begin
    if (select bc_id from book_copy where bc_id = bookCopy) is null then
        return false;
    end if; 
    select bc_book_status into @bookStatus from book_copy where bc_id = bookCopy;
    if (@bookStatus < 3) then
        return false;
    end if;
        update book_copy set bc_book_status = 1 where bc_id = bookCopy;
        update rent_history set rh_return_date = now() where rh_book_copy_id = bookCopy and rh_return_date is null;
        return true;
end;
-- -------------------------------------------------------------

$$$ delimiter ;


-- CREATE VIEW "v_authors" -------------------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `vwandalka`@`%` SQL SECURITY DEFINER VIEW `v_authors`
AS select `gup5`.`authors`.`author_id` AS `author_id`,`gup5`.`person_name`.`pn_name` AS `author_name`,`gup5`.`person_surname`.`ps_surname` AS `author_surname` from ((`gup5`.`authors` join `gup5`.`person_name` on((`gup5`.`authors`.`author_name_id` = `gup5`.`person_name`.`pn_id`))) join `gup5`.`person_surname` on((`gup5`.`authors`.`author_surname_id` = `gup5`.`person_surname`.`ps_id`)));
-- -------------------------------------------------------------


-- CREATE VIEW "v_books" ---------------------------------------
CREATE ALGORITHM = UNDEFINED DEFINER = `vwandalka`@`%` SQL SECURITY DEFINER VIEW `v_books`
AS select `gup5`.`book`.`book_title` AS `book_title`,`gup5`.`publisher`.`publisher_name` AS `publisher_name`,`gup5`.`book_description`.`bd_book_description` AS `bd_book_description` from ((`gup5`.`book` join `gup5`.`publisher` on((`gup5`.`book`.`book_publisher_id` = `gup5`.`publisher`.`publisher_id`))) join `gup5`.`book_description` on((`gup5`.`book`.`book_id` = `gup5`.`book_description`.`bd_book_id`)));
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


