-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add iot_devices',7,'add_iot_devices'),(26,'Can change iot_devices',7,'change_iot_devices'),(27,'Can delete iot_devices',7,'delete_iot_devices'),(28,'Can view iot_devices',7,'view_iot_devices'),(29,'Can add iot_log',8,'add_iot_log'),(30,'Can change iot_log',8,'change_iot_log'),(31,'Can delete iot_log',8,'delete_iot_log'),(32,'Can view iot_log',8,'view_iot_log'),(33,'Can add room_state',9,'add_room_state'),(34,'Can change room_state',9,'change_room_state'),(35,'Can delete room_state',9,'delete_room_state'),(36,'Can view room_state',9,'view_room_state'),(37,'Can add labour',10,'add_labour'),(38,'Can change labour',10,'change_labour'),(39,'Can delete labour',10,'delete_labour'),(40,'Can view labour',10,'view_labour'),(41,'Can add manager',11,'add_manager'),(42,'Can change manager',11,'change_manager'),(43,'Can delete manager',11,'delete_manager'),(44,'Can view manager',11,'view_manager'),(45,'Can add room',12,'add_room'),(46,'Can change room',12,'change_room'),(47,'Can delete room',12,'delete_room'),(48,'Can view room',12,'view_room'),(49,'Can add supervisor',13,'add_supervisor'),(50,'Can change supervisor',13,'change_supervisor'),(51,'Can delete supervisor',13,'delete_supervisor'),(52,'Can view supervisor',13,'view_supervisor'),(53,'Can add room labour',14,'add_roomlabour'),(54,'Can change room labour',14,'change_roomlabour'),(55,'Can delete room labour',14,'delete_roomlabour'),(56,'Can view room labour',14,'view_roomlabour');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$EmrKH7upIiSegYDLrJUBGu$wgAHLaDqKQn5RdHEGA560Rlx5NfNDKJmfuHgJsqD0x0=',NULL,1,'vishal','','','',1,1,'2024-08-16 07:51:29.591408');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'flutter','room_state'),(7,'iot','iot_devices'),(8,'iot','iot_log'),(10,'management','labour'),(11,'management','manager'),(12,'management','room'),(14,'management','roomlabour'),(13,'management','supervisor'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-16 07:11:23.621824'),(2,'auth','0001_initial','2024-08-16 07:11:23.959297'),(3,'admin','0001_initial','2024-08-16 07:11:24.050034'),(4,'admin','0002_logentry_remove_auto_add','2024-08-16 07:11:24.057063'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-16 07:11:24.066033'),(6,'contenttypes','0002_remove_content_type_name','2024-08-16 07:11:24.131032'),(7,'auth','0002_alter_permission_name_max_length','2024-08-16 07:11:24.176033'),(8,'auth','0003_alter_user_email_max_length','2024-08-16 07:11:24.201035'),(9,'auth','0004_alter_user_username_opts','2024-08-16 07:11:24.209036'),(10,'auth','0005_alter_user_last_login_null','2024-08-16 07:11:24.269032'),(11,'auth','0006_require_contenttypes_0002','2024-08-16 07:11:24.272032'),(12,'auth','0007_alter_validators_add_error_messages','2024-08-16 07:11:24.280032'),(13,'auth','0008_alter_user_username_max_length','2024-08-16 07:11:24.334032'),(14,'auth','0009_alter_user_last_name_max_length','2024-08-16 07:11:24.373547'),(15,'auth','0010_alter_group_name_max_length','2024-08-16 07:11:24.388619'),(16,'auth','0011_update_proxy_permissions','2024-08-16 07:11:24.395255'),(17,'auth','0012_alter_user_first_name_max_length','2024-08-16 07:11:24.446797'),(18,'management','0001_initial','2024-08-16 07:11:24.576058'),(19,'flutter','0001_initial','2024-08-16 07:11:24.633536'),(20,'iot','0001_initial','2024-08-16 07:11:24.695538'),(21,'sessions','0001_initial','2024-08-16 07:11:24.731535'),(22,'flutter','0002_room_state_time','2024-08-16 07:23:29.117572'),(23,'management','0002_alter_labour_phone_no','2024-08-16 08:03:00.610023'),(24,'management','0003_alter_supervisor_phone_no','2024-08-16 08:04:32.268935'),(25,'management','0004_alter_manager_phone_no','2024-08-16 08:05:02.752772');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flutter_room_state`
--

DROP TABLE IF EXISTS `flutter_room_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flutter_room_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gas01` decimal(12,8) NOT NULL,
  `gas02` decimal(12,8) NOT NULL,
  `gas03` decimal(12,8) NOT NULL,
  `gas04` decimal(12,8) NOT NULL,
  `state` varchar(50) NOT NULL,
  `room_id_id` varchar(20) NOT NULL,
  `time` time(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id_id` (`room_id_id`),
  CONSTRAINT `flutter_room_state_room_id_id_76df66a1_fk_managemen` FOREIGN KEY (`room_id_id`) REFERENCES `management_room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flutter_room_state`
