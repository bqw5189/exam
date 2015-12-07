--<ScriptOptions statementTerminator=";"/>
create user 'exam'@'127.0.0.1' identified by 'exam';
create database if not exists exam default character set utf8 collate utf8_unicode_ci;



--ALTER TABLE `database`.`t_te_question_exampaper` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_exam_result` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_exam_paper_result` DROP PRIMARY KEY;

--ALTER TABLE `database`.`ss_user` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_project` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_exam_question` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_select_items` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_course` DROP PRIMARY KEY;

--ALTER TABLE `database`.`ss_task` DROP PRIMARY KEY;

--ALTER TABLE `database`.`t_te_make_exam` DROP PRIMARY KEY;

--ALTER TABLE `database`.`ss_user` DROP INDEX `database`.`login_name`;

--DROP TABLE `database`.`t_te_question_exampaper`;

--DROP TABLE `database`.`t_te_exam_question`;

--DROP TABLE `database`.`ss_task`;

--DROP TABLE `database`.`t_te_exam_result`;

--DROP TABLE `database`.`t_te_exam_paper_result`;

--DROP TABLE `database`.`t_te_make_exam`;

--DROP TABLE `database`.`t_te_course`;

--DROP TABLE `database`.`ss_user`;

--DROP TABLE `database`.`t_te_project`;

--DROP TABLE `database`.`t_te_select_items`;
create table ss_class(
	id bigint not null auto_increment,
	class_name varchar(50),
	class_remark varchar(80),
	PRIMARY KEY (`id`)
)ENGINE=InnoDB;
alter table ss_user add column class_id BIGINT NOT NULL;
update ss_user set class_id = '2014届数控系01班' where roles='student';
CREATE TABLE `database`.`ss_user` (
	`id` BIGINT NOT NULL auto_increment,
	class_id bigint not null,
	`login_name` VARCHAR(64) NOT NULL,
	`name` VARCHAR(64) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`salt` VARCHAR(64) NOT NULL,
	`roles` VARCHAR(255) NOT NULL,
	`register_date` TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;
CREATE TABLE `database`.`t_te_question_exampaper` (
	`id` BIGINT NOT NULL,
	`exampaper_id` BIGINT NOT NULL,
	`question_id` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_exam_question` (
	`id` BIGINT NOT NULL,
	`type` INT,
	`question_cont` VARCHAR(200),
	`question_answer_id` VARCHAR(3000),
	`question_score` DOUBLE NOT NULL,
	`project_id` BIGINT NOT NULL,
	`state` INT DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`ss_task` (
	`id` BIGINT NOT NULL,
	`title` VARCHAR(128) NOT NULL,
	`description` VARCHAR(255),
	`user_id` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_exam_result` (
	`id` BIGINT NOT NULL,
	`person_id` BIGINT,
	`depd_id` BIGINT,
	`exam_question_id` BIGINT,
	`choose_question_id` VARCHAR(2000),
	`question_answer` VARCHAR(2000),
	`person_name` VARCHAR(50),
	`question_score` DOUBLE,
	`state` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_exam_paper_result` (
	`id` BIGINT NOT NULL,
	`exam_name` VARCHAR(200),
	`exam_id` BIGINT,
	`exam_remark` VARCHAR(500),
	`person_name` VARCHAR(50),
	`person_id` BIGINT,
	`sum_score` DOUBLE,
	`exam_order` INT,
	`state` INT,
	`exam_code` BIGINT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_make_exam` (
	`id` BIGINT NOT NULL,
	`exam_name` VARCHAR(200) NOT NULL,
	`exam_remark` VARCHAR(500),
	`exam_time` INT NOT NULL,
	`project_id` BIGINT NOT NULL,
	`state` INT,
	`exam_begin_date` TIMESTAMP,
	`exam_end_date` TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_course` (
	`id` BIGINT NOT NULL,
	`course_name` VARCHAR(200) NOT NULL,
	`remark` VARCHAR(500),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`ss_user` (
	`id` BIGINT NOT NULL,
	`login_name` VARCHAR(64) NOT NULL,
	`name` VARCHAR(64) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`salt` VARCHAR(64) NOT NULL,
	`roles` VARCHAR(255) NOT NULL,
	`register_date` TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_project` (
	`id` BIGINT NOT NULL,
	`depd_id` BIGINT NOT NULL,
	`project_name` VARCHAR(200) NOT NULL,
	`remark` VARCHAR(500),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `database`.`t_te_select_items` (
	`id` BIGINT NOT NULL,
	`depd_id` BIGINT,
	`select_cont` VARCHAR(500),
	`is_answer` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE UNIQUE INDEX `login_name` ON `database`.`ss_user` (`login_name` ASC);
ALTER TABLE `t_te_exam_question` ADD INDEX index_t_te_exam_question ( `project_id` )；
ALTER TABLE `t_te_make_exam` ADD INDEX index_t_te_make_exam ( `project_id` )；
ALTER TABLE `t_te_exam_paper_result` ADD INDEX index_t_te_exam_paper_result ( `exam_id` )；