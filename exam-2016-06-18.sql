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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_class`
--

LOCK TABLES `ss_class` WRITE;
/*!40000 ALTER TABLE `ss_class` DISABLE KEYS */;
INSERT INTO `ss_class` VALUES (1,'2014届数控系01班','2014届数控系01班'),(2,'班级01','1122jioijoi1122jioijoi1122jioijoi1122jio'),(3,'12',''),(4,'123','123'),(5,'234','324'),(6,'345','345'),(7,'111','111'),(8,'22','22'),(9,'33','33'),(10,'55','55');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_user`
--

LOCK TABLES `ss_user` WRITE;
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` VALUES (1,'admin','管理员','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','admin','2016-06-19 12:33:47',1),(2,'user','学生','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','6d65d24122c30500','user','2016-06-19 12:33:48',1),(3,'teacher','老师','3cb3228620732f1e570fe29920f3aa0df636ad9d','ccdef9df1622648f','teacher','2016-06-19 12:33:48',1),(4,'user1','user1','d5f510402a9148de7d3c4b6d1c98082b19f75d0c','e70d793173712bd4','student','2016-06-19 13:10:26',2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_answer`
--

LOCK TABLES `t_te_answer` WRITE;
/*!40000 ALTER TABLE `t_te_answer` DISABLE KEYS */;
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
INSERT INTO `t_te_exam_question` VALUES (1,1,'某化合物分子离子峰区的相对峰度为M:(M+2):(M+4)=9:6:1，则分子式中含()个氯原子。','1',5,201,1),(2,1,'在化合物CH3Br的质谱中，M和M+2峰的相对强度比应为：','8',5,201,1),(3,1,'某一含卤素的化合物，其质谱图上同位素峰强比M:M+2:M+4=3:4:1，则该化合物中含有（）','11',5,201,1),(4,1,'本项目的采样地点是','13',5,201,1),(5,1,'本项目的检验指标是','18',5,201,1),(6,1,'本项目的检验标准是','23',5,201,1),(7,1,'本项目的样品名称是','27',5,201,1),(8,1,'本项目所用方法为','30',5,201,1),(9,1,'在气相色谱定量分析中，只有试样中所有组分都能出彼此分离较好的峰才能使用的方法是(    )','34',5,201,1),(10,2,'本项目检测样品任务单上有以下哪些内容',NULL,10,201,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_te_make_exam`
--

LOCK TABLES `t_te_make_exam` WRITE;
/*!40000 ALTER TABLE `t_te_make_exam` DISABLE KEYS */;
INSERT INTO `t_te_make_exam` VALUES (1,'test','	              	\r\n	              stesete',11,201,3,'2016-05-04 19:46:01','2016-05-04 19:46:45'),(100,'2015年期中考试','考试时间为30分钟，考试期间请不要大声喧哗，共3道单选，2道多选题，共50分',30,200,1,NULL,NULL);
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
INSERT INTO `t_te_project` VALUES (200,100,'第二单元',''),(201,100,'第三单元',''),(202,101,'第一单元',''),(203,102,'第一单元',''),(204,102,'第一单元',''),(205,104,'第一单元',''),(206,104,'第二单元','');
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
INSERT INTO `t_te_select_items` VALUES (1,1,'1',1),(2,1,'2',0),(3,1,'3',0),(4,1,'4',0),(5,2,'98.9:1.1',0),(6,2,'98.9:0.02',0),(7,2,'98.9:0.02',0),(8,2,'1:01',1),(9,3,'两个氯',0),(10,3,'两个溴',0),(11,3,'一个氯和一个溴',1),(12,3,'两个氯和两个溴',0),(13,4,'北校区',1),(14,4,'朝阳垡头地区',0),(15,4,'南校区',0),(16,5,'BOD',0),(17,5,'COD',0),(18,5,'PAH',1),(19,5,'TP',0),(20,6,'GB 11914-1989',0),(21,6,'GB 3838-2002',0),(22,6,'GB 11893-1989',0),(23,6,'HJ 478-2009',1),(24,7,'污水中TP含量测定',0),(25,7,'污水中BOD含量测定',0),(26,7,'污水中DO含量测定',0),(27,7,'北校区大气',1),(28,8,'气相色谱',0),(29,8,'液相色谱',0),(30,8,'液相色谱',1),(32,9,'内标法',0),(33,9,'外标法—比较法',0),(34,9,'外标法—标准工作曲线法',1);
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

-- Dump completed on 2016-06-19 22:45:51
