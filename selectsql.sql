
create table t_te_course(
	id bigint auto_increment,
	course_name varchar(200) not null,
	remark varchar(500),
	primary key (id)
);
create table t_te_project(
	id bigint auto_increment,
	depd_id bigint not null,
	project_name varchar(200) not null,
	remark varchar(500),
	primary key (id)
);

create table t_te_make_exam (
	id bigint auto_increment,
	exam_name varchar(200) not null,
	exam_remark varchar(500),
	exam_time INTEGER not null,
	project_id bigint not null,
	state INTEGER, 
	exam_begin_date timestamp null,
	exam_end_date timestamp null,
    primary key (id)
) engine=InnoDB;


create table T_TE_EXAM_QUESTION (
   id bigint auto_increment,
   TYPE                 INTEGER                        null,
   QUESTION_CONT        VARCHAR(200)                   null,   
   QUESTION_ANSWER_ID   VARCHAR(3000)                  null,  
   QUESTION_SCORE       Double not null, 
   PROJECT_ID     bigint not null,
  primary key (id)
)


create table T_TE_SELECT_ITEMS (
   ID                   bigint            auto_increment,
   DEPD_ID              bigint                  null,
   SELECT_CONT          VARCHAR(500)                   null,
   IS_ANSWER            INTEGER                        null,   
   primary key (id)
)

create table T_TE_QUESTION_EXAMPAPER (
   ID                   bigint            auto_increment,
   EXAMPAPER_ID         bigint                not   null,
   QUESTION_ID          bigint                not null,
   primary key (id)
 )
 
 create table T_TE_EXAM_RESULT (
   ID                   bigint            auto_increment,
   PERSON_ID            bigint                   null,
   DEPD_ID              bigint                   null,
   EXAM_QUESTION_ID     bigint                  null,
   CHOOSE_QUESTION_ID  VARCHAR(2000)                  null,
   QUESTION_ANSWER      VARCHAR(2000)                  null,
   PERSON_NAME          VARCHAR(50)                    null,
   QUESTION_SCORE       DOUBLE                         null,
   STATE                integer                null,  
   primary key (id)
)

create table T_TE_EXAM_PAPER_RESULT (
   ID                   bigint                    auto_increment,
   EXAM_NAME            VARCHAR(200)                   null,
   EXAM_ID              bigint                    null,
   EXAM_REMARK          VARCHAR(500)                   null,
   PERSON_NAME          VARCHAR(50)                    null,
   PERSON_ID            bigint                  null,
   SUM_SCORE            DOUBLE                  null,  
   EXAM_ORDER           INTEGER                        null,
   STATE                INTEGER                        null,
   EXAM_CODE            bigint                    null,   
   primary key (id)
)