insert into ss_task (id, title, description, user_id) values(1, 'Study PlayFramework 2.0','http://www.playframework.org/', 2);
insert into ss_task (id, title, description, user_id) values(2, 'Study Grails 2.0','http://www.grails.org/', 2);
insert into ss_task (id, title, description, user_id) values(3, 'Try SpringFuse','http://www.springfuse.com/', 2);
insert into ss_task (id, title, description, user_id) values(4, 'Try Spring Roo','http://www.springsource.org/spring-roo', 2);
insert into ss_task (id, title, description, user_id) values(5, 'Release SpringSide 4.0','As soon as posibble.', 2);

insert into ss_user (id, login_name, name, password, salt, roles, register_date) values(1,'admin','管理员','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','admin','2015-09-04 01:00:00');
insert into ss_user (id, login_name, name, password, salt, roles, register_date) 
values(2,'user','学生','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','user','2015-09-04 02:00:00');
insert into ss_user (id, login_name, name, password, salt, roles, register_date) 
values(3,'teacher','老师','3cb3228620732f1e570fe29920f3aa0df636ad9d','ccdef9df1622648f','teacher','2015-09-04 02:00:00');

insert into t_te_make_exam 
(id, exam_name, exam_remark, exam_time,project_id,state) 
values(100,'2015年期中考试','考试时间为30分钟，考试期间请不要大声喧哗，共3道单选，2道多选题，共50分',
30,200,1);
insert into t_te_course values(100,'化学课','');
insert into t_te_course values(101,'生物课','');
insert into t_te_course values(102,'历史课','');
insert into t_te_course values(103,'语文课','');
insert into t_te_course values(104,'驾驶课','');
insert into t_tefƒ_project values(200,100,'第一单元','');
insert into t_te_project values(201,100,'第二单元','');
insert into t_te_project values(202,100,'第三单元','');
insert into t_te_project values(203,101,'第一单元','');
insert into t_te_project values(204,102,'第一单元','');
insert into t_te_project values(205,102,'第一单元','');
insert into t_te_project values(206,104,'第一单元','');
insert into t_te_project values(207,104,'第二单元','');

