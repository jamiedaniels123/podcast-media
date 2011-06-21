# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-21 10:27:07
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for media-api
CREATE DATABASE IF NOT EXISTS `media-api` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `media-api`;


# Dumping structure for table media-api.api_log
DROP TABLE IF EXISTS `api_log`;
CREATE TABLE IF NOT EXISTS `api_log` (
  `al_index` int(10) NOT NULL AUTO_INCREMENT,
  `al_datastream` text COLLATE utf8_unicode_ci,
  `al_message` text COLLATE utf8_unicode_ci,
  `al_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`al_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table media-api.api_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_log` ENABLE KEYS */;


# Dumping structure for table media-api.command_queue
DROP TABLE IF EXISTS `command_queue`;
CREATE TABLE IF NOT EXISTS `command_queue` (
  `cq_index` int(10) NOT NULL AUTO_INCREMENT,
  `cq_message_id` int(10) DEFAULT '0',
  `cq_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `cq_data` text COLLATE utf8_unicode_ci,
  `cq_result` text COLLATE utf8_unicode_ci,
  `cq_time` int(12) DEFAULT NULL,
  `cq_update` int(12) DEFAULT NULL,
  `cq_status` enum('Y','N','F','R') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`cq_index`),
  KEY `ma_command` (`cq_message_id`,`cq_command`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table media-api.command_queue: ~36 rows (approximately)
/*!40000 ALTER TABLE `command_queue` DISABLE KEYS */;
INSERT INTO `command_queue` (`cq_index`, `cq_message_id`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_status`) VALUES
	(1, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, 0, 'N'),
	(2, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, 0, 'N'),
	(3, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, 0, 'N'),
	(4, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, 0, 'N'),
	(5, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, 0, 'N'),
	(6, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, 0, 'N'),
	(7, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, 0, 'N'),
	(8, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, 0, 'N'),
	(9, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, 0, 'N'),
	(10, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, 0, 'N'),
	(11, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, 0, 'N'),
	(12, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, 0, 'N'),
	(13, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, 0, 'N'),
	(14, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, 0, 'N'),
	(15, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, 0, 'N'),
	(16, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, 0, 'N'),
	(17, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, 0, 'N'),
	(18, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, 0, 'N'),
	(19, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, 0, 'N'),
	(20, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, 0, 'N'),
	(21, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, 0, 'N'),
	(22, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, 0, 'N'),
	(23, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, 0, 'N'),
	(24, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, 0, 'N'),
	(25, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, 0, NULL, 'N'),
	(26, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, 0, NULL, 'N'),
	(27, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, 0, NULL, 'N'),
	(28, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, 0, NULL, 'N'),
	(29, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, 0, NULL, 'N'),
	(30, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, 0, NULL, 'N'),
	(31, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, 0, NULL, 'N'),
	(32, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, 0, NULL, 'N'),
	(33, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, 1307637708, NULL, 'N'),
	(34, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, 1307637708, NULL, 'N'),
	(35, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, 1307637708, NULL, 'N'),
	(36, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, 1307637708, NULL, 'N');
/*!40000 ALTER TABLE `command_queue` ENABLE KEYS */;


# Dumping structure for table media-api.command_routes
DROP TABLE IF EXISTS `command_routes`;
CREATE TABLE IF NOT EXISTS `command_routes` (
  `cr_index` int(10) NOT NULL DEFAULT '0',
  `cr_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_destination` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_function` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci DEFAULT NULL,
  `cr_callback` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_route_type` enum('queue','direct') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cr_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table media-api.command_routes: ~14 rows (approximately)
/*!40000 ALTER TABLE `command_routes` DISABLE KEYS */;
INSERT INTO `command_routes` (`cr_index`, `cr_source`, `cr_destination`, `cr_action`, `cr_function`, `cr_callback`, `cr_route_type`) VALUES
	(1, 'admin-api', 'encoder-api', 'transcode-media', 'doTranscodeMedia', 'transcode-media', 'queue'),
	(2, 'admin-api', 'encoder-api', 'transcode-media-and-deliver', 'doTranscodeMediaAndDeliver', 'transcode-media-and-deliver', 'queue'),
	(3, 'admin-api', 'encoder-api', 'transfer-file-to-media-server', 'doTransferFileToMediaServer', 'transfer-file-to-media-server', 'queue'),
	(4, 'admin-api', 'encoder-api', 'transfer-folder-to-media-server', 'doTransferFolderToMediaServer', 'transfer-folder-to-media-server', 'queue'),
	(5, 'admin-api', 'media-api', 'delete-file-on-media-server', 'doDeleteFileOnMediaServer', 'delete-file-on-media-server', 'direct'),
	(6, 'admin-api', 'media-api', 'delete-folder-on-media-server', 'doDeleteFolderOnMediaServer', 'delete-folder-on-media-server', 'direct'),
	(7, 'admin-api', 'media-api', 'update-file-metadata', 'doUpdateFileMetaData', 'update-file-metadata', 'queue'),
	(8, 'admin-api', 'media-api', 'update-folder-metadata', 'doUpdateFolderMetaData', 'update-folder-metadata', 'queue'),
	(9, 'admin-api', 'media-api', 'update-list-of-files-metadata', 'doUpdateListOfFilesMetaData', 'update-list-of-files-metadata', 'queue'),
	(10, 'admin-api', 'media-api', 'set-permissions-folder', 'doSetPermisssionsFolder', 'set-permissions-folder', 'queue'),
	(11, 'admin-api', 'media-api', 'check-file-exists', 'doCheckFileExists', 'check-file-exists', 'direct'),
	(12, 'admin-api', 'media-api', 'check-list-of-files-exists', 'doCheckListOfFilesExists', 'check-list-of-files-exists', 'direct'),
	(13, 'admin-api', 'media-api', 'check-folder-exists', 'doCheckFolderExists', 'check-folder-exists', 'direct'),
	(14, 'admin-api', 'media-api', 'status', 'doStatus', 'status', 'direct');
/*!40000 ALTER TABLE `command_routes` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
