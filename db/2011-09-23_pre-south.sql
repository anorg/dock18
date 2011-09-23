-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: fresh
-- ------------------------------------------------------
-- Server version	5.1.58-1~dotdeb.1-log

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
-- Current Database: `fresh`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fresh` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

#USE `fresh`;

--
-- Table structure for table `account_account`
--

DROP TABLE IF EXISTS `account_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_17b5ed9e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES (1,1,'Europe/Zurich','en-us');
/*!40000 ALTER TABLE `account_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_passwordreset`
--

DROP TABLE IF EXISTS `account_passwordreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_passwordreset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `temp_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `reset` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_passwordreset_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_367327ed` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_passwordreset`
--

LOCK TABLES `account_passwordreset` WRITE;
/*!40000 ALTER TABLE `account_passwordreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_passwordreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_announcement`
--

DROP TABLE IF EXISTS `announcements_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `site_wide` tinyint(1) NOT NULL,
  `members_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_announcement_685aee7` (`creator_id`),
  CONSTRAINT `creator_id_refs_id_1b56d8` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_announcement`
--

LOCK TABLES `announcements_announcement` WRITE;
/*!40000 ALTER TABLE `announcements_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can moderate comments',8,'can_moderate'),(26,'Can add comment flag',9,'add_commentflag'),(27,'Can change comment flag',9,'change_commentflag'),(28,'Can delete comment flag',9,'delete_commentflag'),(29,'Can add notice type',10,'add_noticetype'),(30,'Can change notice type',10,'change_noticetype'),(31,'Can delete notice type',10,'delete_noticetype'),(32,'Can add notice setting',11,'add_noticesetting'),(33,'Can change notice setting',11,'change_noticesetting'),(34,'Can delete notice setting',11,'delete_noticesetting'),(35,'Can add notice',12,'add_notice'),(36,'Can change notice',12,'change_notice'),(37,'Can delete notice',12,'delete_notice'),(38,'Can add notice queue batch',13,'add_noticequeuebatch'),(39,'Can change notice queue batch',13,'change_noticequeuebatch'),(40,'Can delete notice queue batch',13,'delete_noticequeuebatch'),(41,'Can add observed item',14,'add_observeditem'),(42,'Can change observed item',14,'change_observeditem'),(43,'Can delete observed item',14,'delete_observeditem'),(44,'Can add message',15,'add_message'),(45,'Can change message',15,'change_message'),(46,'Can delete message',15,'delete_message'),(47,'Can add don\'t send entry',16,'add_dontsendentry'),(48,'Can change don\'t send entry',16,'change_dontsendentry'),(49,'Can delete don\'t send entry',16,'delete_dontsendentry'),(50,'Can add message log',17,'add_messagelog'),(51,'Can change message log',17,'change_messagelog'),(52,'Can delete message log',17,'delete_messagelog'),(53,'Can add email address',18,'add_emailaddress'),(54,'Can change email address',18,'change_emailaddress'),(55,'Can delete email address',18,'delete_emailaddress'),(56,'Can add email confirmation',19,'add_emailconfirmation'),(57,'Can change email confirmation',19,'change_emailconfirmation'),(58,'Can delete email confirmation',19,'delete_emailconfirmation'),(59,'Can add announcement',20,'add_announcement'),(60,'Can change announcement',20,'change_announcement'),(61,'Can delete announcement',20,'delete_announcement'),(62,'Can add account',21,'add_account'),(63,'Can change account',21,'change_account'),(64,'Can delete account',21,'delete_account'),(65,'Can add password reset',22,'add_passwordreset'),(66,'Can change password reset',22,'change_passwordreset'),(67,'Can delete password reset',22,'delete_passwordreset'),(68,'Can add signup code',23,'add_signupcode'),(69,'Can change signup code',23,'change_signupcode'),(70,'Can delete signup code',23,'delete_signupcode'),(71,'Can add signup code result',24,'add_signupcoderesult'),(72,'Can change signup code result',24,'change_signupcoderesult'),(73,'Can delete signup code result',24,'delete_signupcoderesult'),(74,'Can add profile',25,'add_profile'),(75,'Can change profile',25,'change_profile'),(76,'Can delete profile',25,'delete_profile'),(77,'Can add cache key',26,'add_cachekey'),(78,'Can change cache key',26,'change_cachekey'),(79,'Can delete cache key',26,'delete_cachekey'),(80,'Can add source',27,'add_source'),(81,'Can change source',27,'change_source'),(82,'Can delete source',27,'delete_source'),(83,'Can add thumbnail',28,'add_thumbnail'),(84,'Can change thumbnail',28,'change_thumbnail'),(85,'Can delete thumbnail',28,'delete_thumbnail'),(86,'Can add Tag',29,'add_tag'),(87,'Can change Tag',29,'change_tag'),(88,'Can delete Tag',29,'delete_tag'),(89,'Can add Tagged Item',30,'add_taggeditem'),(90,'Can change Tagged Item',30,'change_taggeditem'),(91,'Can delete Tagged Item',30,'delete_taggeditem'),(92,'Can add room',31,'add_room'),(93,'Can change room',31,'change_room'),(94,'Can delete room',31,'delete_room'),(95,'Can add message',32,'add_message'),(96,'Can change message',32,'change_message'),(97,'Can delete message',32,'delete_message'),(98,'Can add nonce',33,'add_nonce'),(99,'Can change nonce',33,'change_nonce'),(100,'Can delete nonce',33,'delete_nonce'),(101,'Can add association',34,'add_association'),(102,'Can change association',34,'change_association'),(103,'Can delete association',34,'delete_association'),(104,'Can add user openid association',35,'add_useropenidassociation'),(105,'Can change user openid association',35,'change_useropenidassociation'),(106,'Can delete user openid association',35,'delete_useropenidassociation'),(107,'Can add site',36,'add_site'),(108,'Can change site',36,'change_site'),(109,'Can delete site',36,'delete_site'),(110,'Can add migration history',37,'add_migrationhistory'),(111,'Can change migration history',37,'change_migrationhistory'),(112,'Can delete migration history',37,'delete_migrationhistory'),(113,'Can add placeholder',38,'add_placeholder'),(114,'Can change placeholder',38,'change_placeholder'),(115,'Can delete placeholder',38,'delete_placeholder'),(116,'Can add cms plugin',39,'add_cmsplugin'),(117,'Can change cms plugin',39,'change_cmsplugin'),(118,'Can delete cms plugin',39,'delete_cmsplugin'),(119,'Can add page',40,'add_page'),(120,'Can change page',40,'change_page'),(121,'Can delete page',40,'delete_page'),(122,'Can view page',40,'view_page'),(123,'Can add PageModerator',41,'add_pagemoderator'),(124,'Can change PageModerator',41,'change_pagemoderator'),(125,'Can delete PageModerator',41,'delete_pagemoderator'),(126,'Can add Page moderator state',42,'add_pagemoderatorstate'),(127,'Can change Page moderator state',42,'change_pagemoderatorstate'),(128,'Can delete Page moderator state',42,'delete_pagemoderatorstate'),(129,'Can add Page global permission',43,'add_globalpagepermission'),(130,'Can change Page global permission',43,'change_globalpagepermission'),(131,'Can delete Page global permission',43,'delete_globalpagepermission'),(132,'Can add Page permission',44,'add_pagepermission'),(133,'Can change Page permission',44,'change_pagepermission'),(134,'Can delete Page permission',44,'delete_pagepermission'),(135,'Can add User (page)',45,'add_pageuser'),(136,'Can change User (page)',45,'change_pageuser'),(137,'Can delete User (page)',45,'delete_pageuser'),(138,'Can add User group (page)',46,'add_pageusergroup'),(139,'Can change User group (page)',46,'change_pageusergroup'),(140,'Can delete User group (page)',46,'delete_pageusergroup'),(141,'Can add title',47,'add_title'),(142,'Can change title',47,'change_title'),(143,'Can delete title',47,'delete_title'),(144,'Can add text',48,'add_text'),(145,'Can change text',48,'change_text'),(146,'Can delete text',48,'delete_text'),(147,'Can add picture',49,'add_picture'),(148,'Can change picture',49,'change_picture'),(149,'Can delete picture',49,'delete_picture'),(150,'Can add link',50,'add_link'),(151,'Can change link',50,'change_link'),(152,'Can delete link',50,'delete_link'),(153,'Can add file',51,'add_file'),(154,'Can change file',51,'change_file'),(155,'Can delete file',51,'delete_file'),(156,'Can add Snippet',52,'add_snippet'),(157,'Can change Snippet',52,'change_snippet'),(158,'Can delete Snippet',52,'delete_snippet'),(159,'Can add Snippet',53,'add_snippetptr'),(160,'Can change Snippet',53,'change_snippetptr'),(161,'Can delete Snippet',53,'delete_snippetptr'),(162,'Can add google map',54,'add_googlemap'),(163,'Can change google map',54,'change_googlemap'),(164,'Can delete google map',54,'delete_googlemap'),(165,'Can add season',55,'add_season'),(166,'Can change season',55,'change_season'),(167,'Can delete season',55,'delete_season'),(168,'Can add Event',56,'add_event'),(169,'Can change Event',56,'change_event'),(170,'Can delete Event',56,'delete_event'),(171,'Can add participation',57,'add_participation'),(172,'Can change participation',57,'change_participation'),(173,'Can delete participation',57,'delete_participation'),(174,'Can add event plugin',58,'add_eventplugin'),(175,'Can change event plugin',58,'change_eventplugin'),(176,'Can delete event plugin',58,'delete_eventplugin'),(177,'Can add event list plugin',59,'add_eventlistplugin'),(178,'Can change event list plugin',59,'change_eventlistplugin'),(179,'Can delete event list plugin',59,'delete_eventlistplugin');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'root','','','none@none.no','sha1$776af$2679d60ef10be68563e14215e5fbaec8e62e1e70',1,1,1,'2011-09-23 16:47:42','2011-09-23 16:45:57');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bcast_event`
--

DROP TABLE IF EXISTS `bcast_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bcast_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `transmission` tinyint(1) NOT NULL,
  `chat` tinyint(1) NOT NULL,
  `filebrowser` tinyint(1) NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `Season_id` int(11) NOT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bcast_event_459baa53` (`Season_id`),
  KEY `bcast_event_109d8a5f` (`room_id`),
  CONSTRAINT `room_id_refs_id_5a2bf588` FOREIGN KEY (`room_id`) REFERENCES `jqchat_room` (`id`),
  CONSTRAINT `Season_id_refs_id_2960cd75` FOREIGN KEY (`Season_id`) REFERENCES `bcast_season` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_event`
--

LOCK TABLES `bcast_event` WRITE;
/*!40000 ALTER TABLE `bcast_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `bcast_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bcast_participation`
--

DROP TABLE IF EXISTS `bcast_participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bcast_participation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_joined` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bcast_participation_403f60f` (`user_id`),
  KEY `bcast_participation_1647d06b` (`event_id`),
  CONSTRAINT `event_id_refs_id_930ad2a` FOREIGN KEY (`event_id`) REFERENCES `bcast_event` (`id`),
  CONSTRAINT `user_id_refs_id_328701f2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_participation`
--

LOCK TABLES `bcast_participation` WRITE;
/*!40000 ALTER TABLE `bcast_participation` DISABLE KEYS */;
/*!40000 ALTER TABLE `bcast_participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bcast_season`
--

DROP TABLE IF EXISTS `bcast_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bcast_season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_season`
--

LOCK TABLES `bcast_season` WRITE;
/*!40000 ALTER TABLE `bcast_season` DISABLE KEYS */;
/*!40000 ALTER TABLE `bcast_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cmsplugin`
--

DROP TABLE IF EXISTS `cms_cmsplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cmsplugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placeholder_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` smallint(5) unsigned DEFAULT NULL,
  `language` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_cmsplugin_3e35d7b0` (`placeholder_id`),
  KEY `cms_cmsplugin_63f17a16` (`parent_id`),
  KEY `cms_cmsplugin_75853655` (`language`),
  KEY `cms_cmsplugin_52f8f330` (`plugin_type`),
  KEY `cms_cmsplugin_2a8f42e8` (`level`),
  KEY `cms_cmsplugin_42b06ff6` (`lft`),
  KEY `cms_cmsplugin_6eabc1a6` (`rght`),
  KEY `cms_cmsplugin_102f80d8` (`tree_id`),
  CONSTRAINT `parent_id_refs_id_1f4cd5fd` FOREIGN KEY (`parent_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `placeholder_id_refs_id_209446bc` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cmsplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission`
--

DROP TABLE IF EXISTS `cms_globalpagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_moderate` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `can_recover_page` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_globalpagepermission_403f60f` (`user_id`),
  KEY `cms_globalpagepermission_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_4edd8708` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_ac9af97` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission`
--

LOCK TABLES `cms_globalpagepermission` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_globalpagepermission_sites`
--

DROP TABLE IF EXISTS `cms_globalpagepermission_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_globalpagepermission_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `globalpagepermission_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `globalpagepermission_id` (`globalpagepermission_id`,`site_id`),
  KEY `cms_globalpagepermission_sites_a21423f` (`globalpagepermission_id`),
  KEY `cms_globalpagepermission_sites_6223029` (`site_id`),
  CONSTRAINT `globalpagepermission_id_refs_id_2c730e06` FOREIGN KEY (`globalpagepermission_id`) REFERENCES `cms_globalpagepermission` (`id`),
  CONSTRAINT `site_id_refs_id_38dfe611` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_globalpagepermission_sites`
--

LOCK TABLES `cms_globalpagepermission_sites` WRITE;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_globalpagepermission_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `changed_by` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `changed_date` datetime NOT NULL,
  `publication_date` datetime DEFAULT NULL,
  `publication_end_date` datetime DEFAULT NULL,
  `in_navigation` tinyint(1) NOT NULL,
  `soft_root` tinyint(1) NOT NULL,
  `reverse_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `navigation_extenders` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `template` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `moderator_state` smallint(6) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `login_required` tinyint(1) NOT NULL,
  `limit_visibility_in_menu` smallint(6) DEFAULT NULL,
  `publisher_is_draft` tinyint(1) NOT NULL,
  `publisher_public_id` int(11) DEFAULT NULL,
  `publisher_state` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_public_id` (`publisher_public_id`),
  KEY `cms_page_63f17a16` (`parent_id`),
  KEY `cms_page_1199bb9e` (`publication_date`),
  KEY `cms_page_5dde019c` (`publication_end_date`),
  KEY `cms_page_3c0ea264` (`in_navigation`),
  KEY `cms_page_455d889d` (`soft_root`),
  KEY `cms_page_b56116b` (`reverse_id`),
  KEY `cms_page_267392ec` (`navigation_extenders`),
  KEY `cms_page_6223029` (`site_id`),
  KEY `cms_page_2a8f42e8` (`level`),
  KEY `cms_page_42b06ff6` (`lft`),
  KEY `cms_page_6eabc1a6` (`rght`),
  KEY `cms_page_102f80d8` (`tree_id`),
  KEY `cms_page_36f698d1` (`limit_visibility_in_menu`),
  KEY `cms_page_16d2d3fa` (`publisher_is_draft`),
  KEY `cms_page_5ffeb0a6` (`publisher_state`),
  CONSTRAINT `parent_id_refs_id_653a773` FOREIGN KEY (`parent_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `publisher_public_id_refs_id_653a773` FOREIGN KEY (`publisher_public_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `site_id_refs_id_128f08e6` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_placeholders`
--

DROP TABLE IF EXISTS `cms_page_placeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_placeholders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `placeholder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_id` (`page_id`,`placeholder_id`),
  KEY `cms_page_placeholders_32d04bc7` (`page_id`),
  KEY `cms_page_placeholders_3e35d7b0` (`placeholder_id`),
  CONSTRAINT `page_id_refs_id_4dd4551b` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `placeholder_id_refs_id_4f20b6a0` FOREIGN KEY (`placeholder_id`) REFERENCES `cms_placeholder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_page_placeholders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagemoderator`
--

DROP TABLE IF EXISTS `cms_pagemoderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagemoderator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `moderate_page` tinyint(1) NOT NULL,
  `moderate_children` tinyint(1) NOT NULL,
  `moderate_descendants` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagemoderator_32d04bc7` (`page_id`),
  KEY `cms_pagemoderator_403f60f` (`user_id`),
  CONSTRAINT `page_id_refs_id_6d4379fb` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `user_id_refs_id_3a8b1d7f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagemoderator`
--

LOCK TABLES `cms_pagemoderator` WRITE;
/*!40000 ALTER TABLE `cms_pagemoderator` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagemoderator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagemoderatorstate`
--

DROP TABLE IF EXISTS `cms_pagemoderatorstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagemoderatorstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `action` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagemoderatorstate_32d04bc7` (`page_id`),
  KEY `cms_pagemoderatorstate_403f60f` (`user_id`),
  CONSTRAINT `page_id_refs_id_b236163` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `user_id_refs_id_2808fb19` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagemoderatorstate`
--

LOCK TABLES `cms_pagemoderatorstate` WRITE;
/*!40000 ALTER TABLE `cms_pagemoderatorstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagemoderatorstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pagepermission`
--

DROP TABLE IF EXISTS `cms_pagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `can_change` tinyint(1) NOT NULL,
  `can_add` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `can_change_advanced_settings` tinyint(1) NOT NULL,
  `can_publish` tinyint(1) NOT NULL,
  `can_change_permissions` tinyint(1) NOT NULL,
  `can_move_page` tinyint(1) NOT NULL,
  `can_moderate` tinyint(1) NOT NULL,
  `can_view` tinyint(1) NOT NULL,
  `grant_on` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_pagepermission_403f60f` (`user_id`),
  KEY `cms_pagepermission_425ae3c4` (`group_id`),
  KEY `cms_pagepermission_32d04bc7` (`page_id`),
  CONSTRAINT `group_id_refs_id_2c9c6fcd` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `page_id_refs_id_2ce5c936` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `user_id_refs_id_4f0ab76c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagepermission`
--

LOCK TABLES `cms_pagepermission` WRITE;
/*!40000 ALTER TABLE `cms_pagepermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageuser`
--

DROP TABLE IF EXISTS `cms_pageuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageuser` (
  `user_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `cms_pageuser_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_16b8b1ea` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_ptr_id_refs_id_16b8b1ea` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageuser`
--

LOCK TABLES `cms_pageuser` WRITE;
/*!40000 ALTER TABLE `cms_pageuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pageusergroup`
--

DROP TABLE IF EXISTS `cms_pageusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_pageusergroup` (
  `group_ptr_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  KEY `cms_pageusergroup_4a21cf42` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_3dc63396` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_ptr_id_refs_id_661a1ca9` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pageusergroup`
--

LOCK TABLES `cms_pageusergroup` WRITE;
/*!40000 ALTER TABLE `cms_pageusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_pageusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_placeholder`
--

DROP TABLE IF EXISTS `cms_placeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_placeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slot` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `default_width` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_placeholder_400badfd` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_placeholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_title`
--

DROP TABLE IF EXISTS `cms_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_url_overwrite` tinyint(1) NOT NULL,
  `application_urls` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`,`page_id`),
  KEY `cms_title_75853655` (`language`),
  KEY `cms_title_56ae2a2a` (`slug`),
  KEY `cms_title_6a8a34e2` (`path`),
  KEY `cms_title_3d964e2e` (`has_url_overwrite`),
  KEY `cms_title_23b1fc68` (`application_urls`),
  KEY `cms_title_32d04bc7` (`page_id`),
  CONSTRAINT `page_id_refs_id_36799a1` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_eventlistplugin`
--

DROP TABLE IF EXISTS `cmsplugin_eventlistplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_eventlistplugin` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `size` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(11) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_30ae6dfd` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_eventlistplugin`
--

LOCK TABLES `cmsplugin_eventlistplugin` WRITE;
/*!40000 ALTER TABLE `cmsplugin_eventlistplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_eventlistplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_eventplugin`
--

DROP TABLE IF EXISTS `cmsplugin_eventplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_eventplugin` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_eventplugin_1647d06b` (`event_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_5ec5cfd` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `event_id_refs_id_a5fa1bf` FOREIGN KEY (`event_id`) REFERENCES `bcast_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_eventplugin`
--

LOCK TABLES `cmsplugin_eventplugin` WRITE;
/*!40000 ALTER TABLE `cmsplugin_eventplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_eventplugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_file`
--

DROP TABLE IF EXISTS `cmsplugin_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_file` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_3d6b97c1` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_file`
--

LOCK TABLES `cmsplugin_file` WRITE;
/*!40000 ALTER TABLE `cmsplugin_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_googlemap`
--

DROP TABLE IF EXISTS `cmsplugin_googlemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_googlemap` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `route_planer_title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_planer` tinyint(1) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_7f24597b` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_googlemap`
--

LOCK TABLES `cmsplugin_googlemap` WRITE;
/*!40000 ALTER TABLE `cmsplugin_googlemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_googlemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_link`
--

DROP TABLE IF EXISTS `cmsplugin_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_link` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `mailto` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_link_37c07cc5` (`page_link_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_617f46c9` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `page_link_id_refs_id_63526ef3` FOREIGN KEY (`page_link_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_link`
--

LOCK TABLES `cmsplugin_link` WRITE;
/*!40000 ALTER TABLE `cmsplugin_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_picture`
--

DROP TABLE IF EXISTS `cmsplugin_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_picture` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longdesc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `float` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_picture_37c07cc5` (`page_link_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_3f0eb5ec` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `page_link_id_refs_id_74758dc2` FOREIGN KEY (`page_link_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_picture`
--

LOCK TABLES `cmsplugin_picture` WRITE;
/*!40000 ALTER TABLE `cmsplugin_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_snippetptr`
--

DROP TABLE IF EXISTS `cmsplugin_snippetptr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_snippetptr` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `snippet_id` int(11) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_snippetptr_37e31bc4` (`snippet_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_3488e716` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `snippet_id_refs_id_570a9f83` FOREIGN KEY (`snippet_id`) REFERENCES `snippet_snippet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_snippetptr`
--

LOCK TABLES `cmsplugin_snippetptr` WRITE;
/*!40000 ALTER TABLE `cmsplugin_snippetptr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_snippetptr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_text`
--

DROP TABLE IF EXISTS `cmsplugin_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_text` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_175e936e` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_text`
--

LOCK TABLES `cmsplugin_text` WRITE;
/*!40000 ALTER TABLE `cmsplugin_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `flag` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `flag_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_403f60f` (`user_id`),
  KEY `django_comment_flags_64c238ac` (`comment_id`),
  KEY `django_comment_flags_111c90f9` (`flag`),
  CONSTRAINT `comment_id_refs_id_373a05f7` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `user_id_refs_id_603c4dcb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_pk` longtext COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `user_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `submit_date` datetime NOT NULL,
  `ip_address` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_1bb8f392` (`content_type_id`),
  KEY `django_comments_6223029` (`site_id`),
  KEY `django_comments_403f60f` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_d5868a5` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_7e9ddfef` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'comment','comments','comment'),(9,'comment flag','comments','commentflag'),(10,'notice type','notification','noticetype'),(11,'notice setting','notification','noticesetting'),(12,'notice','notification','notice'),(13,'notice queue batch','notification','noticequeuebatch'),(14,'observed item','notification','observeditem'),(15,'message','mailer','message'),(16,'don\'t send entry','mailer','dontsendentry'),(17,'message log','mailer','messagelog'),(18,'email address','emailconfirmation','emailaddress'),(19,'email confirmation','emailconfirmation','emailconfirmation'),(20,'announcement','announcements','announcement'),(21,'account','account','account'),(22,'password reset','account','passwordreset'),(23,'signup code','signup_codes','signupcode'),(24,'signup code result','signup_codes','signupcoderesult'),(25,'profile','profiles','profile'),(26,'cache key','menus','cachekey'),(27,'source','easy_thumbnails','source'),(28,'thumbnail','easy_thumbnails','thumbnail'),(29,'Tag','taggit','tag'),(30,'Tagged Item','taggit','taggeditem'),(31,'room','jqchat','room'),(32,'message','jqchat','message'),(33,'nonce','django_openid','nonce'),(34,'association','django_openid','association'),(35,'user openid association','django_openid','useropenidassociation'),(36,'site','sites','site'),(37,'migration history','south','migrationhistory'),(38,'placeholder','cms','placeholder'),(39,'cms plugin','cms','cmsplugin'),(40,'page','cms','page'),(41,'PageModerator','cms','pagemoderator'),(42,'Page moderator state','cms','pagemoderatorstate'),(43,'Page global permission','cms','globalpagepermission'),(44,'Page permission','cms','pagepermission'),(45,'User (page)','cms','pageuser'),(46,'User group (page)','cms','pageusergroup'),(47,'title','cms','title'),(48,'text','text','text'),(49,'picture','picture','picture'),(50,'link','link','link'),(51,'file','file','file'),(52,'Snippet','snippet','snippet'),(53,'Snippet','snippet','snippetptr'),(54,'google map','googlemap','googlemap'),(55,'season','bcast','season'),(56,'Event','bcast','event'),(57,'participation','bcast','participation'),(58,'event plugin','bcast','eventplugin'),(59,'event list plugin','bcast','eventlistplugin');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_association`
--

DROP TABLE IF EXISTS `django_openid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` longtext COLLATE utf8_unicode_ci NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_association`
--

LOCK TABLES `django_openid_association` WRITE;
/*!40000 ALTER TABLE `django_openid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_nonce`
--

DROP TABLE IF EXISTS `django_openid_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_nonce`
--

LOCK TABLES `django_openid_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_useropenidassociation`
--

DROP TABLE IF EXISTS `django_openid_useropenidassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_useropenidassociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_openid_useropenidassociation_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_7b6741ee` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_useropenidassociation`
--

LOCK TABLES `django_openid_useropenidassociation` WRITE;
/*!40000 ALTER TABLE `django_openid_useropenidassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_useropenidassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('87f1b1476463541283524a3f322e6a12','NTNmOTVjMTRiMjkxYTlkYjBkYWE5YzJhZWU3YTkzZGVmN2UzOGE1YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVTZwaW5heC5hcHBzLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNh\ndGlvbkJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=\n','2011-10-07 16:47:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_source`
--

DROP TABLE IF EXISTS `easy_thumbnails_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storage_hash` (`storage_hash`,`name`),
  KEY `easy_thumbnails_source_3a997c55` (`storage_hash`),
  KEY `easy_thumbnails_source_52094d6e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easy_thumbnails_thumbnail`
--

DROP TABLE IF EXISTS `easy_thumbnails_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easy_thumbnails_thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modified` datetime NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storage_hash` (`storage_hash`,`name`),
  KEY `easy_thumbnails_thumbnail_3a997c55` (`storage_hash`),
  KEY `easy_thumbnails_thumbnail_52094d6e` (`name`),
  KEY `easy_thumbnails_thumbnail_7607617b` (`source_id`),
  CONSTRAINT `source_id_refs_id_5bffe8f5` FOREIGN KEY (`source_id`) REFERENCES `easy_thumbnails_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailconfirmation_emailaddress`
--

DROP TABLE IF EXISTS `emailconfirmation_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailconfirmation_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`email`),
  KEY `emailconfirmation_emailaddress_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_91cf840` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfirmation_emailaddress`
--

LOCK TABLES `emailconfirmation_emailaddress` WRITE;
/*!40000 ALTER TABLE `emailconfirmation_emailaddress` DISABLE KEYS */;
INSERT INTO `emailconfirmation_emailaddress` VALUES (1,1,'none@none.no',1,1);
/*!40000 ALTER TABLE `emailconfirmation_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailconfirmation_emailconfirmation`
--

DROP TABLE IF EXISTS `emailconfirmation_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailconfirmation_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address_id` int(11) NOT NULL,
  `sent` datetime NOT NULL,
  `confirmation_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailconfirmation_emailconfirmation_1df9fea4` (`email_address_id`),
  CONSTRAINT `email_address_id_refs_id_344d8787` FOREIGN KEY (`email_address_id`) REFERENCES `emailconfirmation_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfirmation_emailconfirmation`
--

LOCK TABLES `emailconfirmation_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `emailconfirmation_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailconfirmation_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jqchat_message`
--

DROP TABLE IF EXISTS `jqchat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jqchat_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `event` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `unix_timestamp` double NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jqchat_message_403f60f` (`user_id`),
  KEY `jqchat_message_109d8a5f` (`room_id`),
  CONSTRAINT `room_id_refs_id_25d48e6a` FOREIGN KEY (`room_id`) REFERENCES `jqchat_room` (`id`),
  CONSTRAINT `user_id_refs_id_2b479529` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jqchat_message`
--

LOCK TABLES `jqchat_message` WRITE;
/*!40000 ALTER TABLE `jqchat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `jqchat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jqchat_room`
--

DROP TABLE IF EXISTS `jqchat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jqchat_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_modified` int(11) DEFAULT NULL,
  `last_activity` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jqchat_room_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_76ff6e66` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jqchat_room`
--

LOCK TABLES `jqchat_room` WRITE;
/*!40000 ALTER TABLE `jqchat_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `jqchat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailer_dontsendentry`
--

DROP TABLE IF EXISTS `mailer_dontsendentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailer_dontsendentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_address` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `when_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_dontsendentry`
--

LOCK TABLES `mailer_dontsendentry` WRITE;
/*!40000 ALTER TABLE `mailer_dontsendentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailer_dontsendentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailer_message`
--

DROP TABLE IF EXISTS `mailer_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailer_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `when_added` datetime NOT NULL,
  `priority` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_message`
--

LOCK TABLES `mailer_message` WRITE;
/*!40000 ALTER TABLE `mailer_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailer_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailer_messagelog`
--

DROP TABLE IF EXISTS `mailer_messagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailer_messagelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `when_added` datetime NOT NULL,
  `priority` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `when_attempted` datetime NOT NULL,
  `result` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `log_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_messagelog`
--

LOCK TABLES `mailer_messagelog` WRITE;
/*!40000 ALTER TABLE `mailer_messagelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailer_messagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_cachekey`
--

DROP TABLE IF EXISTS `menus_cachekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus_cachekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus_cachekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_notice`
--

DROP TABLE IF EXISTS `notification_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `unseen` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `on_site` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_notice_32f69dc` (`recipient_id`),
  KEY `notification_notice_6fe0a617` (`sender_id`),
  KEY `notification_notice_d734034` (`notice_type_id`),
  CONSTRAINT `notice_type_id_refs_id_212d5727` FOREIGN KEY (`notice_type_id`) REFERENCES `notification_noticetype` (`id`),
  CONSTRAINT `recipient_id_refs_id_690c45d1` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `sender_id_refs_id_690c45d1` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_notice`
--

LOCK TABLES `notification_notice` WRITE;
/*!40000 ALTER TABLE `notification_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_noticequeuebatch`
--

DROP TABLE IF EXISTS `notification_noticequeuebatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_noticequeuebatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickled_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_noticequeuebatch`
--

LOCK TABLES `notification_noticequeuebatch` WRITE;
/*!40000 ALTER TABLE `notification_noticequeuebatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_noticequeuebatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_noticesetting`
--

DROP TABLE IF EXISTS `notification_noticesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_noticesetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `medium` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `send` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`notice_type_id`,`medium`),
  KEY `notification_noticesetting_403f60f` (`user_id`),
  KEY `notification_noticesetting_d734034` (`notice_type_id`),
  CONSTRAINT `notice_type_id_refs_id_1024de5c` FOREIGN KEY (`notice_type_id`) REFERENCES `notification_noticetype` (`id`),
  CONSTRAINT `user_id_refs_id_8c53966` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_noticesetting`
--

LOCK TABLES `notification_noticesetting` WRITE;
/*!40000 ALTER TABLE `notification_noticesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_noticesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_noticetype`
--

DROP TABLE IF EXISTS `notification_noticetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_noticetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `default` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_noticetype`
--

LOCK TABLES `notification_noticetype` WRITE;
/*!40000 ALTER TABLE `notification_noticetype` DISABLE KEYS */;
INSERT INTO `notification_noticetype` VALUES (1,'announcement','Announcement','you have received an announcement',2);
/*!40000 ALTER TABLE `notification_noticetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_observeditem`
--

DROP TABLE IF EXISTS `notification_observeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_observeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `signal` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_observeditem_403f60f` (`user_id`),
  KEY `notification_observeditem_1bb8f392` (`content_type_id`),
  KEY `notification_observeditem_d734034` (`notice_type_id`),
  CONSTRAINT `content_type_id_refs_id_6c21f628` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notice_type_id_refs_id_4b098f3e` FOREIGN KEY (`notice_type_id`) REFERENCES `notification_noticetype` (`id`),
  CONSTRAINT `user_id_refs_id_7555f7d4` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_observeditem`
--

LOCK TABLES `notification_observeditem` WRITE;
/*!40000 ALTER TABLE `notification_observeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_observeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_profile`
--

DROP TABLE IF EXISTS `profiles_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `profiles_profile_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_2c67a130` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_profile`
--

LOCK TABLES `profiles_profile` WRITE;
/*!40000 ALTER TABLE `profiles_profile` DISABLE KEYS */;
INSERT INTO `profiles_profile` VALUES (1,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profiles_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_codes_signupcode`
--

DROP TABLE IF EXISTS `signup_codes_signupcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signup_codes_signupcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `max_uses` int(10) unsigned NOT NULL,
  `expiry` datetime DEFAULT NULL,
  `inviter_id` int(11) DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sent` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `use_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `signup_codes_signupcode_74fccd78` (`inviter_id`),
  CONSTRAINT `inviter_id_refs_id_d38433a` FOREIGN KEY (`inviter_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_codes_signupcode`
--

LOCK TABLES `signup_codes_signupcode` WRITE;
/*!40000 ALTER TABLE `signup_codes_signupcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_codes_signupcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_codes_signupcoderesult`
--

DROP TABLE IF EXISTS `signup_codes_signupcoderesult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signup_codes_signupcoderesult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signup_code_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `signup_codes_signupcoderesult_16afc873` (`signup_code_id`),
  KEY `signup_codes_signupcoderesult_403f60f` (`user_id`),
  CONSTRAINT `signup_code_id_refs_id_414a75ea` FOREIGN KEY (`signup_code_id`) REFERENCES `signup_codes_signupcode` (`id`),
  CONSTRAINT `user_id_refs_id_13a21fc7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_codes_signupcoderesult`
--

LOCK TABLES `signup_codes_signupcoderesult` WRITE;
/*!40000 ALTER TABLE `signup_codes_signupcoderesult` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_codes_signupcoderesult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippet_snippet`
--

DROP TABLE IF EXISTS `snippet_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippet_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snippet_snippet`
--

LOCK TABLES `snippet_snippet` WRITE;
/*!40000 ALTER TABLE `snippet_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `snippet_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'cms','0001_initial','2011-09-23 14:47:31'),(2,'picture','0001_initial','2011-09-23 14:47:31'),(3,'picture','0002_link_rename','2011-09-23 14:47:31'),(4,'picture','0003_freeze','2011-09-23 14:47:31'),(5,'cms','0002_auto_start','2011-09-23 14:47:31'),(6,'cms','0003_remove_placeholder','2011-09-23 14:47:31'),(7,'cms','0004_textobjects','2011-09-23 14:47:31'),(8,'cms','0005_mptt_added_to_plugins','2011-09-23 14:47:31'),(9,'cms','0006_apphook','2011-09-23 14:47:31'),(10,'cms','0007_apphook_longer','2011-09-23 14:47:31'),(11,'cms','0008_redirects','2011-09-23 14:47:31'),(12,'cms','0009_added_meta_fields','2011-09-23 14:47:31'),(13,'cms','0010_5char_language','2011-09-23 14:47:31'),(14,'cms','0011_title_overwrites','2011-09-23 14:47:31'),(15,'cms','0012_publisher','2011-09-23 14:47:31'),(16,'picture','0004_publisher','2011-09-23 14:47:31'),(17,'picture','0005_table_rename','2011-09-23 14:47:31'),(18,'text','0001_initial','2011-09-23 14:47:31'),(19,'text','0002_freeze','2011-09-23 14:47:31'),(20,'text','0003_publisher','2011-09-23 14:47:31'),(21,'snippet','0001_initial','2011-09-23 14:47:31'),(22,'snippet','0002_publisher','2011-09-23 14:47:31'),(23,'link','0001_initial','2011-09-23 14:47:31'),(24,'link','0002_link_rename','2011-09-23 14:47:31'),(25,'link','0003_page_link','2011-09-23 14:47:31'),(26,'link','0004_larger_link_names','2011-09-23 14:47:31'),(27,'link','0005_publisher','2011-09-23 14:47:31'),(28,'googlemap','0001_initial','2011-09-23 14:47:31'),(29,'file','0001_initial','2011-09-23 14:47:31'),(30,'file','0002_freeze','2011-09-23 14:47:31'),(31,'file','0003_publisher','2011-09-23 14:47:31'),(32,'cms','0013_site_copy','2011-09-23 14:47:31'),(33,'cms','0014_sites_removed','2011-09-23 14:47:31'),(34,'cms','0015_modified_by_added','2011-09-23 14:47:31'),(35,'cms','0016_author_copy','2011-09-23 14:47:31'),(36,'cms','0017_author_removed','2011-09-23 14:47:31'),(37,'cms','0018_site_permissions','2011-09-23 14:47:31'),(38,'cms','0019_public_table_renames','2011-09-23 14:47:31'),(39,'picture','0006_float_added','2011-09-23 14:47:31'),(40,'cms','0020_advanced_permissions','2011-09-23 14:47:31'),(41,'cms','0021_publisher2','2011-09-23 14:47:31'),(42,'cms','0022_login_required_added','2011-09-23 14:47:31'),(43,'cms','0023_plugin_table_naming_function_changed','2011-09-23 14:47:31'),(44,'cms','0024_added_placeholder_model','2011-09-23 14:47:31'),(45,'cms','0025_placeholder_migration','2011-09-23 14:47:31'),(46,'cms','0026_finish_placeholder_migration','2011-09-23 14:47:31'),(47,'cms','0027_added_width_to_placeholder','2011-09-23 14:47:31'),(48,'cms','0028_limit_visibility_in_menu_step1of3','2011-09-23 14:47:31'),(49,'cms','0029_limit_visibility_in_menu_step2of3_data','2011-09-23 14:47:31'),(50,'cms','0030_limit_visibility_in_menu_step3of3','2011-09-23 14:47:31'),(51,'cms','0031_improved_language_code_support','2011-09-23 14:47:31'),(52,'cms','0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis','2011-09-23 14:47:31'),(53,'cms','0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st','2011-09-23 14:47:31'),(54,'cms','0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel','2011-09-23 14:47:31'),(55,'cms','0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio','2011-09-23 14:47:31'),(56,'menus','0001_initial','2011-09-23 14:47:31'),(57,'text','0004_table_rename','2011-09-23 14:47:31'),(58,'text','0005_publisher2','2011-09-23 14:47:31'),(59,'text','0006_2_1_4_upgrade','2011-09-23 14:47:31'),(60,'picture','0007_publisher2','2011-09-23 14:47:31'),(61,'picture','0008_longdesc_added','2011-09-23 14:47:31'),(62,'link','0006_table_rename','2011-09-23 14:47:31'),(63,'link','0007_publisher2','2011-09-23 14:47:31'),(64,'link','0008_mailto','2011-09-23 14:47:31'),(65,'file','0004_table_rename','2011-09-23 14:47:31'),(66,'file','0005_publisher2','2011-09-23 14:47:31'),(67,'snippet','0003_table_rename','2011-09-23 14:47:31'),(68,'snippet','0004_publisher2','2011-09-23 14:47:31'),(69,'snippet','0005_template_added','2011-09-23 14:47:31'),(70,'googlemap','0002_table_rename','2011-09-23 14:47:31'),(71,'googlemap','0003_address_unified','2011-09-23 14:47:31'),(72,'googlemap','0004_copy_address','2011-09-23 14:47:31'),(73,'googlemap','0005_delete_street','2011-09-23 14:47:31'),(74,'googlemap','0006_publisher2','2011-09-23 14:47:31'),(75,'googlemap','0007_latlng','2011-09-23 14:47:31'),(76,'googlemap','0008_routeplaner','2011-09-23 14:47:31'),(77,'googlemap','0009_routeplaner_title','2011-09-23 14:47:31'),(78,'easy_thumbnails','0001_initial','2011-09-23 14:47:31'),(79,'easy_thumbnails','0002_filename_indexes','2011-09-23 14:47:31'),(80,'easy_thumbnails','0003_auto__add_storagenew','2011-09-23 14:47:31'),(81,'easy_thumbnails','0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new','2011-09-23 14:47:31'),(82,'easy_thumbnails','0005_storage_fks_null','2011-09-23 14:47:31'),(83,'easy_thumbnails','0006_copy_storage','2011-09-23 14:47:31'),(84,'easy_thumbnails','0007_storagenew_fks_not_null','2011-09-23 14:47:31'),(85,'easy_thumbnails','0008_auto__del_field_source_storage__del_field_thumbnail_storage','2011-09-23 14:47:31'),(86,'easy_thumbnails','0009_auto__del_storage','2011-09-23 14:47:31'),(87,'easy_thumbnails','0010_rename_storage','2011-09-23 14:47:31'),(88,'easy_thumbnails','0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash','2011-09-23 14:47:31'),(89,'easy_thumbnails','0012_build_storage_hashes','2011-09-23 14:47:31'),(90,'easy_thumbnails','0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora','2011-09-23 14:47:31'),(91,'easy_thumbnails','0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s','2011-09-23 14:47:31');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_3747b463` (`tag_id`),
  KEY `taggit_taggeditem_7d61c803` (`object_id`),
  KEY `taggit_taggeditem_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_5a2b7711` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `tag_id_refs_id_3781c07b` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-23 16:49:15
