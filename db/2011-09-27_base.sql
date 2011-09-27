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

#CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fresh` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES (1,1,'Europe/Zurich','en-us'),(2,2,'Europe/Zurich','en-us'),(3,3,'Europe/Zurich','en-us'),(4,4,'Europe/Zurich','en-us');
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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can moderate comments',8,'can_moderate'),(26,'Can add comment flag',9,'add_commentflag'),(27,'Can change comment flag',9,'change_commentflag'),(28,'Can delete comment flag',9,'delete_commentflag'),(29,'Can add notice type',10,'add_noticetype'),(30,'Can change notice type',10,'change_noticetype'),(31,'Can delete notice type',10,'delete_noticetype'),(32,'Can add notice setting',11,'add_noticesetting'),(33,'Can change notice setting',11,'change_noticesetting'),(34,'Can delete notice setting',11,'delete_noticesetting'),(35,'Can add notice',12,'add_notice'),(36,'Can change notice',12,'change_notice'),(37,'Can delete notice',12,'delete_notice'),(38,'Can add notice queue batch',13,'add_noticequeuebatch'),(39,'Can change notice queue batch',13,'change_noticequeuebatch'),(40,'Can delete notice queue batch',13,'delete_noticequeuebatch'),(41,'Can add observed item',14,'add_observeditem'),(42,'Can change observed item',14,'change_observeditem'),(43,'Can delete observed item',14,'delete_observeditem'),(44,'Can add message',15,'add_message'),(45,'Can change message',15,'change_message'),(46,'Can delete message',15,'delete_message'),(47,'Can add don\'t send entry',16,'add_dontsendentry'),(48,'Can change don\'t send entry',16,'change_dontsendentry'),(49,'Can delete don\'t send entry',16,'delete_dontsendentry'),(50,'Can add message log',17,'add_messagelog'),(51,'Can change message log',17,'change_messagelog'),(52,'Can delete message log',17,'delete_messagelog'),(53,'Can add email address',18,'add_emailaddress'),(54,'Can change email address',18,'change_emailaddress'),(55,'Can delete email address',18,'delete_emailaddress'),(56,'Can add email confirmation',19,'add_emailconfirmation'),(57,'Can change email confirmation',19,'change_emailconfirmation'),(58,'Can delete email confirmation',19,'delete_emailconfirmation'),(59,'Can add announcement',20,'add_announcement'),(60,'Can change announcement',20,'change_announcement'),(61,'Can delete announcement',20,'delete_announcement'),(62,'Can add account',21,'add_account'),(63,'Can change account',21,'change_account'),(64,'Can delete account',21,'delete_account'),(65,'Can add password reset',22,'add_passwordreset'),(66,'Can change password reset',22,'change_passwordreset'),(67,'Can delete password reset',22,'delete_passwordreset'),(68,'Can add signup code',23,'add_signupcode'),(69,'Can change signup code',23,'change_signupcode'),(70,'Can delete signup code',23,'delete_signupcode'),(71,'Can add signup code result',24,'add_signupcoderesult'),(72,'Can change signup code result',24,'change_signupcoderesult'),(73,'Can delete signup code result',24,'delete_signupcoderesult'),(74,'Can add profile',25,'add_profile'),(75,'Can change profile',25,'change_profile'),(76,'Can delete profile',25,'delete_profile'),(77,'Can add cache key',26,'add_cachekey'),(78,'Can change cache key',26,'change_cachekey'),(79,'Can delete cache key',26,'delete_cachekey'),(80,'Can add source',27,'add_source'),(81,'Can change source',27,'change_source'),(82,'Can delete source',27,'delete_source'),(83,'Can add thumbnail',28,'add_thumbnail'),(84,'Can change thumbnail',28,'change_thumbnail'),(85,'Can delete thumbnail',28,'delete_thumbnail'),(86,'Can add Tag',29,'add_tag'),(87,'Can change Tag',29,'change_tag'),(88,'Can delete Tag',29,'delete_tag'),(89,'Can add Tagged Item',30,'add_taggeditem'),(90,'Can change Tagged Item',30,'change_taggeditem'),(91,'Can delete Tagged Item',30,'delete_taggeditem'),(92,'Can add room',31,'add_room'),(93,'Can change room',31,'change_room'),(94,'Can delete room',31,'delete_room'),(95,'Can add message',32,'add_message'),(96,'Can change message',32,'change_message'),(97,'Can delete message',32,'delete_message'),(98,'Can add nonce',33,'add_nonce'),(99,'Can change nonce',33,'change_nonce'),(100,'Can delete nonce',33,'delete_nonce'),(101,'Can add association',34,'add_association'),(102,'Can change association',34,'change_association'),(103,'Can delete association',34,'delete_association'),(104,'Can add user openid association',35,'add_useropenidassociation'),(105,'Can change user openid association',35,'change_useropenidassociation'),(106,'Can delete user openid association',35,'delete_useropenidassociation'),(107,'Can add site',36,'add_site'),(108,'Can change site',36,'change_site'),(109,'Can delete site',36,'delete_site'),(110,'Can add migration history',37,'add_migrationhistory'),(111,'Can change migration history',37,'change_migrationhistory'),(112,'Can delete migration history',37,'delete_migrationhistory'),(113,'Can add placeholder',38,'add_placeholder'),(114,'Can change placeholder',38,'change_placeholder'),(115,'Can delete placeholder',38,'delete_placeholder'),(116,'Can add cms plugin',39,'add_cmsplugin'),(117,'Can change cms plugin',39,'change_cmsplugin'),(118,'Can delete cms plugin',39,'delete_cmsplugin'),(119,'Can add page',40,'add_page'),(120,'Can change page',40,'change_page'),(121,'Can delete page',40,'delete_page'),(122,'Can view page',40,'view_page'),(123,'Can add PageModerator',41,'add_pagemoderator'),(124,'Can change PageModerator',41,'change_pagemoderator'),(125,'Can delete PageModerator',41,'delete_pagemoderator'),(126,'Can add Page moderator state',42,'add_pagemoderatorstate'),(127,'Can change Page moderator state',42,'change_pagemoderatorstate'),(128,'Can delete Page moderator state',42,'delete_pagemoderatorstate'),(129,'Can add Page global permission',43,'add_globalpagepermission'),(130,'Can change Page global permission',43,'change_globalpagepermission'),(131,'Can delete Page global permission',43,'delete_globalpagepermission'),(132,'Can add Page permission',44,'add_pagepermission'),(133,'Can change Page permission',44,'change_pagepermission'),(134,'Can delete Page permission',44,'delete_pagepermission'),(135,'Can add User (page)',45,'add_pageuser'),(136,'Can change User (page)',45,'change_pageuser'),(137,'Can delete User (page)',45,'delete_pageuser'),(138,'Can add User group (page)',46,'add_pageusergroup'),(139,'Can change User group (page)',46,'change_pageusergroup'),(140,'Can delete User group (page)',46,'delete_pageusergroup'),(141,'Can add title',47,'add_title'),(142,'Can change title',47,'change_title'),(143,'Can delete title',47,'delete_title'),(144,'Can add text',48,'add_text'),(145,'Can change text',48,'change_text'),(146,'Can delete text',48,'delete_text'),(147,'Can add picture',49,'add_picture'),(148,'Can change picture',49,'change_picture'),(149,'Can delete picture',49,'delete_picture'),(150,'Can add link',50,'add_link'),(151,'Can change link',50,'change_link'),(152,'Can delete link',50,'delete_link'),(153,'Can add file',51,'add_file'),(154,'Can change file',51,'change_file'),(155,'Can delete file',51,'delete_file'),(156,'Can add Snippet',52,'add_snippet'),(157,'Can change Snippet',52,'change_snippet'),(158,'Can delete Snippet',52,'delete_snippet'),(159,'Can add Snippet',53,'add_snippetptr'),(160,'Can change Snippet',53,'change_snippetptr'),(161,'Can delete Snippet',53,'delete_snippetptr'),(162,'Can add google map',54,'add_googlemap'),(163,'Can change google map',54,'change_googlemap'),(164,'Can delete google map',54,'delete_googlemap'),(165,'Can add season',55,'add_season'),(166,'Can change season',55,'change_season'),(167,'Can delete season',55,'delete_season'),(168,'Can add Event',56,'add_event'),(169,'Can change Event',56,'change_event'),(170,'Can delete Event',56,'delete_event'),(171,'Can add participation',57,'add_participation'),(172,'Can change participation',57,'change_participation'),(173,'Can delete participation',57,'delete_participation'),(174,'Can add event plugin',58,'add_eventplugin'),(175,'Can change event plugin',58,'change_eventplugin'),(176,'Can delete event plugin',58,'delete_eventplugin'),(177,'Can add event list plugin',59,'add_eventlistplugin'),(178,'Can change event list plugin',59,'change_eventlistplugin'),(179,'Can delete event list plugin',59,'delete_eventlistplugin'),(180,'Can add facebook profile',60,'add_facebookprofile'),(181,'Can change facebook profile',60,'change_facebookprofile'),(182,'Can delete facebook profile',60,'delete_facebookprofile'),(183,'Can add participants plugin',61,'add_participantsplugin'),(184,'Can change participants plugin',61,'change_participantsplugin'),(185,'Can delete participants plugin',61,'delete_participantsplugin'),(186,'Can add folder',62,'add_folder'),(187,'Can change folder',62,'change_folder'),(188,'Can delete folder',62,'delete_folder'),(189,'Can use directory listing',62,'can_use_directory_listing'),(190,'Can add Folder Permission',63,'add_folderpermission'),(191,'Can change Folder Permission',63,'change_folderpermission'),(192,'Can delete Folder Permission',63,'delete_folderpermission'),(193,'Can add File',64,'add_file'),(194,'Can change File',64,'change_file'),(195,'Can delete File',64,'delete_file'),(196,'Can add Image',65,'add_image'),(197,'Can change Image',65,'change_image'),(198,'Can delete Image',65,'delete_image'),(199,'Can add Clipboard',66,'add_clipboard'),(200,'Can change Clipboard',66,'change_clipboard'),(201,'Can delete Clipboard',66,'delete_clipboard'),(202,'Can add Clipboard item',67,'add_clipboarditem'),(203,'Can change Clipboard item',67,'change_clipboarditem'),(204,'Can delete Clipboard item',67,'delete_clipboarditem'),(205,'Can add filer file',68,'add_filerfile'),(206,'Can change filer file',68,'change_filerfile'),(207,'Can delete filer file',68,'delete_filerfile'),(208,'Can add filer folder',69,'add_filerfolder'),(209,'Can change filer folder',69,'change_filerfolder'),(210,'Can delete filer folder',69,'delete_filerfolder');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'root','','','none@none.no','sha1$776af$2679d60ef10be68563e14215e5fbaec8e62e1e70',1,1,1,'2011-09-25 20:48:20','2011-09-23 16:45:57'),(2,'user','','','jonas@anorg.net','sha1$a3438$2aad871327c7a36a133d59cc79d22af2d07a885d',0,1,0,'2011-09-25 21:20:35','2011-09-25 13:29:15'),(3,'jonas.ohrstrom','Jonas','Ohrstrom','jonas@anorg.net','!',0,1,0,'2011-09-25 15:44:29','2011-09-25 14:14:04'),(4,'john','','','lennon@thebeatles.com','sha1$6c859$9526df29735a88123181cfb22a53c24f2bb842a6',0,1,0,'2011-09-25 15:58:06','2011-09-25 15:58:06');
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
  `room_id` int(11) DEFAULT NULL,
  `location` varchar(200) COLLATE utf8_unicode_ci,
  `picture_id` int(11),
  `intro_id` int(11),
  `folder_id` int(11),
  PRIMARY KEY (`id`),
  KEY `bcast_event_459baa53` (`Season_id`),
  KEY `bcast_event_109d8a5f` (`room_id`),
  KEY `bcast_event_4e1a3051` (`picture_id`),
  KEY `bcast_event_31b9dac5` (`intro_id`),
  KEY `bcast_event_4e5f642` (`folder_id`),
  CONSTRAINT `folder_id_refs_id_68a1496b` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`),
  CONSTRAINT `intro_id_refs_id_12619c3b` FOREIGN KEY (`intro_id`) REFERENCES `filer_file` (`id`),
  CONSTRAINT `picture_id_refs_file_ptr_id_107632df` FOREIGN KEY (`picture_id`) REFERENCES `filer_image` (`file_ptr_id`),
  CONSTRAINT `room_id_refs_id_5a2bf588` FOREIGN KEY (`room_id`) REFERENCES `jqchat_room` (`id`),
  CONSTRAINT `Season_id_refs_id_2960cd75` FOREIGN KEY (`Season_id`) REFERENCES `bcast_season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_event`
--

LOCK TABLES `bcast_event` WRITE;
/*!40000 ALTER TABLE `bcast_event` DISABLE KEYS */;
INSERT INTO `bcast_event` VALUES (1,'EVENT---A','ksjhgdkjagsd a','2011-09-24 17:45:39','2011-09-24 19:45:39','2011-09-23 17:46:30','2011-09-27 13:45:26',1,1,1,'2011-09-24_event-a','show',1,1,'Dock18',NULL,NULL,7),(2,'EVENT---B','asdhagdsjahgsdj','2011-09-27 18:09:21','2011-09-27 18:09:21','2011-09-23 18:09:31','2011-09-27 13:04:09',1,1,1,'2011-09-27_event-b','workshop',1,1,'Dock18',NULL,NULL,NULL),(3,'EVENT--NOW','','2011-09-25 18:48:42','2011-10-25 20:48:48','2011-09-25 20:49:02','2011-09-25 21:33:40',1,1,1,'2011-09-25_event-now','show',1,2,'Dock18',NULL,NULL,NULL),(4,'Event Today','asdasdadsads','2011-09-26 18:00:00','2011-09-27 04:00:00','2011-09-26 14:13:09','2011-09-26 14:13:09',1,1,1,'2011-09-26_event-today','show',1,1,'Dock18',NULL,NULL,NULL);
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
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bcast_participation_403f60f` (`user_id`),
  KEY `bcast_participation_1647d06b` (`event_id`),
  CONSTRAINT `event_id_refs_id_930ad2a` FOREIGN KEY (`event_id`) REFERENCES `bcast_event` (`id`),
  CONSTRAINT `user_id_refs_id_328701f2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_participation`
