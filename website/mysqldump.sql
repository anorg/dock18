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

USE `fresh`;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES (1,1,'Europe/Zurich','en-us'),(2,2,'Europe/Zurich','en-us'),(3,3,'Europe/Zurich','en-us'),(4,4,'Europe/Zurich','en-us'),(5,5,'Europe/Zurich','en-us');
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
-- Table structure for table `analytics_analytics`
--

DROP TABLE IF EXISTS `analytics_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_analytics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `analytics_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_analytics_6223029` (`site_id`),
  CONSTRAINT `site_id_refs_id_24197445` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_analytics`
--

LOCK TABLES `analytics_analytics` WRITE;
/*!40000 ALTER TABLE `analytics_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_analytics` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Streamers');
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
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,1,149),(150,1,150),(151,1,151),(152,1,152),(153,1,153),(154,1,154),(155,1,155),(156,1,156),(157,1,157),(158,1,158),(159,1,159),(160,1,160),(161,1,161),(162,1,162),(163,1,163),(164,1,164),(165,1,165),(166,1,166),(167,1,167),(168,1,168),(169,1,169),(170,1,170),(171,1,171),(172,1,172),(173,1,173),(174,1,174),(175,1,175),(176,1,176),(177,1,177),(178,1,178),(179,1,179),(180,1,180),(181,1,181),(182,1,182),(183,1,183),(184,1,184),(185,1,185),(186,1,186),(187,1,187),(188,1,188),(189,1,189),(190,1,190),(191,1,191),(192,1,192),(193,1,193),(194,1,194),(195,1,195),(196,1,196),(197,1,197),(198,1,198),(199,1,199),(200,1,200),(201,1,201),(202,1,202),(203,1,203),(204,1,204),(205,1,205),(206,1,206),(207,1,207),(208,1,208),(209,1,209),(210,1,210),(211,1,211),(212,1,212),(213,1,213),(214,1,214),(215,1,215),(216,1,216),(217,1,217),(218,1,218),(219,1,219),(220,1,220),(221,1,221),(222,1,222),(223,1,223),(224,1,224),(225,1,225),(226,1,226),(227,1,227),(228,1,228),(229,1,229),(230,1,230),(231,1,231),(232,1,232),(233,1,233),(234,1,234);
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
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can moderate comments',8,'can_moderate'),(26,'Can add comment flag',9,'add_commentflag'),(27,'Can change comment flag',9,'change_commentflag'),(28,'Can delete comment flag',9,'delete_commentflag'),(29,'Can add notice type',10,'add_noticetype'),(30,'Can change notice type',10,'change_noticetype'),(31,'Can delete notice type',10,'delete_noticetype'),(32,'Can add notice setting',11,'add_noticesetting'),(33,'Can change notice setting',11,'change_noticesetting'),(34,'Can delete notice setting',11,'delete_noticesetting'),(35,'Can add notice',12,'add_notice'),(36,'Can change notice',12,'change_notice'),(37,'Can delete notice',12,'delete_notice'),(38,'Can add notice queue batch',13,'add_noticequeuebatch'),(39,'Can change notice queue batch',13,'change_noticequeuebatch'),(40,'Can delete notice queue batch',13,'delete_noticequeuebatch'),(41,'Can add observed item',14,'add_observeditem'),(42,'Can change observed item',14,'change_observeditem'),(43,'Can delete observed item',14,'delete_observeditem'),(44,'Can add message',15,'add_message'),(45,'Can change message',15,'change_message'),(46,'Can delete message',15,'delete_message'),(47,'Can add don\'t send entry',16,'add_dontsendentry'),(48,'Can change don\'t send entry',16,'change_dontsendentry'),(49,'Can delete don\'t send entry',16,'delete_dontsendentry'),(50,'Can add message log',17,'add_messagelog'),(51,'Can change message log',17,'change_messagelog'),(52,'Can delete message log',17,'delete_messagelog'),(53,'Can add email address',18,'add_emailaddress'),(54,'Can change email address',18,'change_emailaddress'),(55,'Can delete email address',18,'delete_emailaddress'),(56,'Can add email confirmation',19,'add_emailconfirmation'),(57,'Can change email confirmation',19,'change_emailconfirmation'),(58,'Can delete email confirmation',19,'delete_emailconfirmation'),(59,'Can add announcement',20,'add_announcement'),(60,'Can change announcement',20,'change_announcement'),(61,'Can delete announcement',20,'delete_announcement'),(62,'Can add account',21,'add_account'),(63,'Can change account',21,'change_account'),(64,'Can delete account',21,'delete_account'),(65,'Can add password reset',22,'add_passwordreset'),(66,'Can change password reset',22,'change_passwordreset'),(67,'Can delete password reset',22,'delete_passwordreset'),(68,'Can add signup code',23,'add_signupcode'),(69,'Can change signup code',23,'change_signupcode'),(70,'Can delete signup code',23,'delete_signupcode'),(71,'Can add signup code result',24,'add_signupcoderesult'),(72,'Can change signup code result',24,'change_signupcoderesult'),(73,'Can delete signup code result',24,'delete_signupcoderesult'),(74,'Can add profile',25,'add_profile'),(75,'Can change profile',25,'change_profile'),(76,'Can delete profile',25,'delete_profile'),(77,'Can add cache key',26,'add_cachekey'),(78,'Can change cache key',26,'change_cachekey'),(79,'Can delete cache key',26,'delete_cachekey'),(80,'Can add source',27,'add_source'),(81,'Can change source',27,'change_source'),(82,'Can delete source',27,'delete_source'),(83,'Can add thumbnail',28,'add_thumbnail'),(84,'Can change thumbnail',28,'change_thumbnail'),(85,'Can delete thumbnail',28,'delete_thumbnail'),(86,'Can add Tag',29,'add_tag'),(87,'Can change Tag',29,'change_tag'),(88,'Can delete Tag',29,'delete_tag'),(89,'Can add Tagged Item',30,'add_taggeditem'),(90,'Can change Tagged Item',30,'change_taggeditem'),(91,'Can delete Tagged Item',30,'delete_taggeditem'),(92,'Can add room',31,'add_room'),(93,'Can change room',31,'change_room'),(94,'Can delete room',31,'delete_room'),(95,'Can add message',32,'add_message'),(96,'Can change message',32,'change_message'),(97,'Can delete message',32,'delete_message'),(98,'Can add nonce',33,'add_nonce'),(99,'Can change nonce',33,'change_nonce'),(100,'Can delete nonce',33,'delete_nonce'),(101,'Can add association',34,'add_association'),(102,'Can change association',34,'change_association'),(103,'Can delete association',34,'delete_association'),(104,'Can add user openid association',35,'add_useropenidassociation'),(105,'Can change user openid association',35,'change_useropenidassociation'),(106,'Can delete user openid association',35,'delete_useropenidassociation'),(107,'Can add site',36,'add_site'),(108,'Can change site',36,'change_site'),(109,'Can delete site',36,'delete_site'),(110,'Can add migration history',37,'add_migrationhistory'),(111,'Can change migration history',37,'change_migrationhistory'),(112,'Can delete migration history',37,'delete_migrationhistory'),(113,'Can add placeholder',38,'add_placeholder'),(114,'Can change placeholder',38,'change_placeholder'),(115,'Can delete placeholder',38,'delete_placeholder'),(116,'Can add cms plugin',39,'add_cmsplugin'),(117,'Can change cms plugin',39,'change_cmsplugin'),(118,'Can delete cms plugin',39,'delete_cmsplugin'),(119,'Can add page',40,'add_page'),(120,'Can change page',40,'change_page'),(121,'Can delete page',40,'delete_page'),(122,'Can view page',40,'view_page'),(123,'Can add PageModerator',41,'add_pagemoderator'),(124,'Can change PageModerator',41,'change_pagemoderator'),(125,'Can delete PageModerator',41,'delete_pagemoderator'),(126,'Can add Page moderator state',42,'add_pagemoderatorstate'),(127,'Can change Page moderator state',42,'change_pagemoderatorstate'),(128,'Can delete Page moderator state',42,'delete_pagemoderatorstate'),(129,'Can add Page global permission',43,'add_globalpagepermission'),(130,'Can change Page global permission',43,'change_globalpagepermission'),(131,'Can delete Page global permission',43,'delete_globalpagepermission'),(132,'Can add Page permission',44,'add_pagepermission'),(133,'Can change Page permission',44,'change_pagepermission'),(134,'Can delete Page permission',44,'delete_pagepermission'),(135,'Can add User (page)',45,'add_pageuser'),(136,'Can change User (page)',45,'change_pageuser'),(137,'Can delete User (page)',45,'delete_pageuser'),(138,'Can add User group (page)',46,'add_pageusergroup'),(139,'Can change User group (page)',46,'change_pageusergroup'),(140,'Can delete User group (page)',46,'delete_pageusergroup'),(141,'Can add title',47,'add_title'),(142,'Can change title',47,'change_title'),(143,'Can delete title',47,'delete_title'),(144,'Can add text',48,'add_text'),(145,'Can change text',48,'change_text'),(146,'Can delete text',48,'delete_text'),(147,'Can add picture',49,'add_picture'),(148,'Can change picture',49,'change_picture'),(149,'Can delete picture',49,'delete_picture'),(150,'Can add link',50,'add_link'),(151,'Can change link',50,'change_link'),(152,'Can delete link',50,'delete_link'),(153,'Can add file',51,'add_file'),(154,'Can change file',51,'change_file'),(155,'Can delete file',51,'delete_file'),(156,'Can add Snippet',52,'add_snippet'),(157,'Can change Snippet',52,'change_snippet'),(158,'Can delete Snippet',52,'delete_snippet'),(159,'Can add Snippet',53,'add_snippetptr'),(160,'Can change Snippet',53,'change_snippetptr'),(161,'Can delete Snippet',53,'delete_snippetptr'),(162,'Can add google map',54,'add_googlemap'),(163,'Can change google map',54,'change_googlemap'),(164,'Can delete google map',54,'delete_googlemap'),(165,'Can add season',55,'add_season'),(166,'Can change season',55,'change_season'),(167,'Can delete season',55,'delete_season'),(168,'Can add Event',56,'add_event'),(169,'Can change Event',56,'change_event'),(170,'Can delete Event',56,'delete_event'),(171,'Can add participation',57,'add_participation'),(172,'Can change participation',57,'change_participation'),(173,'Can delete participation',57,'delete_participation'),(174,'Can add event plugin',58,'add_eventplugin'),(175,'Can change event plugin',58,'change_eventplugin'),(176,'Can delete event plugin',58,'delete_eventplugin'),(177,'Can add event list plugin',59,'add_eventlistplugin'),(178,'Can change event list plugin',59,'change_eventlistplugin'),(179,'Can delete event list plugin',59,'delete_eventlistplugin'),(180,'Can add facebook profile',60,'add_facebookprofile'),(181,'Can change facebook profile',60,'change_facebookprofile'),(182,'Can delete facebook profile',60,'delete_facebookprofile'),(183,'Can add participants plugin',61,'add_participantsplugin'),(184,'Can change participants plugin',61,'change_participantsplugin'),(185,'Can delete participants plugin',61,'delete_participantsplugin'),(186,'Can add folder',62,'add_folder'),(187,'Can change folder',62,'change_folder'),(188,'Can delete folder',62,'delete_folder'),(189,'Can use directory listing',62,'can_use_directory_listing'),(190,'Can add Folder Permission',63,'add_folderpermission'),(191,'Can change Folder Permission',63,'change_folderpermission'),(192,'Can delete Folder Permission',63,'delete_folderpermission'),(193,'Can add File',64,'add_file'),(194,'Can change File',64,'change_file'),(195,'Can delete File',64,'delete_file'),(196,'Can add Image',65,'add_image'),(197,'Can change Image',65,'change_image'),(198,'Can delete Image',65,'delete_image'),(199,'Can add Clipboard',66,'add_clipboard'),(200,'Can change Clipboard',66,'change_clipboard'),(201,'Can delete Clipboard',66,'delete_clipboard'),(202,'Can add Clipboard item',67,'add_clipboarditem'),(203,'Can change Clipboard item',67,'change_clipboarditem'),(204,'Can delete Clipboard item',67,'delete_clipboarditem'),(205,'Can add filer file',68,'add_filerfile'),(206,'Can change filer file',68,'change_filerfile'),(207,'Can delete filer file',68,'delete_filerfile'),(208,'Can add filer folder',69,'add_filerfolder'),(209,'Can change filer folder',69,'change_filerfolder'),(210,'Can delete filer folder',69,'delete_filerfolder'),(211,'Can add join invitation',70,'add_joininvitation'),(212,'Can change join invitation',70,'change_joininvitation'),(213,'Can delete join invitation',70,'delete_joininvitation'),(214,'Can add invitation stat',71,'add_invitationstat'),(215,'Can change invitation stat',71,'change_invitationstat'),(216,'Can delete invitation stat',71,'delete_invitationstat'),(217,'Can add like',72,'add_like'),(218,'Can change like',72,'change_like'),(219,'Can delete like',72,'delete_like'),(220,'Can add analytics',73,'add_analytics'),(221,'Can change analytics',73,'change_analytics'),(222,'Can delete analytics',73,'delete_analytics'),(223,'Can add filer image',74,'add_filerimage'),(224,'Can change filer image',74,'change_filerimage'),(225,'Can delete filer image',74,'delete_filerimage'),(226,'Can add thumbnail option',75,'add_thumbnailoption'),(227,'Can change thumbnail option',75,'change_thumbnailoption'),(228,'Can delete thumbnail option',75,'delete_thumbnailoption'),(229,'Can add filer teaser',76,'add_filerteaser'),(230,'Can change filer teaser',76,'change_filerteaser'),(231,'Can delete filer teaser',76,'delete_filerteaser'),(232,'Can add filer video',77,'add_filervideo'),(233,'Can change filer video',77,'change_filervideo'),(234,'Can delete filer video',77,'delete_filervideo'),(235,'Can add spectate',78,'add_spectate'),(236,'Can change spectate',78,'change_spectate'),(237,'Can delete spectate',78,'delete_spectate');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'root','','','none@none.no','sha1$776af$2679d60ef10be68563e14215e5fbaec8e62e1e70',1,1,1,'2011-10-31 17:41:49','2011-09-23 16:45:57'),(2,'user','','','jonas@anorg.net','sha1$a3438$2aad871327c7a36a133d59cc79d22af2d07a885d',0,1,0,'2011-09-25 21:20:35','2011-09-25 13:29:15'),(3,'jonas.ohrstrom','Jonas','Ohrstrom','jonas@anorg.net','!',0,1,0,'2011-09-25 15:44:29','2011-09-25 14:14:04'),(4,'john','','','lennon@thebeatles.com','sha1$6c859$9526df29735a88123181cfb22a53c24f2bb842a6',0,1,0,'2011-09-25 15:58:06','2011-09-25 15:58:06'),(5,'test','','','','sha1$3d694$1ed94805da5291ad936cd5492776d8f610553de4',0,1,0,'2011-09-27 14:46:24','2011-09-27 14:45:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (3,1,1);
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
  `processed` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `show_spectators` tinyint(1) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bcast_event`
--

LOCK TABLES `bcast_event` WRITE;
/*!40000 ALTER TABLE `bcast_event` DISABLE KEYS */;
INSERT INTO `bcast_event` VALUES (1,'EVENT---A','Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum..\r\n','2011-10-07 19:11:00','2011-10-07 19:20:00','2011-09-23 17:46:30','2011-10-07 19:10:56',0,1,1,'2011-10-07_event-a','show',1,1,'Dock18',3,NULL,11,'done',1),(2,'EVENT---Tomorrow','asdhagdsjahgsdj','2011-11-01 18:09:21','2011-11-01 18:09:21','2011-09-23 18:09:31','2011-10-31 09:54:46',1,1,1,'2011-09-27_event-b','workshop',1,1,'Dock18',NULL,NULL,66,'done',1),(3,'EVENT--NOW','','2011-10-31 09:54:05','2011-10-31 20:48:48','2011-09-25 20:49:02','2011-10-31 09:54:07',1,1,1,'2011-10-28_event-now','show',1,2,'Dock18',NULL,NULL,68,'init',1),(4,'Event Today','asdasdadsads','2011-10-31 12:51:37','2011-10-31 23:59:00','2011-09-26 14:13:09','2011-10-31 09:51:42',1,1,1,'2011-10-29_event-today','show',1,1,'Dock18',NULL,NULL,20,'done',1),(5,'Testevent final 000','asdasd','2011-10-29 18:05:01','2011-09-29 20:05:02','2011-09-28 20:45:04','2011-10-28 17:32:31',1,1,1,'2011-10-29_testevent-final-000','show',1,1,'Dock18',NULL,NULL,57,'done',1),(6,'supertestroom az szd iauds uoazsd','','2011-10-30 18:22:32','2011-10-30 22:59:44','2011-10-28 14:31:59','2011-10-30 18:22:36',1,1,1,'2011-10-28_supertestroom-az-szd-iauds-uoazsd','show',1,4,'Dock18',NULL,NULL,66,'init',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cmsplugin`
--

LOCK TABLES `cms_cmsplugin` WRITE;
/*!40000 ALTER TABLE `cms_cmsplugin` DISABLE KEYS */;
INSERT INTO `cms_cmsplugin` VALUES (1,3,NULL,1,'en','EventListingPlugin','2011-09-23 17:46:56',0,1,2,1),(4,9,NULL,0,'en','EventPlugin','2011-09-23 18:10:00',0,1,2,2),(5,12,NULL,0,'en','EventPlugin','2011-09-23 18:10:14',0,1,2,3),(7,15,NULL,0,'en','EventPlugin','2011-09-25 20:49:49',0,1,2,4),(8,18,NULL,0,'en','EventPlugin','2011-09-25 20:49:49',0,1,2,5),(9,18,NULL,1,'en','FilerFolderPlugin','2011-09-26 18:31:38',0,1,2,6),(12,21,NULL,1,'en','TextPlugin','2011-09-26 19:46:52',0,1,2,8),(13,21,NULL,0,'en','EventPlugin','2011-09-26 19:51:05',0,1,2,9),(14,30,NULL,0,'en','TextPlugin','2011-09-27 14:37:40',0,1,4,10),(15,3,14,NULL,'en','LinkPlugin','2011-09-27 14:38:34',1,2,3,10),(16,24,NULL,0,'en','EventPlugin','2011-09-28 20:47:25',0,1,2,11),(25,3,NULL,0,'en','TextPlugin','2011-10-07 18:58:38',0,1,2,13),(26,33,NULL,0,'en','EventPlugin','2011-10-28 14:38:32',0,1,2,14),(27,3,NULL,3,'en','EventListingPlugin','2011-10-28 17:30:55',0,1,2,15),(28,3,NULL,2,'en','TextPlugin','2011-10-28 17:31:06',0,1,2,16),(30,6,NULL,0,'en','EventListingPlugin','2011-10-28 18:01:11',0,1,2,17),(31,6,NULL,1,'en','TextPlugin','2011-10-28 18:01:55',0,1,2,18),(32,6,NULL,2,'en','EventListingPlugin','2011-10-28 18:02:07',0,1,2,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (1,'root','root',NULL,'2011-09-23 17:46:49','2011-10-29 15:34:32','2011-09-23 17:47:06',NULL,1,0,NULL,'',1,'layout/2col.html',1,0,0,1,2,1,0,NULL,1,NULL,1),(2,'root','root',NULL,'2011-09-23 18:07:58','2011-10-28 18:02:43','2011-09-23 18:12:31',NULL,1,0,'events','',1,'layout/1col.html',1,0,0,1,16,2,0,NULL,1,NULL,1),(3,'root','root',2,'2011-09-23 18:08:16','2011-09-25 16:43:00','2011-09-23 18:12:31',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,2,3,2,0,NULL,1,NULL,1),(4,'root','root',2,'2011-09-23 18:08:33','2011-09-23 18:12:32','2011-09-23 18:12:32',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,4,5,2,0,NULL,1,NULL,1),(5,'root','root',2,'2011-09-25 20:49:42','2011-09-25 20:50:04','2011-09-25 20:50:04',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,6,7,2,0,NULL,1,NULL,1),(6,'root','root',2,'2011-09-26 14:13:26','2011-09-26 20:17:51','2011-09-25 20:50:04',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,8,9,2,0,NULL,1,NULL,1),(7,'script','root',2,'2011-09-26 19:45:22','2011-09-27 14:41:45','2011-09-26 20:17:56',NULL,1,0,NULL,NULL,1,'layout/1col.html',1,0,1,10,11,2,0,NULL,1,NULL,1),(8,'root','root',2,'2011-09-28 20:47:16','2011-09-28 20:49:14','2011-09-28 20:49:14',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,12,13,2,0,NULL,1,NULL,1),(9,'root','root',2,'2011-10-28 14:38:26','2011-10-28 14:38:41','2011-10-28 14:38:41',NULL,1,0,NULL,'',1,'INHERIT',1,0,1,14,15,2,0,NULL,1,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_placeholders`
--

LOCK TABLES `cms_page_placeholders` WRITE;
/*!40000 ALTER TABLE `cms_page_placeholders` DISABLE KEYS */;
INSERT INTO `cms_page_placeholders` VALUES (1,1,1),(2,1,2),(3,1,3),(28,1,28),(29,1,29),(30,1,30),(4,2,4),(5,2,5),(6,2,6),(25,2,25),(26,2,26),(27,2,27),(7,3,7),(8,3,8),(9,3,9),(34,3,34),(35,3,35),(10,4,10),(11,4,11),(12,4,12),(13,5,13),(14,5,14),(15,5,15),(36,5,36),(37,5,37),(16,6,16),(17,6,17),(18,6,18),(19,7,19),(20,7,20),(21,7,21),(22,8,22),(23,8,23),(24,8,24),(31,9,31),(32,9,32),(33,9,33);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_placeholder`
--

LOCK TABLES `cms_placeholder` WRITE;
/*!40000 ALTER TABLE `cms_placeholder` DISABLE KEYS */;
INSERT INTO `cms_placeholder` VALUES (1,'body_content',NULL),(2,'template_footer',NULL),(3,'template_1_content_a',NULL),(4,'body_content',NULL),(5,'template_footer',NULL),(6,'template_1_content_a',NULL),(7,'body_content',NULL),(8,'template_footer',NULL),(9,'template_1_content_a',NULL),(10,'body_content',NULL),(11,'template_footer',NULL),(12,'template_1_content_a',NULL),(13,'body_content',NULL),(14,'template_footer',NULL),(15,'template_1_content_a',NULL),(16,'body_content',NULL),(17,'template_footer',NULL),(18,'template_1_content_a',NULL),(19,'body_content',NULL),(20,'template_footer',NULL),(21,'template_1_content_a',NULL),(22,'body_content',NULL),(23,'template_footer',NULL),(24,'template_1_content_a',NULL),(25,'sidebar_pre',NULL),(26,'sidebar_post',NULL),(27,'zidebar_pre',NULL),(28,'sidebar_pre',NULL),(29,'sidebar_post',NULL),(30,'template_1_content_2',NULL),(31,'sidebar_pre',NULL),(32,'sidebar_post',NULL),(33,'template_1_content_a',NULL),(34,'sidebar_pre',NULL),(35,'sidebar_post',NULL),(36,'sidebar_pre',NULL),(37,'sidebar_post',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_title`
--

LOCK TABLES `cms_title` WRITE;
/*!40000 ALTER TABLE `cms_title` DISABLE KEYS */;
INSERT INTO `cms_title` VALUES (1,'en','Dock18 Home','','dock18-home','',0,'','','','','',1,'2011-09-23 17:46:49'),(2,'en','Veranstaltungen','','veranstaltungen','veranstaltungen',0,'','','','','',2,'2011-09-23 18:07:58'),(3,'en','Test 1','','test-1','veranstaltungen/test-1',0,'','','','','',3,'2011-09-23 18:08:16'),(4,'en','Test 2','','test-2','veranstaltungen/test-2',0,'','','','','',4,'2011-09-23 18:08:33'),(5,'en','Test Event | +\"*ç%&/()=?','','test-event-c','veranstaltungen/test-event-c',0,'','','','','',5,'2011-09-25 20:49:42'),(6,'en','Test Event | should be today','','today-event','veranstaltungen/today-event',0,'','','','','',6,'2011-09-25 20:49:42'),(7,'en','My Page','','my-page','veranstaltungen/my-page',0,'','','','','',7,'2011-09-26 19:45:22'),(8,'en','Testevent 000','','testevent-000','veranstaltungen/testevent-000',0,'','','','','',8,'2011-09-28 20:47:16'),(9,'en','supertestroom','','supertestroom','veranstaltungen/supertestroom',0,'','','','','',9,'2011-10-28 14:38:26');
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
  `range` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_30ae6dfd` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_eventlistplugin`
--

LOCK TABLES `cmsplugin_eventlistplugin` WRITE;
/*!40000 ALTER TABLE `cmsplugin_eventlistplugin` DISABLE KEYS */;
INSERT INTO `cmsplugin_eventlistplugin` VALUES (1,'m',10,'future'),(27,'m',8,'past'),(30,'m',80,'future'),(32,'m',80,'past');
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
INSERT INTO `cmsplugin_eventplugin` VALUES (4,1),(13,1),(5,2),(7,3),(8,4),(16,5),(26,6);
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
-- Table structure for table `cmsplugin_filer_image_thumbnailoption`
--

DROP TABLE IF EXISTS `cmsplugin_filer_image_thumbnailoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_filer_image_thumbnailoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `crop` tinyint(1) NOT NULL,
  `upscale` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_filer_image_thumbnailoption`
--

LOCK TABLES `cmsplugin_filer_image_thumbnailoption` WRITE;
/*!40000 ALTER TABLE `cmsplugin_filer_image_thumbnailoption` DISABLE KEYS */;
INSERT INTO `cmsplugin_filer_image_thumbnailoption` VALUES (1,'m',200,200,1,1);
/*!40000 ALTER TABLE `cmsplugin_filer_image_thumbnailoption` ENABLE KEYS */;
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
-- Table structure for table `cmsplugin_filerimage`
--

DROP TABLE IF EXISTS `cmsplugin_filerimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_filerimage` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `image_id` int(11),
  `alt_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_autoscale` tinyint(1) NOT NULL DEFAULT '1',
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `alignment` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `free_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_option_id` int(11),
  `crop` tinyint(1) NOT NULL,
  `upscale` tinyint(1) NOT NULL,
  `original_link` tinyint(1) NOT NULL,
  `file_link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_filerimage_6682136` (`image_id`),
  KEY `cmsplugin_filerimage_37c07cc5` (`page_link_id`),
  KEY `cmsplugin_filerimage_6747c09c` (`thumbnail_option_id`),
  KEY `cmsplugin_filerimage_3ca539e4` (`file_link_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_3f873c7a` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `file_link_id_refs_id_5ec3672c` FOREIGN KEY (`file_link_id`) REFERENCES `filer_file` (`id`),
  CONSTRAINT `image_id_refs_file_ptr_id_6f5059d6` FOREIGN KEY (`image_id`) REFERENCES `filer_image` (`file_ptr_id`),
  CONSTRAINT `page_link_id_refs_id_3d7fd63c` FOREIGN KEY (`page_link_id`) REFERENCES `cms_page` (`id`),
  CONSTRAINT `thumbnail_option_id_refs_id_917a93` FOREIGN KEY (`thumbnail_option_id`) REFERENCES `cmsplugin_filer_image_thumbnailoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_filerimage`
--

LOCK TABLES `cmsplugin_filerimage` WRITE;
/*!40000 ALTER TABLE `cmsplugin_filerimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_filerimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_filerteaser`
--

DROP TABLE IF EXISTS `cmsplugin_filerteaser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_filerteaser` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `use_autoscale` tinyint(1) NOT NULL DEFAULT '1',
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `free_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_link_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) NOT NULL,
  `image_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_filerteaser_6682136` (`image_id`),
  KEY `cmsplugin_filerteaser_37c07cc5` (`page_link_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_90de02a` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `image_id_refs_file_ptr_id_73c83de6` FOREIGN KEY (`image_id`) REFERENCES `filer_image` (`file_ptr_id`),
  CONSTRAINT `page_link_id_refs_id_4dfb498` FOREIGN KEY (`page_link_id`) REFERENCES `cms_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_filerteaser`
--

LOCK TABLES `cmsplugin_filerteaser` WRITE;
/*!40000 ALTER TABLE `cmsplugin_filerteaser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_filerteaser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmsplugin_filervideo`
--

DROP TABLE IF EXISTS `cmsplugin_filervideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmsplugin_filervideo` (
  `cmsplugin_ptr_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `movie_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `height` smallint(5) unsigned NOT NULL,
  `auto_play` tinyint(1) NOT NULL DEFAULT '0',
  `auto_hide` tinyint(1) NOT NULL DEFAULT '0',
  `fullscreen` tinyint(1) NOT NULL DEFAULT '1',
  `loop` tinyint(1) NOT NULL DEFAULT '0',
  `bgcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000',
  `textcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FFFFFF',
  `seekbarcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '13ABEC',
  `seekbarbgcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '333333',
  `loadingbarcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '828282',
  `buttonoutcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '333333',
  `buttonovercolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000',
  `buttonhighlightcolor` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FFFFFF',
  PRIMARY KEY (`cmsplugin_ptr_id`),
  KEY `cmsplugin_filervideo_5d0896af` (`movie_id`),
  KEY `cmsplugin_filervideo_6682136` (`image_id`),
  CONSTRAINT `cmsplugin_ptr_id_refs_id_6897a7bc` FOREIGN KEY (`cmsplugin_ptr_id`) REFERENCES `cms_cmsplugin` (`id`),
  CONSTRAINT `image_id_refs_file_ptr_id_e935c74` FOREIGN KEY (`image_id`) REFERENCES `filer_image` (`file_ptr_id`),
  CONSTRAINT `movie_id_refs_id_7b871d76` FOREIGN KEY (`movie_id`) REFERENCES `filer_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmsplugin_filervideo`
--

LOCK TABLES `cmsplugin_filervideo` WRITE;
/*!40000 ALTER TABLE `cmsplugin_filervideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmsplugin_filervideo` ENABLE KEYS */;
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
INSERT INTO `cmsplugin_link` VALUES (15,'link','',4,'');
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
INSERT INTO `cmsplugin_text` VALUES (12,'<h2>hello world</h2><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. </p><blockquote><p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait </p></blockquote><pre>nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </pre>'),(14,'<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus.</p><p>Duis autem vel eum iriure diam nonummy nibh euismod <img src=\"/static/cms/images/plugins/link.png\" alt=\"Link - link\" id=\"plugin_obj_15\" title=\"Link - link\"/> ut laoreet dolore magna aliquam erat volutpat. </p>'),(25,'<p>asdajsdf ajgfd jagfsd ahjgfsd hjgafdghjafjs dfgjagh sdasda sd</p><p>asd azgsdajhksdgjahgsd </p>'),(28,'<h2>Archivierte Shows</h2><p>schon gelaufen - tja...</p>'),(31,'<h4>Archiv</h4>');
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
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-09-23 17:46:14',1,55,'1','asdasda',1,''),(2,'2011-09-23 17:46:23',1,31,'1','chatroom',1,''),(3,'2011-09-23 17:46:30',1,56,'1','asdasdjhag kjsdg akjshdg akjg',1,''),(4,'2011-09-23 17:46:49',1,40,'1','Dock18 Home',1,''),(5,'2011-09-23 17:47:01',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(6,'2011-09-23 17:47:06',1,40,'1','Dock18 Home',2,'Changed published, in_navigation, language and moderator_state.'),(7,'2011-09-23 18:07:58',1,40,'2','Veranstaltungen',1,''),(8,'2011-09-23 18:08:16',1,40,'3','Test 1',1,''),(9,'2011-09-23 18:08:33',1,40,'4','Test 2',1,''),(10,'2011-09-23 18:08:59',1,56,'1','EVENT---A',2,'Changed title, tags, date_start and date_end.'),(11,'2011-09-23 18:09:31',1,56,'2','EVENT---B',1,''),(12,'2011-09-23 18:10:06',1,40,'3','Test 1',2,'Changed language and moderator_state.'),(13,'2011-09-23 18:10:19',1,40,'4','Test 2',2,'Changed language and moderator_state.'),(14,'2011-09-23 18:12:58',1,40,'2','Veranstaltungen',2,'Changed reverse_id, language and moderator_state.'),(15,'2011-09-23 18:14:57',1,32,'1','root, 1316794497.23',1,''),(16,'2011-09-23 18:15:13',1,32,'2','root, 1316794513.52',1,''),(17,'2011-09-25 16:40:15',1,40,'3','Test 1',2,'Changed language and moderator_state.'),(18,'2011-09-25 16:43:00',1,40,'3','Test 1',2,'Changed language and moderator_state.'),(19,'2011-09-25 17:30:52',1,56,'1','EVENT---A',2,'Changed tags.'),(20,'2011-09-25 17:45:58',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(21,'2011-09-25 17:53:00',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(22,'2011-09-25 17:53:12',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(23,'2011-09-25 17:53:53',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(24,'2011-09-25 17:54:01',1,56,'1','EVENT---A',2,'Changed tags and intro.'),(25,'2011-09-25 20:00:33',1,56,'1','EVENT---A',2,'Changed tags and picture.'),(26,'2011-09-25 20:49:00',1,31,'2','blank',1,''),(27,'2011-09-25 20:49:02',1,56,'3','EVENT--NOW',1,''),(28,'2011-09-25 20:49:42',1,40,'5','Test Event | +\"*ç%&/()=?',1,''),(29,'2011-09-25 20:49:55',1,40,'5','Test Event | +\"*ç%&/()=?',2,'Changed language and moderator_state.'),(30,'2011-09-25 20:51:31',1,56,'3','EVENT--NOW',2,'Changed tags and date_start.'),(31,'2011-09-25 21:33:40',1,56,'3','EVENT--NOW',2,'Changed tags and date_start.'),(32,'2011-09-26 14:13:09',1,56,'4','Event Today',1,''),(33,'2011-09-26 14:14:00',1,40,'6','Test Event | +\"*ç%&/()=?',2,'Changed title, slug, language and moderator_state.'),(34,'2011-09-26 18:32:53',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(35,'2011-09-26 18:33:16',1,63,'1','Folder: \'test\'->all items [can_edit, can_read, can_add_children] []',1,''),(36,'2011-09-26 18:33:19',1,63,'1','Folder: \'test\'->all items [can_edit, can_read, can_add_children] []',2,'No fields changed.'),(37,'2011-09-26 18:54:10',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(38,'2011-09-26 19:27:10',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(39,'2011-09-26 19:27:46',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(40,'2011-09-26 19:34:54',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(41,'2011-09-26 19:58:30',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(42,'2011-09-26 19:58:50',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(43,'2011-09-26 20:17:51',1,40,'6','Test Event | should be today',2,'Changed language and moderator_state.'),(44,'2011-09-27 12:04:20',1,56,'2','EVENT---B',2,'Changed tags and picture.'),(45,'2011-09-27 12:10:50',1,56,'2','EVENT---B',2,'Changed tags and picture.'),(46,'2011-09-27 12:25:58',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(47,'2011-09-27 12:32:59',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(48,'2011-09-27 12:35:14',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(49,'2011-09-27 12:35:23',1,56,'2','EVENT---B',2,'Changed tags and picture.'),(50,'2011-09-27 12:37:54',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(51,'2011-09-27 13:04:09',1,56,'2','EVENT---B',2,'Changed tags and intro.'),(52,'2011-09-27 13:31:45',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(53,'2011-09-27 13:37:37',1,56,'1','EVENT---A',2,'Changed tags.'),(54,'2011-09-27 13:37:46',1,56,'1','EVENT---A',2,'Changed tags.'),(55,'2011-09-27 13:39:32',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(56,'2011-09-27 13:39:37',1,56,'1','EVENT---A',2,'Changed tags.'),(57,'2011-09-27 13:41:32',1,56,'1','EVENT---A',2,'Changed tags.'),(58,'2011-09-27 13:41:40',1,56,'1','EVENT---A',2,'Changed tags.'),(59,'2011-09-27 13:41:45',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(60,'2011-09-27 13:45:26',1,56,'1','EVENT---A',2,'Changed tags.'),(61,'2011-09-27 14:31:27',1,56,'1','EVENT---A',2,'Changed tags and picture.'),(62,'2011-09-27 14:38:47',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(63,'2011-09-27 14:39:26',1,56,'1','EVENT---A',2,'Changed excerpt and tags.'),(64,'2011-09-27 14:39:45',1,56,'1','EVENT---A',2,'Changed tags, transmission and chat.'),(65,'2011-09-27 14:40:55',1,40,'7','My Page',2,'Changed language and moderator_state.'),(66,'2011-09-27 14:41:45',1,40,'7','My Page',2,'Changed language and moderator_state.'),(67,'2011-09-27 14:44:45',1,56,'1','EVENT---A',2,'Changed excerpt and tags.'),(68,'2011-09-27 17:24:59',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(69,'2011-09-27 17:26:39',1,56,'1','EVENT---A',2,'Changed tags and folder.'),(70,'2011-09-28 20:45:04',1,56,'5','Testevent final 000',1,''),(71,'2011-09-28 20:47:16',1,40,'8','Testevent 000',1,''),(72,'2011-09-28 20:49:14',1,40,'8','Testevent 000',2,'Changed published, in_navigation, language and moderator_state.'),(73,'2011-09-28 20:55:41',1,56,'5','Testevent final 000',2,'Changed tags, date_start and date_end.'),(74,'2011-09-28 20:56:04',1,56,'5','Testevent final 000',2,'Changed tags and date_start.'),(75,'2011-09-28 20:59:30',1,56,'5','Testevent final 000',2,'Changed tags and date_end.'),(76,'2011-09-28 21:40:43',1,64,'365','Intro, ULYSESS isst kuchen',2,'Changed name, owner and description.'),(77,'2011-09-28 21:40:53',1,64,'365','1. Intro, ULYSESS isst kuchen',2,'Changed name.'),(78,'2011-09-28 21:40:56',1,64,'365','1. Intro, ULYSESS isst kuchen',2,'No fields changed.'),(79,'2011-09-28 21:40:57',1,64,'365','1. Intro, ULYSESS isst kuchen',2,'No fields changed.'),(80,'2011-09-28 21:41:10',1,64,'366','2. Ein anderes file',2,'Changed name and owner.'),(81,'2011-09-29 19:05:09',1,56,'5','Testevent final 000',2,'Changed tags, date_start and date_end.'),(82,'2011-10-01 16:53:52',1,36,'1','web.devel.dock18.ch:8000',2,'Changed domain and name.'),(83,'2011-10-01 17:47:02',1,56,'1','EVENT---A',2,'Changed excerpt, tags, transmission and chat.'),(84,'2011-10-03 13:04:02',1,32,'1','root, 1316794497.23',3,''),(85,'2011-10-03 13:04:02',1,32,'2','root, 1316794513.52',3,''),(86,'2011-10-03 13:04:02',1,32,'3','root, 1316950005.76',3,''),(87,'2011-10-03 13:04:02',1,32,'4','root, 1316950009.67',3,''),(88,'2011-10-03 13:04:02',1,32,'5','root, 1316950042.24',3,''),(89,'2011-10-03 13:04:02',1,32,'6','root, 1316950103.03',3,''),(90,'2011-10-03 13:04:02',1,32,'7','user, 1316950166.57',3,''),(91,'2011-10-03 13:04:02',1,32,'8','user, 1316950168.2',3,''),(92,'2011-10-03 13:04:02',1,32,'9','user, 1316950169.12',3,''),(93,'2011-10-03 13:04:02',1,32,'10','user, 1316950170.52',3,''),(94,'2011-10-03 13:04:02',1,32,'11','user, 1316950171.85',3,''),(95,'2011-10-03 13:04:02',1,32,'12','user, 1316950187.41',3,''),(96,'2011-10-03 13:04:02',1,32,'13','user, 1316950210.09',3,''),(97,'2011-10-03 13:04:02',1,32,'14','jonas.ohrstrom, 1316952864.27',3,''),(98,'2011-10-03 13:04:02',1,32,'15','jonas.ohrstrom, 1316958401.26',3,''),(99,'2011-10-03 13:04:02',1,32,'16','jonas.ohrstrom, 1316958403.26',3,''),(100,'2011-10-03 13:04:02',1,32,'17','jonas.ohrstrom, 1316958403.95',3,''),(101,'2011-10-03 13:04:02',1,32,'18','jonas.ohrstrom, 1316958405.31',3,''),(102,'2011-10-03 13:04:02',1,32,'19','root, 1316962897.84',3,''),(103,'2011-10-03 13:04:02',1,32,'20','root, 1316962906.58',3,''),(104,'2011-10-03 13:04:02',1,32,'21','root, 1316963764.76',3,''),(105,'2011-10-03 13:04:02',1,32,'22','root, 1316972889.88',3,''),(106,'2011-10-03 13:04:02',1,32,'23','root, 1316975480.89',3,''),(107,'2011-10-03 13:04:02',1,32,'24','root, 1316975482.74',3,''),(108,'2011-10-03 13:04:02',1,32,'25','root, 1316977054.67',3,''),(109,'2011-10-03 13:04:02',1,32,'26','root, 1316977054.78',3,''),(110,'2011-10-03 13:04:02',1,32,'27','user, 1316978946.13',3,''),(111,'2011-10-03 13:04:02',1,32,'28','root, 1317045228.54',3,''),(112,'2011-10-03 13:04:02',1,32,'29','root, 1317045230.41',3,''),(113,'2011-10-03 13:04:02',1,32,'30','root, 1317045231.37',3,''),(114,'2011-10-03 13:04:02',1,32,'31','root, 1317045239.38',3,''),(115,'2011-10-03 13:04:02',1,32,'32','root, 1317051637.27',3,''),(116,'2011-10-03 13:04:02',1,32,'33','root, 1317051658.64',3,''),(117,'2011-10-03 13:04:02',1,32,'34','root, 1317051664.5',3,''),(118,'2011-10-03 13:04:02',1,32,'35','root, 1317051666.04',3,''),(119,'2011-10-03 13:04:02',1,32,'36','root, 1317051667.27',3,''),(120,'2011-10-03 13:04:02',1,32,'37','root, 1317051667.77',3,''),(121,'2011-10-03 13:04:02',1,32,'38','root, 1317051668.1',3,''),(122,'2011-10-03 13:04:02',1,32,'39','root, 1317235771.9',3,''),(123,'2011-10-03 13:04:02',1,32,'40','root, 1317235797.71',3,''),(124,'2011-10-03 13:04:02',1,32,'41','root, 1317484830.22',3,''),(125,'2011-10-03 13:04:02',1,32,'42','root, 1317484833.59',3,''),(126,'2011-10-03 13:04:02',1,32,'43','root, 1317484874.79',3,''),(127,'2011-10-03 13:04:02',1,32,'44','root, 1317484903.89',3,''),(128,'2011-10-03 13:04:02',1,32,'45','root, 1317484905.17',3,''),(129,'2011-10-03 13:04:02',1,32,'46','root, 1317484907.51',3,''),(130,'2011-10-03 13:04:02',1,32,'47','root, 1317484909.28',3,''),(131,'2011-10-03 13:04:02',1,32,'48','root, 1317484910.35',3,''),(132,'2011-10-03 13:04:02',1,32,'49','root, 1317484911.28',3,''),(133,'2011-10-03 13:04:02',1,32,'50','root, 1317484912.41',3,''),(134,'2011-10-03 13:04:02',1,32,'51','root, 1317484914.09',3,''),(135,'2011-10-03 13:04:02',1,32,'52','root, 1317484915.55',3,''),(136,'2011-10-03 13:04:02',1,32,'53','root, 1317484916.44',3,''),(137,'2011-10-03 13:04:02',1,32,'54','root, 1317484917.37',3,''),(138,'2011-10-03 13:04:02',1,32,'55','root, 1317484918.51',3,''),(139,'2011-10-03 13:04:02',1,32,'56','root, 1317484919.69',3,''),(140,'2011-10-03 13:04:02',1,32,'57','root, 1317484921.98',3,''),(141,'2011-10-03 13:04:02',1,32,'58','root, 1317484923.17',3,''),(142,'2011-10-03 13:04:02',1,32,'59','root, 1317484924.27',3,''),(143,'2011-10-03 13:04:02',1,32,'60','root, 1317484929.72',3,''),(144,'2011-10-03 13:04:02',1,32,'61','root, 1317484931.24',3,''),(145,'2011-10-03 13:04:02',1,32,'62','root, 1317484933.05',3,''),(146,'2011-10-03 13:04:02',1,32,'63','root, 1317484934.46',3,''),(147,'2011-10-03 13:04:02',1,32,'64','root, 1317484935.66',3,''),(148,'2011-10-03 13:04:02',1,32,'65','root, 1317484936.73',3,''),(149,'2011-10-03 13:04:02',1,32,'66','root, 1317484937.51',3,''),(150,'2011-10-03 13:04:02',1,32,'67','root, 1317484939.02',3,''),(151,'2011-10-03 13:04:02',1,32,'68','root, 1317485020.24',3,''),(152,'2011-10-03 13:04:02',1,32,'69','root, 1317485061.34',3,''),(153,'2011-10-03 13:04:02',1,32,'70','root, 1317485069.05',3,''),(154,'2011-10-03 13:04:02',1,32,'71','root, 1317485091.7',3,''),(155,'2011-10-03 13:04:02',1,32,'72','root, 1317485093.6',3,''),(156,'2011-10-03 13:04:02',1,32,'73','root, 1317485095.14',3,''),(157,'2011-10-03 13:04:02',1,32,'74','root, 1317485107.62',3,''),(158,'2011-10-03 13:04:02',1,32,'75','root, 1317485109.45',3,''),(159,'2011-10-03 13:04:02',1,32,'76','root, 1317485123.66',3,''),(160,'2011-10-03 13:04:02',1,32,'77','root, 1317485136.33',3,''),(161,'2011-10-03 13:04:02',1,32,'78','root, 1317485159.01',3,''),(162,'2011-10-03 13:04:02',1,32,'79','root, 1317485163.09',3,''),(163,'2011-10-03 13:04:02',1,32,'80','root, 1317485170.86',3,''),(164,'2011-10-03 13:04:02',1,32,'81','root, 1317485175.55',3,''),(165,'2011-10-03 13:04:02',1,32,'82','root, 1317485182.93',3,''),(166,'2011-10-03 13:04:02',1,32,'83','root, 1317485193.69',3,''),(167,'2011-10-03 13:04:02',1,32,'84','root, 1317485194.45',3,''),(168,'2011-10-03 13:04:02',1,32,'85','root, 1317485195.39',3,''),(169,'2011-10-03 13:04:02',1,32,'86','root, 1317485196.11',3,''),(170,'2011-10-03 13:04:02',1,32,'87','root, 1317485196.69',3,''),(171,'2011-10-03 13:04:02',1,32,'88','root, 1317485197.35',3,''),(172,'2011-10-03 13:04:02',1,32,'89','root, 1317485198.23',3,''),(173,'2011-10-03 13:04:02',1,32,'90','root, 1317485198.37',3,''),(174,'2011-10-03 13:04:02',1,32,'91','root, 1317485199.72',3,''),(175,'2011-10-03 13:04:02',1,32,'92','root, 1317485305.04',3,''),(176,'2011-10-03 13:04:02',1,32,'93','root, 1317485306.17',3,''),(177,'2011-10-03 13:04:02',1,32,'94','root, 1317485307.13',3,''),(178,'2011-10-03 13:04:02',1,32,'95','root, 1317485307.93',3,''),(179,'2011-10-03 13:04:02',1,32,'96','root, 1317485309.06',3,''),(180,'2011-10-03 13:04:02',1,32,'97','root, 1317485310.0',3,''),(181,'2011-10-03 13:04:02',1,32,'98','root, 1317485310.9',3,''),(182,'2011-10-03 13:04:02',1,32,'99','root, 1317485312.03',3,''),(183,'2011-10-03 13:04:02',1,32,'100','root, 1317485313.08',3,''),(184,'2011-10-03 13:04:09',1,32,'106','root, 1317485330.47',3,''),(185,'2011-10-07 16:31:12',1,40,'2','Veranstaltungen',2,'Changed language and moderator_state.'),(186,'2011-10-07 16:31:32',1,40,'2','Veranstaltungen',2,'Changed language and moderator_state.'),(187,'2011-10-07 16:32:55',1,75,'1','m -- 200 x 200',1,''),(188,'2011-10-07 17:21:26',1,40,'2','Veranstaltungen',2,'Changed language and moderator_state.'),(189,'2011-10-07 18:41:41',1,40,'1','Dock18 Home',2,'Changed template, language and moderator_state.'),(190,'2011-10-07 18:42:07',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(191,'2011-10-07 18:58:49',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(192,'2011-10-07 19:10:56',1,56,'1','EVENT---A',2,'Changed tags, date_start and date_end.'),(193,'2011-10-28 14:11:41',1,2,'1','Streamers',1,''),(194,'2011-10-28 14:11:54',1,3,'1','root',2,'Changed groups.'),(195,'2011-10-28 14:25:16',1,3,'1','root',2,'No fields changed.'),(196,'2011-10-28 14:25:40',1,3,'1','root',2,'No fields changed.'),(197,'2011-10-28 14:31:59',1,56,'6','supertestroom',1,''),(198,'2011-10-28 14:34:37',1,56,'6','supertestroom',2,'Changed tags and date_end.'),(199,'2011-10-28 14:35:05',1,56,'6','supertestroom',2,'Changed tags and date_start.'),(200,'2011-10-28 14:38:26',1,40,'9','supertestroom',1,''),(201,'2011-10-28 14:38:37',1,40,'9','supertestroom',2,'Changed language and moderator_state.'),(202,'2011-10-28 14:38:41',1,40,'9','supertestroom',2,'Changed published, in_navigation, language and moderator_state.'),(203,'2011-10-28 14:45:22',1,56,'6','supertestroom',2,'Changed tags and date_start.'),(204,'2011-10-28 14:45:38',1,56,'6','supertestroom',2,'Changed tags and date_start.'),(205,'2011-10-28 14:59:28',1,56,'6','supertestroom',2,'Changed tags and date_start.'),(206,'2011-10-28 15:01:11',1,56,'6','supertestroom',2,'Changed tags.'),(207,'2011-10-28 17:31:27',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(208,'2011-10-28 17:32:19',1,56,'4','Event Today',2,'Changed tags, date_start and date_end.'),(209,'2011-10-28 17:32:31',1,56,'5','Testevent final 000',2,'Changed tags and date_start.'),(210,'2011-10-28 17:49:38',1,56,'3','EVENT--NOW',2,'Changed tags, date_start and date_end.'),(211,'2011-10-28 17:59:51',1,56,'6','supertestroom',2,'Changed tags, date_start and date_end.'),(212,'2011-10-28 18:01:22',1,40,'2','Veranstaltungen',2,'Changed language and moderator_state.'),(213,'2011-10-28 18:02:16',1,40,'2','Veranstaltungen',2,'Changed language and moderator_state.'),(214,'2011-10-28 18:02:43',1,40,'2','Veranstaltungen',2,'Changed language and moderator_state.'),(215,'2011-10-28 18:45:33',1,56,'6','supertestroom az szd iauds uoazsd',2,'Changed title and tags.'),(216,'2011-10-29 15:34:32',1,40,'1','Dock18 Home',2,'Changed language and moderator_state.'),(217,'2011-10-29 17:11:04',1,56,'2','EVENT---B',2,'Changed tags and folder.'),(218,'2011-10-29 18:03:44',1,31,'4','xfvxvcvcxvxvx',1,''),(219,'2011-10-29 18:03:46',1,56,'6','supertestroom az szd iauds uoazsd',2,'Changed tags and room.'),(220,'2011-10-29 18:14:45',1,56,'4','Event Today',2,'Changed tags, date_start and date_end.'),(221,'2011-10-30 12:22:52',1,65,'376','STREAM REC 1',2,'Changed name and description.'),(222,'2011-10-30 18:17:04',1,56,'4','Event Today',2,'Changed tags, date_start and date_end.'),(223,'2011-10-30 18:22:21',1,56,'4','Event Today',2,'Changed tags and date_start.'),(224,'2011-10-30 18:22:36',1,56,'6','supertestroom az szd iauds uoazsd',2,'Changed tags, date_start and date_end.'),(225,'2011-10-31 09:51:42',1,56,'4','Event Today',2,'Changed tags, date_start and date_end.'),(226,'2011-10-31 09:54:07',1,56,'3','EVENT--NOW',2,'Changed tags, date_start and date_end.'),(227,'2011-10-31 09:54:46',1,56,'2','EVENT---Tomorrow',2,'Changed title, tags, date_start and date_end.'),(228,'2011-10-31 12:25:31',1,64,'7','Movie_on_9-25-11_at_5.42_PM.mov',2,'Changed cue_in and cue_out.'),(229,'2011-10-31 12:35:32',1,64,'7','Movie_on_9-25-11_at_5.42_PM.mov',2,'No fields changed.'),(230,'2011-10-31 12:39:19',1,65,'374','ERSTER BILD',2,'Changed name.'),(231,'2011-10-31 12:40:23',1,64,'368','desktop.ini',2,'Changed cue_in.');
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'log entry','admin','logentry'),(8,'comment','comments','comment'),(9,'comment flag','comments','commentflag'),(10,'notice type','notification','noticetype'),(11,'notice setting','notification','noticesetting'),(12,'notice','notification','notice'),(13,'notice queue batch','notification','noticequeuebatch'),(14,'observed item','notification','observeditem'),(15,'message','mailer','message'),(16,'don\'t send entry','mailer','dontsendentry'),(17,'message log','mailer','messagelog'),(18,'email address','emailconfirmation','emailaddress'),(19,'email confirmation','emailconfirmation','emailconfirmation'),(20,'announcement','announcements','announcement'),(21,'account','account','account'),(22,'password reset','account','passwordreset'),(23,'signup code','signup_codes','signupcode'),(24,'signup code result','signup_codes','signupcoderesult'),(25,'profile','profiles','profile'),(26,'cache key','menus','cachekey'),(27,'source','easy_thumbnails','source'),(28,'thumbnail','easy_thumbnails','thumbnail'),(29,'Tag','taggit','tag'),(30,'Tagged Item','taggit','taggeditem'),(31,'room','jqchat','room'),(32,'message','jqchat','message'),(33,'nonce','django_openid','nonce'),(34,'association','django_openid','association'),(35,'user openid association','django_openid','useropenidassociation'),(36,'site','sites','site'),(37,'migration history','south','migrationhistory'),(38,'placeholder','cms','placeholder'),(39,'cms plugin','cms','cmsplugin'),(40,'page','cms','page'),(41,'PageModerator','cms','pagemoderator'),(42,'Page moderator state','cms','pagemoderatorstate'),(43,'Page global permission','cms','globalpagepermission'),(44,'Page permission','cms','pagepermission'),(45,'User (page)','cms','pageuser'),(46,'User group (page)','cms','pageusergroup'),(47,'title','cms','title'),(48,'text','text','text'),(49,'picture','picture','picture'),(50,'link','link','link'),(51,'file','file','file'),(52,'Snippet','snippet','snippet'),(53,'Snippet','snippet','snippetptr'),(54,'google map','googlemap','googlemap'),(55,'season','bcast','season'),(56,'Event','bcast','event'),(57,'participation','bcast','participation'),(58,'event plugin','bcast','eventplugin'),(59,'event list plugin','bcast','eventlistplugin'),(60,'facebook profile','facebook','facebookprofile'),(61,'participants plugin','bcast','participantsplugin'),(62,'folder','filer','folder'),(63,'Folder Permission','filer','folderpermission'),(64,'File','filer','file'),(65,'Image','filer','image'),(66,'Clipboard','filer','clipboard'),(67,'Clipboard item','filer','clipboarditem'),(68,'filer file','cmsplugin_filer_file','filerfile'),(69,'filer folder','cmsplugin_filer_folder','filerfolder'),(70,'join invitation','kaleo','joininvitation'),(71,'invitation stat','kaleo','invitationstat'),(72,'like','phileo','like'),(73,'analytics','analytics','analytics'),(74,'filer image','cmsplugin_filer_image','filerimage'),(75,'thumbnail option','cmsplugin_filer_image','thumbnailoption'),(76,'filer teaser','cmsplugin_filer_teaser','filerteaser'),(77,'filer video','cmsplugin_filer_video','filervideo'),(78,'spectate','spectators','spectate');
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
INSERT INTO `django_session` VALUES ('009ebf47f6794e9ab711b2c8c6c00107','NjBlOTcxOTZjNDI1YzMzZDI5Y2Q3YTg5MjUxOTFkYmJlNTEwYjI1ODqAAn1xAShVDmNtc19hZG1p\nbl9zaXRlcQKKAQFVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28uY29udHJpYi5hdXRoLmJh\nY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQF1Lg==\n','2011-11-13 12:22:52'),('0fb995c9176da0d0919c4b60c4566c09','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 20:31:30'),('171494fa8c02e1931e331003028cbb6f','MDI1M2M1Mjk1MmIwM2ZhMTRiZmQ5NjIxMzFiNTA2NDBlZmZhNDQ4ZTqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQJV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-10-09 21:20:36'),('19d1d574acd564bf3817a13075a535c1','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 11:17:13'),('1eb5e6300a8ba8d7ba30e86e20663fcb','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 13:28:43'),('2b68519432227e65f11993651d9747fd','ZGMwNWEyNjE5YWZkNmNiY2M2ODBiZmQ3N2E1ZWQ2NzQzZWM5MjQ3OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-10-21 19:10:56'),('2cdecf2feccf5db4b433a29a432467e2','MzBjNGM1YjhiNzAzZjM5MDQ3YjlmMWZmYWMyNzEyMjRhMjg3MjlmNDqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQFV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-10-12 22:38:01'),('344733094eefd55e4a0f91c4763b08f9','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 20:31:30'),('56d4efada4f7c3ca325789c6b93e9cb4','MzBjNGM1YjhiNzAzZjM5MDQ3YjlmMWZmYWMyNzEyMjRhMjg3MjlmNDqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQFV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-10-15 17:47:02'),('7d0e386139f8e35ba84cbf49ded83bc8','ZmI4MzZlNDMwNGVkMzg3MzY3ZjJiODA3MDliMTA2MzhlNDMxOThiOTqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVD19zZXNzaW9uX2V4cGlyeXEDSwBVDV9hdXRoX3Vz\nZXJfaWRxBIoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kcQVVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kcQZVDmNtc19hZG1pbl9zaXRlcQeKAQF1Lg==\n','2011-10-17 17:40:48'),('87f1b1476463541283524a3f322e6a12','NTNmOTVjMTRiMjkxYTlkYjBkYWE5YzJhZWU3YTkzZGVmN2UzOGE1YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVTZwaW5heC5hcHBzLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNh\ndGlvbkJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=\n','2011-10-07 16:47:42'),('8f4efeed90da204b56264012707ac98d','NGY3Mzc3Y2RkZjQ1MTUzMmVhMWRmNjBhNmNmMDg3N2E5Yjk4YjM2MjqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVD19zZXNzaW9uX2V4cGlyeXEDSwBVDV9hdXRoX3Vz\nZXJfaWRxBIoBAVUOY21zX2FkbWluX3NpdGVxBYoBAVUSX2F1dGhfdXNlcl9iYWNrZW5kcQZVKWRq\nYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQd1Lg==\n','2011-11-12 18:03:46'),('909fe3001009ffdf3244abd2fe4507e6','MzBjNGM1YjhiNzAzZjM5MDQ3YjlmMWZmYWMyNzEyMjRhMjg3MjlmNDqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQFV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-10-19 18:16:43'),('9e404f9232233d7adcde6c843773f755','MzBjNGM1YjhiNzAzZjM5MDQ3YjlmMWZmYWMyNzEyMjRhMjg3MjlmNDqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQFV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-10-20 19:41:32'),('a708bc98d29a1e07c6928fdd2e97210a','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-11-13 18:39:11'),('ccbb58ece72b6c5c8c7c1423a1b88a97','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-10-09 20:31:30'),('d88d8d3f19dec28367ad958a94ad0529','YjgzYjRiZTYyMWU3ZDZmNzYyNTI4YjMwNWU5ZWJhZWUyYzUxYWFkNzqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVD19zZXNzaW9uX2V4cGlyeXEDSwBVDV9hdXRoX3Vz\nZXJfaWRxBIoBAVUKdGVzdGNvb2tpZXEFVQZ3b3JrZWRxBlUSX2F1dGhfdXNlcl9iYWNrZW5kcQdV\nKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQh1Lg==\n','2011-11-12 18:14:45'),('e9371727b3aaed78e0a490b6946e9ccc','NTg0YjA2ZDYxYTA0Y2QyNWVmNDBmNjI3NDFhMjM2YmI0YzgzMGQwODqAAn1xAShVDmNtc19hZG1p\nbl9zaXRlcQKKAQFVDV9hdXRoX3VzZXJfaWRxA4oBAVUSX2F1dGhfdXNlcl9iYWNrZW5kcQRVKWRq\nYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQV1Lg==\n','2011-11-14 18:31:52'),('f6f48fcfc2dd49e983e3f04bbb7a50f6','NmEyN2NlYmE2YzRhYjVmYTE2Yjk2M2IxYmM5YTI1OTA4NDkyY2ZjODqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVDV9hdXRoX3VzZXJfaWRxA4oBAlUSX2F1dGhfdXNl\ncl9iYWNrZW5kcQRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQV1\nLg==\n','2011-10-09 13:29:15'),('fa96307b960b367a47434c059357bccf','MzBjNGM1YjhiNzAzZjM5MDQ3YjlmMWZmYWMyNzEyMjRhMjg3MjlmNDqAAn1xAShVH2lkaW9zX2Fk\nZGl0aW9uYWxfaW5mb19raWNrc3RhcnRxAohVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSlkamFuZ28u\nY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEEVQ1fYXV0aF91c2VyX2lkcQWKAQFV\nD19zZXNzaW9uX2V4cGlyeXEGSwB1Lg==\n','2011-11-14 12:40:23'),('fc08f94e84c70acec6f4c6ea8104a39e','ZGRiMzBiZDU3ZDNkYzI4MDE5OTY2YzJkZmQ2MDIyNGIwNDBmOTdlYjqAAn1xAS4=\n','2011-11-01 21:17:21');
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
INSERT INTO `django_site` VALUES (1,'web.devel.dock18.ch:8000','web.devel.dock18.ch:8000');
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
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_source`
--

LOCK TABLES `easy_thumbnails_source` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_source` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_source` VALUES (1,'f9bde26a1556cd667f742bd34ec7c55e','pictures/R-1624927-1242546064.jpg','2011-09-25 20:00:33'),(2,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg','2011-09-26 18:53:22'),(3,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg','2011-09-26 18:53:23'),(4,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg','2011-09-26 18:53:25'),(5,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/jonas_ohrstrom-0g48cv7jxl7qjvhsr6lo.pdf','2011-09-26 18:56:19'),(6,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/jonas_ohrstrom-utkp9duixiuqhpo1or41.pdf','2011-09-26 18:56:19'),(7,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/movie_on_9-25-11_at_542_pm.mov','2011-09-27 12:32:42'),(8,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/movie_on_9-25-11_at_542_pm_1.mov','2011-09-27 14:15:50'),(9,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/desktop.ini','2011-09-27 14:16:00'),(10,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg','2011-09-27 14:16:00'),(11,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg','2011-09-27 14:16:09'),(12,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg','2011-09-27 14:22:10'),(13,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg','2011-09-27 14:22:18'),(14,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0134.jpg','2011-09-27 16:53:50'),(15,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile.txt','2011-09-27 17:41:31'),(16,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie.css','2011-09-27 17:41:31'),(17,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts.css','2011-09-27 17:41:31'),(18,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen.css','2011-09-27 17:41:31'),(19,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print.css','2011-09-27 17:41:31'),(20,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_1.txt','2011-09-27 17:41:31'),(21,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form.css','2011-09-27 17:41:31'),(22,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_2.txt','2011-09-27 17:41:44'),(23,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_1.css','2011-09-27 17:41:44'),(24,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_1.css','2011-09-27 17:41:44'),(25,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_1.css','2011-09-27 17:41:44'),(26,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_1.css','2011-09-27 17:41:44'),(27,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_3.txt','2011-09-27 17:41:45'),(28,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_1.css','2011-09-27 17:41:45'),(29,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_4.txt','2011-09-27 17:44:30'),(30,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_2.css','2011-09-27 17:44:30'),(31,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_5.txt','2011-09-27 17:44:33'),(32,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_3.css','2011-09-27 17:44:33'),(33,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_6.txt','2011-09-27 17:44:35'),(34,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_4.css','2011-09-27 17:44:35'),(35,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_7.txt','2011-09-27 17:44:38'),(36,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_5.css','2011-09-27 17:44:38'),(37,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_8.txt','2011-09-27 17:49:31'),(38,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_6.css','2011-09-27 17:49:31'),(39,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_9.txt','2011-09-27 17:49:34'),(40,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_7.css','2011-09-27 17:49:34'),(41,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_10.txt','2011-09-27 17:54:36'),(42,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_8.css','2011-09-27 17:54:36'),(43,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_11.txt','2011-09-27 18:46:55'),(44,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_2.css','2011-09-27 18:46:55'),(45,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_2.css','2011-09-27 18:46:55'),(46,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_2.css','2011-09-27 18:46:55'),(47,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_2.css','2011-09-27 18:46:55'),(48,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_12.txt','2011-09-27 18:46:55'),(49,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_9.css','2011-09-27 18:46:55'),(50,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_13.txt','2011-09-27 18:46:55'),(51,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_3.css','2011-09-27 18:46:55'),(52,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_3.css','2011-09-27 18:46:55'),(53,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_3.css','2011-09-27 18:46:55'),(54,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_3.css','2011-09-27 18:46:55'),(55,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_14.txt','2011-09-27 18:46:55'),(56,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_10.css','2011-09-27 18:46:55'),(57,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_15.txt','2011-09-27 18:46:55'),(58,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_4.css','2011-09-27 18:46:55'),(59,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_4.css','2011-09-27 18:46:55'),(60,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_4.css','2011-09-27 18:46:55'),(61,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_4.css','2011-09-27 18:46:55'),(62,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_16.txt','2011-09-27 18:46:55'),(63,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_11.css','2011-09-27 18:46:55'),(64,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_17.txt','2011-09-27 18:57:31'),(65,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_5.css','2011-09-27 18:57:31'),(66,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_5.css','2011-09-27 18:57:31'),(67,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_5.css','2011-09-27 18:57:31'),(68,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_5.css','2011-09-27 18:57:31'),(69,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_18.txt','2011-09-27 18:57:31'),(70,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_12.css','2011-09-27 18:57:31'),(71,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_19.txt','2011-09-27 18:57:31'),(72,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_6.css','2011-09-27 18:57:31'),(73,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_6.css','2011-09-27 18:57:31'),(74,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_6.css','2011-09-27 18:57:31'),(75,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_6.css','2011-09-27 18:57:31'),(76,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_20.txt','2011-09-27 18:57:31'),(77,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_13.css','2011-09-27 18:57:31'),(78,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_21.txt','2011-09-27 18:57:31'),(79,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_7.css','2011-09-27 18:57:31'),(80,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_7.css','2011-09-27 18:57:31'),(81,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_7.css','2011-09-27 18:57:31'),(82,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_7.css','2011-09-27 18:57:31'),(83,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_22.txt','2011-09-27 18:57:31'),(84,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_14.css','2011-09-27 18:57:31'),(85,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_23.txt','2011-09-27 18:58:23'),(86,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_24.txt','2011-09-27 18:58:52'),(87,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_8.css','2011-09-27 18:58:52'),(88,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_8.css','2011-09-27 18:58:52'),(89,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_8.css','2011-09-27 18:58:52'),(90,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_8.css','2011-09-27 18:58:52'),(91,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_25.txt','2011-09-27 18:58:52'),(92,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_15.css','2011-09-27 18:58:52'),(93,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_26.txt','2011-09-27 18:58:52'),(94,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_9.css','2011-09-27 18:58:52'),(95,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_9.css','2011-09-27 18:58:52'),(96,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_9.css','2011-09-27 18:58:52'),(97,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_9.css','2011-09-27 18:58:52'),(98,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_27.txt','2011-09-27 18:58:52'),(99,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_16.css','2011-09-27 18:58:52'),(100,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_28.txt','2011-09-27 18:58:52'),(101,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_10.css','2011-09-27 18:58:52'),(102,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_10.css','2011-09-27 18:58:52'),(103,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_10.css','2011-09-27 18:58:52'),(104,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_10.css','2011-09-27 18:58:52'),(105,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_29.txt','2011-09-27 18:58:52'),(106,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_17.css','2011-09-27 18:58:52'),(107,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_30.txt','2011-09-27 18:59:28'),(108,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_11.css','2011-09-27 18:59:28'),(109,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_11.css','2011-09-27 18:59:28'),(110,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_11.css','2011-09-27 18:59:28'),(111,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_11.css','2011-09-27 18:59:28'),(112,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_31.txt','2011-09-27 18:59:28'),(113,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_18.css','2011-09-27 18:59:28'),(114,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_32.txt','2011-09-27 18:59:28'),(115,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_12.css','2011-09-27 18:59:28'),(116,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_12.css','2011-09-27 18:59:28'),(117,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_12.css','2011-09-27 18:59:28'),(118,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_12.css','2011-09-27 18:59:28'),(119,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_33.txt','2011-09-27 18:59:28'),(120,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_19.css','2011-09-27 18:59:28'),(121,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_34.txt','2011-09-27 18:59:28'),(122,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_13.css','2011-09-27 18:59:29'),(123,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_13.css','2011-09-27 18:59:29'),(124,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_13.css','2011-09-27 18:59:29'),(125,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_13.css','2011-09-27 18:59:29'),(126,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_35.txt','2011-09-27 18:59:29'),(127,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_20.css','2011-09-27 18:59:29'),(128,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_36.txt','2011-09-27 19:00:14'),(129,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_14.css','2011-09-27 19:00:14'),(130,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_14.css','2011-09-27 19:00:14'),(131,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_14.css','2011-09-27 19:00:14'),(132,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_14.css','2011-09-27 19:00:14'),(133,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_37.txt','2011-09-27 19:00:14'),(134,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_21.css','2011-09-27 19:00:14'),(135,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_38.txt','2011-09-27 19:00:14'),(136,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_15.css','2011-09-27 19:00:14'),(137,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_15.css','2011-09-27 19:00:14'),(138,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_15.css','2011-09-27 19:00:14'),(139,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_15.css','2011-09-27 19:00:14'),(140,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_39.txt','2011-09-27 19:00:14'),(141,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_22.css','2011-09-27 19:00:14'),(142,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_40.txt','2011-09-27 19:00:14'),(143,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_16.css','2011-09-27 19:00:14'),(144,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_16.css','2011-09-27 19:00:14'),(145,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_16.css','2011-09-27 19:00:14'),(146,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_16.css','2011-09-27 19:00:14'),(147,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_41.txt','2011-09-27 19:00:14'),(148,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_23.css','2011-09-27 19:00:14'),(149,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_42.txt','2011-09-27 19:00:34'),(150,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_17.css','2011-09-27 19:00:34'),(151,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_17.css','2011-09-27 19:00:34'),(152,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_17.css','2011-09-27 19:00:34'),(153,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_17.css','2011-09-27 19:00:34'),(154,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_43.txt','2011-09-27 19:00:34'),(155,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_24.css','2011-09-27 19:00:34'),(156,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_44.txt','2011-09-27 19:00:34'),(157,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_18.css','2011-09-27 19:00:34'),(158,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_18.css','2011-09-27 19:00:34'),(159,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_18.css','2011-09-27 19:00:34'),(160,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_18.css','2011-09-27 19:00:34'),(161,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_45.txt','2011-09-27 19:00:34'),(162,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_25.css','2011-09-27 19:00:34'),(163,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_46.txt','2011-09-27 19:00:34'),(164,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_19.css','2011-09-27 19:00:34'),(165,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_19.css','2011-09-27 19:00:34'),(166,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_19.css','2011-09-27 19:00:34'),(167,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_19.css','2011-09-27 19:00:34'),(168,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_47.txt','2011-09-27 19:00:34'),(169,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_26.css','2011-09-27 19:00:34'),(170,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_48.txt','2011-09-27 19:01:29'),(171,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_20.css','2011-09-27 19:01:29'),(172,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_20.css','2011-09-27 19:01:29'),(173,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_20.css','2011-09-27 19:01:29'),(174,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_20.css','2011-09-27 19:01:29'),(175,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_49.txt','2011-09-27 19:01:29'),(176,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_27.css','2011-09-27 19:01:29'),(177,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_50.txt','2011-09-27 19:01:29'),(178,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_21.css','2011-09-27 19:01:29'),(179,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_21.css','2011-09-27 19:01:29'),(180,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_21.css','2011-09-27 19:01:29'),(181,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_21.css','2011-09-27 19:01:29'),(182,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_51.txt','2011-09-27 19:01:30'),(183,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_28.css','2011-09-27 19:01:30'),(184,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_52.txt','2011-09-27 19:01:30'),(185,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_22.css','2011-09-27 19:01:30'),(186,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_22.css','2011-09-27 19:01:30'),(187,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_22.css','2011-09-27 19:01:30'),(188,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_22.css','2011-09-27 19:01:30'),(189,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_53.txt','2011-09-27 19:01:30'),(190,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_29.css','2011-09-27 19:01:30'),(191,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_54.txt','2011-09-27 19:04:28'),(192,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_23.css','2011-09-27 19:04:28'),(193,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_23.css','2011-09-27 19:04:28'),(194,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_23.css','2011-09-27 19:04:28'),(195,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_23.css','2011-09-27 19:04:28'),(196,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_55.txt','2011-09-27 19:04:28'),(197,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_30.css','2011-09-27 19:04:28'),(198,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_56.txt','2011-09-27 19:04:29'),(199,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_24.css','2011-09-27 19:04:29'),(200,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_24.css','2011-09-27 19:04:29'),(201,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_24.css','2011-09-27 19:04:29'),(202,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_24.css','2011-09-27 19:04:29'),(203,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_57.txt','2011-09-27 19:04:29'),(204,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_31.css','2011-09-27 19:04:29'),(205,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_58.txt','2011-09-27 19:04:29'),(206,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_25.css','2011-09-27 19:04:29'),(207,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_25.css','2011-09-27 19:04:29'),(208,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_25.css','2011-09-27 19:04:29'),(209,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_25.css','2011-09-27 19:04:29'),(210,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_59.txt','2011-09-27 19:04:29'),(211,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_32.css','2011-09-27 19:04:29'),(212,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_60.txt','2011-09-27 19:08:46'),(213,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_26.css','2011-09-27 19:08:46'),(214,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_26.css','2011-09-27 19:08:46'),(215,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_26.css','2011-09-27 19:08:46'),(216,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_26.css','2011-09-27 19:08:46'),(217,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_61.txt','2011-09-27 19:08:46'),(218,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_33.css','2011-09-27 19:08:46'),(219,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_62.txt','2011-09-27 19:08:46'),(220,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_27.css','2011-09-27 19:08:46'),(221,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_27.css','2011-09-27 19:08:46'),(222,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_27.css','2011-09-27 19:08:46'),(223,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_27.css','2011-09-27 19:08:46'),(224,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_63.txt','2011-09-27 19:08:47'),(225,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_34.css','2011-09-27 19:08:47'),(226,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_64.txt','2011-09-27 19:08:47'),(227,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/ie_28.css','2011-09-27 19:08:47'),(228,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/fonts_28.css','2011-09-27 19:08:47'),(229,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/screen_28.css','2011-09-27 19:08:47'),(230,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/print_28.css','2011-09-27 19:08:47'),(231,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_65.txt','2011-09-27 19:08:47'),(232,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/uni-form_35.css','2011-09-27 19:08:47'),(233,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_66.txt','2011-09-27 19:09:26'),(234,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57.swf','2011-09-27 19:09:26'),(235,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim.zip','2011-09-27 19:09:26'),(236,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus.zip','2011-09-27 19:09:26'),(237,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57.swf','2011-09-27 19:09:26'),(238,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_67.txt','2011-09-27 19:09:26'),(239,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_1.swf','2011-09-27 19:09:26'),(240,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_1.zip','2011-09-27 19:09:26'),(241,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_1.zip','2011-09-27 19:09:26'),(242,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_1.swf','2011-09-27 19:09:26'),(243,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_68.txt','2011-09-27 19:09:26'),(244,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_2.swf','2011-09-27 19:09:26'),(245,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_2.zip','2011-09-27 19:09:26'),(246,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_2.zip','2011-09-27 19:09:26'),(247,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_2.swf','2011-09-27 19:09:26'),(248,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_69.txt','2011-09-27 19:09:54'),(249,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_3.swf','2011-09-27 19:09:54'),(250,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_3.zip','2011-09-27 19:09:54'),(251,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_3.zip','2011-09-27 19:09:54'),(252,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_3.swf','2011-09-27 19:09:54'),(253,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_70.txt','2011-09-27 19:09:54'),(254,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_4.swf','2011-09-27 19:09:54'),(255,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_4.zip','2011-09-27 19:09:54'),(256,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_4.zip','2011-09-27 19:09:54'),(257,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_4.swf','2011-09-27 19:09:54'),(258,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_71.txt','2011-09-27 19:09:54'),(259,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_5.swf','2011-09-27 19:09:54'),(260,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_5.zip','2011-09-27 19:09:54'),(261,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_5.zip','2011-09-27 19:09:54'),(262,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_5.swf','2011-09-27 19:09:54'),(263,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_72.txt','2011-09-27 19:11:51'),(264,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_6.swf','2011-09-27 19:11:51'),(265,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_6.zip','2011-09-27 19:11:51'),(266,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_6.zip','2011-09-27 19:11:51'),(267,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_6.swf','2011-09-27 19:11:51'),(268,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_73.txt','2011-09-27 19:11:52'),(269,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_7.swf','2011-09-27 19:11:52'),(270,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_7.zip','2011-09-27 19:11:52'),(271,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_7.zip','2011-09-27 19:11:52'),(272,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_7.swf','2011-09-27 19:11:52'),(273,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/python-outfile_74.txt','2011-09-27 19:11:52'),(274,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-57_8.swf','2011-09-27 19:11:52'),(275,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieusslim_8.zip','2011-09-27 19:11:52'),(276,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/modieus_8.zip','2011-09-27 19:11:52'),(277,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/jwplayer-viral-57_8.swf','2011-09-27 19:11:52'),(278,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5.flv','2011-09-27 19:28:03'),(279,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4.flv','2011-09-27 19:28:03'),(280,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv.flv','2011-09-27 19:28:04'),(281,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0.flv','2011-09-27 19:28:04'),(282,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2.flv','2011-09-27 19:28:05'),(283,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_1.flv','2011-09-27 19:28:06'),(284,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_1.flv','2011-09-27 19:28:06'),(285,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_1.flv','2011-09-27 19:28:06'),(286,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_1.flv','2011-09-27 19:28:07'),(287,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_1.flv','2011-09-27 19:28:07'),(288,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_2.flv','2011-09-27 19:28:08'),(289,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_2.flv','2011-09-27 19:28:09'),(290,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_2.flv','2011-09-27 19:28:09'),(291,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_2.flv','2011-09-27 19:28:09'),(292,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_2.flv','2011-09-27 19:28:10'),(293,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_3.flv','2011-09-27 19:30:04'),(294,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_3.flv','2011-09-27 19:30:04'),(295,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_3.flv','2011-09-27 19:30:04'),(296,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_3.flv','2011-09-27 19:30:05'),(297,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_3.flv','2011-09-27 19:30:05'),(298,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_4.flv','2011-09-27 19:30:06'),(299,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_4.flv','2011-09-27 19:30:06'),(300,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_4.flv','2011-09-27 19:30:06'),(301,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_4.flv','2011-09-27 19:30:07'),(302,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_4.flv','2011-09-27 19:30:08'),(303,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_5.flv','2011-09-27 19:30:09'),(304,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_5.flv','2011-09-27 19:30:09'),(305,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_5.flv','2011-09-27 19:30:09'),(306,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_5.flv','2011-09-27 19:30:10'),(307,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_5.flv','2011-09-27 19:30:10'),(308,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_6.flv','2011-09-27 19:32:23'),(309,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_6.flv','2011-09-27 19:32:23'),(310,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_6.flv','2011-09-27 19:32:23'),(311,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_6.flv','2011-09-27 19:32:24'),(312,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_6.flv','2011-09-27 19:32:24'),(313,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_7.flv','2011-09-27 19:32:25'),(314,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_7.flv','2011-09-27 19:32:25'),(315,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_7.flv','2011-09-27 19:32:25'),(316,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_7.flv','2011-09-27 19:32:26'),(317,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_7.flv','2011-09-27 19:32:27'),(318,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_8.flv','2011-09-27 19:32:28'),(319,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_8.flv','2011-09-27 19:32:28'),(320,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_8.flv','2011-09-27 19:32:28'),(321,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_8.flv','2011-09-27 19:32:28'),(322,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_8.flv','2011-09-27 19:32:29'),(323,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_9.flv','2011-09-27 19:33:38'),(324,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_9.flv','2011-09-27 19:33:38'),(325,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_9.flv','2011-09-27 19:33:38'),(326,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_9.flv','2011-09-27 19:33:38'),(327,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_9.flv','2011-09-27 19:33:39'),(328,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_10.flv','2011-09-27 19:33:40'),(329,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_10.flv','2011-09-27 19:33:40'),(330,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_10.flv','2011-09-27 19:33:40'),(331,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_10.flv','2011-09-27 19:33:41'),(332,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_10.flv','2011-09-27 19:33:41'),(333,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_11.flv','2011-09-27 19:33:42'),(334,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_11.flv','2011-09-27 19:33:43'),(335,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_11.flv','2011-09-27 19:33:43'),(336,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_11.flv','2011-09-27 19:33:44'),(337,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_11.flv','2011-09-27 19:33:45'),(338,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_12.flv','2011-09-27 19:34:19'),(339,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_12.flv','2011-09-27 19:34:19'),(340,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_12.flv','2011-09-27 19:34:19'),(341,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_12.flv','2011-09-27 19:34:20'),(342,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_12.flv','2011-09-27 19:34:20'),(343,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_13.flv','2011-09-27 19:34:21'),(344,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_13.flv','2011-09-27 19:34:22'),(345,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_13.flv','2011-09-27 19:34:22'),(346,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_13.flv','2011-09-27 19:34:22'),(347,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_13.flv','2011-09-27 19:34:23'),(348,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_5_14.flv','2011-09-27 19:34:24'),(349,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_4_14.flv','2011-09-27 19:34:24'),(350,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-nowflv_14.flv','2011-09-27 19:34:24'),(351,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_0_14.flv','2011-09-27 19:34:25'),(352,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/2011-09-25_event-now_2_14.flv','2011-09-27 19:34:26'),(353,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/img_0138.jpg','2011-09-28 20:46:21'),(354,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/2011-09-25_event-now_5.flv','2011-09-28 20:59:54'),(355,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/2011-09-25_event-now_4.flv','2011-09-28 20:59:54'),(356,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/2011-09-25_event-nowflv.flv','2011-09-28 20:59:55'),(357,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/2011-09-25_event-now_0.flv','2011-09-28 20:59:55'),(358,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/2011-09-25_event-now_2.flv','2011-09-28 20:59:58'),(359,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/desktop.ini','2011-10-28 14:34:07'),(360,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/thumb.aspx','2011-10-28 14:34:07'),(361,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0523.jpg','2011-10-28 14:34:07'),(362,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0524.jpg','2011-10-28 14:34:08'),(363,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0512.jpg','2011-10-28 14:34:09'),(364,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0522.jpg','2011-10-28 14:34:10'),(365,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0523.jpg','2011-10-29 16:45:38'),(366,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0524.jpg','2011-10-29 16:45:39'),(367,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0512.jpg','2011-10-29 16:45:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easy_thumbnails_thumbnail`
--

LOCK TABLES `easy_thumbnails_thumbnail` WRITE;
/*!40000 ALTER TABLE `easy_thumbnails_thumbnail` DISABLE KEYS */;
INSERT INTO `easy_thumbnails_thumbnail` VALUES (1,'d26becbf46ac48eda79c7a39a13a02dd','pictures/R-1624927-1242546064.jpg.80x80_q80_crop.jpg','2011-09-25 20:00:42',1),(2,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__16x16_q80_crop_upscale.jpg','2011-09-26 18:53:22',2),(3,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__32x32_q80_crop_upscale.jpg','2011-09-26 18:53:22',2),(4,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__48x48_q80_crop_upscale.jpg','2011-09-26 18:53:23',2),(5,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__64x64_q80_crop_upscale.jpg','2011-09-26 18:53:23',2),(6,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__16x16_q80_crop_upscale.jpg','2011-09-26 18:53:23',3),(7,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__32x32_q80_crop_upscale.jpg','2011-09-26 18:53:24',3),(8,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__48x48_q80_crop_upscale.jpg','2011-09-26 18:53:24',3),(9,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__64x64_q80_crop_upscale.jpg','2011-09-26 18:53:24',3),(10,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__16x16_q80_crop_upscale.jpg','2011-09-26 18:53:25',4),(11,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__32x32_q80_crop_upscale.jpg','2011-09-26 18:53:25',4),(12,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__48x48_q80_crop_upscale.jpg','2011-09-26 18:53:25',4),(13,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__64x64_q80_crop_upscale.jpg','2011-09-26 18:53:26',4),(14,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__210x10000_q80.jpg','2011-09-26 18:53:30',3),(15,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__32x32_q80.jpg','2011-09-26 18:54:14',2),(16,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__32x32_q80.jpg','2011-09-26 18:54:14',3),(17,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__32x32_q80.jpg','2011-09-26 18:54:15',4),(18,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__200x200_q80.jpg','2011-09-26 19:27:16',2),(19,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0510.jpg__200x200_q80.jpg','2011-09-26 19:27:16',3),(20,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__200x200_q80.jpg','2011-09-26 19:27:16',4),(21,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__80x80_q80_crop.jpg','2011-09-27 12:10:56',4),(22,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__500x80_q80_crop.jpg','2011-09-27 12:18:01',4),(23,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__500x400_q80_crop.jpg','2011-09-27 12:18:13',4),(24,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:16:02',10),(25,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:16:06',10),(26,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:16:07',10),(27,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0222.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:16:09',10),(28,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:16:11',11),(29,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:16:16',11),(30,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:16:18',11),(31,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0236.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:16:19',11),(32,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:22:11',12),(33,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:22:15',12),(34,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:22:16',12),(35,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000453.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:22:17',12),(36,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 14:22:20',13),(37,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 14:22:23',13),(38,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 14:22:24',13),(39,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/p1000454.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 14:22:25',13),(40,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0134.jpg__16x16_q80_crop_upscale.jpg','2011-09-27 16:53:52',14),(41,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0134.jpg__32x32_q80_crop_upscale.jpg','2011-09-27 16:53:56',14),(42,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0134.jpg__48x48_q80_crop_upscale.jpg','2011-09-27 16:53:58',14),(43,'52617e6399d6f38ea9cbf527bf430616','2011/09/27/img_0134.jpg__64x64_q80_crop_upscale.jpg','2011-09-27 16:53:59',14),(44,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/img_0138.jpg__16x16_q80_crop_upscale.jpg','2011-09-28 20:46:23',353),(45,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/img_0138.jpg__32x32_q80_crop_upscale.jpg','2011-09-28 20:46:26',353),(46,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/img_0138.jpg__48x48_q80_crop_upscale.jpg','2011-09-28 20:46:27',353),(47,'52617e6399d6f38ea9cbf527bf430616','2011/09/28/img_0138.jpg__64x64_q80_crop_upscale.jpg','2011-09-28 20:46:29',353),(48,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__170x170_q80_crop.jpg','2011-10-03 17:58:45',4),(49,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__200x150_q80_crop_upscale.jpg','2011-10-07 16:32:38',2),(50,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__1600x1200_q80_crop_upscale.jpg','2011-10-07 16:32:40',2),(51,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0513.jpg__200x200_q80_crop_upscale.jpg','2011-10-07 16:32:58',2),(52,'52617e6399d6f38ea9cbf527bf430616','2011/09/26/img_0519.jpg__70x70_q80_crop.jpg','2011-10-07 18:35:47',4),(53,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0523.jpg__16x16_q80_crop_upscale.jpg','2011-10-28 14:34:07',361),(54,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0523.jpg__32x32_q80_crop_upscale.jpg','2011-10-28 14:34:08',361),(55,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0523.jpg__48x48_q80_crop_upscale.jpg','2011-10-28 14:34:08',361),(56,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0523.jpg__64x64_q80_crop_upscale.jpg','2011-10-28 14:34:08',361),(57,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0524.jpg__16x16_q80_crop_upscale.jpg','2011-10-28 14:34:08',362),(58,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0524.jpg__32x32_q80_crop_upscale.jpg','2011-10-28 14:34:08',362),(59,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0524.jpg__48x48_q80_crop_upscale.jpg','2011-10-28 14:34:09',362),(60,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0524.jpg__64x64_q80_crop_upscale.jpg','2011-10-28 14:34:09',362),(61,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0512.jpg__16x16_q80_crop_upscale.jpg','2011-10-28 14:34:09',363),(62,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0512.jpg__32x32_q80_crop_upscale.jpg','2011-10-28 14:34:10',363),(63,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0512.jpg__48x48_q80_crop_upscale.jpg','2011-10-28 14:34:10',363),(64,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0512.jpg__64x64_q80_crop_upscale.jpg','2011-10-28 14:34:10',363),(65,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0522.jpg__16x16_q80_crop_upscale.jpg','2011-10-28 14:34:10',364),(66,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0522.jpg__32x32_q80_crop_upscale.jpg','2011-10-28 14:34:11',364),(67,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0522.jpg__48x48_q80_crop_upscale.jpg','2011-10-28 14:34:11',364),(68,'52617e6399d6f38ea9cbf527bf430616','2011/10/28/img_0522.jpg__64x64_q80_crop_upscale.jpg','2011-10-28 14:34:11',364),(69,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0523.jpg__16x16_q80_crop_upscale.jpg','2011-10-29 16:45:38',365),(70,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0523.jpg__32x32_q80_crop_upscale.jpg','2011-10-29 16:45:38',365),(71,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0523.jpg__48x48_q80_crop_upscale.jpg','2011-10-29 16:45:38',365),(72,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0523.jpg__64x64_q80_crop_upscale.jpg','2011-10-29 16:45:39',365),(73,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0524.jpg__16x16_q80_crop_upscale.jpg','2011-10-29 16:45:39',366),(74,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0524.jpg__32x32_q80_crop_upscale.jpg','2011-10-29 16:45:39',366),(75,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0524.jpg__48x48_q80_crop_upscale.jpg','2011-10-29 16:45:39',366),(76,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0524.jpg__64x64_q80_crop_upscale.jpg','2011-10-29 16:45:40',366),(77,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0512.jpg__16x16_q80_crop_upscale.jpg','2011-10-29 16:45:40',367),(78,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0512.jpg__32x32_q80_crop_upscale.jpg','2011-10-29 16:45:40',367),(79,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0512.jpg__48x48_q80_crop_upscale.jpg','2011-10-29 16:45:40',367),(80,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0512.jpg__64x64_q80_crop_upscale.jpg','2011-10-29 16:45:41',367),(81,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0512.jpg__210x10000_q80.jpg','2011-10-30 12:22:39',367),(82,'52617e6399d6f38ea9cbf527bf430616','2011/10/29/img_0523.jpg__210x10000_q80.jpg','2011-10-31 12:39:06',365);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `cue_in` int(11),
  `cue_out` int(11),
  PRIMARY KEY (`id`),
  KEY `filer_file_4e5f642` (`folder_id`),
  KEY `filer_file_5d52dd10` (`owner_id`),
  KEY `filer_file_689fbb87` (`polymorphic_ctype_id`),
  CONSTRAINT `folder_id_refs_id_5276dead` FOREIGN KEY (`folder_id`) REFERENCES `filer_folder` (`id`),
  CONSTRAINT `owner_id_refs_id_6abe8089` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `polymorphic_ctype_id_refs_id_29c16935` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_file`
--

LOCK TABLES `filer_file` WRITE;
/*!40000 ALTER TABLE `filer_file` DISABLE KEYS */;
INSERT INTO `filer_file` VALUES (1,1,'2011/09/26/img_0513.jpg',602810,0,'IMG_0513.JPG',NULL,1,'2011-09-26 18:53:22','2011-09-26 18:53:27',NULL,1,'b414f38d35fa7fbb7ad60683bb11588da7174b7d',65,0,0),(2,1,'2011/09/26/img_0510.jpg',635000,0,'IMG_0510.JPG',NULL,1,'2011-09-26 18:53:23','2011-09-26 18:53:27',NULL,1,'ce5957033816a7dd086d0a2419e99fe98e382605',65,0,0),(3,1,'2011/09/26/img_0519.jpg',669294,0,'IMG_0519.JPG',NULL,1,'2011-09-26 18:53:25','2011-09-26 18:53:27',NULL,1,'a6631932a87a1c1ab1c084dfe748807eebeff50a',65,0,0),(4,1,'2011/09/26/jonas_ohrstrom-0g48cv7jxl7qjvhsr6lo.pdf',191449,0,'jonas_ohrstrom-0g48Cv7Jxl7QJVHSr6Lo.pdf',NULL,1,'2011-09-26 18:56:19','2011-09-26 18:56:29',NULL,1,'ff7399deb25bd25818d6275a22d96a5b24c03b0b',64,0,0),(5,1,'2011/09/26/jonas_ohrstrom-utkp9duixiuqhpo1or41.pdf',188309,0,'jonas_ohrstrom-uTKp9dUiXIuqHPo1OR41.pdf',NULL,1,'2011-09-26 18:56:19','2011-09-26 18:56:29',NULL,1,'df2970c9bcc371ad0aa9d30f305519ec5abdde92',64,0,0),(6,4,'2011/09/27/movie_on_9-25-11_at_542_pm.mov',620768,0,'Movie_on_9-25-11_at_5.42_PM.mov',NULL,1,'2011-09-27 12:32:42','2011-09-27 12:32:55',NULL,1,'2f3c04bde25ec351e9c03c09ce9e6f7acce44c36',64,0,0),(7,7,'2011/09/27/movie_on_9-25-11_at_542_pm_1.mov',620768,0,'Movie_on_9-25-11_at_5.42_PM.mov','',1,'2011-09-27 14:15:51','2011-10-31 12:35:32','',1,'2f3c04bde25ec351e9c03c09ce9e6f7acce44c36',64,500,20),(8,7,'2011/09/27/desktop.ini',664,0,'desktop.ini',NULL,1,'2011-09-27 14:16:00','2011-09-27 14:16:20',NULL,1,'e32929275c7957bfd5f9b5265482cb7e65da0bd4',64,0,0),(9,7,'2011/09/27/img_0222.jpg',2740967,0,'IMG_0222.JPG',NULL,1,'2011-09-27 14:16:00','2011-09-27 14:16:20',NULL,1,'a3527c80afd04b2490794fb2acbb8d1cae9907ae',65,0,0),(10,7,'2011/09/27/img_0236.jpg',2731150,0,'IMG_0236.JPG',NULL,1,'2011-09-27 14:16:09','2011-09-27 14:16:20',NULL,1,'3453b9a2f1284322dee681f575aaa14a0eaaf238',65,0,0),(11,8,'2011/09/27/p1000453.jpg',6718976,0,'P1000453.JPG',NULL,1,'2011-09-27 14:22:10','2011-09-27 14:22:32',NULL,1,'b3bdb4957c9d97f1194c23e83a8dee1c5fe3e124',65,0,0),(12,8,'2011/09/27/p1000454.jpg',7126528,0,'P1000454.JPG',NULL,1,'2011-09-27 14:22:18','2011-09-27 14:22:32',NULL,1,'05d66390caea6c59ce965864f0b00a7f41c250c5',65,0,0),(16,NULL,'2011/09/27/img_0134.jpg',2760920,0,'IMG_0134.JPG',NULL,1,'2011-09-27 16:53:51','2011-09-27 16:53:51',NULL,1,'d5f9dd22c84ca16df497d61caadb3fbd10976fa6',65,0,0),(21,NULL,'tmp/nginx.access.log',0,0,NULL,NULL,1,'2011-09-27 17:03:09','2011-09-27 17:03:09',NULL,1,'da39a3ee5e6b4b0d3255bfef95601890afd80709',64,0,0),(22,NULL,'tmp/nginx.access.log',0,0,'ACCESSLOG',NULL,1,'2011-09-27 17:04:33','2011-09-27 17:04:33',NULL,1,'da39a3ee5e6b4b0d3255bfef95601890afd80709',64,0,0),(23,12,'tmp/nginx.access.log',0,0,NULL,'whatever',1,'2011-09-27 17:06:59','2011-09-27 17:27:36',NULL,1,'da39a3ee5e6b4b0d3255bfef95601890afd80709',64,0,0),(24,13,'2011/09/27/python-outfile.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(25,13,'2011/09/27/ie.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(26,13,'2011/09/27/fonts.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(27,13,'2011/09/27/screen.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(28,13,'2011/09/27/print.css',2855,0,'print.css',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(29,14,'2011/09/27/python-outfile_1.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(30,14,'2011/09/27/uni-form.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(31,13,'2011/09/27/python-outfile_2.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:41:44','2011-09-27 17:41:44',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(32,13,'2011/09/27/ie_1.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 17:41:44','2011-09-27 17:41:44',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(33,13,'2011/09/27/fonts_1.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 17:41:44','2011-09-27 17:41:44',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(34,13,'2011/09/27/screen_1.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 17:41:44','2011-09-27 17:41:44',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(35,13,'2011/09/27/print_1.css',2855,0,'print.css',NULL,NULL,'2011-09-27 17:41:45','2011-09-27 17:41:45',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(36,14,'2011/09/27/python-outfile_3.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:41:45','2011-09-27 17:41:45',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(37,14,'2011/09/27/uni-form_1.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:41:45','2011-09-27 17:41:45',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(38,15,'2011/09/27/python-outfile_4.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:44:30','2011-09-27 17:44:30',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(39,15,'2011/09/27/uni-form_2.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:44:30','2011-09-27 17:44:30',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(40,15,'2011/09/27/python-outfile_5.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:44:33','2011-09-27 17:44:33',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(41,15,'2011/09/27/uni-form_3.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:44:33','2011-09-27 17:44:33',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(42,15,'2011/09/27/python-outfile_6.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:44:35','2011-09-27 17:44:35',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(43,15,'2011/09/27/uni-form_4.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:44:35','2011-09-27 17:44:35',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(44,15,'2011/09/27/python-outfile_7.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:44:38','2011-09-27 17:44:38',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(45,15,'2011/09/27/uni-form_5.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:44:38','2011-09-27 17:44:38',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(46,15,'2011/09/27/python-outfile_8.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:49:31','2011-09-27 17:49:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(47,15,'2011/09/27/uni-form_6.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:49:31','2011-09-27 17:49:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(48,15,'2011/09/27/python-outfile_9.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:49:34','2011-09-27 17:49:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(49,15,'2011/09/27/uni-form_7.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:49:34','2011-09-27 17:49:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(50,15,'2011/09/27/python-outfile_10.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 17:54:36','2011-09-27 17:54:36',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(51,15,'2011/09/27/uni-form_8.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 17:54:36','2011-09-27 17:54:36',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(52,16,'2011/09/27/python-outfile_11.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(53,16,'2011/09/27/ie_2.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(54,16,'2011/09/27/fonts_2.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(55,16,'2011/09/27/screen_2.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(56,16,'2011/09/27/print_2.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(57,17,'2011/09/27/python-outfile_12.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(58,17,'2011/09/27/uni-form_9.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(59,16,'2011/09/27/python-outfile_13.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(60,16,'2011/09/27/ie_3.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(61,16,'2011/09/27/fonts_3.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(62,16,'2011/09/27/screen_3.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(63,16,'2011/09/27/print_3.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(64,17,'2011/09/27/python-outfile_14.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(65,17,'2011/09/27/uni-form_10.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(66,16,'2011/09/27/python-outfile_15.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(67,16,'2011/09/27/ie_4.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(68,16,'2011/09/27/fonts_4.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(69,16,'2011/09/27/screen_4.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(70,16,'2011/09/27/print_4.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(71,17,'2011/09/27/python-outfile_16.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(72,17,'2011/09/27/uni-form_11.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(73,16,'2011/09/27/python-outfile_17.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(74,16,'2011/09/27/ie_5.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(75,16,'2011/09/27/fonts_5.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(76,16,'2011/09/27/screen_5.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(77,16,'2011/09/27/print_5.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(78,17,'2011/09/27/python-outfile_18.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(79,17,'2011/09/27/uni-form_12.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(80,16,'2011/09/27/python-outfile_19.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(81,16,'2011/09/27/ie_6.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(82,16,'2011/09/27/fonts_6.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(83,16,'2011/09/27/screen_6.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(84,16,'2011/09/27/print_6.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(85,17,'2011/09/27/python-outfile_20.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(86,17,'2011/09/27/uni-form_13.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(87,16,'2011/09/27/python-outfile_21.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(88,16,'2011/09/27/ie_7.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(89,16,'2011/09/27/fonts_7.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(90,16,'2011/09/27/screen_7.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(91,16,'2011/09/27/print_7.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(92,17,'2011/09/27/python-outfile_22.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(93,17,'2011/09/27/uni-form_14.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:57:31','2011-09-27 18:57:31',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(94,16,'2011/09/27/python-outfile_23.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:23','2011-09-27 18:58:23',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(95,16,'2011/09/27/python-outfile_24.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(96,16,'2011/09/27/ie_8.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(97,16,'2011/09/27/fonts_8.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(98,16,'2011/09/27/screen_8.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(99,16,'2011/09/27/print_8.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(100,17,'2011/09/27/python-outfile_25.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(101,17,'2011/09/27/uni-form_15.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(102,16,'2011/09/27/python-outfile_26.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(103,16,'2011/09/27/ie_9.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(104,16,'2011/09/27/fonts_9.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(105,16,'2011/09/27/screen_9.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(106,16,'2011/09/27/print_9.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(107,17,'2011/09/27/python-outfile_27.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(108,17,'2011/09/27/uni-form_16.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(109,16,'2011/09/27/python-outfile_28.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(110,16,'2011/09/27/ie_10.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(111,16,'2011/09/27/fonts_10.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(112,16,'2011/09/27/screen_10.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(113,16,'2011/09/27/print_10.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(114,17,'2011/09/27/python-outfile_29.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(115,17,'2011/09/27/uni-form_17.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:58:52','2011-09-27 18:58:52',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(116,16,'2011/09/27/python-outfile_30.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(117,16,'2011/09/27/ie_11.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(118,16,'2011/09/27/fonts_11.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(119,16,'2011/09/27/screen_11.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(120,16,'2011/09/27/print_11.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(121,17,'2011/09/27/python-outfile_31.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(122,17,'2011/09/27/uni-form_18.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(123,16,'2011/09/27/python-outfile_32.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(124,16,'2011/09/27/ie_12.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(125,16,'2011/09/27/fonts_12.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(126,16,'2011/09/27/screen_12.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(127,16,'2011/09/27/print_12.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(128,17,'2011/09/27/python-outfile_33.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(129,17,'2011/09/27/uni-form_19.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(130,16,'2011/09/27/python-outfile_34.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:59:28','2011-09-27 18:59:28',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(131,16,'2011/09/27/ie_13.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 18:59:29','2011-09-27 18:59:29',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(132,16,'2011/09/27/fonts_13.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 18:59:29','2011-09-27 18:59:29',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(133,16,'2011/09/27/screen_13.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 18:59:29','2011-09-27 18:59:29',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(134,16,'2011/09/27/print_13.css',2855,0,'print.css',NULL,NULL,'2011-09-27 18:59:29','2011-09-27 18:59:29',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(135,17,'2011/09/27/python-outfile_35.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 18:59:29','2011-09-27 18:59:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(136,17,'2011/09/27/uni-form_20.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 18:59:29','2011-09-27 18:59:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(137,16,'2011/09/27/python-outfile_36.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(138,16,'2011/09/27/ie_14.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(139,16,'2011/09/27/fonts_14.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(140,16,'2011/09/27/screen_14.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(141,16,'2011/09/27/print_14.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(142,17,'2011/09/27/python-outfile_37.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(143,17,'2011/09/27/uni-form_21.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(144,16,'2011/09/27/python-outfile_38.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(145,16,'2011/09/27/ie_15.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(146,16,'2011/09/27/fonts_15.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(147,16,'2011/09/27/screen_15.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(148,16,'2011/09/27/print_15.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(149,17,'2011/09/27/python-outfile_39.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(150,17,'2011/09/27/uni-form_22.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(151,16,'2011/09/27/python-outfile_40.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(152,16,'2011/09/27/ie_16.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(153,16,'2011/09/27/fonts_16.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(154,16,'2011/09/27/screen_16.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(155,16,'2011/09/27/print_16.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(156,17,'2011/09/27/python-outfile_41.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(157,17,'2011/09/27/uni-form_23.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:00:14','2011-09-27 19:00:14',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(158,16,'2011/09/27/python-outfile_42.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(159,16,'2011/09/27/ie_17.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(160,16,'2011/09/27/fonts_17.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(161,16,'2011/09/27/screen_17.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(162,16,'2011/09/27/print_17.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(163,17,'2011/09/27/python-outfile_43.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(164,17,'2011/09/27/uni-form_24.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(165,16,'2011/09/27/python-outfile_44.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(166,16,'2011/09/27/ie_18.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(167,16,'2011/09/27/fonts_18.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(168,16,'2011/09/27/screen_18.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(169,16,'2011/09/27/print_18.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(170,17,'2011/09/27/python-outfile_45.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(171,17,'2011/09/27/uni-form_25.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(172,16,'2011/09/27/python-outfile_46.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(173,16,'2011/09/27/ie_19.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(174,16,'2011/09/27/fonts_19.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(175,16,'2011/09/27/screen_19.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(176,16,'2011/09/27/print_19.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(177,17,'2011/09/27/python-outfile_47.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(178,17,'2011/09/27/uni-form_26.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:00:34','2011-09-27 19:00:34',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(179,16,'2011/09/27/python-outfile_48.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(180,16,'2011/09/27/ie_20.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(181,16,'2011/09/27/fonts_20.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(182,16,'2011/09/27/screen_20.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(183,16,'2011/09/27/print_20.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(184,17,'2011/09/27/python-outfile_49.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(185,17,'2011/09/27/uni-form_27.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(186,16,'2011/09/27/python-outfile_50.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(187,16,'2011/09/27/ie_21.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(188,16,'2011/09/27/fonts_21.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(189,16,'2011/09/27/screen_21.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(190,16,'2011/09/27/print_21.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:01:29','2011-09-27 19:01:29',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(191,17,'2011/09/27/python-outfile_51.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(192,17,'2011/09/27/uni-form_28.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(193,16,'2011/09/27/python-outfile_52.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(194,16,'2011/09/27/ie_22.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(195,16,'2011/09/27/fonts_22.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(196,16,'2011/09/27/screen_22.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(197,16,'2011/09/27/print_22.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(198,17,'2011/09/27/python-outfile_53.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(199,17,'2011/09/27/uni-form_29.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:01:30','2011-09-27 19:01:30',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(200,16,'2011/09/27/python-outfile_54.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(201,16,'2011/09/27/ie_23.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(202,16,'2011/09/27/fonts_23.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(203,16,'2011/09/27/screen_23.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(204,16,'2011/09/27/print_23.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(205,17,'2011/09/27/python-outfile_55.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(206,17,'2011/09/27/uni-form_30.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:04:28','2011-09-27 19:04:28',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(207,16,'2011/09/27/python-outfile_56.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(208,16,'2011/09/27/ie_24.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(209,16,'2011/09/27/fonts_24.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(210,16,'2011/09/27/screen_24.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(211,16,'2011/09/27/print_24.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(212,17,'2011/09/27/python-outfile_57.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(213,17,'2011/09/27/uni-form_31.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(214,16,'2011/09/27/python-outfile_58.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(215,16,'2011/09/27/ie_25.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(216,16,'2011/09/27/fonts_25.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(217,16,'2011/09/27/screen_25.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(218,16,'2011/09/27/print_25.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(219,17,'2011/09/27/python-outfile_59.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(220,17,'2011/09/27/uni-form_32.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:04:29','2011-09-27 19:04:29',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(221,16,'2011/09/27/python-outfile_60.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(222,16,'2011/09/27/ie_26.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(223,16,'2011/09/27/fonts_26.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(224,16,'2011/09/27/screen_26.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(225,16,'2011/09/27/print_26.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(226,17,'2011/09/27/python-outfile_61.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(227,17,'2011/09/27/uni-form_33.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(228,16,'2011/09/27/python-outfile_62.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(229,16,'2011/09/27/ie_27.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(230,16,'2011/09/27/fonts_27.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(231,16,'2011/09/27/screen_27.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(232,16,'2011/09/27/print_27.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:08:46','2011-09-27 19:08:46',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(233,17,'2011/09/27/python-outfile_63.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(234,17,'2011/09/27/uni-form_34.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(235,16,'2011/09/27/python-outfile_64.txt',99671,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'709f260ded4a29173bd49ed40539b680d1284f76',64,0,0),(236,16,'2011/09/27/ie_28.css',4462,0,'ie.css',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'abd293ab2160beed1c5e3e80ba92a40a24e52b4e',64,0,0),(237,16,'2011/09/27/fonts_28.css',201,0,'fonts.css',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'2b1d7fc4d0f7fb6f89cc979a04bcf1cb35a72c9f',64,0,0),(238,16,'2011/09/27/screen_28.css',92153,0,'screen.css',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'cd399e6a8bfde0fa138508793b3c1f31db548f7c',64,0,0),(239,16,'2011/09/27/print_28.css',2855,0,'print.css',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'ed45105af57bcf1235d3fa8c5e0c00edb95e8014',64,0,0),(240,17,'2011/09/27/python-outfile_65.txt',10200,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(241,17,'2011/09/27/uni-form_35.css',10200,0,'uni-form.css',NULL,NULL,'2011-09-27 19:08:47','2011-09-27 19:08:47',NULL,1,'33d0e22402d8db8d24ad7359204e23c5bad683ed',64,0,0),(242,18,'2011/09/27/python-outfile_66.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(243,18,'2011/09/27/jwplayer-57.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(244,18,'2011/09/27/modieusslim.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(245,18,'2011/09/27/modieus.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(246,18,'2011/09/27/jwplayer-viral-57.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(247,18,'2011/09/27/python-outfile_67.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(248,18,'2011/09/27/jwplayer-57_1.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(249,18,'2011/09/27/modieusslim_1.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(250,18,'2011/09/27/modieus_1.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(251,18,'2011/09/27/jwplayer-viral-57_1.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(252,18,'2011/09/27/python-outfile_68.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(253,18,'2011/09/27/jwplayer-57_2.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(254,18,'2011/09/27/modieusslim_2.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(255,18,'2011/09/27/modieus_2.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(256,18,'2011/09/27/jwplayer-viral-57_2.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(257,18,'2011/09/27/python-outfile_69.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(258,18,'2011/09/27/jwplayer-57_3.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(259,18,'2011/09/27/modieusslim_3.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(260,18,'2011/09/27/modieus_3.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(261,18,'2011/09/27/jwplayer-viral-57_3.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(262,18,'2011/09/27/python-outfile_70.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(263,18,'2011/09/27/jwplayer-57_4.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(264,18,'2011/09/27/modieusslim_4.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(265,18,'2011/09/27/modieus_4.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(266,18,'2011/09/27/jwplayer-viral-57_4.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(267,18,'2011/09/27/python-outfile_71.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(268,18,'2011/09/27/jwplayer-57_5.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(269,18,'2011/09/27/modieusslim_5.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(270,18,'2011/09/27/modieus_5.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(271,18,'2011/09/27/jwplayer-viral-57_5.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:09:54','2011-09-27 19:09:54',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(272,18,'2011/09/27/python-outfile_72.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:11:51','2011-09-27 19:11:51',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(273,18,'2011/09/27/jwplayer-57_6.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:11:51','2011-09-27 19:11:51',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(274,18,'2011/09/27/modieusslim_6.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:11:51','2011-09-27 19:11:51',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(275,18,'2011/09/27/modieus_6.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:11:51','2011-09-27 19:11:51',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(276,18,'2011/09/27/jwplayer-viral-57_6.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:11:51','2011-09-27 19:11:51',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(277,18,'2011/09/27/python-outfile_73.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(278,18,'2011/09/27/jwplayer-57_7.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(279,18,'2011/09/27/modieusslim_7.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(280,18,'2011/09/27/modieus_7.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(281,18,'2011/09/27/jwplayer-viral-57_7.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(282,18,'2011/09/27/python-outfile_74.txt',514447,0,'python-outfile.txt',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'80e54e28300a496a5b2efd1ab5e5fa7bacf2bfa1',64,0,0),(283,18,'2011/09/27/jwplayer-57_8.swf',106407,0,'jwplayer-5.7.swf',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'e0a079a8a5dc4cd8b0448362c5696dbeeec2123b',64,0,0),(284,18,'2011/09/27/modieusslim_8.zip',279598,0,'modieusslim.zip',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'a9a7193117dfc65d9a8d0c1c57e0d88e8d80a856',64,0,0),(285,18,'2011/09/27/modieus_8.zip',22025,0,'modieus.zip',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'52e9679bda0693014410d99ad6fbaa388a2ac029',64,0,0),(286,18,'2011/09/27/jwplayer-viral-57_8.swf',106417,0,'jwplayer-viral-5.7.swf',NULL,NULL,'2011-09-27 19:11:52','2011-09-27 19:11:52',NULL,1,'ac8ba5ea185e8c5fed8fd0a2f0c7afe8da314b2b',64,0,0),(287,24,'2011/09/27/2011-09-25_event-now_5.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:28:03','2011-09-27 19:28:03',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(288,24,'2011/09/27/2011-09-25_event-now_4.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:28:04','2011-09-27 19:28:04',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(289,24,'2011/09/27/2011-09-25_event-nowflv.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:28:04','2011-09-27 19:28:04',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(290,24,'2011/09/27/2011-09-25_event-now_0.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:28:05','2011-09-27 19:28:05',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(291,24,'2011/09/27/2011-09-25_event-now_2.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:28:06','2011-09-27 19:28:06',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(292,24,'2011/09/27/2011-09-25_event-now_5_1.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:28:06','2011-09-27 19:28:06',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(293,24,'2011/09/27/2011-09-25_event-now_4_1.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:28:06','2011-09-27 19:28:06',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(294,24,'2011/09/27/2011-09-25_event-nowflv_1.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:28:07','2011-09-27 19:28:07',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(295,24,'2011/09/27/2011-09-25_event-now_0_1.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:28:07','2011-09-27 19:28:07',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(296,24,'2011/09/27/2011-09-25_event-now_2_1.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:28:08','2011-09-27 19:28:08',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(297,24,'2011/09/27/2011-09-25_event-now_5_2.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:28:08','2011-09-27 19:28:08',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(298,24,'2011/09/27/2011-09-25_event-now_4_2.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:28:09','2011-09-27 19:28:09',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(299,24,'2011/09/27/2011-09-25_event-nowflv_2.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:28:09','2011-09-27 19:28:09',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(300,24,'2011/09/27/2011-09-25_event-now_0_2.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:28:10','2011-09-27 19:28:10',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(301,24,'2011/09/27/2011-09-25_event-now_2_2.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:28:11','2011-09-27 19:28:11',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(302,27,'2011/09/27/2011-09-25_event-now_5_3.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:30:04','2011-09-27 19:30:04',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(303,27,'2011/09/27/2011-09-25_event-now_4_3.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:30:04','2011-09-27 19:30:04',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(304,27,'2011/09/27/2011-09-25_event-nowflv_3.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:30:04','2011-09-27 19:30:04',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(305,27,'2011/09/27/2011-09-25_event-now_0_3.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:30:05','2011-09-27 19:30:05',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(306,27,'2011/09/27/2011-09-25_event-now_2_3.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:30:06','2011-09-27 19:30:06',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(307,30,'2011/09/27/2011-09-25_event-now_5_4.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:30:06','2011-09-27 19:30:06',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(308,30,'2011/09/27/2011-09-25_event-now_4_4.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:30:06','2011-09-27 19:30:06',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(309,30,'2011/09/27/2011-09-25_event-nowflv_4.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:30:07','2011-09-27 19:30:07',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(310,30,'2011/09/27/2011-09-25_event-now_0_4.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:30:07','2011-09-27 19:30:07',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(311,30,'2011/09/27/2011-09-25_event-now_2_4.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:30:09','2011-09-27 19:30:09',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(312,33,'2011/09/27/2011-09-25_event-now_5_5.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:30:09','2011-09-27 19:30:09',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(313,33,'2011/09/27/2011-09-25_event-now_4_5.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:30:09','2011-09-27 19:30:09',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(314,33,'2011/09/27/2011-09-25_event-nowflv_5.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:30:10','2011-09-27 19:30:10',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(315,33,'2011/09/27/2011-09-25_event-now_0_5.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:30:10','2011-09-27 19:30:10',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(316,33,'2011/09/27/2011-09-25_event-now_2_5.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:30:11','2011-09-27 19:30:11',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(317,36,'2011/09/27/2011-09-25_event-now_5_6.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:32:23','2011-09-27 19:32:23',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(318,36,'2011/09/27/2011-09-25_event-now_4_6.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:32:23','2011-09-27 19:32:23',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(319,36,'2011/09/27/2011-09-25_event-nowflv_6.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:32:23','2011-09-27 19:32:23',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(320,36,'2011/09/27/2011-09-25_event-now_0_6.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:32:24','2011-09-27 19:32:24',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(321,36,'2011/09/27/2011-09-25_event-now_2_6.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:32:25','2011-09-27 19:32:25',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(322,39,'2011/09/27/2011-09-25_event-now_5_7.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:32:25','2011-09-27 19:32:25',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(323,39,'2011/09/27/2011-09-25_event-now_4_7.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:32:25','2011-09-27 19:32:25',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(324,39,'2011/09/27/2011-09-25_event-nowflv_7.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:32:26','2011-09-27 19:32:26',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(325,39,'2011/09/27/2011-09-25_event-now_0_7.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:32:26','2011-09-27 19:32:26',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(326,39,'2011/09/27/2011-09-25_event-now_2_7.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:32:27','2011-09-27 19:32:27',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(327,42,'2011/09/27/2011-09-25_event-now_5_8.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:32:28','2011-09-27 19:32:28',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(328,42,'2011/09/27/2011-09-25_event-now_4_8.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:32:28','2011-09-27 19:32:28',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(329,42,'2011/09/27/2011-09-25_event-nowflv_8.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:32:28','2011-09-27 19:32:28',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(330,42,'2011/09/27/2011-09-25_event-now_0_8.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:32:29','2011-09-27 19:32:29',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(331,42,'2011/09/27/2011-09-25_event-now_2_8.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:32:30','2011-09-27 19:32:30',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(332,46,'2011/09/27/2011-09-25_event-now_5_9.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(333,46,'2011/09/27/2011-09-25_event-now_4_9.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(334,46,'2011/09/27/2011-09-25_event-nowflv_9.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(335,46,'2011/09/27/2011-09-25_event-now_0_9.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:33:39','2011-09-27 19:33:39',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(336,46,'2011/09/27/2011-09-25_event-now_2_9.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:33:40','2011-09-27 19:33:40',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(337,49,'2011/09/27/2011-09-25_event-now_5_10.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:33:40','2011-09-27 19:33:40',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(338,49,'2011/09/27/2011-09-25_event-now_4_10.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:33:40','2011-09-27 19:33:40',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(339,NULL,'2011/09/27/2011-09-25_event-nowflv_10.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:33:41','2011-09-27 19:34:47',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(340,49,'2011/09/27/2011-09-25_event-now_0_10.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:33:41','2011-09-27 19:33:41',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(341,NULL,'2011/09/27/2011-09-25_event-now_2_10.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:33:42','2011-09-27 19:35:19',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(342,52,'2011/09/27/2011-09-25_event-now_5_11.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:33:43','2011-09-27 19:33:43',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(343,52,'2011/09/27/2011-09-25_event-now_4_11.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:33:43','2011-09-27 19:33:43',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(344,52,'2011/09/27/2011-09-25_event-nowflv_11.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:33:43','2011-09-27 19:33:43',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(345,52,'2011/09/27/2011-09-25_event-now_0_11.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:33:44','2011-09-27 19:33:44',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(346,52,'2011/09/27/2011-09-25_event-now_2_11.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:33:45','2011-09-27 19:33:45',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(347,53,'2011/09/27/2011-09-25_event-now_5_12.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:34:19','2011-09-27 19:34:19',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(348,53,'2011/09/27/2011-09-25_event-now_4_12.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:34:19','2011-09-27 19:34:19',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(349,53,'2011/09/27/2011-09-25_event-nowflv_12.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:34:20','2011-09-27 19:34:20',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(350,53,'2011/09/27/2011-09-25_event-now_0_12.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:34:20','2011-09-27 19:34:20',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(351,53,'2011/09/27/2011-09-25_event-now_2_12.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:34:21','2011-09-27 19:34:21',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(352,54,'2011/09/27/2011-09-25_event-now_5_13.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:34:22','2011-09-27 19:34:22',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(353,54,'2011/09/27/2011-09-25_event-now_4_13.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:34:22','2011-09-27 19:34:22',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(354,54,'2011/09/27/2011-09-25_event-nowflv_13.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:34:22','2011-09-27 19:34:22',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(355,54,'2011/09/27/2011-09-25_event-now_0_13.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:34:22','2011-09-27 19:34:22',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(356,54,'2011/09/27/2011-09-25_event-now_2_13.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:34:24','2011-09-27 19:34:24',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(357,55,'2011/09/27/2011-09-25_event-now_5_14.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-27 19:34:24','2011-09-27 19:34:24',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(358,55,'2011/09/27/2011-09-25_event-now_4_14.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-27 19:34:24','2011-09-27 19:34:24',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(359,55,'2011/09/27/2011-09-25_event-nowflv_14.flv',16769782,0,'2011-09-25_event-now.flv.flv',NULL,NULL,'2011-09-27 19:34:25','2011-09-27 19:34:25',NULL,1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(360,55,'2011/09/27/2011-09-25_event-now_0_14.flv',8472440,0,'2011-09-25_event-now_0.flv',NULL,NULL,'2011-09-27 19:34:25','2011-09-27 19:34:25',NULL,1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(361,55,'2011/09/27/2011-09-25_event-now_2_14.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-27 19:34:27','2011-09-27 19:34:27',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(362,57,'2011/09/28/img_0138.jpg',2828194,0,'IMG_0138.JPG',NULL,1,'2011-09-28 20:46:21','2011-09-28 20:46:30',NULL,1,'9244a93c74f7a0cfa71e8472021c31b9ae2be2ce',65,0,0),(363,60,'2011/09/28/2011-09-25_event-now_5.flv',5576196,0,'2011-09-25_event-now_5.flv',NULL,NULL,'2011-09-28 20:59:54','2011-09-28 21:02:36',NULL,1,'cb288654236ed5b0a9486446786b453b1b1acd37',64,0,0),(364,60,'2011/09/28/2011-09-25_event-now_4.flv',2138140,0,'2011-09-25_event-now_4.flv',NULL,NULL,'2011-09-28 20:59:54','2011-09-28 21:02:36',NULL,1,'919b90305e307236e10d540bfd2a40b66fa94198',64,0,0),(365,60,'2011/09/28/2011-09-25_event-nowflv.flv',16769782,0,'2011-09-25_event-now.flv.flv','1. Intro, ULYSESS isst kuchen',4,'2011-09-28 20:59:55','2011-09-28 21:40:57','asdjhg akjhsdg akjhsdg sakjhgds ksajhgds kjahgd skjahgd skjahg dskjhsag dkjhsag sdkjhga dkjshag dkhd gkjahgd skajhgd jkahgds.',1,'7d44ee4a318e0fe0e9144feeb695734e058397cc',64,0,0),(366,60,'2011/09/28/2011-09-25_event-now_0.flv',8472440,0,'2011-09-25_event-now_0.flv','2. Ein anderes file',1,'2011-09-28 20:59:56','2011-09-28 21:41:10','',1,'ba19792994609c162e1d43685c89dcb9879bce47',64,0,0),(367,60,'2011/09/28/2011-09-25_event-now_2.flv',36534100,0,'2011-09-25_event-now_2.flv',NULL,NULL,'2011-09-28 20:59:58','2011-09-28 21:02:36',NULL,1,'d43534381c1fc7008dc8fe0e3d9af8d14f683d79',64,0,0),(368,67,'2011/10/28/desktop.ini',664,0,'desktop.ini','',1,'2011-10-28 14:34:07','2011-10-31 12:40:23','',1,'e32929275c7957bfd5f9b5265482cb7e65da0bd4',64,50,0),(369,66,'2011/10/28/thumb.aspx',88777,0,'thumb.aspx',NULL,1,'2011-10-28 14:34:07','2011-10-28 14:34:13',NULL,1,'1f1979d4518177225a7c0406e0c0f1e0acea7617',64,0,0),(370,66,'2011/10/28/img_0523.jpg',528837,0,'IMG_0523.JPG',NULL,1,'2011-10-28 14:34:07','2011-10-28 14:34:13',NULL,1,'d8092010555bb7ee165b736e00af6e25b822e4f9',65,0,0),(371,66,'2011/10/28/img_0524.jpg',537507,0,'IMG_0524.JPG',NULL,1,'2011-10-28 14:34:08','2011-10-28 14:34:13',NULL,1,'d317f2198af2a89e27d4381f9d89e02fb049f1f3',65,0,0),(372,66,'2011/10/28/img_0512.jpg',544858,0,'IMG_0512.JPG',NULL,1,'2011-10-28 14:34:09','2011-10-28 14:34:13',NULL,1,'0198e6cf9ddb688738bb2030eb8a75c3694fa44c',65,0,0),(373,66,'2011/10/28/img_0522.jpg',553198,0,'IMG_0522.JPG',NULL,1,'2011-10-28 14:34:10','2011-10-28 14:34:13',NULL,1,'3a1f388b30a459e021c66cd9487742faf5bab206',65,0,0),(374,67,'2011/10/29/img_0523.jpg',528837,1,'IMG_0523.JPG','ERSTER BILD',1,'2011-10-29 16:45:38','2011-10-31 12:39:19','',1,'d8092010555bb7ee165b736e00af6e25b822e4f9',65,0,0),(375,67,'2011/10/29/img_0524.jpg',537507,0,'IMG_0524.JPG',NULL,1,'2011-10-29 16:45:39','2011-10-29 16:45:42',NULL,1,'d317f2198af2a89e27d4381f9d89e02fb049f1f3',65,0,0),(376,67,'2011/10/29/img_0512.jpg',544858,1,'IMG_0512.JPG','STREAM REC 1',1,'2011-10-29 16:45:40','2011-10-30 12:22:52','und ne beschrieb dazu',1,'0198e6cf9ddb688738bb2030eb8a75c3694fa44c',65,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filer_folder`
--

LOCK TABLES `filer_folder` WRITE;
/*!40000 ALTER TABLE `filer_folder` DISABLE KEYS */;
INSERT INTO `filer_folder` VALUES (1,NULL,'test',1,'2011-09-26 18:31:52','2011-09-26 18:31:52','2011-09-26 18:31:52',1,6,1,0),(2,NULL,'subfolder',1,'2011-09-26 18:56:04','2011-09-26 18:56:04','2011-09-26 18:56:04',1,2,2,0),(3,1,'subfolder x',1,'2011-09-26 18:56:37','2011-09-26 18:56:37','2011-09-26 18:56:37',2,3,1,1),(4,1,'intros',1,'2011-09-27 12:32:49','2011-09-27 12:32:49','2011-09-27 12:32:49',4,5,1,1),(5,NULL,'shows',1,'2011-09-27 13:30:41','2011-09-27 13:30:41','2011-09-27 13:30:41',1,64,3,0),(6,5,'2011-10-02_intro',1,'2011-09-27 13:31:12','2011-09-27 13:31:12','2011-09-27 13:31:12',2,3,3,1),(7,NULL,'2011-09-24_event-a',NULL,'2011-09-27 13:41:32','2011-09-27 13:41:32','2011-09-27 13:41:32',1,4,4,0),(8,7,'subfolder',1,'2011-09-27 14:20:17','2011-09-27 14:20:17','2011-09-27 14:20:17',2,3,4,1),(9,NULL,'2011-09-24_event-a',1,'2011-09-27 17:24:59','2011-09-27 17:24:59','2011-09-27 17:24:59',1,4,5,0),(10,9,'Recordings',1,'2011-09-27 17:24:59','2011-09-27 17:24:59','2011-09-27 17:24:59',2,3,5,1),(11,5,'2011-09-24_event-a',1,'2011-09-27 17:26:39','2011-09-27 17:26:39','2011-09-27 17:26:39',4,9,3,1),(12,11,'Recordings',1,'2011-09-27 17:26:39','2011-09-27 17:26:39','2011-09-27 17:26:39',5,6,3,2),(13,NULL,'css',NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31','2011-09-27 17:41:31',1,4,6,0),(14,13,'uniform',NULL,'2011-09-27 17:41:31','2011-09-27 17:41:31','2011-09-27 17:41:31',2,3,6,1),(15,5,'uniform',NULL,'2011-09-27 17:44:30','2011-09-27 17:44:30','2011-09-27 17:44:30',10,11,3,1),(16,5,'css',NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55','2011-09-27 18:46:55',12,15,3,1),(17,16,'uniform',NULL,'2011-09-27 18:46:55','2011-09-27 18:46:55','2011-09-27 18:46:55',13,14,3,2),(18,5,'swf',NULL,'2011-09-27 19:09:26','2011-09-27 19:09:26','2011-09-27 19:09:26',16,17,3,1),(19,5,'stream',NULL,'2011-09-27 19:13:48','2011-09-27 19:13:48','2011-09-27 19:13:48',18,19,3,1),(20,5,'2011-09-26_event-today',1,'2011-09-27 19:14:53','2011-09-27 19:14:53','2011-09-27 19:14:53',20,25,3,1),(21,20,'Recordings',1,'2011-09-27 19:14:53','2011-09-27 19:14:53','2011-09-27 19:14:53',21,22,3,2),(22,5,'2011-09-27_event-b',1,'2011-09-27 19:14:53','2011-09-27 19:14:53','2011-09-27 19:14:53',26,31,3,1),(23,22,'Recordings',1,'2011-09-27 19:14:53','2011-09-27 19:14:53','2011-09-27 19:14:53',27,28,3,2),(24,5,'recorded',NULL,'2011-09-27 19:23:54','2011-09-27 19:23:54','2011-09-27 19:23:54',32,33,3,1),(25,NULL,'showsEVENT---A',NULL,'2011-09-27 19:30:04','2011-09-27 19:30:04','2011-09-27 19:30:04',1,6,7,0),(26,25,'recordings',NULL,'2011-09-27 19:30:04','2011-09-27 19:30:04','2011-09-27 19:30:04',2,5,7,1),(27,26,'recorded',NULL,'2011-09-27 19:30:04','2011-09-27 19:30:04','2011-09-27 19:30:04',3,4,7,2),(28,NULL,'showsEvent Today',NULL,'2011-09-27 19:30:06','2011-09-27 19:30:06','2011-09-27 19:30:06',1,6,8,0),(29,28,'recordings',NULL,'2011-09-27 19:30:06','2011-09-27 19:30:06','2011-09-27 19:30:06',2,5,8,1),(30,29,'recorded',NULL,'2011-09-27 19:30:06','2011-09-27 19:30:06','2011-09-27 19:30:06',3,4,8,2),(31,NULL,'showsEVENT---B',NULL,'2011-09-27 19:30:09','2011-09-27 19:30:09','2011-09-27 19:30:09',1,6,9,0),(32,31,'recordings',NULL,'2011-09-27 19:30:09','2011-09-27 19:30:09','2011-09-27 19:30:09',2,5,9,1),(33,32,'recorded',NULL,'2011-09-27 19:30:09','2011-09-27 19:30:09','2011-09-27 19:30:09',3,4,9,2),(34,5,'EVENT---A',NULL,'2011-09-27 19:32:22','2011-09-27 19:32:22','2011-09-27 19:32:22',34,39,3,1),(35,34,'recordings',NULL,'2011-09-27 19:32:22','2011-09-27 19:32:22','2011-09-27 19:32:22',35,38,3,2),(36,35,'recorded',NULL,'2011-09-27 19:32:22','2011-09-27 19:32:22','2011-09-27 19:32:22',36,37,3,3),(37,5,'Event Today',NULL,'2011-09-27 19:32:25','2011-09-27 19:32:25','2011-09-27 19:32:25',40,45,3,1),(38,37,'recordings',NULL,'2011-09-27 19:32:25','2011-09-27 19:32:25','2011-09-27 19:32:25',41,44,3,2),(39,38,'recorded',NULL,'2011-09-27 19:32:25','2011-09-27 19:32:25','2011-09-27 19:32:25',42,43,3,3),(40,5,'EVENT---B',NULL,'2011-09-27 19:32:27','2011-09-27 19:32:27','2011-09-27 19:32:27',46,51,3,1),(41,40,'recordings',NULL,'2011-09-27 19:32:27','2011-09-27 19:32:27','2011-09-27 19:32:27',47,50,3,2),(42,41,'recorded',NULL,'2011-09-27 19:32:28','2011-09-27 19:32:28','2011-09-27 19:32:28',48,49,3,3),(43,NULL,'events',NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38','2011-09-27 19:33:38',1,30,10,0),(44,43,'EVENT---A',NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38','2011-09-27 19:33:38',2,9,10,1),(45,44,'recordings',NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38','2011-09-27 19:33:38',3,6,10,2),(46,45,'recorded',NULL,'2011-09-27 19:33:38','2011-09-27 19:33:38','2011-09-27 19:33:38',4,5,10,3),(47,43,'Event Today',NULL,'2011-09-27 19:33:40','2011-09-27 19:33:40','2011-09-27 19:33:40',10,17,10,1),(48,47,'recordings',NULL,'2011-09-27 19:33:40','2011-09-27 19:33:40','2011-09-27 19:33:40',11,14,10,2),(49,48,'recorded',NULL,'2011-09-27 19:33:40','2011-09-27 19:33:40','2011-09-27 19:33:40',12,13,10,3),(50,43,'EVENT---B',NULL,'2011-09-27 19:33:42','2011-09-27 19:33:42','2011-09-27 19:33:42',18,25,10,1),(51,50,'recordings',NULL,'2011-09-27 19:33:42','2011-09-27 19:33:42','2011-09-27 19:33:42',19,22,10,2),(52,51,'recorded',NULL,'2011-09-27 19:33:42','2011-09-27 19:33:42','2011-09-27 19:33:42',20,21,10,3),(53,44,'recorded',NULL,'2011-09-27 19:34:19','2011-09-27 19:34:19','2011-09-27 19:34:19',7,8,10,2),(54,47,'recorded',NULL,'2011-09-27 19:34:21','2011-09-27 19:34:21','2011-09-27 19:34:21',15,16,10,2),(55,50,'recorded',NULL,'2011-09-27 19:34:24','2011-09-27 19:34:24','2011-09-27 19:34:24',23,24,10,2),(57,5,'Testevent final 000',1,'2011-09-28 20:45:04','2011-09-28 20:45:04','2011-09-28 20:45:04',52,55,3,1),(58,43,'Testevent final 000',NULL,'2011-09-28 20:59:54','2011-09-28 20:59:54','2011-09-28 20:59:54',26,29,10,1),(59,58,'recorded',NULL,'2011-09-28 20:59:54','2011-09-28 20:59:54','2011-09-28 20:59:54',27,28,10,2),(60,57,'recorded',1,'2011-09-28 21:02:31','2011-09-28 21:02:31','2011-09-28 21:02:31',53,54,3,2),(61,11,'recorded',NULL,'2011-09-29 13:51:48','2011-09-29 13:51:48','2011-09-29 13:51:48',7,8,3,2),(62,20,'recorded',NULL,'2011-09-29 14:41:59','2011-09-29 14:41:59','2011-09-29 14:41:59',23,24,3,2),(63,NULL,'recorded',NULL,'2011-09-29 15:12:07','2011-09-29 15:12:07','2011-09-29 15:12:07',1,2,11,0),(64,22,'recorded',NULL,'2011-09-29 19:04:23','2011-09-29 19:04:23','2011-09-29 19:04:23',29,30,3,2),(66,5,'supertestroom',1,'2011-10-28 14:31:59','2011-10-28 14:31:59','2011-10-28 14:31:59',56,59,3,1),(67,66,'recorded',NULL,'2011-10-28 14:38:49','2011-10-28 14:38:49','2011-10-28 14:38:49',57,58,3,2),(68,5,'EVENT--NOW',1,'2011-10-28 17:49:38','2011-10-28 17:49:38','2011-10-28 17:49:38',60,63,3,1),(69,68,'recorded',NULL,'2011-10-29 13:20:01','2011-10-29 13:20:01','2011-10-29 13:20:01',61,62,3,2);
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
INSERT INTO `filer_image` VALUES (1,1200,1600,'2011-09-26 18:53:21',NULL,NULL,NULL,0,0,NULL),(2,1200,1600,'2011-09-26 18:53:23',NULL,NULL,NULL,0,0,NULL),(3,1200,1600,'2011-09-26 18:53:24',NULL,NULL,NULL,0,0,NULL),(9,3240,4320,'2011-09-27 14:16:00',NULL,NULL,NULL,0,0,NULL),(10,3240,4320,'2011-09-27 14:16:09',NULL,NULL,NULL,0,0,NULL),(11,3000,4000,'2011-09-27 14:22:10',NULL,NULL,NULL,0,0,NULL),(12,3000,4000,'2011-09-27 14:22:18',NULL,NULL,NULL,0,0,NULL),(16,3240,4320,'2011-09-27 16:53:50',NULL,NULL,NULL,0,0,NULL),(362,3240,4320,'2011-09-28 20:46:21',NULL,NULL,NULL,0,0,NULL),(370,1200,1600,'2011-10-28 14:34:07',NULL,NULL,NULL,0,0,NULL),(371,1200,1600,'2011-10-28 14:34:08',NULL,NULL,NULL,0,0,NULL),(372,1200,1600,'2011-10-28 14:34:09',NULL,NULL,NULL,0,0,NULL),(373,1200,1600,'2011-10-28 14:34:10',NULL,NULL,NULL,0,0,NULL),(374,1200,1600,'2011-10-29 16:45:38','','','',0,0,''),(375,1200,1600,'2011-10-29 16:45:39',NULL,NULL,NULL,0,0,NULL),(376,1200,1600,'2011-10-29 16:45:40','','','',0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jqchat_message`
--

LOCK TABLES `jqchat_message` WRITE;
/*!40000 ALTER TABLE `jqchat_message` DISABLE KEYS */;
INSERT INTO `jqchat_message` VALUES (101,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum..</span><br />',1317485318.83814,'2011-10-01 18:08:38'),(102,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum..</span><br />',1317485320.30937,'2011-10-01 18:08:40'),(103,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum..</span><br />',1317485321.24789,'2011-10-01 18:08:41'),(104,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum..</span><br />',1317485321.80414,'2011-10-01 18:08:41'),(105,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum..</span><br />',1317485322.53253,'2011-10-01 18:08:42'),(107,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdhgajhsdgajshdgajhsga</span><br />',1317486170.36481,'2011-10-01 18:22:50'),(108,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdjhagsdj</span><br />',1317831436.09466,'2011-10-05 18:17:16'),(109,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>askdhakjhsd</span><br />',1317831437.4837,'2011-10-05 18:17:17'),(110,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>ashdgajhgdas</span><br />',1317831438.44922,'2011-10-05 18:17:18'),(111,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>ashgdjahgads</span><br />',1317831439.33817,'2011-10-05 18:17:19'),(112,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdkjahksdhjdas</span><br />',1317831444.40688,'2011-10-05 18:17:24'),(113,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdgahjgajds</span><br />',1317831445.4811,'2011-10-05 18:17:25'),(114,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>kjh</span><br />',1317922909.38448,'2011-10-06 19:41:49'),(115,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>bmbmnbmb</span><br />',1317922911.38383,'2011-10-06 19:41:51'),(116,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdiauztsdbiauztsdv</span><br />',1318003816.50222,'2011-10-07 18:10:16'),(117,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>agsdkagsdkjhagdsk jhga kjsdhgak jhsdga kjhsgd kjahsgd kjahgsd kjahgs dkjahgs dkjhag kjsdhga kjsdhgajkhsgd kjags d</span><br />',1318003820.57827,'2011-10-07 18:10:20'),(118,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdjgajhsdg ajs d</span><br />',1318004098.50033,'2011-10-07 18:14:58'),(119,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>ahsdg kajhgsd ahsdg </span><br />',1318004099.73957,'2011-10-07 18:14:59'),(120,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdzasdasudzasidz a</span><br />',1318004351.11311,'2011-10-07 18:19:11'),(121,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdgfa dghjsfa jghsdfajgsd fas</span><br />',1318004353.35494,'2011-10-07 18:19:13'),(122,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>ajsfd aghjfs dhjgafdhjsgfaj sda</span><br />',1318004354.92858,'2011-10-07 18:19:14'),(123,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>ajhgsfd aghjfsdj gafsjhdgfa sda</span><br />',1318004356.37004,'2011-10-07 18:19:16'),(124,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>akjshdgf ajkhsgd kajhgds a</span><br />',1318004357.49913,'2011-10-07 18:19:17'),(125,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>jahgs dkjhagsdkhag ds</span><br />',1318004358.55962,'2011-10-07 18:19:18'),(126,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdiasdiazg sdas</span><br />',1318004904.34116,'2011-10-07 18:28:24'),(127,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdaghs da</span><br />',1318005017.38971,'2011-10-07 18:30:17'),(128,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type your message here..</span><br />',1318005019.91782,'2011-10-07 18:30:19'),(129,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdjag sdkhags d</span><br />',1318005079.36745,'2011-10-07 18:31:19'),(130,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>aksjdz akhjsdg as</span><br />',1318005080.45832,'2011-10-07 18:31:20'),(131,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>a sdasudf asd</span><br />',1318005081.10965,'2011-10-07 18:31:21'),(132,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'> dsausdf auzsd azfsd aghf dsjhgaf sjdhgfa dhjgfa hjsdgfahjsfd ahjfsd jafgsj dgfa hjsdgf ahjsfd ahjfgsd gjafjsdfahjgsfd ahjf sdhjaf sdhjgfajgs da </span><br />',1318005085.50523,'2011-10-07 18:31:25'),(133,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>da sdafsd jaghfs das$ad ahgdf ajsd a</span><br />',1318005087.54012,'2011-10-07 18:31:27'),(134,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>sd asdf as</span><br />',1318005088.22573,'2011-10-07 18:31:28'),(135,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>a sdagsfd as</span><br />',1318005088.93493,'2011-10-07 18:31:28'),(136,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>a sdahsfd aghjsfd jagsf jdasd</span><br />',1318005090.39803,'2011-10-07 18:31:30'),(137,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asjdg akhsgd a</span><br />',1318005091.89976,'2011-10-07 18:31:31'),(138,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdads</span><br />',1318005094.19087,'2011-10-07 18:31:34'),(139,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdhgaksdjhg as</span><br />',1318005095.4899,'2011-10-07 18:31:35'),(140,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>azsdgjahgsda</span><br />',1318005096.38768,'2011-10-07 18:31:36'),(141,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>ajsdajhsdfjagfsdas</span><br />',1318005097.63923,'2011-10-07 18:31:37'),(142,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asjdhgaj sgdfja hgsfd as</span><br />',1318005098.93167,'2011-10-07 18:31:38'),(143,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>a sdhgfa sd</span><br />',1318005099.63716,'2011-10-07 18:31:39'),(144,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>s da sfd ajshdgfajsghdf ajhgsfd jahgfsd jhgafs djhgfas jhgdf ahjgsfd jhagfs djhgafs jdhgfa jhsgdf ahjgfs djhgaf sjdhgfajhsgdf jhasgfd hjgafsd as</span><br />',1318005105.11258,'2011-10-07 18:31:45'),(145,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>as dhaklsd kajhlsd lakjhsd a</span><br />',1318005288.70168,'2011-10-07 18:34:48'),(146,1,2,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>http://www.google.ch asjhdgas</span><br />',1318005294.60172,'2011-10-07 18:34:54'),(147,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdaiuzsdagsd asd</span><br />',1318007193.37206,'2011-10-07 19:06:33'),(148,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asd</span><br />',1319807299.10731,'2011-10-28 15:08:19'),(149,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>sdfsdfsdfsf</span><br />',1319807315.03981,'2011-10-28 15:08:35'),(150,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Typasdasdaage here..</span><br />',1319807802.43992,'2011-10-28 15:16:42'),(151,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asd</span><br />',1319807804.78699,'2011-10-28 15:16:44'),(152,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>guten tag!</span><br />',1319808186.21685,'2011-10-28 15:23:06'),(153,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asdad</span><br />',1319808199.85998,'2011-10-28 15:23:19'),(154,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type your message here..asdads</span><br />',1319809420.71542,'2011-10-28 15:43:40'),(155,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>will auch chaten!!</span><br />',1319893206.98371,'2011-10-29 15:00:06'),(156,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894292.46319,'2011-10-29 15:18:12'),(157,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894292.74159,'2011-10-29 15:18:12'),(158,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894292.98914,'2011-10-29 15:18:12'),(159,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894293.33598,'2011-10-29 15:18:13'),(160,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894293.48778,'2011-10-29 15:18:13'),(161,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894293.64048,'2011-10-29 15:18:13'),(162,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>Type asdasdadsad here..</span><br />',1319894299.28794,'2011-10-29 15:18:19'),(163,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline lets see for multiline </span><br />',1319894627.35283,'2011-10-29 15:23:47'),(164,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asjhdg akjhsdg kajhgsjgkdjhgakjshdgkjahsgdkjahsdgkjahsdgjkahsgdkjahgsdjkahgsdjkahsgdkjahgsdkjhagsdjkhagjdkshgakjhsdgajkhgdkajg</span><br />',1319894642.25722,'2011-10-29 15:24:02'),(165,1,3,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>http://192.168.200.128:8008/veranstaltungen/supertestroom/</span><br />',1319894685.67622,'2011-10-29 15:24:45'),(166,1,4,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>freue mich schon...</span><br />',1319904265.04826,'2011-10-29 18:04:25'),(167,1,1,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>asd</span><br />',1319995103.55903,'2011-10-30 18:18:23'),(168,1,4,NULL,'<span class=\'user\'>root</span><span class=\'msg\'>lala</span><br />',1320049536.4601,'2011-10-31 09:25:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jqchat_room`
--

LOCK TABLES `jqchat_room` WRITE;
/*!40000 ALTER TABLE `jqchat_room` DISABLE KEYS */;
INSERT INTO `jqchat_room` VALUES (1,'chatroom','2011-09-23 17:46:23','',1316792783,1319995103,NULL,NULL),(2,'blank','2011-09-25 20:49:00','',1316976540,1318005294,NULL,NULL),(3,'supertestroom','2011-10-28 14:31:59',NULL,NULL,1319894685,NULL,NULL),(4,'xfvxvcvcxvxvx','2011-10-29 18:03:44','',1319904224,1320049536,NULL,NULL);
/*!40000 ALTER TABLE `jqchat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleo_invitationstat`
--

DROP TABLE IF EXISTS `kaleo_invitationstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleo_invitationstat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `invites_sent` int(11) NOT NULL,
  `invites_allocated` int(11) NOT NULL,
  `invites_accepted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_4bc66cdc` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleo_invitationstat`
--

LOCK TABLES `kaleo_invitationstat` WRITE;
/*!40000 ALTER TABLE `kaleo_invitationstat` DISABLE KEYS */;
INSERT INTO `kaleo_invitationstat` VALUES (1,1,0,10,0),(2,2,0,10,0),(3,3,0,10,0),(4,4,0,10,0),(5,5,0,10,0);
/*!40000 ALTER TABLE `kaleo_invitationstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaleo_joininvitation`
--

DROP TABLE IF EXISTS `kaleo_joininvitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaleo_joininvitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `sent` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `signup_code_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `signup_code_id` (`signup_code_id`),
  KEY `kaleo_joininvitation_74b00be1` (`from_user_id`),
  KEY `kaleo_joininvitation_315477a4` (`to_user_id`),
  CONSTRAINT `from_user_id_refs_id_405f4956` FOREIGN KEY (`from_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `signup_code_id_refs_id_3d9c2b4b` FOREIGN KEY (`signup_code_id`) REFERENCES `signup_codes_signupcode` (`id`),
  CONSTRAINT `to_user_id_refs_id_405f4956` FOREIGN KEY (`to_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaleo_joininvitation`
--

LOCK TABLES `kaleo_joininvitation` WRITE;
/*!40000 ALTER TABLE `kaleo_joininvitation` DISABLE KEYS */;
INSERT INTO `kaleo_joininvitation` VALUES (1,1,NULL,NULL,'2011-09-28 22:24:08',1,1),(2,1,NULL,NULL,'2011-09-28 22:30:19',1,2),(3,1,NULL,NULL,'2011-09-28 22:30:28',1,3),(4,1,NULL,NULL,'2011-10-29 14:03:21',1,4);
/*!40000 ALTER TABLE `kaleo_joininvitation` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2327 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_cachekey`
--

LOCK TABLES `menus_cachekey` WRITE;
/*!40000 ALTER TABLE `menus_cachekey` DISABLE KEYS */;
INSERT INTO `menus_cachekey` VALUES (1364,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1365,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1366,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1367,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1368,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1369,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1370,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1371,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1372,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1373,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1374,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1375,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1376,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1377,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1378,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1379,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1380,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1381,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1382,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1383,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1384,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1385,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1386,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1387,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1388,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1389,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1390,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1391,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1392,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1393,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1394,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1395,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1396,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1397,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1398,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1399,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1400,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1401,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1402,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1403,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1404,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1405,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1406,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1407,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1408,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1409,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1410,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1411,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1412,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1413,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1414,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1415,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1416,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1417,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1418,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1419,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1420,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1421,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1422,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1423,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1424,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1425,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1426,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1427,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1428,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1429,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1430,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1431,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1432,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1433,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1434,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1435,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1436,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1437,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1438,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1439,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1440,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1441,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1442,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1443,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1444,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1445,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1446,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1447,'en-us',1,'cms-menu_nodes_en-us_1'),(1448,'en',1,'cms-menu_nodes_en_1'),(1449,'en',1,'cms-menu_nodes_en_1'),(1450,'en',1,'cms-menu_nodes_en_1'),(1451,'en',1,'cms-menu_nodes_en_1'),(1452,'en',1,'cms-menu_nodes_en_1'),(1453,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1454,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1455,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1456,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1457,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1458,'en',1,'cms-menu_nodes_en_1'),(1459,'en',1,'cms-menu_nodes_en_1'),(1460,'en',1,'cms-menu_nodes_en_1'),(1461,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1462,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1463,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1464,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1465,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1466,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1467,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1468,'en',1,'cms-menu_nodes_en_1'),(1469,'en',1,'cms-menu_nodes_en_1'),(1470,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1471,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1472,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1473,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1474,'en',1,'cms-menu_nodes_en_1'),(1475,'en',1,'cms-menu_nodes_en_1'),(1476,'en',1,'cms-menu_nodes_en_1'),(1477,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1478,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1479,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1480,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1481,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1482,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1483,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1484,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1485,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1486,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1487,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1488,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1489,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1490,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1491,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1492,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1493,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1494,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1495,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1496,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1497,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1498,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1499,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1500,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1501,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1502,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1503,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1504,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1505,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1506,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1507,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1508,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1509,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1510,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1511,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1512,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1513,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1514,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1515,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1516,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1517,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1518,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1519,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1520,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1521,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1522,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1523,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1524,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1525,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1526,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1527,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1528,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1529,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1530,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1531,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1532,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1533,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1534,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1535,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1536,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1537,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1538,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1539,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1540,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1541,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1542,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1543,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1544,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1545,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1546,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1547,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1548,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1549,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1550,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1551,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1552,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1553,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1554,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1555,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1556,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1557,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1558,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1559,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1560,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1561,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1562,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1563,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1564,'en-us',1,'cms-menu_nodes_en-us_1'),(1565,'en',1,'cms-menu_nodes_en_1'),(1566,'en',1,'cms-menu_nodes_en_1'),(1567,'en',1,'cms-menu_nodes_en_1'),(1568,'en',1,'cms-menu_nodes_en_1'),(1569,'en',1,'cms-menu_nodes_en_1'),(1570,'en',1,'cms-menu_nodes_en_1'),(1571,'en',1,'cms-menu_nodes_en_1'),(1572,'en',1,'cms-menu_nodes_en_1'),(1573,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1574,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1575,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1576,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1577,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1578,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1579,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1580,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1581,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1582,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1583,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1584,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1585,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1586,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1587,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1588,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1589,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1590,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1591,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1592,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1593,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1594,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1595,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1596,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1597,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1598,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1599,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1600,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1601,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1602,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1603,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1604,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1605,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1606,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1607,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1608,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1609,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1610,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1611,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1612,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1613,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1614,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1615,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1616,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1617,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1618,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1619,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1620,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1621,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1622,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1623,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1624,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1625,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1626,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1627,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1628,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1629,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1630,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1631,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1632,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1633,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1634,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1635,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1636,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1637,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1638,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1639,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1640,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1641,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1642,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1643,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1644,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1645,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1646,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1647,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1648,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1649,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1650,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1651,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1652,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1653,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1654,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1655,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1656,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1657,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1658,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1659,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1660,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1661,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1662,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1663,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1664,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1665,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1666,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1667,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1668,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1669,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1670,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1671,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1672,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1673,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1674,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1675,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1676,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1677,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1678,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1679,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1680,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1681,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1682,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1683,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1684,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1685,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1686,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1687,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1688,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1689,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1690,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1691,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1692,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1693,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1694,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1695,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1696,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1697,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1698,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1699,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1700,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1701,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1702,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1703,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1704,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1705,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1706,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1707,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1708,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1709,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1710,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1711,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1712,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1713,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1714,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1715,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1716,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1717,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1718,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1719,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1720,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1721,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1722,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1723,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1724,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1725,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1726,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1727,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1728,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1729,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1730,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1731,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1732,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1733,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1734,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1735,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1736,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1737,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1738,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1739,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1740,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1741,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1742,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1743,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1744,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1745,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1746,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1747,'en-us',1,'cms-menu_nodes_en-us_1'),(1748,'en',1,'cms-menu_nodes_en_1'),(1749,'en',1,'cms-menu_nodes_en_1'),(1750,'en',1,'cms-menu_nodes_en_1'),(1751,'en',1,'cms-menu_nodes_en_1'),(1752,'en',1,'cms-menu_nodes_en_1'),(1753,'en',1,'cms-menu_nodes_en_1'),(1754,'en',1,'cms-menu_nodes_en_1'),(1755,'en',1,'cms-menu_nodes_en_1'),(1756,'en',1,'cms-menu_nodes_en_1'),(1757,'en',1,'cms-menu_nodes_en_1'),(1758,'en',1,'cms-menu_nodes_en_1'),(1759,'en',1,'cms-menu_nodes_en_1'),(1760,'en',1,'cms-menu_nodes_en_1'),(1761,'en',1,'cms-menu_nodes_en_1'),(1762,'en',1,'cms-menu_nodes_en_1'),(1763,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1764,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1765,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1766,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1767,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1768,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1769,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1770,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1771,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1772,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1773,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1774,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1775,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1776,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1777,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1778,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1779,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1780,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1781,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1782,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1783,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1784,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1785,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1786,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1787,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1788,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1789,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1790,'en-us',1,'cms-menu_nodes_en-us_1'),(1791,'en',1,'cms-menu_nodes_en_1'),(1792,'en',1,'cms-menu_nodes_en_1'),(1793,'en',1,'cms-menu_nodes_en_1'),(1794,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1795,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1796,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1797,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1798,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1799,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1800,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1801,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1802,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1803,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1804,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1805,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1806,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1807,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1808,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1809,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1810,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1811,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1812,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1813,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1814,'en-us',1,'cms-menu_nodes_en-us_1'),(1815,'en',1,'cms-menu_nodes_en_1'),(1816,'en',1,'cms-menu_nodes_en_1'),(1817,'en',1,'cms-menu_nodes_en_1'),(1818,'en',1,'cms-menu_nodes_en_1'),(1819,'en',1,'cms-menu_nodes_en_1'),(1820,'en',1,'cms-menu_nodes_en_1'),(1821,'en',1,'cms-menu_nodes_en_1'),(1822,'en',1,'cms-menu_nodes_en_1'),(1823,'en',1,'cms-menu_nodes_en_1'),(1824,'en',1,'cms-menu_nodes_en_1'),(1825,'en',1,'cms-menu_nodes_en_1'),(1826,'en',1,'cms-menu_nodes_en_1'),(1827,'en',1,'cms-menu_nodes_en_1'),(1828,'en',1,'cms-menu_nodes_en_1'),(1829,'en',1,'cms-menu_nodes_en_1'),(1830,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1831,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1832,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1833,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1834,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1835,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1836,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1837,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1838,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1839,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1840,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1841,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1842,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1843,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1844,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1845,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1846,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1847,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1848,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1849,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1850,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1851,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1852,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1853,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1854,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1855,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1856,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1857,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1858,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1859,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1860,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1861,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1862,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1863,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1864,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1865,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1866,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1867,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1868,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1869,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1870,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1871,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1872,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1873,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1874,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1875,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1876,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1877,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1878,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1879,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1880,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1881,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1882,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1883,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1884,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1885,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1886,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1887,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1888,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1889,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1890,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1891,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1892,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1893,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1894,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1895,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1896,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1897,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1898,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1899,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1900,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1901,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1902,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1903,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1904,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1905,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1906,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1907,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1908,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1909,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1910,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1911,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1912,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1913,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1914,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1915,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1916,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1917,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1918,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1919,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1920,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1921,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1922,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1923,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1924,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1925,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1926,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1927,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1928,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1929,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1930,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1931,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1932,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1933,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1934,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1935,'en-us',1,'cms-menu_nodes_en-us_1'),(1936,'en',1,'cms-menu_nodes_en_1'),(1937,'en',1,'cms-menu_nodes_en_1'),(1938,'en',1,'cms-menu_nodes_en_1'),(1939,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1940,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1941,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1942,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1943,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1944,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1945,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1946,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1947,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1948,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1949,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1950,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1951,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1952,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1953,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1954,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1955,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1956,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1957,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1958,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1959,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1960,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1961,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1962,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1963,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1964,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1965,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1966,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1967,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1968,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1969,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1970,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1971,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1972,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1973,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1974,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1975,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1976,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1977,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1978,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1979,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1980,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1981,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1982,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1983,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1984,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1985,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1986,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1987,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1988,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1989,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1990,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1991,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1992,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1993,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1994,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1995,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1996,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1997,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1998,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(1999,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2000,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2001,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2002,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2003,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2004,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2005,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2006,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2007,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2008,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2009,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2010,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2011,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2012,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2013,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2014,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2015,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2016,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2017,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2018,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2019,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2020,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2021,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2022,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2023,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2024,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2025,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2026,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2027,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2028,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2029,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2030,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2031,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2032,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2033,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2034,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2035,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2036,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2037,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2038,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2039,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2040,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2041,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2042,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2043,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2044,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2045,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2046,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2047,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2048,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2049,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2050,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2051,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2052,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2053,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2054,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2055,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2056,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2057,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2058,'en',1,'cms-menu_nodes_en_1'),(2059,'en',1,'cms-menu_nodes_en_1'),(2060,'en',1,'cms-menu_nodes_en_1'),(2061,'en',1,'cms-menu_nodes_en_1'),(2062,'en',1,'cms-menu_nodes_en_1'),(2063,'en',1,'cms-menu_nodes_en_1'),(2064,'en',1,'cms-menu_nodes_en_1'),(2065,'en',1,'cms-menu_nodes_en_1'),(2066,'en',1,'cms-menu_nodes_en_1'),(2067,'en',1,'cms-menu_nodes_en_1'),(2068,'en',1,'cms-menu_nodes_en_1'),(2069,'en',1,'cms-menu_nodes_en_1'),(2070,'en',1,'cms-menu_nodes_en_1'),(2071,'en',1,'cms-menu_nodes_en_1'),(2072,'en',1,'cms-menu_nodes_en_1'),(2073,'en',1,'cms-menu_nodes_en_1'),(2074,'en',1,'cms-menu_nodes_en_1'),(2075,'en',1,'cms-menu_nodes_en_1'),(2076,'en',1,'cms-menu_nodes_en_1'),(2077,'en',1,'cms-menu_nodes_en_1'),(2078,'en',1,'cms-menu_nodes_en_1'),(2079,'en',1,'cms-menu_nodes_en_1'),(2080,'en',1,'cms-menu_nodes_en_1'),(2081,'en',1,'cms-menu_nodes_en_1'),(2082,'en',1,'cms-menu_nodes_en_1'),(2083,'en',1,'cms-menu_nodes_en_1'),(2084,'en',1,'cms-menu_nodes_en_1'),(2085,'en',1,'cms-menu_nodes_en_1'),(2086,'en',1,'cms-menu_nodes_en_1'),(2087,'en',1,'cms-menu_nodes_en_1'),(2088,'en',1,'cms-menu_nodes_en_1'),(2089,'en',1,'cms-menu_nodes_en_1'),(2090,'en',1,'cms-menu_nodes_en_1'),(2091,'en',1,'cms-menu_nodes_en_1'),(2092,'en',1,'cms-menu_nodes_en_1'),(2093,'en',1,'cms-menu_nodes_en_1'),(2094,'en',1,'cms-menu_nodes_en_1'),(2095,'en',1,'cms-menu_nodes_en_1'),(2096,'en',1,'cms-menu_nodes_en_1'),(2097,'en',1,'cms-menu_nodes_en_1'),(2098,'en',1,'cms-menu_nodes_en_1'),(2099,'en',1,'cms-menu_nodes_en_1'),(2100,'en',1,'cms-menu_nodes_en_1'),(2101,'en',1,'cms-menu_nodes_en_1'),(2102,'en',1,'cms-menu_nodes_en_1'),(2103,'en',1,'cms-menu_nodes_en_1'),(2104,'en',1,'cms-menu_nodes_en_1'),(2105,'en',1,'cms-menu_nodes_en_1'),(2106,'en',1,'cms-menu_nodes_en_1'),(2107,'en',1,'cms-menu_nodes_en_1'),(2108,'en',1,'cms-menu_nodes_en_1'),(2109,'en',1,'cms-menu_nodes_en_1'),(2110,'en',1,'cms-menu_nodes_en_1'),(2111,'en',1,'cms-menu_nodes_en_1'),(2112,'en',1,'cms-menu_nodes_en_1'),(2113,'en',1,'cms-menu_nodes_en_1'),(2114,'en',1,'cms-menu_nodes_en_1'),(2115,'en',1,'cms-menu_nodes_en_1'),(2116,'en',1,'cms-menu_nodes_en_1'),(2117,'en',1,'cms-menu_nodes_en_1'),(2118,'en',1,'cms-menu_nodes_en_1'),(2119,'en',1,'cms-menu_nodes_en_1'),(2120,'en',1,'cms-menu_nodes_en_1'),(2121,'en',1,'cms-menu_nodes_en_1'),(2122,'en',1,'cms-menu_nodes_en_1'),(2123,'en',1,'cms-menu_nodes_en_1'),(2124,'en',1,'cms-menu_nodes_en_1'),(2125,'en',1,'cms-menu_nodes_en_1'),(2126,'en',1,'cms-menu_nodes_en_1'),(2127,'en',1,'cms-menu_nodes_en_1'),(2128,'en',1,'cms-menu_nodes_en_1'),(2129,'en',1,'cms-menu_nodes_en_1'),(2130,'en',1,'cms-menu_nodes_en_1'),(2131,'en',1,'cms-menu_nodes_en_1'),(2132,'en',1,'cms-menu_nodes_en_1'),(2133,'en',1,'cms-menu_nodes_en_1'),(2134,'en',1,'cms-menu_nodes_en_1'),(2135,'en',1,'cms-menu_nodes_en_1'),(2136,'en',1,'cms-menu_nodes_en_1'),(2137,'en',1,'cms-menu_nodes_en_1'),(2138,'en',1,'cms-menu_nodes_en_1'),(2139,'en',1,'cms-menu_nodes_en_1'),(2140,'en',1,'cms-menu_nodes_en_1'),(2141,'en',1,'cms-menu_nodes_en_1'),(2142,'en',1,'cms-menu_nodes_en_1'),(2143,'en',1,'cms-menu_nodes_en_1'),(2144,'en',1,'cms-menu_nodes_en_1'),(2145,'en',1,'cms-menu_nodes_en_1'),(2146,'en',1,'cms-menu_nodes_en_1'),(2147,'en',1,'cms-menu_nodes_en_1'),(2148,'en',1,'cms-menu_nodes_en_1'),(2149,'en',1,'cms-menu_nodes_en_1'),(2150,'en',1,'cms-menu_nodes_en_1'),(2151,'en',1,'cms-menu_nodes_en_1'),(2152,'en',1,'cms-menu_nodes_en_1'),(2153,'en',1,'cms-menu_nodes_en_1'),(2154,'en',1,'cms-menu_nodes_en_1'),(2155,'en',1,'cms-menu_nodes_en_1'),(2156,'en',1,'cms-menu_nodes_en_1'),(2157,'en',1,'cms-menu_nodes_en_1'),(2158,'en',1,'cms-menu_nodes_en_1'),(2159,'en',1,'cms-menu_nodes_en_1'),(2160,'en',1,'cms-menu_nodes_en_1'),(2161,'en',1,'cms-menu_nodes_en_1'),(2162,'en',1,'cms-menu_nodes_en_1'),(2163,'en',1,'cms-menu_nodes_en_1'),(2164,'en',1,'cms-menu_nodes_en_1'),(2165,'en',1,'cms-menu_nodes_en_1'),(2166,'en',1,'cms-menu_nodes_en_1'),(2167,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2168,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2169,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2170,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2171,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2172,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2173,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2174,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2175,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2176,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2177,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2178,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2179,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2180,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2181,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2182,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2183,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2184,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2185,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2186,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2187,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2188,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2189,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2190,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2191,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2192,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2193,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2194,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2195,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2196,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2197,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2198,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2199,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2200,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2201,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2202,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2203,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2204,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2205,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2206,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2207,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2208,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2209,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2210,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2211,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2212,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2213,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2214,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2215,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2216,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2217,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2218,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2219,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2220,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2221,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2222,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2223,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2224,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2225,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2226,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2227,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2228,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2229,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2230,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2231,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2232,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2233,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2234,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2235,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2236,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2237,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2238,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2239,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2240,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2241,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2242,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2243,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2244,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2245,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2246,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2247,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2248,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2249,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2250,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2251,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2252,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2253,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2254,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2255,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2256,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2257,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2258,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2259,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2260,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2261,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2262,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2263,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2264,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2265,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2266,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2267,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2268,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2269,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2270,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2271,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2272,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2273,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2274,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2275,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2276,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2277,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2278,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2279,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2280,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2281,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2282,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2283,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2284,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2285,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2286,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2287,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2288,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2289,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2290,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2291,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2292,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2293,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2294,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2295,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2296,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2297,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2298,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2299,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2300,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2301,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2302,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2303,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2304,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2305,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2306,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2307,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2308,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2309,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2310,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2311,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2312,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2313,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2314,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2315,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2316,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2317,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2318,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2319,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2320,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2321,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2322,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2323,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2324,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2325,'en-us',1,'cms-menu_nodes_en-us_1_1_user'),(2326,'en-us',1,'cms-menu_nodes_en-us_1_1_user');
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
-- Table structure for table `phileo_like`
--

DROP TABLE IF EXISTS `phileo_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phileo_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_content_type_id` int(11) NOT NULL,
  `receiver_object_id` int(10) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_id` (`sender_id`,`receiver_content_type_id`,`receiver_object_id`),
  KEY `phileo_like_6fe0a617` (`sender_id`),
  KEY `phileo_like_65942083` (`receiver_content_type_id`),
  CONSTRAINT `receiver_content_type_id_refs_id_6bc45cc0` FOREIGN KEY (`receiver_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `sender_id_refs_id_40f7853c` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phileo_like`
--

LOCK TABLES `phileo_like` WRITE;
/*!40000 ALTER TABLE `phileo_like` DISABLE KEYS */;
INSERT INTO `phileo_like` VALUES (6,1,56,2,'2011-10-01 17:40:01');
/*!40000 ALTER TABLE `phileo_like` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_profile`
--

LOCK TABLES `profiles_profile` WRITE;
/*!40000 ALTER TABLE `profiles_profile` DISABLE KEYS */;
INSERT INTO `profiles_profile` VALUES (1,1,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL),(2,2,'Jonas Ohrstrom','Zurich','http://ohrstrom.ch/','about?\r\nhm another\r\nLINE','0','jonasohrstrom','http://facebook.com/ohrstrom',''),(3,3,'lalal lolo','','','','0',NULL,NULL,NULL),(4,4,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL),(5,5,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_codes_signupcode`
--

LOCK TABLES `signup_codes_signupcode` WRITE;
/*!40000 ALTER TABLE `signup_codes_signupcode` DISABLE KEYS */;
INSERT INTO `signup_codes_signupcode` VALUES (1,'c012df52a81bd8778db502c86d9346bb89068d58',1,'2011-10-05 22:24:08',1,'ohrstrom@gmail.com','',NULL,'2011-09-28 22:24:08',0),(2,'a573902705327df19b058819fc6ed91a815f5d98',1,'2011-10-05 22:30:19',1,'jonas@anorg.net','',NULL,'2011-09-28 22:30:19',0),(3,'edfebd7de071c13bdf890004e9169da0a1439b82',1,'2011-10-05 22:30:28',1,'spam3@anorg.net','',NULL,'2011-09-28 22:30:28',0),(4,'797c00248fceaab33d72c81ed6b5a075a6debc4c',1,'2011-11-05 14:03:21',1,'ohrstrom@gmail.co.uk','',NULL,'2011-10-29 14:03:21',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'cms','0001_initial','2011-09-23 14:47:31'),(2,'picture','0001_initial','2011-09-23 14:47:31'),(3,'picture','0002_link_rename','2011-09-23 14:47:31'),(4,'picture','0003_freeze','2011-09-23 14:47:31'),(5,'cms','0002_auto_start','2011-09-23 14:47:31'),(6,'cms','0003_remove_placeholder','2011-09-23 14:47:31'),(7,'cms','0004_textobjects','2011-09-23 14:47:31'),(8,'cms','0005_mptt_added_to_plugins','2011-09-23 14:47:31'),(9,'cms','0006_apphook','2011-09-23 14:47:31'),(10,'cms','0007_apphook_longer','2011-09-23 14:47:31'),(11,'cms','0008_redirects','2011-09-23 14:47:31'),(12,'cms','0009_added_meta_fields','2011-09-23 14:47:31'),(13,'cms','0010_5char_language','2011-09-23 14:47:31'),(14,'cms','0011_title_overwrites','2011-09-23 14:47:31'),(15,'cms','0012_publisher','2011-09-23 14:47:31'),(16,'picture','0004_publisher','2011-09-23 14:47:31'),(17,'picture','0005_table_rename','2011-09-23 14:47:31'),(18,'text','0001_initial','2011-09-23 14:47:31'),(19,'text','0002_freeze','2011-09-23 14:47:31'),(20,'text','0003_publisher','2011-09-23 14:47:31'),(21,'snippet','0001_initial','2011-09-23 14:47:31'),(22,'snippet','0002_publisher','2011-09-23 14:47:31'),(23,'link','0001_initial','2011-09-23 14:47:31'),(24,'link','0002_link_rename','2011-09-23 14:47:31'),(25,'link','0003_page_link','2011-09-23 14:47:31'),(26,'link','0004_larger_link_names','2011-09-23 14:47:31'),(27,'link','0005_publisher','2011-09-23 14:47:31'),(28,'googlemap','0001_initial','2011-09-23 14:47:31'),(29,'file','0001_initial','2011-09-23 14:47:31'),(30,'file','0002_freeze','2011-09-23 14:47:31'),(31,'file','0003_publisher','2011-09-23 14:47:31'),(32,'cms','0013_site_copy','2011-09-23 14:47:31'),(33,'cms','0014_sites_removed','2011-09-23 14:47:31'),(34,'cms','0015_modified_by_added','2011-09-23 14:47:31'),(35,'cms','0016_author_copy','2011-09-23 14:47:31'),(36,'cms','0017_author_removed','2011-09-23 14:47:31'),(37,'cms','0018_site_permissions','2011-09-23 14:47:31'),(38,'cms','0019_public_table_renames','2011-09-23 14:47:31'),(39,'picture','0006_float_added','2011-09-23 14:47:31'),(40,'cms','0020_advanced_permissions','2011-09-23 14:47:31'),(41,'cms','0021_publisher2','2011-09-23 14:47:31'),(42,'cms','0022_login_required_added','2011-09-23 14:47:31'),(43,'cms','0023_plugin_table_naming_function_changed','2011-09-23 14:47:31'),(44,'cms','0024_added_placeholder_model','2011-09-23 14:47:31'),(45,'cms','0025_placeholder_migration','2011-09-23 14:47:31'),(46,'cms','0026_finish_placeholder_migration','2011-09-23 14:47:31'),(47,'cms','0027_added_width_to_placeholder','2011-09-23 14:47:31'),(48,'cms','0028_limit_visibility_in_menu_step1of3','2011-09-23 14:47:31'),(49,'cms','0029_limit_visibility_in_menu_step2of3_data','2011-09-23 14:47:31'),(50,'cms','0030_limit_visibility_in_menu_step3of3','2011-09-23 14:47:31'),(51,'cms','0031_improved_language_code_support','2011-09-23 14:47:31'),(52,'cms','0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis','2011-09-23 14:47:31'),(53,'cms','0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st','2011-09-23 14:47:31'),(54,'cms','0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel','2011-09-23 14:47:31'),(55,'cms','0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio','2011-09-23 14:47:31'),(56,'menus','0001_initial','2011-09-23 14:47:31'),(57,'text','0004_table_rename','2011-09-23 14:47:31'),(58,'text','0005_publisher2','2011-09-23 14:47:31'),(59,'text','0006_2_1_4_upgrade','2011-09-23 14:47:31'),(60,'picture','0007_publisher2','2011-09-23 14:47:31'),(61,'picture','0008_longdesc_added','2011-09-23 14:47:31'),(62,'link','0006_table_rename','2011-09-23 14:47:31'),(63,'link','0007_publisher2','2011-09-23 14:47:31'),(64,'link','0008_mailto','2011-09-23 14:47:31'),(65,'file','0004_table_rename','2011-09-23 14:47:31'),(66,'file','0005_publisher2','2011-09-23 14:47:31'),(67,'snippet','0003_table_rename','2011-09-23 14:47:31'),(68,'snippet','0004_publisher2','2011-09-23 14:47:31'),(69,'snippet','0005_template_added','2011-09-23 14:47:31'),(70,'googlemap','0002_table_rename','2011-09-23 14:47:31'),(71,'googlemap','0003_address_unified','2011-09-23 14:47:31'),(72,'googlemap','0004_copy_address','2011-09-23 14:47:31'),(73,'googlemap','0005_delete_street','2011-09-23 14:47:31'),(74,'googlemap','0006_publisher2','2011-09-23 14:47:31'),(75,'googlemap','0007_latlng','2011-09-23 14:47:31'),(76,'googlemap','0008_routeplaner','2011-09-23 14:47:31'),(77,'googlemap','0009_routeplaner_title','2011-09-23 14:47:31'),(78,'easy_thumbnails','0001_initial','2011-09-23 14:47:31'),(79,'easy_thumbnails','0002_filename_indexes','2011-09-23 14:47:31'),(80,'easy_thumbnails','0003_auto__add_storagenew','2011-09-23 14:47:31'),(81,'easy_thumbnails','0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new','2011-09-23 14:47:31'),(82,'easy_thumbnails','0005_storage_fks_null','2011-09-23 14:47:31'),(83,'easy_thumbnails','0006_copy_storage','2011-09-23 14:47:31'),(84,'easy_thumbnails','0007_storagenew_fks_not_null','2011-09-23 14:47:31'),(85,'easy_thumbnails','0008_auto__del_field_source_storage__del_field_thumbnail_storage','2011-09-23 14:47:31'),(86,'easy_thumbnails','0009_auto__del_storage','2011-09-23 14:47:31'),(87,'easy_thumbnails','0010_rename_storage','2011-09-23 14:47:31'),(88,'easy_thumbnails','0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash','2011-09-23 14:47:31'),(89,'easy_thumbnails','0012_build_storage_hashes','2011-09-23 14:47:31'),(90,'easy_thumbnails','0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora','2011-09-23 14:47:31'),(91,'easy_thumbnails','0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s','2011-09-23 14:47:31'),(92,'bcast','0001_initial','2011-09-23 14:54:19'),(93,'profiles','0001_initial','2011-09-23 14:54:27'),(94,'jqchat','0001_initial','2011-09-23 14:54:32'),(95,'bcast','0002_auto__chg_field_participation_date_joined','2011-09-25 14:21:56'),(96,'bcast','0003_auto__add_participantsplugin','2011-09-25 14:38:39'),(97,'bcast','0004_auto__add_field_event_location','2011-09-25 15:29:38'),(98,'bcast','0005_auto__chg_field_event_location','2011-09-25 15:30:15'),(99,'bcast','0006_auto__add_field_event_intro','2011-09-25 15:45:27'),(100,'profiles','0002_auto__add_field_profile_picture__add_field_profile_skype__add_field_pr','2011-09-25 19:22:24'),(101,'filer','0001_initial','2011-09-26 16:30:22'),(102,'filer','0002_rename_file_field','2011-09-26 16:30:22'),(103,'filer','0003_add_description_field','2011-09-26 16:30:22'),(104,'filer','0004_auto__del_field_file__file__add_field_file_file__add_field_file_is_pub','2011-09-26 16:30:23'),(105,'filer','0005_auto__add_field_file_sha1__chg_field_file_file','2011-09-26 16:30:25'),(106,'cmsplugin_filer_file','0001_initial','2011-09-26 16:31:13'),(107,'cmsplugin_filer_folder','0001_initial','2011-09-26 16:31:13'),(108,'filer','0006_polymorphic__add_field_file_polymorphic_ctype','2011-09-26 16:52:47'),(109,'filer','0007_polymorphic__content_type_data','2011-09-26 16:52:47'),(110,'filer','0008_polymorphic__del_field_file__file_type_plugin_name','2011-09-26 16:52:48'),(111,'bcast','0007_auto__del_field_event_picture__del_field_event_intro','2011-09-27 10:05:32'),(112,'bcast','0008_auto__add_field_event_picture__add_field_event_intro','2011-09-27 10:10:19'),(113,'bcast','0009_auto__add_field_event_folder','2011-09-27 11:29:27'),(114,'bcast','0010_auto__add_field_event_processed','2011-09-27 16:36:06'),(115,'cmsplugin_filer_image','0001_initial','2011-10-07 14:30:05'),(116,'cmsplugin_filer_image','0002_auto__add_field_filerimage_image_url__chg_field_filerimage_image','2011-10-07 14:30:07'),(117,'cmsplugin_filer_image','0003_auto__add_thumbnailoption__add_field_filerimage_thumbnail_option','2011-10-07 14:30:07'),(118,'cmsplugin_filer_image','0004_auto__del_field_thumbnailoption_is_scaled__del_field_thumbnailoption_i','2011-10-07 14:30:09'),(119,'cmsplugin_filer_image','0005_rename_float_to_alignment','2011-10-07 14:30:09'),(120,'cmsplugin_filer_image','0006_auto__add_field_filerimage_original_link','2011-10-07 14:30:09'),(121,'cmsplugin_filer_image','0007_rename_caption_to_caption_text','2011-10-07 14:30:09'),(122,'cmsplugin_filer_image','0008_auto__add_field_filerimage_file_link','2011-10-07 14:30:09'),(123,'cmsplugin_filer_teaser','0001_initial','2011-10-07 14:30:09'),(124,'cmsplugin_filer_teaser','0002_add_teaser_style_choice','2011-10-07 14:30:09'),(125,'cmsplugin_filer_teaser','0003_target_blank','2011-10-07 14:30:09'),(126,'cmsplugin_filer_teaser','0004_add_optional_external_image_url','2011-10-07 14:30:09'),(127,'cmsplugin_filer_teaser','0004_auto__chg_field_filerteaser_title','2011-10-07 14:30:09'),(128,'cmsplugin_filer_teaser','0005_auto__add_field_filerteaser_external_image','2011-10-07 14:30:09'),(129,'cmsplugin_filer_teaser','0006_fix_migration_mess','2011-10-07 14:30:10'),(130,'cmsplugin_filer_video','0001_initial','2011-10-07 14:30:10'),(131,'bcast','0011_auto__add_field_eventlistplugin_range','2011-10-28 15:08:19'),(132,'spectators','0001_initial','2011-10-30 11:53:00'),(133,'bcast','0012_auto__add_field_event_show_spectators','2011-10-30 12:42:04'),(134,'filer','0009_auto__add_field_file_cue_in__add_field_file_cue_out','2011-10-31 11:23:46');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectators_spectate`
--

DROP TABLE IF EXISTS `spectators_spectate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spectators_spectate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_content_type_id` int(11) NOT NULL,
  `receiver_object_id` int(10) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_id` (`sender_id`,`receiver_content_type_id`,`receiver_object_id`),
  KEY `spectators_spectate_6fe0a617` (`sender_id`),
  KEY `spectators_spectate_65942083` (`receiver_content_type_id`),
  CONSTRAINT `receiver_content_type_id_refs_id_507d07cd` FOREIGN KEY (`receiver_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `sender_id_refs_id_1944120f` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectators_spectate`
--

LOCK TABLES `spectators_spectate` WRITE;
/*!40000 ALTER TABLE `spectators_spectate` DISABLE KEYS */;
INSERT INTO `spectators_spectate` VALUES (64,1,56,6,'2011-10-30 14:58:06'),(67,1,56,4,'2011-10-30 19:06:20');
/*!40000 ALTER TABLE `spectators_spectate` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'asdaksda','asdaksda'),(2,'d','d'),(3,'Show','show'),(4,'testing','testing'),(5,'event','event'),(6,'double tag','double-tag'),(7,'today','today'),(9,'show','show_1'),(10,'none','none');
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (81,1,1,56),(82,2,1,56),(88,10,5,56),(107,9,4,56),(108,3,4,56),(109,5,4,56),(110,6,4,56),(111,7,4,56),(112,4,3,56),(113,9,2,56),(114,3,2,56);
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

-- Dump completed on 2011-11-01 12:46:56
