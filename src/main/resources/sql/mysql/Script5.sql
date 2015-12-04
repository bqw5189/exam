--<ScriptOptions statementTerminator=";"/>

ALTER TABLE  `ss_user` DROP PRIMARY KEY;

ALTER TABLE  `ss_task` DROP PRIMARY KEY;

ALTER TABLE  `t_te_select_items` DROP PRIMARY KEY;

ALTER TABLE  `t_te_project` DROP PRIMARY KEY;

ALTER TABLE  `t_te_exam_result` DROP PRIMARY KEY;

ALTER TABLE  `t_te_make_exam` DROP PRIMARY KEY;

ALTER TABLE  `t_te_course` DROP PRIMARY KEY;

ALTER TABLE  `t_te_question_exampaper` DROP PRIMARY KEY;

ALTER TABLE  `t_te_exam_paper_result` DROP PRIMARY KEY;

ALTER TABLE  `t_te_exam_question` DROP PRIMARY KEY;

ALTER TABLE  `ss_user` DROP INDEX  `login_name`;

DROP TABLE  `ss_task`;


DROP TABLE  `t_te_project`;

DROP TABLE  `t_te_course`;
DROP TABLE  `ss_user`;



delete from   `t_te_make_exam`;
delete from   `t_te_exam_result`;


delete from   `t_te_select_items`;

delete from   `t_te_question_exampaper`;

delete from   `t_te_exam_question`;

delete from   `t_te_exam_paper_result`;


alter table t_te_exam_result change ALBUM_ID ALBUM_ID bigint not null auto_increment;
alter table album auto_increment=1;
alter table t_te_exam_result change id id int primary key auto_increment;

alter table ss_user change id id bigint auto_increment;

CREATE TABLE  `t_te_exam_result` (
	`id` BIGINT auto_increment,
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

CREATE TABLE  `t_te_project` (
	`id` BIGINT auto_increment,
	`depd_id` BIGINT NOT NULL,
	`project_name` VARCHAR(200) NOT NULL,
	`remark` VARCHAR(500),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `t_te_course` (
	`id` BIGINT auto_increment,
	`course_name` VARCHAR(200) NOT NULL,
	`remark` VARCHAR(500),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `t_te_make_exam` (
	`id` BIGINT auto_increment,
	`exam_name` VARCHAR(200) NOT NULL,
	`exam_remark` VARCHAR(500),
	`exam_time` INT NOT NULL,
	`project_id` BIGINT NOT NULL,
	`state` INT,
	`exam_begin_date` TIMESTAMP,
	`exam_end_date` TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `ss_user` (
	`id` BIGINT auto_increment,
	`login_name` VARCHAR(64) NOT NULL,
	`name` VARCHAR(64) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`salt` VARCHAR(64) NOT NULL,
	`roles` VARCHAR(255) NOT NULL,
	`register_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `t_te_select_items` (
	`id` BIGINT auto_increment,
	`depd_id` BIGINT,
	`select_cont` VARCHAR(500),
	`is_answer` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `t_te_question_exampaper` (
	`id` BIGINT auto_increment,
	`exampaper_id` BIGINT NOT NULL,
	`question_id` BIGINT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `t_te_exam_question` (
	`id` BIGINT auto_increment,
	`type` INT,
	`question_cont` VARCHAR(200),
	`question_answer_id` VARCHAR(3000),
	`question_score` DOUBLE NOT NULL,
	`project_id` BIGINT NOT NULL,
	`state` INT DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE  `t_te_exam_paper_result` (
	`id` BIGINT auto_increment,
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

CREATE UNIQUE INDEX `login_name` ON  `ss_user` (`login_name` ASC);

