CREATE DATABASE  IF NOT EXISTS `forum` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `forum`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_time` datetime DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (14,'2018-08-05 17:33:59',61,2,'666666666666'),(15,'2018-08-05 17:41:32',1,2,'23333333333');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysRole_sysPermission`
--

DROP TABLE IF EXISTS `sysRole_sysPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysRole_sysPermission` (
  `role_id` int(11) DEFAULT NULL,
  `per_id` int(11) DEFAULT NULL,
  KEY `fk_sysRole_sysPermission_1_idx` (`role_id`),
  KEY `fk_sysRole_sysPermission_2_idx` (`per_id`),
  CONSTRAINT `fk_sysRole_sysPermission_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sysRole_sysPermission_2` FOREIGN KEY (`per_id`) REFERENCES `sys_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysRole_sysPermission`
--

LOCK TABLES `sysRole_sysPermission` WRITE;
/*!40000 ALTER TABLE `sysRole_sysPermission` DISABLE KEYS */;
INSERT INTO `sysRole_sysPermission` VALUES (2,8),(2,11),(2,5),(2,1),(1,31),(1,16),(1,20),(1,18),(1,21),(1,17),(1,19),(1,29),(1,27),(1,30),(1,28),(1,10),(1,8),(1,9),(1,15),(1,13),(1,11),(1,12),(1,14),(1,26),(1,24),(1,22),(1,34),(1,23),(1,25),(1,7),(1,5),(1,6),(1,35),(1,3),(1,1),(1,4),(1,2),(3,16),(3,27),(3,10),(3,8),(3,9),(3,15),(3,13),(3,11),(3,12),(3,14),(3,22),(3,7),(3,5),(3,6),(3,35),(3,3),(3,1),(3,4),(3,2);
/*!40000 ALTER TABLE `sysRole_sysPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `resource_type` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `permission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'话题查询许可',NULL,'/admin/topic/list',NULL),(2,'话题置顶许可',NULL,'/admin/topic/top',NULL),(3,'话题升精许可',NULL,'/admin/topic/good',NULL),(4,'话题编辑许可',NULL,'/admin/topic/editPage',NULL),(5,'评论查看许可',NULL,'/admin/comment/list',NULL),(6,'评论编辑许可',NULL,'/admin/comment/editPage',NULL),(7,'评论删除许可',NULL,'/admin/comment/delete',NULL),(8,'标签查看许可',NULL,'/admin/tag/list',NULL),(9,'标签编辑许可',NULL,'/admin/tag/editPage',NULL),(10,'标签删除许可',NULL,'/admin/tag/delete',NULL),(11,'用户查看许可',NULL,'/admin/user/list',NULL),(12,'用户禁用许可',NULL,'/admin/user/block',NULL),(13,'用户启用许可',NULL,'/admin/user/usering',NULL),(14,'用户编辑许可',NULL,'/admin/user/editPage',NULL),(15,'用户删除许可',NULL,'/admin/user/delete',NULL),(16,'后台用户列表',NULL,'/admin/admin_user/list',NULL),(17,'后台用户禁用',NULL,'/admin/admin_user/block',NULL),(18,'后台用户启用',NULL,'/admin/admin_user/usering',NULL),(19,'后台用户编辑',NULL,'/admin/admin_user/editPage',NULL),(20,'后台用户删除',NULL,'/admin/admin_user/delete',NULL),(21,'后台用户添加',NULL,'/admin/admin_user/addPage',NULL),(22,'角色查询许可',NULL,'/admin/role/list',NULL),(23,'角色禁用许可',NULL,'/admin/role/block',NULL),(24,'角色启用许可',NULL,'/admin/role/usering',NULL),(25,'角色编辑许可',NULL,'/admin/role/editPage',NULL),(26,'角色删除许可',NULL,'/admin/role/addPage',NULL),(27,'权限查询许可',NULL,'/admin/permission/list',NULL),(28,'权限编辑许可',NULL,'/admin/permission/editPage',NULL),(29,'权限删除许可',NULL,'/admin/permission/delete',NULL),(30,'权限添加许可',NULL,'/admin/permission/addPage',NULL),(31,'前后缓存清理',NULL,'/admin/clear',NULL),(34,'角色添加许可',NULL,'/admin/role/addPage',NULL),(35,'话题删除许可',NULL,'/admin/topic/delete',NULL);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理用户','拥有所有权限的超级管理员',1),(2,'普通用户','拥有前台所有数据的查看权限',1),(3,'普通管理用户','拥有前台所有数据的权限和后台数据的查看权限',1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) DEFAULT NULL,
  `describ` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_UNIQUE` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'java','Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。'),(2,'css',''),(3,'js',''),(4,'html',''),(5,'spring',''),(6,'springmvc',''),(7,'mybatis',''),(8,'springboot',''),(9,'hibernate',''),(10,'IDEA',''),(11,'Eclipse',''),(12,'知识','');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_topics`
--

DROP TABLE IF EXISTS `tags_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_topics` (
  `topic_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  KEY `fk_tags_topic_1_idx` (`topic_id`),
  KEY `fk_tags_topic_2_idx` (`tags_id`),
  CONSTRAINT `fk_tags_topic_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_topic_2` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_topics`
--

LOCK TABLES `tags_topics` WRITE;
/*!40000 ALTER TABLE `tags_topics` DISABLE KEYS */;
INSERT INTO `tags_topics` VALUES (5,1),(5,2),(2,3),(2,5),(3,6),(4,7),(6,3),(6,5),(7,6),(8,7),(9,1),(9,2),(10,3),(10,5),(11,6),(12,7),(13,1),(13,2),(14,3),(14,5),(15,6),(16,7),(17,1),(17,2),(18,3),(18,5),(19,6),(20,7),(21,1),(21,2),(22,3),(22,5),(23,6),(24,7),(25,1),(25,2),(27,6),(28,7),(29,1),(29,2),(30,3),(30,5),(31,6),(32,7),(33,1),(33,2),(35,6),(36,7),(37,1),(37,2),(38,3),(38,5),(39,6),(40,7),(41,1),(41,2),(42,3),(42,5),(43,6),(44,7),(45,1),(45,2),(46,3),(46,5),(47,6),(48,7),(49,1),(49,2),(50,3),(50,5),(51,6),(52,7),(53,1),(53,2),(54,3),(54,5),(55,6),(56,7),(57,1),(57,2),(59,6),(60,7),(61,1),(61,2),(63,6),(64,7),(65,1),(65,2),(66,3),(66,5),(67,6),(68,7),(69,1),(69,2),(70,3),(70,5),(71,6),(72,7),(73,1),(73,2),(74,3),(74,5),(75,6),(76,7),(77,1),(77,2),(78,3),(78,5),(79,6),(80,7),(81,1),(81,2),(82,3),(82,5),(83,6),(84,7),(85,1),(85,2),(86,3),(86,5),(87,6),(88,7),(89,1),(89,2),(90,3),(90,5),(91,6),(92,7),(93,1),(93,2),(95,6),(96,7),(94,4),(94,6),(62,10),(58,11),(26,12),(34,5),(34,10),(1,1),(1,2);
/*!40000 ALTER TABLE `tags_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good` tinyint(4) DEFAULT '0',
  `in_time` datetime DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `top` tinyint(4) DEFAULT '0',
  `view` int(11) DEFAULT '0',
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `tags` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,'2018-05-29 16:57:17','测试title1',1,14,'我是一个粉刷将，粉刷本领强<p><br></p>',1,'java,css'),(2,1,'2018-05-30 16:57:17','测试title2',0,3,'我是一个粉刷将，粉刷本领强<p><br></p>',2,'js,spring'),(3,0,'2018-05-31 16:57:17','测试title3',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',3,'springmvc'),(4,0,'2018-06-01 16:57:17','测试title4',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',4,'mybatis'),(5,1,'2018-06-02 16:57:17','测试title5',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',1,'java,css'),(6,0,'2018-06-03 16:57:17','测试title6',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(7,0,'2018-06-04 16:57:17','测试title7',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(8,0,'2018-06-05 16:57:17','测试title8',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(9,1,'2018-06-07 16:57:17','测试title9',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(10,0,'2018-06-08 16:57:17','测试title10',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(11,1,'2018-06-09 16:57:17','测试title11',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(12,1,'2018-06-10 16:57:17','测试title12',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(13,1,'2018-06-11 16:57:17','测试title13',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(14,0,'2018-06-12 16:57:17','测试title14',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(15,0,'2018-06-13 16:57:17','测试title15',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(16,1,'2018-06-14 16:57:17','测试title16',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(17,0,'2018-06-15 16:57:17','测试title17',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(18,1,'2018-06-16 16:57:17','测试title18',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(19,0,'2018-06-17 16:57:17','测试title19',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(20,0,'2018-06-18 16:57:17','测试title20',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(21,0,'2018-06-19 16:57:17','测试title21',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(22,0,'2018-06-20 16:57:17','测试title22',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(23,1,'2018-06-21 16:57:17','测试title23',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(24,0,'2018-06-22 16:57:17','测试title24',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(25,0,'2018-06-23 16:57:17','测试title25',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(26,0,'2018-06-24 16:57:17','测试title26',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',2,'知识'),(27,1,'2018-06-25 16:57:17','测试title27',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(28,1,'2018-06-26 16:57:17','测试title28',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(29,0,'2018-06-27 16:57:17','测试title29',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(30,0,'2018-06-28 16:57:17','测试title30',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(31,1,'2018-06-29 16:57:17','测试title31',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(32,0,'2018-06-30 16:57:17','测试title32',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(33,0,'2018-07-01 16:57:17','测试title33',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(34,0,'2018-07-02 16:57:17','测试title34',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',2,'spring,IDEA'),(35,0,'2018-07-03 16:57:17','测试title35',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(36,1,'2018-07-04 16:57:17','测试title36',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(37,1,'2018-07-05 16:57:17','测试title37',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(38,1,'2018-07-06 16:57:17','测试title38',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(39,0,'2018-07-07 16:57:17','测试title39',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(40,0,'2018-07-08 16:57:17','测试title40',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(41,1,'2018-07-09 16:57:17','测试title41',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(42,0,'2018-07-10 16:57:17','测试title42',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(43,1,'2018-07-11 16:57:17','测试title43',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(44,0,'2018-07-12 16:57:17','测试title44',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(45,1,'2018-07-13 16:57:17','测试title45',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(46,1,'2018-07-14 16:57:17','测试title46',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(47,0,'2018-07-15 16:57:17','测试title47',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(48,0,'2018-07-16 16:57:17','测试title48',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(49,1,'2018-07-17 16:57:17','测试title49',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(50,0,'2018-07-18 16:57:17','测试title50',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(51,0,'2018-07-19 16:57:17','测试title51',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(52,1,'2018-07-20 16:57:17','测试title52',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(53,0,'2018-07-21 16:57:17','测试title53',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(54,0,'2018-07-22 16:57:17','测试title54',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(55,0,'2018-07-23 16:57:17','测试title55',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(56,1,'2018-07-24 16:57:17','测试title56',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(57,1,'2018-07-25 16:57:17','测试title57',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(58,0,'2018-07-26 16:57:17','测试title58',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',2,'Eclipse'),(59,1,'2018-07-27 16:57:17','测试title59',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(60,0,'2018-07-28 16:57:17','测试title60',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(61,0,'2018-07-29 16:57:17','测试title61',0,2,'我是一个粉刷将，粉刷本领强',1,'java,css'),(62,0,'2018-07-30 16:57:17','测试title62',0,2,'我是一个粉刷将，粉刷本领强<p><br></p>',2,'IDEA'),(63,0,'2018-07-31 16:57:17','测试title63',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(64,1,'2018-08-01 16:57:17','测试title64',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(65,0,'2018-08-02 16:57:17','测试title65',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(66,0,'2018-08-03 16:57:17','测试title66',0,1,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(67,0,'2018-08-04 16:57:17','测试title67',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(68,1,'2018-08-05 16:57:17','测试title68',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(69,0,'2018-08-05 01:57:17','测试title69',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(70,0,'2018-08-05 02:57:17','测试title70',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(71,0,'2018-08-05 03:57:17','测试title71',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(72,1,'2018-08-05 04:57:17','测试title72',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(73,1,'2018-08-05 05:57:17','测试title73',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(74,1,'2018-08-05 06:57:17','测试title74',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(75,1,'2018-08-05 07:57:17','测试title75',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(76,0,'2018-08-05 08:57:17','测试title76',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(77,0,'2018-08-05 09:57:17','测试title77',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(78,1,'2018-08-05 10:57:17','测试title78',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(79,0,'2018-08-05 11:57:17','测试title79',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(80,0,'2018-08-05 12:57:17','测试title80',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(81,0,'2018-08-05 13:57:17','测试title81',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(82,0,'2018-08-05 14:57:17','测试title82',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(83,1,'2018-08-05 15:57:17','测试title83',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(84,0,'2018-08-05 16:57:17','测试title84',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(85,0,'2018-08-05 17:57:17','测试title85',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(86,0,'2018-08-05 18:57:17','测试title86',0,0,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(87,1,'2018-08-05 19:57:17','测试title87',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(88,0,'2018-08-05 20:57:17','测试title88',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(89,0,'2018-08-05 21:57:17','测试title89',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(90,0,'2018-08-05 22:57:17','测试title90',0,2,'我是一个粉刷将，粉刷本领强',2,'js,spring'),(91,0,'2018-08-05 23:57:17','测试title91',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(92,1,'2018-08-06 16:57:17','测试title92',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis'),(93,0,'2018-08-07 16:57:17','测试title93',0,0,'我是一个粉刷将，粉刷本领强',1,'java,css'),(94,0,'2018-08-08 16:57:17','测试title94',0,5,'我是一个粉刷将，粉刷本领强<p><br></p>',2,'html,springmvc'),(95,1,'2018-08-09 16:57:17','测试title95',0,0,'我是一个粉刷将，粉刷本领强',3,'springmvc'),(96,1,'2018-08-10 16:57:17','测试title96',0,0,'我是一个粉刷将，粉刷本领强',4,'mybatis');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `intro` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT 'normal',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'saber','lgy3121196','519888682@qq.com','2018-07-25 08:57:42','2.jpg','海碧鸥愈白，天阔羽更孤','normal'),(2,'admin','admin','1043907335@qq.com','2018-07-29 17:11:01','19053b8d529e4626a50.jpeg','我是一个粉刷将，粉刷本领强','normal'),(3,'milanuo','lgy3121196','1043907335@qq.com','2018-07-25 18:47:05','3.jpg','真相只有一个！','normal'),(4,'kenan','lgy3121196','971355090@qq.com','2018-08-02 18:07:43','1.jpg','hahahahahaha','normal');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userInfo_sysRole`
--

DROP TABLE IF EXISTS `userInfo_sysRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userInfo_sysRole` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `fk_userInfo_sysRole_1_idx` (`user_id`),
  KEY `fk_userInfo_sysRole_2_idx` (`role_id`),
  CONSTRAINT `fk_userInfo_sysRole_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userInfo_sysRole_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo_sysRole`
--

LOCK TABLES `userInfo_sysRole` WRITE;
/*!40000 ALTER TABLE `userInfo_sysRole` DISABLE KEYS */;
INSERT INTO `userInfo_sysRole` VALUES (5,2),(3,2),(3,3),(1,1),(4,2),(2,3);
/*!40000 ALTER TABLE `userInfo_sysRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'admin','df655ad8d3229f3269fad2a8bab59b6c',1,'2018-08-06 15:40:50'),(2,'saber','7588385134676883d190a0a7cc2746d4',1,'2018-08-07 10:40:04'),(3,'密拉诺','71c01a64cc758e9ffd058d3cde7f81bc',1,'2018-08-09 15:29:07'),(4,'仕郎','f247e52b83c7d33ff6527e9169ac4335',1,'2018-08-09 15:30:29'),(5,'柯南','33844a27305ca105c8729d2fbabf1305',2,'2018-08-09 15:31:46');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-12 10:36:40
