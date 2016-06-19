----drop table if exists ss_task;
--drop table if exists ss_user;
--drop table if exists t_te_make_exam;
--CREATE USER 'exam'@'127.0.0.1' IDENTIFIED BY 'exam';
--CREATE DATABASE IF NOT EXISTS test DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

CREATE DATABASE IF NOT EXISTS exam DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

CREATE TABLE ss_class
(
    ID BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    class_name VARCHAR(50),
    class_remark VARCHAR(80)
);
CREATE TABLE ss_task
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    description VARCHAR(255),
    user_id BIGINT(20) NOT NULL
);
CREATE TABLE ss_user
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    login_name VARCHAR(64) NOT NULL,
    name VARCHAR(64) NOT NULL,
    password VARCHAR(255) NOT NULL,
    salt VARCHAR(64) NOT NULL,
    roles VARCHAR(255) NOT NULL,
    register_date TIMESTAMP DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    class_id BIGINT(20) NOT NULL
);
CREATE UNIQUE INDEX login_name ON ss_user (login_name);
CREATE TABLE t_te_answer
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_id BIGINT(20),
    title TEXT,
    course VARCHAR(256),
    answer TEXT,
    answer_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
    c_type VARCHAR(32) DEFAULT 'text'
);
CREATE TABLE t_te_course
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(200) NOT NULL,
    remark VARCHAR(500)
);
CREATE TABLE t_te_exam_paper_result
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    exam_name VARCHAR(200),
    exam_id BIGINT(20),
    exam_remark VARCHAR(500),
    person_name VARCHAR(50),
    person_id BIGINT(20),
    sum_score DOUBLE,
    exam_order INT(11),
    state INT(11),
    exam_code BIGINT(20)
);
CREATE TABLE t_te_exam_question
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type INT(11),
    question_cont VARCHAR(200),
    question_answer_id VARCHAR(3000),
    question_score DOUBLE NOT NULL,
    project_id BIGINT(20) NOT NULL,
    state INT(11) DEFAULT '0'
);
CREATE TABLE t_te_exam_result
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    person_id BIGINT(20),
    depd_id BIGINT(20),
    exam_question_id BIGINT(20),
    choose_question_id VARCHAR(2000),
    question_answer VARCHAR(2000),
    person_name VARCHAR(50),
    question_score DOUBLE,
    state INT(11)
);
CREATE TABLE t_te_make_exam
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    exam_name VARCHAR(200) NOT NULL,
    exam_remark VARCHAR(500),
    exam_time INT(11) NOT NULL,
    project_id BIGINT(20) NOT NULL,
    state INT(11),
    exam_begin_date TIMESTAMP DEFAULT 'CURRENT_TIMESTAMP' NOT NULL,
    exam_end_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL
);
CREATE TABLE t_te_project
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    depd_id BIGINT(20) NOT NULL,
    project_name VARCHAR(200) NOT NULL,
    remark VARCHAR(500)
);
CREATE TABLE t_te_question_exampaper
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    exampaper_id BIGINT(20) NOT NULL,
    question_id BIGINT(20) NOT NULL
);
CREATE TABLE t_te_select_items
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    depd_id BIGINT(20),
    select_cont VARCHAR(500),
    is_answer INT(11)
);
CREATE TABLE t_te_words
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(128),
    word VARCHAR(128),
    remark VARCHAR(1024)
);
 ----------------bak
create table ss_task (
	id bigint auto_increment,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table ss_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default 0,
	primary key (id)
) engine=InnoDB;
--课程类别
create table t_te_course(
	id bigint auto_increment,
	course_name varchar(200) not null,--课程名称
	remark varchar(500),
	primary key (id)
);
--所属项目
--drop table t_te_project;
create table t_te_project(
	id bigint auto_increment,
	depd_id bigint not null,--所属课程
	project_name varchar(200) not null,--项目名称
	remark varchar(500),
	primary key (id)
);
--组卷表
create table t_te_make_exam (
	id bigint auto_increment,
	exam_name varchar(200) not null,--试卷名称
	exam_remark varchar(500),--说明
	exam_time INTEGER not null,--考试时间
	project_id bigint not null,--所属项目
	state INTEGER, --0：未考试1：开始考试2：结束考试
	exam_begin_date timestamp null,
	exam_end_date timestamp null,
    primary key (id)
) engine=InnoDB;

--试题主表
create table T_TE_EXAM_QUESTION (
   id bigint auto_increment,
   TYPE                 INTEGER                        null,--类型：1、单选 2、多选、3、填空、4、问答
   QUESTION_CONT        VARCHAR(200)                   null,--考题内容   
   QUESTION_ANSWER_ID   VARCHAR(3000)                  null, --考题答案ID  
   QUESTION_SCORE       Double not null, --分数
   PROJECT_ID     bigint not null,
  primary key (id)
)

--试题子表
create table T_TE_SELECT_ITEMS (
   ID                   bigint            auto_increment,
   DEPD_ID              bigint                  null,--试题ID（T_TE_EXAM_QUESTION）
   SELECT_CONT          VARCHAR(500)                   null,--选项内容
   IS_ANSWER            INTEGER                        null,--是否为答案   
   primary key (id)
)
--试卷与试题关联表
create table T_TE_QUESTION_EXAMPAPER (
   ID                   bigint            auto_increment,
   EXAMPAPER_ID         bigint                not   null,--试卷ID
   QUESTION_ID          bigint                not null,--试题ID
   primary key (id)
 )
 --考试结果表
 create table T_TE_EXAM_RESULT (
   ID                   bigint            auto_increment,
   PERSON_ID            bigint                   null,--考试人ID
   DEPD_ID              bigint                   null,--试卷ID
   EXAM_QUESTION_ID     bigint                  null,--试题ID
   CHOOSE_QUESTION_ID  VARCHAR(2000)                  null,--选择试题选项ID
   QUESTION_ANSWER      VARCHAR(2000)                  null,--试题回答
   PERSON_NAME          VARCHAR(50)                    null,--考试人姓名
   QUESTION_SCORE       DOUBLE                         null,  --得分
   STATE                integer                null,  
   primary key (id)
)
--考试结果表
create table T_TE_EXAM_PAPER_RESULT (
   ID                   bigint                    auto_increment,
   EXAM_NAME            VARCHAR(200)                   null,--试卷名称
   EXAM_ID              bigint                    null,--试卷ID
   EXAM_REMARK          VARCHAR(500)                   null,--试题说明
   PERSON_NAME          VARCHAR(50)                    null,--考试人姓名
   PERSON_ID            bigint                  null,--考试人ID
   SUM_SCORE            DOUBLE                  null,  --总得分 
   EXAM_ORDER           INTEGER                        null,--排名
   STATE                INTEGER                        null,--状态
   EXAM_CODE            bigint                    null,   --试卷编号
   primary key (id)
)

create table t_te_answer(
  id bigint auto_increment,
  user_id bigint,
  title VARCHAR(512),
  course VARCHAR(256),
  c_type VARCHAR(32),
  answer TEXT,
	answer_date timestamp not null default 0,
  primary key (id)
)

create table t_te_words(
  id bigint auto_increment,
  type VARCHAR(128),
  word VARCHAR(128),
  remark VARCHAR(1024),
  primary key (id)
)


select a.scale,e.QUESTION_CONT as questionCont,e.id from 
(select count(QUESTION_SCORE>1
) /count(id)*100 as scale ,EXAM_QUESTION_ID
from T_TE_EXAM_RESULT where DEPD_ID='' group by EXAM_QUESTION_ID) a
left join T_TE_EXAM_QUESTION e on a. EXAM_QUESTION_ID=e.id