--

LOCK TABLES `bcast_participation` WRITE;
/*!40000 ALTER TABLE `bcast_participation` DISABLE KEYS */;
INSERT INTO `bcast_participation` VALUES (1,3,1,'2011-09-25 16:24:07'),(2,2,1,'2011-09-25 16:24:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_season`
--

LOCK TABLES `bcast_season` WRITE;
/*!40000 ALTER TABLE `bcast_season` DISABLE KEYS */;
INSERT INTO `bcast_season` VALUES (1,'asdasda','2011-09-23 17:46:09','2011-09-23 17:46:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
INSERT INTO `cms_cmsplugin` VALUES (1,3,NULL,0,'en','EventListingPlugin','2011-09-23 17:46:56',0,1,2,1),(4,9,NULL,0,'en','EventPlugin','2011-09-23 18:10:00',0,1,2,2),(5,12,NULL,0,'en','EventPlugin','2011-09-23 18:10:14',0,1,2,3),(7,15,NULL,0,'en','EventPlugin','2011-09-25 20:49:49',0,1,2,4),(8,18,NULL,0,'en','EventPlugin','2011-09-25 20:49:49',0,1,2,5),(9,18,NULL,1,'en','FilerFolderPlugin','2011-09-26 18:31:38',0,1,2,6),(12,21,NULL,1,'en','TextPlugin','2011-09-26 19:46:52',0,1,2,8),(13,21,NULL,2,'en','EventPlugin','2011-09-26 19:51:05',0,1,2,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'root','root',NULL,'2011-09-23 17:46:49','2011-09-23 17:47:06','2011-09-23 17:47:06',NULL,1,0,NULL,'',1,'layout/1col.html',1,0,0,1,2,1,0,NULL,1,NULL,1),(2,'root','root',NULL,'2011-09-23 18:07:58','2011-09-23 18:12:58','2011-09-23 18:12:31',NULL,1,0,'events','',1,'layout/1col.html',1,0,0,1,10,2,0,NULL,1,NULL,1),(3,'root','root',2,'2011-09-23 18:08:16','2011-09-25 16:43:00','2011-09-23 18:12:31',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,2,3,2,0,NULL,1,NULL,1),(4,'root','root',2,'2011-09-23 18:08:33','2011-09-23 18:12:32','2011-09-23 18:12:32',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,4,5,2,0,NULL,1,NULL,1),(5,'root','root',2,'2011-09-25 20:49:42','2011-09-25 20:50:04','2011-09-25 20:50:04',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,6,7,2,0,NULL,1,NULL,1),(6,'root','root',2,'2011-09-26 14:13:26','2011-09-26 20:17:51','2011-09-25 20:50:04',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,8,9,2,0,NULL,1,NULL,1),(7,'script','root',NULL,'2011-09-26 19:45:22','2011-09-26 20:17:56','2011-09-26 20:17:56',NULL,1,0,NULL,NULL,1,'layout/1col.html',1,0,0,1,2,3,0,NULL,1,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
INSERT INTO `cms_page_placeholders` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9),(10,4,10),(11,4,11),(12,4,12),(13,5,13),(14,5,14),(15,5,15),(16,6,16),(17,6,17),(18,6,18),(19,7,19),(20,7,20),(21,7,21);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pagemoderatorstate`
--

LOCK TABLES `cms_pagemoderatorstate` WRITE;
/*!40000 ALTER TABLE `cms_pagemoderatorstate` DISABLE KEYS */;
INSERT INTO `cms_pagemoderatorstate` VALUES (1,6,1,'2011-09-26 14:13:26','CHA','Page was copied.');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
INSERT INTO `cms_placeholder` VALUES (1,'body_content',NULL),(2,'template_footer',NULL),(3,'template_1_content_a',NULL),(4,'body_content',NULL),(5,'template_footer',NULL),(6,'template_1_content_a',NULL),(7,'body_content',NULL),(8,'template_footer',NULL),(9,'template_1_content_a',NULL),(10,'body_content',NULL),(11,'template_footer',NULL),(12,'template_1_content_a',NULL),(13,'body_content',NULL),(14,'template_footer',NULL),(15,'template_1_content_a',NULL),(16,'body_content',NULL),(17,'template_footer',NULL),(18,'template_1_content_a',NULL),(19,'body_content',NULL),(20,'template_footer',NULL),(21,'template_1_content_a',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
INSERT INTO `cms_title` VALUES (1,'en','Dock18 Home','','dock18-home','',0,'','','','','',1,'2011-09-23 17:46:49'),(2,'en','Veranstaltungen','','veranstaltungen','veranstaltungen',0,'','','','','',2,'2011-09-23 18:07:58'),(3,'en','Test 1','','test-1','veranstaltungen/test-1',0,'','','','','',3,'2011-09-23 18:08:16'),(4,'en','Test 2','','test-2','veranstaltungen/test-2',0,'','','','','',4,'2011-09-23 18:08:33'),(5,'en','Test Event | +\"*ç%&/()=?','','test-event-c','veranstaltungen/test-event-c',0,'','','','','',5,'2011-09-25 20:49:42'),(6,'en','Test Event | should be today','','today-event','veranstaltungen/today-event',0,'','','','','',6,'2011-09-25 20:49:42'),(7,'en','My Page',NULL,'my-page','my-page',0,NULL,NULL,NULL,NULL,NULL,7,'2011-09-26 19:45:22');
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
INSERT INTO `cmsplugin_eventlistplugin` VALUES (1,'m',10);
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
INSERT INTO `cmsplugin_eventplugin` VALUES (4,1),(13,1),(5,2),(7,3),(8,4);
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
-- Table structure for table `cmsplugin_filerfile`
--

DROP TABLE IF EXISTS `cmsplugin_filerfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_filerfile` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_filerfile_2243e3be` (`file_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_61b717d2` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `file_id_refs_id_37fcf12c` FOREIGN KEY (`file_id`) REFERENCES `filer_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_filerfile`
--

LOCK TABLES `cmsplugin_filerfile` WRITE;
/*!40000 ALTER TABLE `cmsplugin_filerfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_filerfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_filerfolder`
--

DROP TABLE IF EXISTS `cmsplugin_filerfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_filerfolder` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_option` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'list',
  `folder_id` int(11) NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_filerfolder_4e5f642` (`folder_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_4c50eb22` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `folder_id_refs_id_46416074` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_filerfolder`
--

LOCK TABLES `cmsplugin_filerfolder` WRITE;
/*!40000 ALTER TABLE `cmsplugin_filerfolder` DISABLE KEYS */;
INSERT INTO `cmsplugin_filerfolder` VALUES (9,'','list',1);
/*!40000 ALTER TABLE `cmsplugin_filerfolder` ENABLE KEYS */;
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
-- Table structure for table `cmsplugin_participantsplugin`
--

DROP TABLE IF EXISTS `cmsplugin_participantsplugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_participantsplugin` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '8',
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_3a7519e` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_participantsplugin`
--

LOCK TABLES `cmsplugin_participantsplugin` WRITE;
/*!40000 ALTER TABLE `cmsplugin_participantsplugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_participantsplugin` ENABLE KEYS */;
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
INSERT INTO `cmsplugin_text` VALUES (12,'hello world');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-09-23 17:46:14',1,55,'1','asdasda',1,''),(2,'2011-09-23 17:46:23',1,31,'1','chatroom',1,''),(3,'2011-09-23 17:46:30',1,56,'1','asdasdjhag kjsdg akjshdg akjg',1,''),(4,'2011-09-23 17:46:49',1,40,'1','Dock18 Home',1,''),(5,'2011-09-23 17:47:01',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(6,'2011-09-23 17:47:06',1,40,'1','Dock18 Home',2,'Changed published, in_navigation, language and moderator_state.'),(7,'2011-09-23 18:07:58',1,40,'2','Veranstaltungen',1,''),(8,'2011-09-23 18:08:16',1,40,'3','Test 1',1,''),(9,'2011-09-23 18:08:33',1,40,'4','Test 2',1,''),(10,'2011-09-23 18:08:59',1,56,'1','EVENT---A',2,'Changed title, tags, date_start and date_end.'),(11,'2011-09-23 18:09:31',1,56,'2','EVENT---B',1,''),(12,'2011-09-23 18:10:06',1,40,'3','Test 1',2,'Changed language and moderator_state.'),(13,'2011-09-23 18:10:19',1,40,'4','Test 2',2,'Changed language and moderator_state.'),(14,'2011-09-23 18:12:58',1,40,'2','Veranstaltungen',2,'Changed reverse_id, language and moderator_state.'),(15,'2011-09-23 18:14:57',1,32,'1','root, 1316794497.23',1,''),(16,'2011-09-23 18:15:13',1,32,'2','root, 1316794513.52',1,''),(17,'2011-09-25 16:40:15',1,40,'3','Test 1',2,'Changed language and moderator_state.'),(18,'2011-09-25 16:43:00',1,40,'3','Test 1',2,'Changed language and moderator_state.'),(19,'2011-09-25 17:30:52',1,56,'1','EVENT---A',2,'Changed tags.'),(20,'2011-09-25 17:45:58',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(21,'2011-09-25 17:53:00',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(22,'2011-09-25 17:53:12',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(23,'2011-09-25 17:53:53',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(24,'2011-09-25 17:54:01',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(25,'2011-09-25 20:00:33',1,56,'1','EVENT---A',2,'Changed tags and picture.'),(26,'2011-09-25 20:49:00',1,31,'2','blank',1,''),(27,'2011-09-25 20:49:02',1,56,'3','EVENT--NOW',1,''),(28,'2011-09-25 20:49:42',1,40,'5','Test Event | +\"*ç%&/()=?',1,''),(29,'2011-09-25 20:49:55',1,40,'5','Test Event | +\"*ç%&/()=?',2,'Changed language and moderator_state.'),(30,'2011-09-25 20:51:31',1,56,'3','EVENT--NOW',2,'Changed tags and date_start.'),(31,'2011-09-25 21:33:40',1,56,'3','EVENT--NOW',2,'Changed tags and date_start.'),(32,'2011-09-26 14:13:09',1,56,'4','Event Today',1,''),(33,'2011-09-26 14:14:00',1,40,'6','Test Event | +\"*ç%&/()=?',2,'Changed title, slug, language and moderator_state.'),(34,'2011-09-26 18:32:53',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(35,'2011-09-26 18:33:16',1,63,'1','Folder: \'test\'->all items [can_edit, can_read, can_add_children] []',1,''),(36,'2011-09-26 18:33:19',1,63,'1','Folder: \'test\'->all items [can_edit, can_read, can_add_children] []',2,'No fields changed.'),(37,'2011-09-26 18:54:10',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(38,'2011-09-26 19:27:10',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(39,'2011-09-26 19:27:46',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(40,'2011-09-26 19:34:54',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(41,'2011-09-26 19:58:30',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(42,'2011-09-26 19:58:50',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(43,'2011-09-26 20:17:51',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(44,'2011-09-27 12:04:20',1,56,'2','EVENT---B',2,'Changed tags and picture.'),(45,'2011-09-27 12:10:50',1,56,'2','EVENT---B',2,'Changed tags and picture.'),(46,'2011-09-27 12:25:58',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(47,'2011-09-27 12:32:59',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(48,'2011-09-27 12:35:14',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(49,'2011-09-27 12:35:23',1,56,'2','EVENT---B',2,'Changed tags and picture.'),(50,'2011-09-27 12:37:54',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(51,'2011-09-27 13:04:09',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(52,'2011-09-27 13:31:45',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(53,'2011-09-27 13:37:37',1,56,'1','EVENT---A',2,'Changed tags.'),(54,'2011-09-27 13:37:46',1,56,'1','EVENT---A',2,'Changed tags.'),(55,'2011-09-27 13:39:32',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(56,'2011-09-27 13:39:37',1,56,'1','EVENT---A',2,'Changed tags.'),(57,'2011-09-27 13:41:32',1,56,'1','EVENT---A',2,'Changed tags.'),(58,'2011-09-27 13:41:40',1,56,'1','EVENT---A',2,'Changed tags.'),(59,'2011-09-27 13:41:45',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(60,'2011-09-27 13:45:26',1,56,'1','EVENT---A',2,'Changed tags.');
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'comment','comments','comment'),(9,'comment flag','comments','commentflag'),(10,'notice type','notification','noticetype'),(11,'notice setting','notification','noticesetting'),(12,'notice','notification','notice'),(13,'notice queue batch','notification','noticequeuebatch'),(14,'observed item','notification','observeditem'),(15,'message','mailer','message'),(16,'don\'t send entry','mailer','dontsendentry'),(17,'message log','mailer','messagelog'),(18,'email address','emailconfirmation','emailaddress'),(19,'email confirmation','emailconfirmation','emailconfirmation'),(20,'announcement','announcements','announcement'),(21,'account','account','account'),(22,'password reset','account','passwordreset'),(23,'signup code','signup_codes','signupcode'),(24,'signup code result','signup_codes','signupcoderesult'),(25,'profile','profiles','profile'),(26,'cache key','menus','cachekey'),(27,'source','easy_thumbnails','source'),(28,'thumbnail','easy_thumbnails','thumbnail'),(29,'Tag','taggit','tag'),(30,'Tagged Item','taggit','taggeditem'),(31,'room','jqchat','room'),(32,'message','jqchat','message'),(33,'nonce','django_openid','nonce'),(34,'association','django_openid','association'),(35,'user openid association','django_openid','useropenidassociation'),(36,'site','sites','site'),(37,'migration history','south','migrationhistory'),(38,'placeholder','cms','placeholder'),(39,'cms plugin','cms','cmsplugin'),(40,'page','cms','page'),(41,'PageModerator','cms','pagemoderator'),(42,'Page moderator state','cms','pagemoderatorstate'),(43,'Page global permission','cms','globalpagepermission'),(44,'Page permission','cms','pagepermission'),(45,'User (page)','cms','pageuser'),(46,'User group (page)','cms','pageusergroup'),(47,'title','cms','title'),(48,'text','text','text'),(49,'picture','picture','picture'),(50,'link','link','link'),(51,'file','file','file'),(52,'Snippet','snippet','snippet'),(53,'Snippet','snippet','snippetptr'),(54,'google map','googlemap','googlemap'),(55,'season','bcast','season'),(56,'Event','bcast','event'),(57,'participation','bcast','participation'),(58,'event plugin','bcast','eventplugin'),(59,'event list plugin','bcast','eventlistplugin'),(60,'facebook profile','facebook','facebookprofile'),(61,'participants plugin','bcast','participantsplugin'),(62,'folder','filer','folder'),(63,'Folder Permission','filer','folderpermission'),(64,'File','filer','file'),(65,'Image','filer','image'),(66,'Clipboard','filer','clipboard'),(67,'Clipboard item','filer','clipboarditem'),(68,'filer file','cmsplugin_filer_file','filerfile'),(69,'filer folder','cmsplugin_filer_folder','filerfolder');
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
INSERT INTO `django_session` VALUES ('0fb995c9176da0d0919c4b60c4566c09','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 20:31:30'),('171494fa8c02e1931e331003028cbb6f','MDI1M2M1Mjk1MmIwM2ZhMTRiZmQ5NjIxMzFiNTA2NDBlZmZhNDQ4ZTqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQJV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-10-09 21:20:36'),('19d1d574acd564bf3817a13075a535c1','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 11:17:13'),('1eb5e6300a8ba8d7ba30e86e20663fcb','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 13:28:43'),('344733094eefd55e4a0f91c4763b08f9','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 20:31:30'),('47e65914d68a1b93d0932b6e60f25001','NjBlOTcxOTZjNDI1YzMzZDI5Y2Q3YTg5MjUxOTFkYmJlNTEwYjI1ODqAAn1xAShVDmNtc19hZG1p\nbl9zaXRlcQKKAQFVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28uY29udHJpYi5hdXRoLmJh\nY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQF1Lg==\n','2011-10-11 13:45:26'),('87f1b1476463541283524a3f322e6a12','NTNmOTVjMTRiMjkxYTlkYjBkYWE5YzJhZWU3YTkzZGVmN2UzOGE1YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVTZwaW5heC5hcHBzLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNh\ndGlvbkJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=\n','2011-10-07 16:47:42'),('ccbb58ece72b6c5c8c7c1423a1b88a97','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 20:31:30'),('f6f48fcfc2dd49e983e3f04bbb7a50f6','NmEyN2NlYmE2YzRhYjVmYTE2Yjk2M2IxYmM5YTI1OTA4NDkyY2ZjODqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVDV9hdXRoX3VzZXJfaWRxA4oBAlUSX2F1dGhfdXNl\ncl9iYWNrZW5kcQRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQV1\nLg==\n','2011-10-09 13:29:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_source` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','pictures/R-1624927-1242546064.jpg','2011-09-25 20:00:33'),(2,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg','2011-09-26 18:53:22'),(3,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg','2011-09-26 18:53:23'),(4,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg','2011-09-26 18:53:25'),(5,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/jonas_ohrstrom-0g48cv7jxl7qjvhsr6lo.pdf','2011-09-26 18:56:19'),(6,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/jonas_ohrstrom-utkp9duixiuqhpo1or41.pdf','2011-09-26 18:56:19'),(7,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/movie_on_9-25-11_at_542_pm.mov','2011-09-27 12:32:42'),(8,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/movie_on_9-25-11_at_542_pm_1.mov','2011-09-27 14:15:50'),(9,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/desktop.ini','2011-09-27 14:16:00'),(10,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg','2011-09-27 14:16:00'),(11,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg','2011-09-27 14:16:09'),(12,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg','2011-09-27 14:22:10'),(13,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg','2011-09-27 14:22:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_thumbnail` VALUES (1,'d26becbf46ac48eda79c7a39a13a02dd','pictures/R-1624927-1242546064.jpg.80x80_q80_crop.jpg','2011-09-25 20:00:42',1),(2,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__16x16_q80_crop_upscale.jpg','2011-09-26 18:53:22',2),(3,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__32x32_q80_crop_upscale.jpg','2011-09-26 18:53:22',2),(4,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__48x48_q80_crop_upscale.jpg','2011-09-26 18:53:23',2),(5,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__64x64_q80_crop_upscale.jpg','2011-09-26 18:53:23',2),(6,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__16x16_q80_crop_upscale.jpg','2011-09-26 18:53:23',3),(7,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__32x32_q80_crop_upscale.jpg','2011-09-26 18:53:24',3),(8,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__48x48_q80_crop_upscale.jpg','2011-09-26 18:53:24',3),(9,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__64x64_q80_crop_upscale.jpg','2011-09-26 18:53:24',3),(10,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__16x16_q80_crop_upscale.jpg','2011-09-26 18:53:25',4),(11,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__32x32_q80_crop_upscale.jpg','2011-09-26 18:53:25',4),(12,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__48x48_q80_crop_upscale.jpg','2011-09-26 18:53:25',4),(13,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__64x64_q80_crop_upscale.jpg','2011-09-26 18:53:26',4),(14,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__210x10000_q80.jpg','2011-09-26 18:53:30',3),(15,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__32x32_q80.jpg','2011-09-26 18:54:14',2),(16,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__32x32_q80.jpg','2011-09-26 18:54:14',3),(17,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__32x32_q80.jpg','2011-09-26 18:54:15',4),(18,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__200x200_q80.jpg','2011-09-26 19:27:16',2),(19,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__200x200_q80.jpg','2011-09-26 19:27:16',3),(20,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__200x200_q80.jpg','2011-09-26 19:27:16',4),(21,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__80x80_q80_crop.jpg','2011-09-27 12:10:56',4),(22,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__500x80_q80_crop.jpg','2011-09-27 12:18:01',4),(23,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__500x400_q80_crop.jpg','2011-09-27 12:18:13',4),(24,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:16:02',10),(25,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:16:06',10),(26,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:16:07',10),(27,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:16:09',10),(28,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:16:11',11),(29,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:16:16',11),(30,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:16:18',11),(31,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:16:19',11),(32,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:22:11',12),(33,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:22:15',12),(34,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:22:16',12),(35,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:22:17',12),(36,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:22:20',13),(37,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:22:23',13),(38,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:22:24',13),(39,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:22:25',13);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfirmation_emailaddress`
--

LOCK TABLES `emailconfirmation_emailaddress` WRITE;
/*!40000 ALTER TABLE `emailconfirmation_emailaddress` DISABLE KEYS */;
INSERT INTO `emailconfirmation_emailaddress` VALUES (1,1,'none@none.no',1,1),(2,2,'jonas@anorg.net',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfirmation_emailconfirmation`
--

LOCK TABLES `emailconfirmation_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `emailconfirmation_emailconfirmation` DISABLE KEYS */;
INSERT INTO `emailconfirmation_emailconfirmation` VALUES (1,2,'2011-09-25 13:29:15','e74bb8c2e94e8e3e17f409c403efacd2d4196935');
/*!40000 ALTER TABLE `emailconfirmation_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_facebookprofile`
--

DROP TABLE IF EXISTS `facebook_facebookprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_facebookprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  `access_token` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_7bbd30a2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_facebookprofile`
--

LOCK TABLES `facebook_facebookprofile` WRITE;
/*!40000 ALTER TABLE `facebook_facebookprofile` DISABLE KEYS */;
INSERT INTO `facebook_facebookprofile` VALUES (1,3,667807929,'AAACdrskJ9C8BAMnu3x80lBQez0UTk6KzciKVFi6vP3JxQYvx5HJRtewO6mTQbdSVhvsY4ULDqQ0dAexA4G3jxQ5c3lA4RUzFUggIpgZDZD');
/*!40000 ALTER TABLE `facebook_facebookprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_clipboard`
--

DROP TABLE IF EXISTS `filer_clipboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_clipboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filer_clipboard_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_16137c20` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_clipboard`
--

LOCK TABLES `filer_clipboard` WRITE;
/*!40000 ALTER TABLE `filer_clipboard` DISABLE KEYS */;
INSERT INTO `filer_clipboard` VALUES (1,1);
/*!40000 ALTER TABLE `filer_clipboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_clipboarditem`
--

DROP TABLE IF EXISTS `filer_clipboarditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_clipboarditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `clipboard_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filer_clipboarditem_2243e3be` (`file_id`),
  KEY `filer_clipboarditem_5dd2488b` (`clipboard_id`),
  CONSTRAINT `clipboard_id_refs_id_46496bc2` FOREIGN KEY (`clipboard_id`) REFERENCES `filer_clipboard` (`id`),
  CONSTRAINT `file_id_refs_id_3533711` FOREIGN KEY (`file_id`) REFERENCES `filer_file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_clipboarditem`
--

LOCK TABLES `filer_clipboarditem` WRITE;
/*!40000 ALTER TABLE `filer_clipboarditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `filer_clipboarditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_file`
--

DROP TABLE IF EXISTS `filer_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci,
  `_file_size` int(11) DEFAULT NULL,
  `has_all_mandatory_data` tinyint(1) NOT NULL DEFAULT '0',
  `original_filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `polymorphic_ctype_id` int(11),
  PRIMARY KEY (`id`),
  KEY `filer_file_4e5f642` (`folder_id`),
  KEY `filer_file_5d52dd10` (`owner_id`),
  KEY `filer_file_689fbb87` (`polymorphic_ctype_id`),
  CONSTRAINT `folder_id_refs_id_5276dead` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`),
  CONSTRAINT `owner_id_refs_id_6abe8089` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `polymorphic_ctype_id_refs_id_29c16935` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_file`
--

LOCK TABLES `filer_file` WRITE;
/*!40000 ALTER TABLE `filer_file` DISABLE KEYS */;
INSERT INTO `filer_file` VALUES (1,1,'2011/09/26/img_0513.jpg',602810,0,'IMG_0513.JPG',NULL,1,'2011-09-26 18:53:22','2011-09-26 18:53:27',NULL,1,'b414f38d35fa7fbb7ad60683bb11588da7174b7d',65),(2,1,'2011/09/26/img_0510.jpg',635000,0,'IMG_0510.JPG',NULL,1,'2011-09-26 18:53:23','2011-09-26 18:53:27',NULL,1,'ce5957033816a7dd086d0a2419e99fe98e382605',65),(3,1,'2011/09/26/img_0519.jpg',669294,0,'IMG_0519.JPG',NULL,1,'2011-09-26 18:53:25','2011-09-26 18:53:27',NULL,1,'a6631932a87a1c1ab1c084dfe748807eebeff50a',65),(4,1,'2011/09/26/jonas_ohrstrom-0g48cv7jxl7qjvhsr6lo.pdf',191449,0,'jonas_ohrstrom-0g48Cv7Jxl7QJVHSr6Lo.pdf',NULL,1,'2011-09-26 18:56:19','2011-09-26 18:56:29',NULL,1,'ff7399deb25bd25818d6275a22d96a5b24c03b0b',64),(5,1,'2011/09/26/jonas_ohrstrom-utkp9duixiuqhpo1or41.pdf',188309,0,'jonas_ohrstrom-uTKp9dUiXIuqHPo1OR41.pdf',NULL,1,'2011-09-26 18:56:19','2011-09-26 18:56:29',NULL,1,'df2970c9bcc371ad0aa9d30f305519ec5abdde92',64),(6,4,'2011/09/27/movie_on_9-25-11_at_542_pm.mov',620768,0,'Movie_on_9-25-11_at_5.42_PM.mov',NULL,1,'2011-09-27 12:32:42','2011-09-27 12:32:55',NULL,1,'2f3c04bde25ec351e9c03c09ce9e6f7acce44c36',64),(7,7,'2011/09/27/movie_on_9-25-11_at_542_pm_1.mov',620768,0,'Movie_on_9-25-11_at_5.42_PM.mov',NULL,1,'2011-09-27 14:15:51','2011-09-27 14:16:20',NULL,1,'2f3c04bde25ec351e9c03c09ce9e6f7acce44c36',64),(8,7,'2011/09/27/desktop.ini',664,0,'desktop.ini',NULL,1,'2011-09-27 14:16:00','2011-09-27 14:16:20',NULL,1,'e32929275c7957bfd5f9b5265482cb7e65da0bd4',64),(9,7,'2011/09/27/img_0222.jpg',2740967,0,'IMG_0222.JPG',NULL,1,'2011-09-27 14:16:00','2011-09-27 14:16:20',NULL,1,'a3527c80afd04b2490794fb2acbb8d1cae9907ae',65),(10,7,'2011/09/27/img_0236.jpg',2731150,0,'IMG_0236.JPG',NULL,1,'2011-09-27 14:16:09','2011-09-27 14:16:20',NULL,1,'3453b9a2f1284322dee681f575aaa14a0eaaf238',65),(11,8,'2011/09/27/p1000453.jpg',6718976,0,'P1000453.JPG',NULL,1,'2011-09-27 14:22:10','2011-09-27 14:22:32',NULL,1,'b3bdb4957c9d97f1194c23e83a8dee1c5fe3e124',65),(12,8,'2011/09/27/p1000454.jpg',7126528,0,'P1000454.JPG',NULL,1,'2011-09-27 14:22:18','2011-09-27 14:22:32',NULL,1,'05d66390caea6c59ce965864f0b00a7f41c250c5',65);
/*!40000 ALTER TABLE `filer_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_folder`
--

DROP TABLE IF EXISTS `filer_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filer_folder_parent_id_4d901e49_uniq` (`parent_id`,`name`),
  KEY `filer_folder_63f17a16` (`parent_id`),
  KEY `filer_folder_5d52dd10` (`owner_id`),
  KEY `filer_folder_42b06ff6` (`lft`),
  KEY `filer_folder_6eabc1a6` (`rght`),
  KEY `filer_folder_102f80d8` (`tree_id`),
  KEY `filer_folder_2a8f42e8` (`level`),
  CONSTRAINT `owner_id_refs_id_4709f467` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `parent_id_refs_id_60f1d8bd` FOREIGN KEY (`parent_id`) REFERENCES `filer_folder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_folder`
--

LOCK TABLES `filer_folder` WRITE;
/*!40000 ALTER TABLE `filer_folder` DISABLE KEYS */;
INSERT INTO `filer_folder` VALUES (1,NULL,'test',1,'2011-09-26 18:31:52','2011-09-26 18:31:52','2011-09-26 18:31:52',1,6,1,0),(2,NULL,'subfolder',1,'2011-09-26 18:56:04','2011-09-26 18:56:04','2011-09-26 18:56:04',1,2,2,0),(3,1,'subfolder x',1,'2011-09-26 18:56:37','2011-09-26 18:56:37','2011-09-26 18:56:37',2,3,1,1),(4,1,'intros',1,'2011-09-27 12:32:49','2011-09-27 12:32:49','2011-09-27 12:32:49',4,5,1,1),(5,NULL,'shows',1,'2011-09-27 13:30:41','2011-09-27 13:30:41','2011-09-27 13:30:41',1,4,3,0),(6,5,'2011-10-02_intro',1,'2011-09-27 13:31:12','2011-09-27 13:31:12','2011-09-27 13:31:12',2,3,3,1),(7,NULL,'2011-09-24_event-a',NULL,'2011-09-27 13:41:32','2011-09-27 13:41:32','2011-09-27 13:41:32',1,4,4,0),(8,7,'subfolder',1,'2011-09-27 14:20:17','2011-09-27 14:20:17','2011-09-27 14:20:17',2,3,4,1);
/*!40000 ALTER TABLE `filer_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_folderpermission`
--

DROP TABLE IF EXISTS `filer_folderpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_folderpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `everybody` tinyint(1) NOT NULL DEFAULT '0',
  `can_edit` tinyint(1) NOT NULL DEFAULT '1',
  `can_read` tinyint(1) NOT NULL DEFAULT '1',
  `can_add_children` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `filer_folderpermission_4e5f642` (`folder_id`),
  KEY `filer_folderpermission_403f60f` (`user_id`),
  KEY `filer_folderpermission_425ae3c4` (`group_id`),
  CONSTRAINT `folder_id_refs_id_565b7e06` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`),
  CONSTRAINT `group_id_refs_id_6e300e3b` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_4ab53c64` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_folderpermission`
--

LOCK TABLES `filer_folderpermission` WRITE;
/*!40000 ALTER TABLE `filer_folderpermission` DISABLE KEYS */;
INSERT INTO `filer_folderpermission` VALUES (1,1,0,NULL,NULL,1,1,1,1);
/*!40000 ALTER TABLE `filer_folderpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filer_image`
--

DROP TABLE IF EXISTS `filer_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filer_image` (
  `file_ptr_id` int(11) NOT NULL,
  `_height` int(11) DEFAULT NULL,
  `_width` int(11) DEFAULT NULL,
  `date_taken` datetime DEFAULT NULL,
  `default_alt_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `must_always_publish_author_credit` tinyint(1) NOT NULL DEFAULT '0',
  `must_always_publish_copyright` tinyint(1) NOT NULL DEFAULT '0',
  `subject_location` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`file_ptr_id`),
  CONSTRAINT `file_ptr_id_refs_id_273c421f` FOREIGN KEY (`file_ptr_id`) REFERENCES `filer_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_image`
--

LOCK TABLES `filer_image` WRITE;
/*!40000 ALTER TABLE `filer_image` DISABLE KEYS */;
INSERT INTO `filer_image` VALUES (1,1200,1600,'2011-09-26 18:53:21',NULL,NULL,NULL,0,0,NULL),(2,1200,1600,'2011-09-26 18:53:23',NULL,NULL,NULL,0,0,NULL),(3,1200,1600,'2011-09-26 18:53:24',NULL,NULL,NULL,0,0,NULL),(9,3240,4320,'2011-09-27 14:16:00',NULL,NULL,NULL,0,0,NULL),(10,3240,4320,'2011-09-27 14:16:09',NULL,NULL,NULL,0,0,NULL),(11,3000,4000,'2011-09-27 14:22:10',NULL,NULL,NULL,0,0,NULL),(12,3000,4000,'2011-09-27 14:22:18',NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `filer_image` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jqchat_message`
--

LOCK TABLES `jqchat_message` WRITE;
/*!40000 ALTER TABLE `jqchat_message` DISABLE KEYS */;
INSERT INTO `jqchat_message` VALUES (1,1,1,1,'',1316794497.22823,'2011-09-23 18:14:57'),(2,1,1,NULL,'aksjdhka sgdh kajhsgd ka',1316794513.51714,'2011-09-23 18:15:13'),(3,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asd</span><br />',1316950005.76348,'2011-09-25 13:26:45'),(4,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>aksjhd alkjshd </span><br />',1316950009.6676,'2011-09-25 13:26:49'),(5,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>whatever</span><br />',1316950042.24323,'2011-09-25 13:27:22'),(6,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdasds</span><br />',1316950103.02764,'2011-09-25 13:28:23'),(7,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>lalala</span><br />',1316950166.57387,'2011-09-25 13:29:26'),(8,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>asdh adskja </span><br />',1316950168.19747,'2011-09-25 13:29:28'),(9,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>aksjdh akjds </span><br />',1316950169.11799,'2011-09-25 13:29:29'),(10,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>jkhas kjhads kjhs</span><br />',1316950170.52185,'2011-09-25 13:29:30'),(11,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>ajskh kads </span><br />',1316950171.84928,'2011-09-25 13:29:31'),(12,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>sdfshfsodf </span><br />',1316950187.41271,'2011-09-25 13:29:47'),(13,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>asdashd ahsdlasda ds</span><br />',1316950210.09264,'2011-09-25 13:30:10'),(14,3,1,NULL,'<span class=\'user\'>jonas.ohrstrom</span><span class=\'msg\'>lalala</span><br />',1316952864.27119,'2011-09-25 14:14:24'),(15,3,1,NULL,'<span class=\'user\'>jonas.ohrstrom</span><span class=\'msg\'>asdkjabsdk labkds a</span><br />',1316958401.26229,'2011-09-25 15:46:41'),(16,3,1,NULL,'<span class=\'user\'>jonas.ohrstrom</span><span class=\'msg\'>ahjgd kjhasg da</span><br />',1316958403.25625,'2011-09-25 15:46:43'),(17,3,1,NULL,'<span class=\'user\'>jonas.ohrstrom</span><span class=\'msg\'>ahsdg kjahgs </span><br />',1316958403.95498,'2011-09-25 15:46:43'),(18,3,1,NULL,'<span class=\'user\'>jonas.ohrstrom</span><span class=\'msg\'>ahjsdg kahgsdkjaghd s</span><br />',1316958405.30575,'2011-09-25 15:46:45'),(19,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>xyz lala! :)</span><br />',1316962897.84203,'2011-09-25 17:01:37'),(20,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>:::::::::::::::::::::::::::::::::::::::::::)</span><br />',1316962906.58437,'2011-09-25 17:01:46'),(21,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>askdhakdjsh</span><br />',1316963764.75856,'2011-09-25 17:16:04'),(22,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>trudelidu</span><br />',1316972889.87555,'2011-09-25 19:48:09'),(23,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdausd</span><br />',1316975480.88509,'2011-09-25 20:31:20'),(24,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdhasdhas</span><br />',1316975482.74089,'2011-09-25 20:31:22'),(25,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdads</span><br />',1316977054.66958,'2011-09-25 20:57:34'),(26,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdads</span><br />',1316977054.78061,'2011-09-25 20:57:34'),(27,2,1,NULL,'<span class=\'user\'>user</span><span class=\'msg\'>xasdfqwertzuio</span><br />',1316978946.13106,'2011-09-25 21:29:06'),(28,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdamsdba </span><br />',1317045228.53944,'2011-09-26 15:53:48'),(29,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>askjdh akjshd a</span><br />',1317045230.41493,'2011-09-26 15:53:50'),(30,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>as dakjsd las </span><br />',1317045231.37283,'2011-09-26 15:53:51'),(31,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>as dahgs djadshga ksdhg akjhgsd kjahgs dkjhag ksdjhgakjhsgdkjahgsd kjahg dskjahgskdjhagksjhdg akjshgdkajhsg dkajhsgd kajhgsd kajhgskdjahgskjdh akjhsgdk ahgs dkjahgsdk jhag skdjhga kjsdhg akjhsgdkajhsgd kajhgsdkahjgks dd</span><br />',1317045239.38295,'2011-09-26 15:53:59'),(32,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdahjsd ajhdsg ahgds kajhgds kajhgds kjhag dksjhga kjshgd akjhdsg akjhdgs kjahg dskjahgd skjahgd kjsahgds kjahgs dkjahgd skjahg djkahgk djshga ksjdhga kjshdg a</span><br />',1317051637.26902,'2011-09-26 17:40:37'),(33,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>dsa sdfajdgs http://www.google.ch/</span><br />',1317051658.63574,'2011-09-26 17:40:58'),(34,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>dkhgf dkfjgh d</span><br />',1317051664.50354,'2011-09-26 17:41:04'),(35,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdhk</span><br />',1317051666.0438,'2011-09-26 17:41:06'),(36,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asd</span><br />',1317051667.27001,'2011-09-26 17:41:07'),(37,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>d</span><br />',1317051667.76649,'2011-09-26 17:41:07'),(38,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>d</span><br />',1317051668.09862,'2011-09-26 17:41:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jqchat_room`
--

LOCK TABLES `jqchat_room` WRITE;
/*!40000 ALTER TABLE `jqchat_room` DISABLE KEYS */;
INSERT INTO `jqchat_room` VALUES (1,'chatroom','2011-09-23 17:46:23','',1316792783,1317051668,NULL,NULL),(2,'blank','2011-09-25 20:49:00','',1316976540,1317045239,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_message`
--

LOCK TABLES `mailer_message` WRITE;
/*!40000 ALTER TABLE `mailer_message` DISABLE KEYS */;
INSERT INTO `mailer_message` VALUES (1,'Y2NvcHlfcmVnCl9yZWNvbnN0cnVjdG9yCnAwCihjZGphbmdvLmNvcmUubWFpbC5tZXNzYWdlCkVt\nYWlsTWVzc2FnZQpwMQpjX19idWlsdGluX18Kb2JqZWN0CnAyCk50cDMKUnA0CihkcDUKUydib2R5\nJwpwNgpnMAooY2RqYW5nby51dGlscy5zYWZlc3RyaW5nClNhZmVVbmljb2RlCnA3CmNfX2J1aWx0\naW5fXwp1bmljb2RlCnA4ClZVc2VyICd1c2VyJyBhdCBleGFtcGxlLmNvbSBoYXMgZ2l2ZW4gdGhp\ncyBhcyBhbiBlbWFpbCBhZGRyZXNzLlx1MDAwYVx1MDAwYVRvIGNvbmZpcm0gdGhpcyBpcyBjb3Jy\nZWN0LCBnbyB0byBodHRwOi8vZXhhbXBsZS5jb20vYWNjb3VudC9jb25maXJtX2VtYWlsL2U3NGJi\nOGMyZTk0ZThlM2UxN2Y0MDljNDAzZWZhY2QyZDQxOTY5MzUvXHUwMDBhCnA5CnRwMTAKUnAxMQpz\nUydleHRyYV9oZWFkZXJzJwpwMTIKKGRwMTMKc1MnYXR0YWNobWVudHMnCnAxNAoobHAxNQpzUydj\nYycKcDE2CihscDE3CnNTJ2Zyb21fZW1haWwnCnAxOApTJ3dlYm1hc3RlckBsb2NhbGhvc3QnCnAx\nOQpzUyd0bycKcDIwCihscDIxClZqb25hc0Bhbm9yZy5uZXQKcDIyCmFzUydjb25uZWN0aW9uJwpw\nMjMKZzAKKGNtYWlsZXIuYmFja2VuZApEYkJhY2tlbmQKcDI0CmcyCk50cDI1ClJwMjYKKGRwMjcK\nUydmYWlsX3NpbGVudGx5JwpwMjgKSTAwCnNic1MnYmNjJwpwMjkKKGxwMzAKc1Mnc3ViamVjdCcK\ncDMxClZDb25maXJtIGVtYWlsIGFkZHJlc3MgZm9yIGV4YW1wbGUuY29tCnAzMgpzYi4=\n','2011-09-25 13:29:15','2');
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
INSERT INTO `menus_cachekey` VALUES (113,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(114,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(115,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(116,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(117,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(118,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(119,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(120,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(121,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(122,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(123,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(124,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(125,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(126,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(127,'en-us',1,'cms-menu_nodes_en-us_1_1_user');
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
  `picture` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci,
  `facebook` varchar(200) COLLATE utf8_unicode_ci,
  `soundcloud` varchar(200) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `profiles_profile_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_2c67a130` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_profile`
--

LOCK TABLES `profiles_profile` WRITE;
/*!40000 ALTER TABLE `profiles_profile` DISABLE KEYS */;
INSERT INTO `profiles_profile` VALUES (1,1,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL),(2,2,'Jonas Ohrstrom','Zurich','http://ohrstrom.ch/','about?\r\nhm another\r\nLINE','0','jonasohrstrom','http://facebook.com/ohrstrom',''),(3,3,'lalal lolo','','','','0',NULL,NULL,NULL),(4,4,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'cms','0001_initial','2011-09-23 14:47:31'),(2,'picture','0001_initial','2011-09-23 14:47:31'),(3,'picture','0002_link_rename','2011-09-23 14:47:31'),(4,'picture','0003_freeze','2011-09-23 14:47:31'),(5,'cms','0002_auto_start','2011-09-23 14:47:31'),(6,'cms','0003_remove_placeholder','2011-09-23 14:47:31'),(7,'cms','0004_textobjects','2011-09-23 14:47:31'),(8,'cms','0005_mptt_added_to_plugins','2011-09-23 14:47:31'),(9,'cms','0006_apphook','2011-09-23 14:47:31'),(10,'cms','0007_apphook_longer','2011-09-23 14:47:31'),(11,'cms','0008_redirects','2011-09-23 14:47:31'),(12,'cms','0009_added_meta_fields','2011-09-23 14:47:31'),(13,'cms','0010_5char_language','2011-09-23 14:47:31'),(14,'cms','0011_title_overwrites','2011-09-23 14:47:31'),(15,'cms','0012_publisher','2011-09-23 14:47:31'),(16,'picture','0004_publisher','2011-09-23 14:47:31'),(17,'picture','0005_table_rename','2011-09-23 14:47:31'),(18,'text','0001_initial','2011-09-23 14:47:31'),(19,'text','0002_freeze','2011-09-23 14:47:31'),(20,'text','0003_publisher','2011-09-23 14:47:31'),(21,'snippet','0001_initial','2011-09-23 14:47:31'),(22,'snippet','0002_publisher','2011-09-23 14:47:31'),(23,'link','0001_initial','2011-09-23 14:47:31'),(24,'link','0002_link_rename','2011-09-23 14:47:31'),(25,'link','0003_page_link','2011-09-23 14:47:31'),(26,'link','0004_larger_link_names','2011-09-23 14:47:31'),(27,'link','0005_publisher','2011-09-23 14:47:31'),(28,'googlemap','0001_initial','2011-09-23 14:47:31'),(29,'file','0001_initial','2011-09-23 14:47:31'),(30,'file','0002_freeze','2011-09-23 14:47:31'),(31,'file','0003_publisher','2011-09-23 14:47:31'),(32,'cms','0013_site_copy','2011-09-23 14:47:31'),(33,'cms','0014_sites_removed','2011-09-23 14:47:31'),(34,'cms','0015_modified_by_added','2011-09-23 14:47:31'),(35,'cms','0016_author_copy','2011-09-23 14:47:31'),(36,'cms','0017_author_removed','2011-09-23 14:47:31'),(37,'cms','0018_site_permissions','2011-09-23 14:47:31'),(38,'cms','0019_public_table_renames','2011-09-23 14:47:31'),(39,'picture','0006_float_added','2011-09-23 14:47:31'),(40,'cms','0020_advanced_permissions','2011-09-23 14:47:31'),(41,'cms','0021_publisher2','2011-09-23 14:47:31'),(42,'cms','0022_login_required_added','2011-09-23 14:47:31'),(43,'cms','0023_plugin_table_naming_function_changed','2011-09-23 14:47:31'),(44,'cms','0024_added_placeholder_model','2011-09-23 14:47:31'),(45,'cms','0025_placeholder_migration','2011-09-23 14:47:31'),(46,'cms','0026_finish_placeholder_migration','2011-09-23 14:47:31'),(47,'cms','0027_added_width_to_placeholder','2011-09-23 14:47:31'),(48,'cms','0028_limit_visibility_in_menu_step1of3','2011-09-23 14:47:31'),(49,'cms','0029_limit_visibility_in_menu_step2of3_data','2011-09-23 14:47:31'),(50,'cms','0030_limit_visibility_in_menu_step3of3','2011-09-23 14:47:31'),(51,'cms','0031_improved_language_code_support','2011-09-23 14:47:31'),(52,'cms','0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis','2011-09-23 14:47:31'),(53,'cms','0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st','2011-09-23 14:47:31'),(54,'cms','0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel','2011-09-23 14:47:31'),(55,'cms','0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio','2011-09-23 14:47:31'),(56,'menus','0001_initial','2011-09-23 14:47:31'),(57,'text','0004_table_rename','2011-09-23 14:47:31'),(58,'text','0005_publisher2','2011-09-23 14:47:31'),(59,'text','0006_2_1_4_upgrade','2011-09-23 14:47:31'),(60,'picture','0007_publisher2','2011-09-23 14:47:31'),(61,'picture','0008_longdesc_added','2011-09-23 14:47:31'),(62,'link','0006_table_rename','2011-09-23 14:47:31'),(63,'link','0007_publisher2','2011-09-23 14:47:31'),(64,'link','0008_mailto','2011-09-23 14:47:31'),(65,'file','0004_table_rename','2011-09-23 14:47:31'),(66,'file','0005_publisher2','2011-09-23 14:47:31'),(67,'snippet','0003_table_rename','2011-09-23 14:47:31'),(68,'snippet','0004_publisher2','2011-09-23 14:47:31'),(69,'snippet','0005_template_added','2011-09-23 14:47:31'),(70,'googlemap','0002_table_rename','2011-09-23 14:47:31'),(71,'googlemap','0003_address_unified','2011-09-23 14:47:31'),(72,'googlemap','0004_copy_address','2011-09-23 14:47:31'),(73,'googlemap','0005_delete_street','2011-09-23 14:47:31'),(74,'googlemap','0006_publisher2','2011-09-23 14:47:31'),(75,'googlemap','0007_latlng','2011-09-23 14:47:31'),(76,'googlemap','0008_routeplaner','2011-09-23 14:47:31'),(77,'googlemap','0009_routeplaner_title','2011-09-23 14:47:31'),(78,'easy_thumbnails','0001_initial','2011-09-23 14:47:31'),(79,'easy_thumbnails','0002_filename_indexes','2011-09-23 14:47:31'),(80,'easy_thumbnails','0003_auto__add_storagenew','2011-09-23 14:47:31'),(81,'easy_thumbnails','0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new','2011-09-23 14:47:31'),(82,'easy_thumbnails','0005_storage_fks_null','2011-09-23 14:47:31'),(83,'easy_thumbnails','0006_copy_storage','2011-09-23 14:47:31'),(84,'easy_thumbnails','0007_storagenew_fks_not_null','2011-09-23 14:47:31'),(85,'easy_thumbnails','0008_auto__del_field_source_storage__del_field_thumbnail_storage','2011-09-23 14:47:31'),(86,'easy_thumbnails','0009_auto__del_storage','2011-09-23 14:47:31'),(87,'easy_thumbnails','0010_rename_storage','2011-09-23 14:47:31'),(88,'easy_thumbnails','0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash','2011-09-23 14:47:31'),(89,'easy_thumbnails','0012_build_storage_hashes','2011-09-23 14:47:31'),(90,'easy_thumbnails','0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora','2011-09-23 14:47:31'),(91,'easy_thumbnails','0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s','2011-09-23 14:47:31'),(92,'bcast','0001_initial','2011-09-23 14:54:19'),(93,'profiles','0001_initial','2011-09-23 14:54:27'),(94,'jqchat','0001_initial','2011-09-23 14:54:32'),(95,'bcast','0002_auto__chg_field_participation_date_joined','2011-09-25 14:21:56'),(96,'bcast','0003_auto__add_participantsplugin','2011-09-25 14:38:39'),(97,'bcast','0004_auto__add_field_event_location','2011-09-25 15:29:38'),(98,'bcast','0005_auto__chg_field_event_location','2011-09-25 15:30:15'),(99,'bcast','0006_auto__add_field_event_intro','2011-09-25 15:45:27'),(100,'profiles','0002_auto__add_field_profile_picture__add_field_profile_skype__add_field_pr','2011-09-25 19:22:24'),(101,'filer','0001_initial','2011-09-26 16:30:22'),(102,'filer','0002_rename_file_field','2011-09-26 16:30:22'),(103,'filer','0003_add_description_field','2011-09-26 16:30:22'),(104,'filer','0004_auto__del_field_file__file__add_field_file_file__add_field_file_is_pub','2011-09-26 16:30:23'),(105,'filer','0005_auto__add_field_file_sha1__chg_field_file_file','2011-09-26 16:30:25'),(106,'cmsplugin_filer_file','0001_initial','2011-09-26 16:31:13'),(107,'cmsplugin_filer_folder','0001_initial','2011-09-26 16:31:13'),(108,'filer','0006_polymorphic__add_field_file_polymorphic_ctype','2011-09-26 16:52:47'),(109,'filer','0007_polymorphic__content_type_data','2011-09-26 16:52:47'),(110,'filer','0008_polymorphic__del_field_file__file_type_plugin_name','2011-09-26 16:52:48'),(111,'bcast','0007_auto__del_field_event_picture__del_field_event_intro','2011-09-27 10:05:32'),(112,'bcast','0008_auto__add_field_event_picture__add_field_event_intro','2011-09-27 10:10:19'),(113,'bcast','0009_auto__add_field_event_folder','2011-09-27 11:29:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'asdaksda','asdaksda'),(2,'d','d'),(3,'Show','show'),(4,'testing','testing'),(5,'event','event'),(6,'double tag','double-tag'),(7,'today','today'),(9,'show','show_1');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (22,4,3,56),(23,9,4,56),(24,3,4,56),(25,5,4,56),(26,6,4,56),(27,7,4,56),(42,9,2,56),(43,3,2,56),(60,1,1,56),(61,2,1,56);
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

-- Dump completed on 2011-09-27 14:25:06
