-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: 101.200.149.58    Database: test
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ss_class`
--

DROP TABLE IF EXISTS `ss_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_remark` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_class`
--

LOCK TABLES `ss_class` WRITE;
/*!40000 ALTER TABLE `ss_class` DISABLE KEYS */;
INSERT INTO `ss_class` VALUES (1,'2014届数控系01班','2014届数控系01班'),(2,'2014届环保系01班 ','1111111111111111111111111111111111111111'),(3,'2014届机电系01班 ',''),(4,'2014届机电系02班','123456789'),(5,'2014届信息系01班 ','324'),(6,'2014届信息系02班 ','345'),(7,'2015届数控系01班 ','111'),(8,' 2015届环保系01班  ','22'),(9,'2015届机电系01班 ','33'),(10,'2015届信息系01班 ','55'),(12,'2015届信息系02班',''),(13,'2016届数控系01班 ',''),(14,'2016届环保系01班 ',''),(15,'2016届机电系01班 ',''),(16,'2016届信息系01班 ','');
/*!40000 ALTER TABLE `ss_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_task`
--

DROP TABLE IF EXISTS `ss_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_task`
--

LOCK TABLES `ss_task` WRITE;
/*!40000 ALTER TABLE `ss_task` DISABLE KEYS */;
INSERT INTO `ss_task` VALUES (1,'Study PlayFramework 2.0','http://www.playframework.org/',2),(2,'Study Grails 2.0','http://www.grails.org/',2),(3,'Try SpringFuse','http://www.springfuse.com/',2),(4,'Try Spring Roo','http://www.springsource.org/spring-roo',2),(5,'Release SpringSide 4.0','As soon as posibble.',2);
/*!40000 ALTER TABLE `ss_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_user`
--

DROP TABLE IF EXISTS `ss_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `class_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_user`
--

LOCK TABLES `ss_user` WRITE;
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` VALUES (1,'admin','管理员','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','admin','2016-06-19 12:33:47',1),(2,'user','学生','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','user','2016-06-19 12:33:48',1),(3,'teacher','老师','3cb3228620732f1e570fe29920f3aa0df636ad9d','ccdef9df1622648f','teacher','2016-06-19 12:33:48',1),(4,'user1','user1','d5f510402a9148de7d3c4b6d1c98082b19f75d0c','e70d793173712bd4','student','2016-06-19 13:10:26',2),(5,'zhangsan','张三','7bb2fe511a72267be58fa41255af55cb7c90723d','c57f882ad8f0bcd5','student','2016-06-21 03:03:13',7),(6,'zhangsan1','张四','8cd5daaf45f52f1d938499f32b10863cce132eee','efb123e3aa0bbf5d','student','2016-06-21 03:03:13',1),(7,'zhangsan2','张五','ddfefbea7f02d0732b8e5107ea89577c2909af90','70dfc2fbb7aa2940','student','2016-06-21 03:03:13',13),(8,'zhangsan3','张六','c665fedc98fb43876003df904aea4100d22a3341','6d535cb39c78c7ad','student','2016-06-21 03:03:13',7),(10,'zan','zan','f32759299108318ddc1b24d57026d69cf9a0f662','9d160963e4ded4ac','student','2016-06-21 03:03:13',13),(11,'zan01','zan01','8874e74055aa5afb9913189bb26e38ba4ba85475','e402960ea6db2102','student','2016-06-21 03:03:14',7),(12,'zan02','zan02','1eefeb810a94ba8ecab07f9d3fce90e2464793cf','a40dfa08f5b083a7','student','2016-06-21 03:03:14',7),(13,'zan03','zan03','48c6f5bd4e8315d008637787fee0f1e787ebe690','42754298c8834187','student','2016-06-21 03:03:14',7),(14,'zan04','zan04','7586f2233cbd0c97a566ea178ae668c1b38133b2','ff3340077101f10e','student','2016-06-21 03:03:14',7);
/*!40000 ALTER TABLE `ss_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_answer`
--

DROP TABLE IF EXISTS `t_te_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `answer_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_answer`
--

LOCK TABLES `t_te_answer` WRITE;
/*!40000 ALTER TABLE `t_te_answer` DISABLE KEYS */;
INSERT INTO `t_te_answer` VALUES (1,2,'常用的食品标准搜索引擎有哪些？请用搜索引擎搜索完成本次检测任务的标准，请写出你搜索的关键词及搜索的网址，并用这一国标文献名保存至个人文件夹。（注：以下问题如有需要，均可使用这些搜索工具寻找答案）','高碑店污水处理厂<br/>活性 污泥中铬元素分析','text','阿斯顿发生的','2016-06-19 16:00:00'),(2,2,'请阅读任务书，并摘录关键词。','高碑店污水处理厂活性污泥中铬元素分析','text','sdfasdf务书，并摘录关键词。','2016-06-19 16:00:00'),(3,10,'请从成本、效率等角度，对比塑化剂的GC-MS、LC-UV等分析方法，并说明本次实验方法的优点。','南三区土壤中塑化剂分析','text','对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法对比塑化剂的GC-MS、LC-UV等分析方法','2016-06-20 16:00:00'),(4,10,'请从设备、操作、效率、成本等角度，对比以下几种色谱常用的前处理方法：“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”。','南三区土壤中塑化剂分析','text','“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”：“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”：“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”：“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”：“液液萃取”、“固相萃取”、“顶空”、“固相微萃取”、“快速溶剂萃取”','2016-06-20 16:00:00'),(5,10,'<p>请查阅《SN/T 2249-2009 塑料及其制品中邻苯二甲酸酯类增塑剂的测定 气相色谱-质谱法》，编制本项目的检测用辅助仪器清单，同时核查本实验室仪器厂家、型号、作用。</p>','南三区土壤中塑化剂分析','.docx','shjfx_jcyfzyqqd.docx','2016-06-20 16:00:00'),(6,10,'<p>编写工作方案</p>','南三区土壤中塑化剂分析','.docx','shjfx_jcyfzyqqd.docx','2016-06-20 16:00:00'),(7,10,'样品是直接取一些土壤分析吗？该如何采集样品，才能保证样品的均匀性、代表性？','南三区土壤中塑化剂分析','text','采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性采集样品，才能保证样品的均匀性、代表性','2016-06-20 16:00:00'),(8,10,'<p>请根据查阅的相关标准及实验室的相关资源编制本任务的仪器清单，同时核查本实验室仪器厂家、型号、作用。请列表完成。</p>','高碑店污水处理厂<br/>活性 污泥中铬元素分析','.docx','shjfx_jcyfzyqqd.docx','2016-06-20 16:00:00');
/*!40000 ALTER TABLE `t_te_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_course`
--

DROP TABLE IF EXISTS `t_te_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_course`
--

LOCK TABLES `t_te_course` WRITE;
/*!40000 ALTER TABLE `t_te_course` DISABLE KEYS */;
INSERT INTO `t_te_course` VALUES (100,'复杂基体有机物指标分析',''),(101,'复杂基体元素指标分析','');
/*!40000 ALTER TABLE `t_te_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_exam_paper_result`
--

DROP TABLE IF EXISTS `t_te_exam_paper_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_exam_paper_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exam_id` bigint(20) DEFAULT NULL,
  `exam_remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `sum_score` double DEFAULT NULL,
  `exam_order` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `exam_code` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_exam_paper_result`
--

LOCK TABLES `t_te_exam_paper_result` WRITE;
/*!40000 ALTER TABLE `t_te_exam_paper_result` DISABLE KEYS */;
INSERT INTO `t_te_exam_paper_result` VALUES (1,'test',1,'	              	\r\n	              stesete','学生',2,5,1,2,NULL),(2,'2016-6-21《大气PM2.5中多环芳烃分析》',102,'','zan',10,15,NULL,1,NULL),(3,'2016-6-21《汽修喷漆车间废水中苯系物分析》',103,'','zan',10,10,NULL,1,NULL),(4,'2016-6-21《南三区土壤中塑化剂分析》',104,'','zan',10,25,NULL,1,NULL),(5,'2016-6-21《南三区土壤中塑化剂分析》',104,'','zan01',11,10,NULL,1,NULL),(6,'2016-6-21《汽修喷漆车间废水中苯系物分析》',103,'','zan01',11,15,NULL,1,NULL),(7,'2016-6-21《大气PM2.5中多环芳烃分析》',102,'','zan01',11,10,NULL,1,NULL),(8,'2016-6-21《大气PM2.5中多环芳烃分析》',102,'','zan02',12,0,NULL,1,NULL),(9,'2016-6-21《汽修喷漆车间废水中苯系物分析》',103,'','zan02',12,10,NULL,1,NULL),(10,'2016-6-21《南三区土壤中塑化剂分析》',104,'','zan02',12,20,NULL,1,NULL),(11,'2016-6-21《南校区大气PM2.5中元素分析》',105,'','zan',10,25,NULL,1,NULL),(12,'2016-6-21《高碑店污水处理厂活性污泥中铬元素分析》',106,'','zan',10,25,NULL,1,NULL),(13,'2016-6-21《南校区自备井水质异味排查》',107,'','zan',10,20,NULL,1,NULL),(14,'2016-6-21《南校区大气PM2.5中元素分析》',105,'','zan02',12,15,NULL,1,NULL),(15,'2016-6-21《高碑店污水处理厂活性污泥中铬元素分析》',106,'','zan02',12,30,NULL,1,NULL),(16,'2016-6-21《南校区自备井水质异味排查》',107,'','zan02',12,15,NULL,1,NULL),(17,'2016-6-21《南校区大气PM2.5中元素分析》',105,'','zan01',11,20,NULL,1,NULL),(18,'2016-6-21《高碑店污水处理厂活性污泥中铬元素分析》',106,'','zan01',11,30,NULL,1,NULL),(19,'2016-6-21《南校区自备井水质异味排查》',107,'','zan01',11,10,NULL,1,NULL),(20,'2016-6-21《汽修喷漆车间废水中苯系物分析》',103,'','学生',2,5,NULL,1,NULL);
/*!40000 ALTER TABLE `t_te_exam_paper_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_exam_question`
--

DROP TABLE IF EXISTS `t_te_exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_exam_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `question_cont` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_answer_id` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_score` double NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_exam_question`
--

LOCK TABLES `t_te_exam_question` WRITE;
/*!40000 ALTER TABLE `t_te_exam_question` DISABLE KEYS */;
INSERT INTO `t_te_exam_question` VALUES (1,1,'某化合物分子离子峰区的相对峰度为M:(M+2):(M+4)=9:6:1，则分子式中含()个氯原子。','1',5,201,1),(2,1,'在化合物CH3Br的质谱中，M和M+2峰的相对强度比应为：','8,7,6',5,201,1),(3,1,'某一含卤素的化合物，其质谱图上同位素峰强比M:M+2:M+4=3:4:1，则该化合物中含有（）','11',5,201,1),(5,1,'本项目的检验指标是','18',5,201,1),(6,1,'本项目的检验标准是','23',5,201,1),(8,1,'本项目所用方法为','30',5,201,1),(9,1,'在气相色谱定量分析中，只有试样中所有组分都能出彼此分离较好的峰才能使用的方法是(    )','34',5,201,1),(10,2,'本项目检测样品任务单上有以下哪些内容',NULL,10,201,1),(11,1,'《大气PM2.5中多环芳烃分析》本项目的采样地点是',NULL,5,200,1),(12,1,'《大气PM2.5中多环芳烃分析》本项目的检验指标是','40',5,200,1),(13,1,'《大气PM2.5中多环芳烃分析》本项目的检验标准是','45',5,200,1),(14,1,'《大气PM2.5中多环芳烃分析》本项目的样品名称是','49',5,200,1),(15,1,'《南三区土壤中塑化剂分析》某化合物分子离子峰区的相对峰度为M:(M+2):(M+4)=9:6:1，则分子式中含()个氯原子。','50',5,202,1),(16,1,'《南三区土壤中塑化剂分析》在化合物CHI<sub>3</sub>Br的质谱中，M和M+2峰的相对强度比应为：','57',5,202,1),(17,1,'《南三区土壤中塑化剂分析》某一含卤素的化合物，其质谱图上同位素峰强比M:M+2:M+4=3:4:1，则该化合物中含有（）','60',5,202,1),(18,2,'《南三区土壤中塑化剂分析》本项目检测样品任务单上有以下哪些内容','62,63,64,65,66,67',10,202,1),(19,1,'《南校区大气PM2.5中元素分析》某化合物分子离子峰区的相对峰度为M:(M+2):(M+4)=9:6:1，则分子式中含()个氯原子。','68',5,203,1),(20,1,'《南校区大气PM2.5中元素分析》》在化合物CHI<sub>3</sub>Br的质谱中，M和M+2峰的相对强度比应为：','75',5,203,1),(21,1,'《南校区大气PM2.5中元素分析》某一含卤素的化合物，其质谱图上同位素峰强比M:M+2:M+4=3:4:1，则该化合物中含有（）','78',5,203,1),(22,2,'《南校区大气PM2.5中元素分析》本项目检测样品任务单上有以下哪些内容','80,81,82,83,84,85',10,203,1),(23,1,'《高碑店污水处理厂活性污泥中铬元素分析》本项目的检验指标是','88',5,204,1),(24,1,'《高碑店污水处理厂活性污泥中铬元素分析》本项目的检验标准是','93',5,204,1),(25,1,'《高碑店污水处理厂活性污泥中铬元素分析》本项目的样品名称是','97',5,204,1),(26,1,'《高碑店污水处理厂活性污泥中铬元素分析》本项目所用方法为','100',5,204,1),(27,1,'《高碑店污水处理厂活性污泥中铬元素分析》在气相色谱定量分析中，只有试样中所有组分都能出彼此分离较好的峰才能使用的方法是(    )','101',5,204,1),(28,2,'《高碑店污水处理厂活性污泥中铬元素分析》本项目检测样品任务单上有以下哪些内容','105,106,107,108,109,110',10,204,1),(29,1,'《南校区自备井水质异味排查》本项目的检验指标是','113',5,205,1),(30,1,'《南校区自备井水质异味排查》本项目的检验标准是','118',5,205,1),(31,1,'《南校区自备井水质异味排查》本项目的样品名称是','122',5,205,1),(32,1,'《南校区自备井水质异味排查》本项目所用方法为','125',5,205,1);
/*!40000 ALTER TABLE `t_te_exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_exam_result`
--

DROP TABLE IF EXISTS `t_te_exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_exam_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(20) DEFAULT NULL,
  `depd_id` bigint(20) DEFAULT NULL,
  `exam_question_id` bigint(20) DEFAULT NULL,
  `choose_question_id` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_answer` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_score` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_exam_result`
--

LOCK TABLES `t_te_exam_result` WRITE;
/*!40000 ALTER TABLE `t_te_exam_result` DISABLE KEYS */;
INSERT INTO `t_te_exam_result` VALUES (1,2,1,1,'1','1','学生',5,1),(2,2,1,2,'6','8','学生',0,1),(3,2,1,3,'10','11','学生',0,1),(4,10,102,12,'40','40','zan',5,1),(5,10,102,13,'45','45','zan',5,1),(6,10,102,14,'49','49','zan',5,1),(7,10,103,5,'18','18','zan',5,1),(8,10,103,6,'23','23','zan',5,1),(9,10,103,8,'29','30','zan',0,1),(10,10,103,9,'32','34','zan',0,1),(11,10,104,15,'50','50','zan',5,1),(12,10,104,16,'57','57','zan',5,1),(13,10,104,17,'60','60','zan',5,1),(14,10,104,18,'62,63,64,65,66,67','62,63,64,65,66,67','zan',10,1),(15,11,104,15,'50','50','zan01',5,1),(16,11,104,16,'56','57','zan01',0,1),(17,11,104,17,'60','60','zan01',5,1),(18,11,104,18,'62,63,64,65,66','62,63,64,65,66,67','zan01',0,1),(19,11,103,5,NULL,'18','zan01',NULL,1),(20,11,103,6,'23','23','zan01',5,1),(21,11,103,8,'30','30','zan01',5,1),(22,11,103,9,'34','34','zan01',5,1),(23,11,102,12,'40','40','zan01',5,1),(24,11,102,13,'43','45','zan01',0,1),(25,11,102,14,'49','49','zan01',5,1),(26,12,102,12,'39','40','zan02',0,1),(27,12,102,13,'43','45','zan02',0,1),(28,12,102,14,'48','49','zan02',0,1),(29,12,103,5,'17','18','zan02',0,1),(30,12,103,6,'23','23','zan02',5,1),(31,12,103,8,'30','30','zan02',5,1),(32,12,103,9,'32','34','zan02',0,1),(33,12,104,15,'53','50','zan02',0,1),(34,12,104,16,'57','57','zan02',5,1),(35,12,104,17,'60','60','zan02',5,1),(36,12,104,18,'62,63,64,65,66,67','62,63,64,65,66,67','zan02',10,1),(37,10,105,19,'68','68','zan',5,1),(38,10,105,20,'75','75','zan',5,1),(39,10,105,21,'78','78','zan',5,1),(40,10,105,22,'80,81,82,83,84,85','80,81,82,83,84,85','zan',10,1),(41,10,106,23,'88','88','zan',5,1),(42,10,106,24,'93','93','zan',5,1),(43,10,106,25,'97','97','zan',5,1),(44,10,106,26,'100','100','zan',5,1),(45,10,106,27,'101','101','zan',5,1),(46,10,106,28,'105,106,107,108','105,106,107,108,109,110','zan',0,1),(47,10,107,29,'113','113','zan',5,1),(48,10,107,30,'118','118','zan',5,1),(49,10,107,31,'122','122','zan',5,1),(50,10,107,32,'125','125','zan',5,1),(51,12,105,19,'68','68','zan02',5,1),(52,12,105,20,'75','75','zan02',5,1),(53,12,105,21,'78','78','zan02',5,1),(54,12,105,22,'80,81,82,83,84','80,81,82,83,84,85','zan02',0,1),(55,12,106,23,'88','88','zan02',5,1),(56,12,106,24,'93','93','zan02',5,1),(57,12,106,25,'97','97','zan02',5,1),(58,12,106,26,'99','100','zan02',0,1),(59,12,106,27,'101','101','zan02',5,1),(60,12,106,28,'105,106,107,108,109,110','105,106,107,108,109,110','zan02',10,1),(61,12,107,29,'113','113','zan02',5,1),(62,12,107,30,'118','118','zan02',5,1),(63,12,107,31,'122','122','zan02',5,1),(64,12,107,32,'124','125','zan02',0,1),(65,11,105,19,'68','68','zan01',5,1),(66,11,105,20,'72','75','zan01',0,1),(67,11,105,21,'78','78','zan01',5,1),(68,11,105,22,'80,81,82,83,84,85','80,81,82,83,84,85','zan01',10,1),(69,11,106,23,'88','88','zan01',5,1),(70,11,106,24,'93','93','zan01',5,1),(71,11,106,25,'97','97','zan01',5,1),(72,11,106,26,'100','100','zan01',5,1),(73,11,106,27,'104','101','zan01',0,1),(74,11,106,28,'105,106,107,108,109,110','105,106,107,108,109,110','zan01',10,1),(75,11,107,29,'113','113','zan01',5,1),(76,11,107,30,'118','118','zan01',5,1),(77,11,107,31,'121','122','zan01',0,1),(78,11,107,32,'124','125','zan01',0,1),(79,2,103,5,'18','18','学生',5,1),(80,2,103,6,'20','23','学生',0,1),(81,2,103,8,'28','30','学生',0,1),(82,2,103,9,'33','34','学生',0,1);
/*!40000 ALTER TABLE `t_te_exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_make_exam`
--

DROP TABLE IF EXISTS `t_te_make_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_make_exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `exam_remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exam_time` int(11) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `exam_begin_date` timestamp NULL DEFAULT NULL,
  `exam_end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_make_exam`
--

LOCK TABLES `t_te_make_exam` WRITE;
/*!40000 ALTER TABLE `t_te_make_exam` DISABLE KEYS */;
INSERT INTO `t_te_make_exam` VALUES (1,'test','	              	\r\n	              stesete',11,201,3,'2016-05-04 19:46:01','2016-05-04 19:46:45'),(100,'2015年期中考试','考试时间为30分钟，考试期间请不要大声喧哗，共3道单选，2道多选题，共50分',30,200,3,NULL,'2016-06-20 19:13:39'),(101,'test01','test01',10,201,3,'2016-06-20 02:59:02','2016-06-20 02:59:26'),(102,'2016-6-21《大气PM2.5中多环芳烃分析》','',20,200,1,'2016-06-20 19:19:20',NULL),(103,'2016-6-21《汽修喷漆车间废水中苯系物分析》','',10,201,1,'2016-06-20 19:19:28',NULL),(104,'2016-6-21《南三区土壤中塑化剂分析》','',10,202,1,'2016-06-20 19:19:24',NULL),(105,'2016-6-21《南校区大气PM2.5中元素分析》','',20,203,1,'2016-06-20 19:19:31',NULL),(106,'2016-6-21《高碑店污水处理厂活性污泥中铬元素分析》','',20,204,1,'2016-06-20 19:19:34',NULL),(107,'2016-6-21《南校区自备井水质异味排查》','',20,205,1,'2016-06-20 19:19:37',NULL);
/*!40000 ALTER TABLE `t_te_make_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_project`
--

DROP TABLE IF EXISTS `t_te_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depd_id` bigint(20) NOT NULL,
  `project_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_project`
--

LOCK TABLES `t_te_project` WRITE;
/*!40000 ALTER TABLE `t_te_project` DISABLE KEYS */;
INSERT INTO `t_te_project` VALUES (200,100,'北校区大气PM2.5中多环芳烃分析',''),(201,100,'汽修喷漆车间废水中苯系物分析',''),(202,100,'南三区土壤中塑化剂分析',''),(203,101,'南校区大气PM2.5中元素分析',''),(204,101,'高碑店污水处理厂活性污泥中铬元素分析',''),(205,101,'南校区自备井水质异味排查','');
/*!40000 ALTER TABLE `t_te_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_question_exampaper`
--

DROP TABLE IF EXISTS `t_te_question_exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_question_exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exampaper_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_question_exampaper`
--

LOCK TABLES `t_te_question_exampaper` WRITE;
/*!40000 ALTER TABLE `t_te_question_exampaper` DISABLE KEYS */;
INSERT INTO `t_te_question_exampaper` VALUES (1,1,1),(2,1,2),(3,1,3),(4,101,1),(5,101,2),(6,101,3),(9,103,9),(10,103,8),(11,103,6),(12,103,5),(13,104,15),(14,104,16),(15,104,17),(16,104,18),(17,105,19),(18,105,20),(19,105,21),(20,105,22),(21,106,23),(22,106,24),(23,106,25),(24,106,26),(25,106,27),(26,106,28),(27,107,29),(28,107,30),(29,107,31),(30,107,32),(31,102,12),(32,102,13),(33,102,14);
/*!40000 ALTER TABLE `t_te_question_exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_select_items`
--

DROP TABLE IF EXISTS `t_te_select_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_select_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depd_id` bigint(20) DEFAULT NULL,
  `select_cont` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_answer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_select_items`
--

LOCK TABLES `t_te_select_items` WRITE;
/*!40000 ALTER TABLE `t_te_select_items` DISABLE KEYS */;
INSERT INTO `t_te_select_items` VALUES (1,1,'1',1),(2,1,'2',0),(3,1,'3',0),(4,1,'4',0),(5,2,'98.9:1.1',0),(6,2,'98.9:0.02',1),(7,2,'98.9:0.02',1),(8,2,'1:01',0),(9,3,'两个氯',0),(10,3,'两个溴',0),(11,3,'一个氯和一个溴',1),(12,3,'两个氯和两个溴',0),(17,5,'COD',0),(18,5,'PAH',1),(19,5,'TP',0),(20,6,'GB 11914-1989',0),(21,6,'GB 3838-2002',0),(22,6,'GB 11893-1989',0),(23,6,'HJ 478-2009',1),(28,8,'气相色谱',0),(29,8,'液相色谱',0),(30,8,'液相色谱',1),(32,9,'内标法',0),(33,9,'外标法—比较法',0),(34,9,'外标法—标准工作曲线法',1),(38,12,'BOD',0),(39,12,'COD',0),(40,12,'PAH',1),(41,12,'TP',0),(42,13,'GB 11914-1989',0),(43,13,'GB 3838-2002',0),(44,13,'GB 11893-1989',0),(45,13,'HJ 478-2009',1),(46,14,'污水中TP含量测定',0),(47,14,'污水中BOD含量测定',0),(48,14,'污水中DO含量测定',0),(49,14,'北校区大气',1),(50,15,'1',1),(51,15,'2',0),(52,15,'3',0),(53,15,'4',0),(54,16,'98.9:1.1',0),(55,16,'98.9:0.02',0),(56,16,'98.9:0.02',0),(57,16,'1:01',1),(58,17,'两个氯',0),(59,17,'两个溴',0),(60,17,'一个氯和一个溴',1),(61,17,'两个氯和两个溴',0),(62,18,'任务单编号',1),(63,18,'检测样品的名称',1),(64,18,'检验依据',1),(65,18,'检验标准',1),(66,18,'检验标准',1),(67,18,'任务完成日期',1),(68,19,'1',1),(69,19,'2',0),(70,19,'3',0),(71,19,'4',0),(72,20,'98.9:1.1',0),(73,20,'98.9:0.02',0),(74,20,'98.9:0.02',0),(75,20,'1:01',1),(76,21,'两个氯',0),(77,21,'两个溴',0),(78,21,'一个氯和一个溴',1),(79,21,'两个氯和两个溴',0),(80,22,'任务单编号',1),(81,22,'检测样品的名称',1),(82,22,'检验依据',1),(83,22,'检验标准',1),(84,22,'检验标准',1),(85,22,'任务完成日期',1),(86,23,'BOD',0),(87,23,'COD',0),(88,23,'PAH',1),(89,23,'TP',0),(90,24,'GB 11914-1989',0),(91,24,'GB 3838-2002',0),(92,24,'GB 11893-1989',0),(93,24,'HJ 478-2009',1),(94,25,'污水中TP含量测定',0),(95,25,'污水中BOD含量测定',0),(96,25,'污水中DO含量测定',0),(97,25,'北校区大气',1),(98,26,'气相色谱',0),(99,26,'液相色谱',0),(100,26,'液相色谱',1),(101,27,'归一化方法',1),(102,27,'内标法',0),(103,27,'外标法—比较法',0),(104,27,'外标法—标准工作曲线法',0),(105,28,'任务单编号',1),(106,28,'检测样品的名称',1),(107,28,'检验依据',1),(108,28,'检验标准',1),(109,28,'检验标准',1),(110,28,'任务完成日期',1),(111,29,'BOD',0),(112,29,'COD',0),(113,29,'PAH',1),(114,29,'TP',0),(115,30,'GB 11914-1989',0),(116,30,'GB 3838-2002',0),(117,30,'GB 11893-1989',0),(118,30,'HJ 478-2009',1),(119,31,'污水中TP含量测定',0),(120,31,'污水中BOD含量测定',0),(121,31,'污水中DO含量测定',0),(122,31,'北校区大气',1),(123,32,'气相色谱',0),(124,32,'液相色谱',0),(125,32,'液相色谱',1);
/*!40000 ALTER TABLE `t_te_select_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_te_words`
--

DROP TABLE IF EXISTS `t_te_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_te_words` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `word` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_words`
--

LOCK TABLES `t_te_words` WRITE;
/*!40000 ALTER TABLE `t_te_words` DISABLE KEYS */;
INSERT INTO `t_te_words` VALUES (1,'北校区大气PM2.5中多环芳烃分析','烃：','饱和的C、H化合物'),(2,'北校区大气PM2.5中多环芳烃分析','烯烃：','含有一个或多个C=C不饱和C、H化合物'),(3,'北校区大气PM2.5中多环芳烃分析','炔烃：','含有一个或多个C≡C不饱和C、H化合物'),(4,'北校区大气PM2.5中多环芳烃分析','芳香烃：','含有一个或多个苯环不饱和C、H化合物'),(5,'北校区大气PM2.5中多环芳烃分析','醇：','脂肪烃、脂环烃或芳香烃侧链中的氢原子被羟基取代而成的化合物。'),(6,'北校区大气PM2.5中多环芳烃分析','醚：','由一个氧原子连接两个烷基或芳基所形成的化合物'),(7,'北校区大气PM2.5中多环芳烃分析','醛：','由烃基与醛基相连而构成的化合物'),(8,'北校区大气PM2.5中多环芳烃分析','酮：','羰基与两个烃基相连的化合物'),(9,'北校区大气PM2.5中多环芳烃分析','酯：','羧酸的一类衍生物，由羧酸与醇（酚）反应失水而生成的化合物'),(10,'北校区大气PM2.5中多环芳烃分析','羧酸：','由烃基和羧基相连构成的有机化合物'),(11,'北校区大气PM2.5中多环芳烃分析','多环芳烃：','分子中含有两个以上苯环的碳氢化合物，包括萘、蒽、菲、芘等150余种化合物。有些多环芳烃还含有氮、硫和环戊烷，常见的具有致癌作用的多环芳烃多为四到六环的稠环化合物。'),(12,'北校区大气PM2.5中多环芳烃分析','电导率仪：','一款面向于医用多效蒸馏水系统，锅炉底水、凝结水，热交换系统，机械零部件的工业热清洗，工业循环水等在较高温度环境运行的高端水质管理和自动化控制而开发的一款宽温度范围的在线水质分析仪表；电导率是以数字表示溶液传导电流的能力。水的电导率与其所含无机酸、碱、盐的量有一定的关系，当它们的浓度较低时，电导率随着浓度的增大而增加，因此，该指标常用于推测水中离子的总浓度或含盐量。'),(13,'北校区大气PM2.5中多环芳烃分析','pH计：','用来精密测量液体介质的酸碱度值的一种仪器设备。'),(14,'北校区大气PM2.5中多环芳烃分析','电位滴定法：','利用溶液电位突变指示终点的滴定法。在滴定过程中，被滴定的溶液中插入连接电位计的两支电极。一支为参考电极，如饱和甘汞电极（常通过盐桥插入），另一支为指标电极，常用铂丝。'),(15,'北校区大气PM2.5中多环芳烃分析','永停滴定法：','根据滴定过程中电流的变化确定滴定终点的方法，属于电流滴定法。'),(16,'北校区大气PM2.5中多环芳烃分析','卡氏水分测定仪：','采用I<sub>2</sub>、SO<sub>2</sub>、吡啶、无水CH<sub>3</sub>OH（含水量在0.05%以下）配制成试剂，测定出试剂的水当量，在试剂与样品中的水进行反应后，通过计算试剂消耗量而计算出样品中水含量，在此原理基础上设计的测定各种物质水分的仪器。'),(17,'北校区大气PM2.5中多环芳烃分析','伏安溶出法（反向极谱法）：','使被测的物质，在待测离子极谱分析产生极限电流的电位下电解一定的时间，然后改变电极的电位，使富集在该电极上的物质重新溶出，根据溶出过程中所得到的伏安曲线来进行定量分析。'),(18,'北校区大气PM2.5中多环芳烃分析','极谱仪：','根据物质电解时所得到的电流-电压曲线，对电解质溶液中不同离子含量进行定性分析及定量分析的一种电化学式分析仪器。它的测试结果是一条极谱曲线(或称极谱图)。极谱图上对应各物质的半波电位是定性分析的依据，波高(代表极限扩散电流)则是定量分析的依据。'),(19,'北校区大气PM2.5中多环芳烃分析','紫外可见光谱：','利用某些物质的分子吸收10～800nm光谱区的辐射来进行分析测定的方法，这种分子吸收光谱产生于价电子和分子轨道上的电子在电子能级间的跃迁，广泛用于有机和无机物质的定性和定量测定。'),(20,'北校区大气PM2.5中多环芳烃分析','红外光谱：','根据不同物质会有选择性的吸收红外光区的电磁辐射来进行结构分析；对各种吸收红外光的化合物的定量和定性分析的一种方法。物质是由不断振动的状态的原子构成，这些原子振动频率与红外光的振动频率相当。用红外光照射有机物时，分子吸收红外光会发生振动能级跃迁，不同的化学键或官能团吸收频率不同，每个有机物分子只吸收与其分子振动、转动频率相一致的红外光谱，所得到的吸收光谱通常称为红外吸收光谱，简称红外光谱“IR”。'),(21,'北校区大气PM2.5中多环芳烃分析','原子吸收光谱：','基于气态的基态原子外层电子对紫外光和可见光范围的相对应原子共振辐射线的吸收强度来定量被测元素含量为基础的分析方法，是一种测量特定气态原子对光辐射的吸收的方法。'),(22,'北校区大气PM2.5中多环芳烃分析','原子荧光光谱：','以原子在辐射能激发下发射的荧光强度进行定量分析的发射光谱分析法。'),(23,'北校区大气PM2.5中多环芳烃分析','薄层色谱：','将适宜的固定相涂布于玻璃板、塑料或铝基片上，成一均匀薄层。待点样、展开后，根据比移值（Rf）与适宜的对照物按同法所得的色谱图的比移值（Rf）作对比，用以进行药品的鉴别、杂质检查或含量测定的方法。是快速分离和定性分析少量物质的一种很重要的实验技术，也用于跟踪反应进程。'),(24,'北校区大气PM2.5中多环芳烃分析','气相色谱：','用气体作为移动相的色谱法。根据所用固定相的不同可分为两类：固定相是固体的，称为气固色谱法；固定相是液体的则称为气液色谱法。'),(25,'北校区大气PM2.5中多环芳烃分析','液相色谱：','用液体作为流动相的色谱法。'),(26,'北校区大气PM2.5中多环芳烃分析','离子色谱：','将改进后的电导检测器安装在离子交换树脂柱的后面，以连续检测色谱分离的离子的方法。'),(27,'北校区大气PM2.5中多环芳烃分析','质量分析器：','在质谱仪中，利用带电粒子在电场或磁场下的作用不同，测定或分离不同荷质比的装置。'),(28,'北校区大气PM2.5中多环芳烃分析','离子源：','将不带电的分子离子化，形成带电荷的离子状态。'),(29,'北校区大气PM2.5中多环芳烃分析','四级杆质谱：','利用四个对称的双曲面杆分离产生的交变电场，分离不同的荷质比。'),(30,'北校区大气PM2.5中多环芳烃分析','不间断电源：','在市电停止后，利用交变器将市电交流和蓄电池的直流互变，仍能提供一段时间电量的蓄电设备。'),(31,'北校区大气PM2.5中多环芳烃分析','分子：','构成物质的基本粒子，由原子组成，是保持化学性质的最小单元。'),(32,'北校区大气PM2.5中多环芳烃分析','原子：','化学反应中不可分割的基本粒子，原子由原子核和核外电子组成。'),(33,'北校区大气PM2.5中多环芳烃分析','中子：','组成原子核的基本粒子，质量单位为1，不带电荷。'),(34,'北校区大气PM2.5中多环芳烃分析','质子：','组成原子核的基本粒子，质量单位为1，带1个正电荷。'),(35,'北校区大气PM2.5中多环芳烃分析','电子：','组成原子的基本粒子，质量相对原子核可以忽略，带1个负电荷。'),(36,'北校区大气PM2.5中多环芳烃分析','同位素：','具有相同的质子数，但是不同的中子数的同一种元素。'),(37,'北校区大气PM2.5中多环芳烃分析','同位素丰度：','又称天然存在比，指的是该同位素在这种元素的所有天然同位素中所占的比例。'),(38,'北校区大气PM2.5中多环芳烃分析','质谱丰度：','在质谱图中，纵坐标的浓度单位。'),(39,'北校区大气PM2.5中多环芳烃分析','基峰：','在质谱图中，质谱丰度值最高的峰。'),(40,'北校区大气PM2.5中多环芳烃分析','电子轰击电离源：','利用高能电子轰击分子形成带电的分子碎片，从而实现待测样品的电离。属于硬电离方式。'),(41,'北校区大气PM2.5中多环芳烃分析','NIST质谱库：','美国国家标准与技术研究院的标准质谱库，提供标准物质的质谱图检索和比对，是未知物定性鉴别的有力工具。'),(42,'北校区大气PM2.5中多环芳烃分析','质谱调谐：','质谱调谐是指对质谱质量轴的校准，通常使用稳定的已知分子量的化合物完成质谱的调谐。'),(43,'北校区大气PM2.5中多环芳烃分析','EPA：','美国环保署，美国国家环境保护局是美国联邦政府的一个独立行政机构，主要负责维护自然环境和保护人类健康不受环境危害影响。'),(44,'北校区大气PM2.5中多环芳烃分析','内标法：','色谱定量方法之一。利用在标准溶液和样品中不存在的物质，以一定浓度添加进入标样和样品，从而帮助定量的方法。内标法对体积要求不高，因此定量分析的重现性得到了极大提高。'),(45,'北校区大气PM2.5中多环芳烃分析','外标法：','色谱定量方法之一。利用化合物在色谱图的峰面积和浓度成正比的特性，对比标准品和样品的峰面积从而求出未知样品浓度的定量方法。'),(46,'北校区大气PM2.5中多环芳烃分析','校正因子：','内标法中评估内标物和标准品的一个因子，内标法应当使用标准溶液添加内标物首先计算校正因子：'),(47,'北校区大气PM2.5中多环芳烃分析','SCAN扫描模式：','在色谱质谱联用中，采用的一种数据采集方式。又称为全扫描模式，即设定一定的质量范围，采集一段质量范围的荷质比的质谱图。这一方式通常用来对未知物进行定量分析。'),(48,'北校区大气PM2.5中多环芳烃分析','SIM选择离子流模式：','在色谱质谱联用中，采用的一种数据采集方式。选择离子流选取目标化合物的特征离子，进行信号采集，可以很好过滤其他荷质比离子的干扰，从而提高信噪比，提高灵敏度。这一模式通常用来进行化合物的定性分析。'),(49,'北校区大气PM2.5中多环芳烃分析','定量离子：','在色谱质谱联用中，目标化合物的特征离子通常就是定量离子。'),(50,'北校区大气PM2.5中多环芳烃分析','辅助定性离子：','在色谱质谱联用中，为了更好地对化合物进行定性，去除假阳性实验，使用化合物的其他特征离子用于辅助定性。'),(51,'北校区大气PM2.5中多环芳烃分析','标准曲线方程：','在分析化学中，建立标准品浓度和信号间的直线关系方程。利用这一方程可以进行位置浓度样品的测定。'),(52,'北校区大气PM2.5中多环芳烃分析','线性相关系数：','在分析化学中，评价标准品浓度和信号间的存在直线关系的程度。相关系数越接近1，说明浓度和信号在一条直线上。'),(53,'北校区大气PM2.5中多环芳烃分析','线性范围：','在一定的精密度、准确度和线性条件下，测试方法使用的高低浓度或量的区间范围。'),(54,'北校区大气PM2.5中多环芳烃分析','检出限：','检测方法所能检测的最低浓度。'),(55,'北校区大气PM2.5中多环芳烃分析','限量值：','在环境、卫生等领域，某些物品中的化合物允许的最高量。'),(56,'北校区大气PM2.5中多环芳烃分析','PM2.5：','可吸入颗粒物，细颗粒物指环境空气中空气动力学当量直径小于等于2.5微米的颗粒物。');
/*!40000 ALTER TABLE `t_te_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-21 19:49:17
