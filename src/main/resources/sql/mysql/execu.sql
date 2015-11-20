drop table if exists ss_task;
drop table if exists ss_user;
drop table if exists t_te_course;
drop table if exists t_te_project;
drop table if exists t_te_make_exam;
drop table if exists t_te_exam_question;
drop table if exists t_te_select_items;
drop table if exists t_te_question_exampaper;
drop table if exists t_te_exam_result;
drop table if exists t_te_exam_paper_result;
--create user 'exam'@'127.0.0.1' identified by 'exam';
--create database if not exists exam default character set utf8 collate utf8_unicode_ci;


create table ss_task (
	id bigint auto_increment,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
) engine=innodb default charset utf8;

create table ss_user (
	id bigint auto_increment,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null default 0,
	primary key (id)
) engine=innodb default charset utf8;

create table t_te_course(
	id bigint auto_increment,
	course_name varchar(200) not null,
	remark varchar(500),
	primary key (id)
)engine=innodb default charset utf8;

--drop table t_te_project;
create table t_te_project(
	id bigint auto_increment,
	depd_id bigint not null,
	project_name varchar(200) not null,
	remark varchar(500),
	primary key (id)
)engine=innodb default charset utf8;

create table t_te_make_exam (
	id bigint auto_increment,
	exam_name varchar(200) not null,
	exam_remark varchar(500),
	exam_time integer not null,
	project_id bigint not null,
	state integer,
	exam_begin_date timestamp null,
	exam_end_date timestamp null,
    primary key (id)
)engine=innodb default charset utf8;


create table t_te_exam_question (
   id bigint auto_increment,
   type                 integer                        null,
   question_cont        varchar(200)                   null,   
   question_answer_id   varchar(3000)                  null,   
   question_score       double not null, 
   project_id     bigint not null,
  primary key (id)
)engine=innodb default charset utf8;


create table t_te_select_items (
   id                   bigint            auto_increment,
   depd_id              bigint                  null,
   select_cont          varchar(500)                   null,
   is_answer            integer                        null,   
   primary key (id)
)engine=innodb default charset utf8;
create table t_te_question_exampaper (
   id                   bigint            auto_increment,
   exampaper_id         bigint                not   null,
   question_id          bigint                not null,
   primary key (id)
 )engine=innodb default charset utf8;
 create table t_te_exam_result (
   id                   bigint            auto_increment,
   person_id            bigint                   null,
   depd_id              bigint                   null,
   exam_question_id     bigint                  null,
   choose_question_id  varchar(2000)                  null,
   question_answer      varchar(2000)                  null,
   person_name          varchar(50)                    null,
   question_score       double                         null,  
   state                integer                null,  
   primary key (id)
)engine=innodb default charset utf8;

create table t_te_exam_paper_result (
   id                   bigint                    auto_increment,
   exam_name            varchar(200)                   null,
   exam_id              bigint                    null,
   exam_remark          varchar(500)                   null,
   person_name          varchar(50)                    null,
   person_id            bigint                  null,
   sum_score            double                  null,  
   exam_order           integer                        null,
   state                integer                        null,
   exam_code            bigint                    null,
   primary key (id)
)engine=innodb default charset utf8;




create procedure p_index_statanaly(out id bigint,out examName varchar(200),out sale number(5,2),out sumScore Double)
begin
     declare v_id long,v_exam_score double,v_num int,v_v_pass_num int,v_ exam_name varchar(200);
     
      select MAX(id) into v_id, exam_name into v_ exam_name from  t_te_make_exam where state=3;
     
      select sum(a. question_score) into v_exam_score  from  t_te_exam_question a,t_te_question_exampaper b where  b.question_id=a.id and b.exampaper_id = v_id;

      select count(id) as v_num from  t_te_exam_paper_result where exam_id=v_id;
      select count(id) as v_pass_num from  t_te_exam_paper_result where exam_id=v_id and sum_score/100>=0.6;
      
      set sale = v_pass_num/v_num;
      set id = v_id;
      set  examName = v_ exam_name;
      set sumScore = v_exam_score;
end






