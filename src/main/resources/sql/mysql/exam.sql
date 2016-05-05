-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.7.11

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_user`
--

LOCK TABLES `ss_user` WRITE;
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` VALUES (1,'admin','管理员','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','admin','2015-09-03 17:00:00'),(2,'user','学生','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','user','2015-09-03 18:00:00'),(3,'teacher','老师','3cb3228620732f1e570fe29920f3aa0df636ad9d','ccdef9df1622648f','teacher','2015-09-03 18:00:00');
/*!40000 ALTER TABLE `ss_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_course`
--

LOCK TABLES `t_te_course` WRITE;
/*!40000 ALTER TABLE `t_te_course` DISABLE KEYS */;
INSERT INTO `t_te_course` VALUES (100,'化学课',''),(101,'生物课',''),(102,'历史课',''),(103,'语文课',''),(104,'驾驶课','');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_exam_paper_result`
--

LOCK TABLES `t_te_exam_paper_result` WRITE;
/*!40000 ALTER TABLE `t_te_exam_paper_result` DISABLE KEYS */;
INSERT INTO `t_te_exam_paper_result` VALUES (1,'test',1,'	              	\r\n	              stesete','学生',2,5,1,2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_exam_question`
--

LOCK TABLES `t_te_exam_question` WRITE;
/*!40000 ALTER TABLE `t_te_exam_question` DISABLE KEYS */;
INSERT INTO `t_te_exam_question` VALUES (1,1,'某化合物分子离子峰区的相对峰度为M:(M+2):(M+4)=9:6:1，则分子式中含()个氯原子。','1',5,201,1),(2,1,'在化合物CH3Br的质谱中，M和M+2峰的相对强度比应为：','8',5,201,1),(3,1,'某一含卤素的化合物，其质谱图上同位素峰强比M:M+2:M+4=3:4:1，则该化合物中含有（）','11',5,201,1),(4,1,'本项目的采样地点是','13',5,201,1),(5,1,'本项目的检验指标是','18',5,201,1),(6,1,'本项目的检验标准是','23',5,201,1),(7,1,'本项目的样品名称是','27',5,201,1),(8,1,'本项目所用方法为','30',5,201,1),(9,1,'在气相色谱定量分析中，只有试样中所有组分都能出彼此分离较好的峰才能使用的方法是(    )','31',5,201,1),(10,2,'本项目检测样品任务单上有以下哪些内容','35,36,37,38,39,40',10,201,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_exam_result`
--

LOCK TABLES `t_te_exam_result` WRITE;
/*!40000 ALTER TABLE `t_te_exam_result` DISABLE KEYS */;
INSERT INTO `t_te_exam_result` VALUES (1,2,1,1,'1','1','学生',5,1),(2,2,1,2,'6','8','学生',0,1),(3,2,1,3,'10','11','学生',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_make_exam`
--

LOCK TABLES `t_te_make_exam` WRITE;
/*!40000 ALTER TABLE `t_te_make_exam` DISABLE KEYS */;
INSERT INTO `t_te_make_exam` VALUES (1,'test','	              	\r\n	              stesete',11,201,3,'2016-05-04 19:46:01','2016-05-04 19:46:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_project`
--

LOCK TABLES `t_te_project` WRITE;
/*!40000 ALTER TABLE `t_te_project` DISABLE KEYS */;
INSERT INTO `t_te_project` VALUES (201,100,'第二单元',''),(202,100,'第三单元',''),(203,101,'第一单元',''),(204,102,'第一单元',''),(205,102,'第一单元',''),(206,104,'第一单元',''),(207,104,'第二单元','');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_question_exampaper`
--

LOCK TABLES `t_te_question_exampaper` WRITE;
/*!40000 ALTER TABLE `t_te_question_exampaper` DISABLE KEYS */;
INSERT INTO `t_te_question_exampaper` VALUES (1,1,1),(2,1,2),(3,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_select_items`
--

LOCK TABLES `t_te_select_items` WRITE;
/*!40000 ALTER TABLE `t_te_select_items` DISABLE KEYS */;
INSERT INTO `t_te_select_items` VALUES (1,1,'1',1),(2,1,'2',0),(3,1,'3',0),(4,1,'4',0),(5,2,'98.9:1.1',0),(6,2,'98.9:0.02',0),(7,2,'98.9:0.02',0),(8,2,'1:01',1),(9,3,'两个氯',0),(10,3,'两个溴',0),(11,3,'一个氯和一个溴',1),(12,3,'两个氯和两个溴',0),(13,4,'北校区',1),(14,4,'朝阳垡头地区',0),(15,4,'南校区',0),(16,5,'BOD',0),(17,5,'COD',0),(18,5,'PAH',1),(19,5,'TP',0),(20,6,'GB 11914-1989',0),(21,6,'GB 3838-2002',0),(22,6,'GB 11893-1989',0),(23,6,'HJ 478-2009',1),(24,7,'污水中TP含量测定',0),(25,7,'污水中BOD含量测定',0),(26,7,'污水中DO含量测定',0),(27,7,'北校区大气',1),(28,8,'气相色谱',0),(29,8,'液相色谱',0),(30,8,'液相色谱',1),(31,9,'归一化方法',1),(32,9,'内标法',0),(33,9,'外标法—比较法',0),(34,9,'外标法—标准工作曲线法',0),(35,10,'任务单编号',1),(36,10,'检测样品的名称',1),(37,10,'检验依据',1),(38,10,'检验标准',1),(39,10,'检验标准',1),(40,10,'任务完成日期',1);
/*!40000 ALTER TABLE `t_te_select_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-05 16:07:31
