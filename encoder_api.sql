# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-10 18:13:59
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for encoder_api
CREATE DATABASE IF NOT EXISTS `encoder_api` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `encoder_api`;


# Dumping structure for table encoder_api.api_destinations
CREATE TABLE IF NOT EXISTS `api_destinations` (
  `ad_index` int(10) NOT NULL DEFAULT '0',
  `ad_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table encoder_api.api_destinations: ~4 rows (approximately)
/*!40000 ALTER TABLE `api_destinations` DISABLE KEYS */;
INSERT INTO `api_destinations` (`ad_index`, `ad_name`, `ad_url`, `ad_ip`, `ad_update`) VALUES
	(1, 'admin-api', 'http://podcast-api-dev.open.ac.uk', '137.108.130.170', '2011-06-10 10:02:09'),
	(2, 'admin-app', 'http://podcast-callback-dev.open.ac.uk', '137.108.130.70', '2011-06-10 10:01:59'),
	(3, 'media-api', 'http://media-podcast-api-dev.open.ac.uk', '137.108.130.115', '2011-06-10 10:05:04'),
	(4, 'encoder-api', 'http://kmi-encoder04/', '137.108.24.36', '2011-06-10 10:05:04');
/*!40000 ALTER TABLE `api_destinations` ENABLE KEYS */;


# Dumping structure for table encoder_api.command_queue
CREATE TABLE IF NOT EXISTS `command_queue` (
  `cq_index` int(10) NOT NULL AUTO_INCREMENT,
  `cq_command_id` int(10) DEFAULT '0',
  `cq_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `cq_data` text COLLATE utf8_unicode_ci,
  `cq_result` text COLLATE utf8_unicode_ci,
  `cq_time` int(12) DEFAULT NULL,
  `cq_update` int(12) DEFAULT NULL,
  `cq_status` enum('Y','N','F','R') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`cq_index`),
  KEY `ma_command` (`cq_command_id`,`cq_command`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table encoder_api.command_queue: ~36 rows (approximately)
/*!40000 ALTER TABLE `command_queue` DISABLE KEYS */;
INSERT INTO `command_queue` (`cq_index`, `cq_command_id`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_status`) VALUES
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


# Dumping structure for table encoder_api.message_queue
CREATE TABLE IF NOT EXISTS `message_queue` (
  `mq_index` int(10) NOT NULL DEFAULT '0',
  `mq_time_start` datetime DEFAULT NULL,
  `mq_time_complete` datetime DEFAULT NULL,
  `mq_status` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mq_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table encoder_api.message_queue: ~0 rows (approximately)
/*!40000 ALTER TABLE `message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_queue` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
