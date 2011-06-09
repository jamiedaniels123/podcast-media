# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-08 16:44:56
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table podcast_media.api_destinations
CREATE TABLE IF NOT EXISTS `api_destinations` (
  `ad_index` int(10) NOT NULL DEFAULT '0',
  `ad_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table podcast_media.api_destinations: ~0 rows (approximately)
/*!40000 ALTER TABLE `api_destinations` DISABLE KEYS */;
INSERT INTO `api_destinations` (`ad_index`, `ad_name`, `ad_url`, `ad_ip`, `ad_update`) VALUES
	(1, 'admin', 'podcast-api-dev.open.ac.uk', NULL, NULL);
/*!40000 ALTER TABLE `api_destinations` ENABLE KEYS */;


# Dumping structure for table podcast_media.command_queue
CREATE TABLE IF NOT EXISTS `command_queue` (
  `cq_index` int(10) NOT NULL AUTO_INCREMENT,
  `cq_command_id` int(10) DEFAULT '0',
  `cq_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `cq_data` text COLLATE utf8_unicode_ci,
  `cq_result` text COLLATE utf8_unicode_ci,
  `cq_time` datetime DEFAULT NULL,
  `cq_update` datetime DEFAULT NULL,
  `cq_status` enum('Y','N','F','R') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`cq_index`),
  KEY `ma_command` (`cq_command_id`,`cq_command`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table podcast_media.command_queue: ~32 rows (approximately)
/*!40000 ALTER TABLE `command_queue` DISABLE KEYS */;
INSERT INTO `command_queue` (`cq_index`, `cq_command_id`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_status`) VALUES
	(1, 0, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-06 12:32:25', '0000-00-00 00:00:00', 'N'),
	(2, 0, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-06 12:32:25', '0000-00-00 00:00:00', 'N'),
	(3, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '2011-06-06 12:32:33', '0000-00-00 00:00:00', 'N'),
	(4, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '2011-06-06 12:32:33', '0000-00-00 00:00:00', 'N'),
	(5, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '2011-06-06 12:32:33', '0000-00-00 00:00:00', 'N'),
	(6, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '2011-06-06 12:32:33', '0000-00-00 00:00:00', 'N'),
	(7, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '2011-06-06 12:32:36', '0000-00-00 00:00:00', 'N'),
	(8, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '2011-06-06 12:32:36', '0000-00-00 00:00:00', 'N'),
	(9, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '2011-06-06 12:32:36', '0000-00-00 00:00:00', 'N'),
	(10, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '2011-06-06 12:32:36', '0000-00-00 00:00:00', 'N'),
	(11, 0, 'deletefolder', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:7:"/itunes";s:5:"count";s:1:"1";}', NULL, '2011-06-06 12:32:38', '0000-00-00 00:00:00', 'N'),
	(12, 0, 'deletefolder', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:6:"/utube";s:5:"count";s:1:"2";}', NULL, '2011-06-06 12:32:38', '0000-00-00 00:00:00', 'N'),
	(13, 0, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-06 13:25:30', '0000-00-00 00:00:00', 'N'),
	(14, 0, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-06 13:25:30', '0000-00-00 00:00:00', 'N'),
	(15, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '2011-06-06 13:25:50', '0000-00-00 00:00:00', 'N'),
	(16, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '2011-06-06 13:25:50', '0000-00-00 00:00:00', 'N'),
	(17, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '2011-06-06 13:25:50', '0000-00-00 00:00:00', 'N'),
	(18, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '2011-06-06 13:25:50', '0000-00-00 00:00:00', 'N'),
	(19, 0, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-06 14:43:48', '0000-00-00 00:00:00', 'N'),
	(20, 0, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-06 14:43:48', '0000-00-00 00:00:00', 'N'),
	(21, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '2011-06-06 14:44:56', '0000-00-00 00:00:00', 'N'),
	(22, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '2011-06-06 14:44:56', '0000-00-00 00:00:00', 'N'),
	(23, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '2011-06-06 14:44:56', '0000-00-00 00:00:00', 'N'),
	(24, 0, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '2011-06-06 14:44:56', '0000-00-00 00:00:00', 'N'),
	(25, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '2011-06-06 14:46:57', '0000-00-00 00:00:00', 'N'),
	(26, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '2011-06-06 14:46:57', '0000-00-00 00:00:00', 'N'),
	(27, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '2011-06-06 14:46:57', '0000-00-00 00:00:00', 'N'),
	(28, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '2011-06-06 14:46:57', '0000-00-00 00:00:00', 'N'),
	(29, 0, 'deletefolder', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:7:"/itunes";s:5:"count";s:1:"1";}', NULL, '2011-06-06 14:47:19', '0000-00-00 00:00:00', 'N'),
	(30, 0, 'deletefolder', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:6:"/utube";s:5:"count";s:1:"2";}', NULL, '2011-06-06 14:47:19', '0000-00-00 00:00:00', 'N'),
	(31, 0, 'processfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(32, 0, 'processfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N');
/*!40000 ALTER TABLE `command_queue` ENABLE KEYS */;


# Dumping structure for table podcast_media.command_routes
CREATE TABLE IF NOT EXISTS `command_routes` (
  `cr_index` int(10) NOT NULL DEFAULT '0',
  `cr_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_destination` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_callback` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_route_type` enum('queue','direct') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cr_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table podcast_media.command_routes: ~1 rows (approximately)
/*!40000 ALTER TABLE `command_routes` DISABLE KEYS */;
INSERT INTO `command_routes` (`cr_index`, `cr_source`, `cr_destination`, `cr_action`, `cr_callback`, `cr_route_type`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `command_routes` ENABLE KEYS */;


# Dumping structure for table podcast_media.message_queue
CREATE TABLE IF NOT EXISTS `message_queue` (
  `mq_index` int(10) NOT NULL DEFAULT '0',
  `mq_time_start` datetime DEFAULT NULL,
  `mq_time_complete` datetime DEFAULT NULL,
  `mq_status` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mq_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table podcast_media.message_queue: ~0 rows (approximately)
/*!40000 ALTER TABLE `message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_queue` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