--

LOCK TABLES `flutter_room_state` WRITE;
/*!40000 ALTER TABLE `flutter_room_state` DISABLE KEYS */;
INSERT INTO `flutter_room_state` VALUES (7,5.40000000,3.70000000,1.50000000,0.20000000,'1','r101','08:06:51.190638'),(8,0.98000000,1.05000000,0.90000000,1.01000000,'2','r102','09:00:00.000000'),(9,1.50000000,1.20000000,1.45000000,1.25000000,'3','r103','10:00:00.000000'),(10,1.10000000,1.15000000,1.20000000,1.11000000,'1','r104','11:00:00.000000'),(11,1.25000000,1.22000000,1.30000000,1.20000000,'2','r105','12:00:00.000000'),(12,1.30000000,1.15000000,1.40000000,1.10000000,'3','r106','13:00:00.000000'),(19,1.34000000,1.19000000,1.25000000,1.14000000,'1','r107','14:00:00.000000'),(20,1.22000000,1.18000000,1.33000000,1.25000000,'2','r108','15:00:00.000000'),(21,1.45000000,1.24000000,1.38000000,1.20000000,'3','r109','16:00:00.000000'),(22,1.11000000,1.16000000,1.20000000,1.15000000,'1','r110','17:00:00.000000'),(23,1.32000000,1.21000000,1.29000000,1.10000000,'2','r111','18:00:00.000000'),(24,1.28000000,1.17000000,1.26000000,1.13000000,'3','r112','19:00:00.000000'),(25,1.36000000,1.14000000,1.30000000,1.16000000,'1','r113','20:00:00.000000'),(26,1.23000000,1.25000000,1.35000000,1.21000000,'2','r114','21:00:00.000000'),(27,1.49000000,1.24000000,1.37000000,1.22000000,'3','r115','22:00:00.000000'),(28,1.15000000,1.20000000,1.18000000,1.13000000,'1','r116','23:00:00.000000'),(29,1.31000000,1.23000000,1.32000000,1.14000000,'2','r117','00:00:00.000000'),(30,1.27000000,1.16000000,1.29000000,1.12000000,'3','r118','01:00:00.000000'),(31,1.35000000,1.21000000,1.31000000,1.19000000,'1','r119','02:00:00.000000'),(32,1.24000000,1.22000000,1.33000000,1.20000000,'2','r120','03:00:00.000000'),(33,1.46000000,1.25000000,1.38000000,1.21000000,'3','r121','04:00:00.000000');
/*!40000 ALTER TABLE `flutter_room_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_iot_devices`
--

DROP TABLE IF EXISTS `iot_iot_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_iot_devices` (
  `mac_id` varchar(50) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `senses_gas` varchar(50) NOT NULL,
  PRIMARY KEY (`mac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_iot_devices`
--

LOCK TABLES `iot_iot_devices` WRITE;
/*!40000 ALTER TABLE `iot_iot_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot_iot_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot_iot_log`
--

DROP TABLE IF EXISTS `iot_iot_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iot_iot_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `time` time(6) NOT NULL,
  `gas01` decimal(12,8) NOT NULL,
  `gas02` decimal(12,8) NOT NULL,
  `gas03` decimal(12,8) NOT NULL,
  `gas04` decimal(12,8) NOT NULL,
  `room_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `iot_iot_log_room_id_id_2a6de6a7_fk_management_room_room_id` (`room_id_id`),
  CONSTRAINT `iot_iot_log_room_id_id_2a6de6a7_fk_management_room_room_id` FOREIGN KEY (`room_id_id`) REFERENCES `management_room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_iot_log`
--

LOCK TABLES `iot_iot_log` WRITE;
/*!40000 ALTER TABLE `iot_iot_log` DISABLE KEYS */;
INSERT INTO `iot_iot_log` VALUES (1,'13:36:51.195643',5.40000000,3.70000000,1.50000000,0.20000000,'r101');
/*!40000 ALTER TABLE `iot_iot_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_labour`
--

DROP TABLE IF EXISTS `management_labour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_labour` (
  `labour_id` varchar(50) NOT NULL,
  `labour_name` varchar(50) NOT NULL,
  `phone_no` bigint NOT NULL,
  PRIMARY KEY (`labour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_labour`
--

LOCK TABLES `management_labour` WRITE;
/*!40000 ALTER TABLE `management_labour` DISABLE KEYS */;
INSERT INTO `management_labour` VALUES ('l001','John Doe',1234567890),('l002','Jane Smith',9876543210),('l003','Bob Brown',5555555555),('l004','Alice Johnson',4444444444),('l005','Tom White',3333333333);
/*!40000 ALTER TABLE `management_labour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_manager`
--

DROP TABLE IF EXISTS `management_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_manager` (
  `manager_id` varchar(50) NOT NULL,
  `manager_name` varchar(50) NOT NULL,
  `phone_no` bigint unsigned NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`manager_id`),
  CONSTRAINT `management_manager_chk_1` CHECK ((`phone_no` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_manager`
--

LOCK TABLES `management_manager` WRITE;
/*!40000 ALTER TABLE `management_manager` DISABLE KEYS */;
INSERT INTO `management_manager` VALUES ('m001','Chris Purple',6666666666,'chris.purple@example.com'),('m002','Emma Orange',7777777777,'emma.orange@example.com'),('m003','James Gray',8888888888,'james.gray@example.com'),('m004','Olivia Pink',9999999999,'olivia.pink@example.com'),('m005','Lucas Brown',1010101010,'lucas.brown@example.com');
/*!40000 ALTER TABLE `management_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_room`
--

DROP TABLE IF EXISTS `management_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_room` (
  `room_id` varchar(20) NOT NULL,
  `room_no` int unsigned NOT NULL,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `management_room_chk_1` CHECK ((`room_no` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_room`
--

LOCK TABLES `management_room` WRITE;
/*!40000 ALTER TABLE `management_room` DISABLE KEYS */;
INSERT INTO `management_room` VALUES ('r101',101),('r102',102),('r103',103),('r104',104),('r105',105),('r106',106),('r107',107),('r108',108),('r109',109),('r110',110),('r111',111),('r112',112),('r113',113),('r114',114),('r115',115),('r116',116),('r117',117),('r118',118),('r119',119),('r120',120),('r121',121);
/*!40000 ALTER TABLE `management_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_roomlabour`
--

DROP TABLE IF EXISTS `management_roomlabour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_roomlabour` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `labour_id_id` varchar(50) NOT NULL,
  `room_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labour_id_id` (`labour_id_id`),
  UNIQUE KEY `room_id_id` (`room_id_id`),
  CONSTRAINT `management_roomlabou_labour_id_id_80fe91fc_fk_managemen` FOREIGN KEY (`labour_id_id`) REFERENCES `management_labour` (`labour_id`),
  CONSTRAINT `management_roomlabou_room_id_id_5b3bd2c0_fk_managemen` FOREIGN KEY (`room_id_id`) REFERENCES `management_room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_roomlabour`
--

LOCK TABLES `management_roomlabour` WRITE;
/*!40000 ALTER TABLE `management_roomlabour` DISABLE KEYS */;
INSERT INTO `management_roomlabour` VALUES (6,'l001','r101'),(7,'l002','r102'),(8,'l003','r103'),(9,'l004','r104'),(10,'l005','r105');
/*!40000 ALTER TABLE `management_roomlabour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_supervisor`
--

DROP TABLE IF EXISTS `management_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_supervisor` (
  `supervisor_id` varchar(50) NOT NULL,
  `supervisor_name` varchar(50) NOT NULL,
  `phone_no` bigint unsigned NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`supervisor_id`),
  CONSTRAINT `management_supervisor_chk_1` CHECK ((`phone_no` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_supervisor`
--

LOCK TABLES `management_supervisor` WRITE;
/*!40000 ALTER TABLE `management_supervisor` DISABLE KEYS */;
INSERT INTO `management_supervisor` VALUES ('s001','Michael Green',1111111111,'michael.green@example.com'),('s002','Sarah Black',2222222222,'sarah.black@example.com'),('s003','David Blue',3333333333,'david.blue@example.com'),('s004','Emily Red',4444444444,'emily.red@example.com'),('s005','Daniel Yellow',5555555555,'daniel.yellow@example.com');
/*!40000 ALTER TABLE `management_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `about` varchar(500) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (302,'vishal','vishalmadle13@gmail.com',_binary '\0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (501);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 13:43:27
