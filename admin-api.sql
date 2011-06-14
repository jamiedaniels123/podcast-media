# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-13 18:17:38
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for admin-api
CREATE DATABASE IF NOT EXISTS `admin-api` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `admin-api`;


# Dumping structure for table admin-api.api_destinations
DROP TABLE IF EXISTS `api_destinations`;
CREATE TABLE IF NOT EXISTS `api_destinations` (
  `ad_index` int(10) NOT NULL DEFAULT '0',
  `ad_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.api_destinations: ~4 rows (approximately)
/*!40000 ALTER TABLE `api_destinations` DISABLE KEYS */;
INSERT INTO `api_destinations` (`ad_index`, `ad_name`, `ad_url`, `ad_ip`, `ad_update`) VALUES
	(1, 'admin-api', 'http://podcast-api-dev.open.ac.uk', '137.108.130.170', '2011-06-10 10:02:09'),
	(2, 'admin-app', 'http://podcast-callback-dev.open.ac.uk', '137.108.130.70', '2011-06-10 10:01:59'),
	(3, 'media-api', 'http://media-podcast-api-dev.open.ac.uk', '137.108.130.115', '2011-06-10 10:05:04'),
	(4, 'encoder-api', 'http://kmi-encoder04/', '137.108.24.36', '2011-06-10 10:05:04');
/*!40000 ALTER TABLE `api_destinations` ENABLE KEYS */;


# Dumping structure for table admin-api.command_routes
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

# Dumping data for table admin-api.command_routes: ~14 rows (approximately)
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


# Dumping structure for table admin-api.queue_commands
DROP TABLE IF EXISTS `queue_commands`;
CREATE TABLE IF NOT EXISTS `queue_commands` (
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.queue_commands: ~101 rows (approximately)
/*!40000 ALTER TABLE `queue_commands` DISABLE KEYS */;
INSERT INTO `queue_commands` (`cq_index`, `cq_command_id`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_status`) VALUES
	(1, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(2, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(3, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(4, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(5, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(6, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(7, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(8, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(9, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(10, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(11, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(12, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(13, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(14, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(15, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(16, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(17, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(18, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(19, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(20, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(21, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(22, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(23, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(24, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(25, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(26, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(27, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(28, 0, 'metadata', 'a:14:{s:9:"custom_id";s:0:"";s:6:"folder";s:1:"/";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(29, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(30, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(31, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(32, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(33, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(34, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(35, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(36, 0, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', NULL, 'N'),
	(37, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(38, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(39, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(40, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(41, 0, 'transfer-folder-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:7:"/itunes";s:5:"count";s:1:"1";}', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'N'),
	(42, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-10 18:33:17', '0000-00-00 00:00:00', 'N'),
	(43, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-10 18:33:17', '0000-00-00 00:00:00', 'N'),
	(44, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-10 18:35:17', '0000-00-00 00:00:00', 'N'),
	(45, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-10 18:35:17', '0000-00-00 00:00:00', 'N'),
	(46, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-10 18:36:47', '0000-00-00 00:00:00', 'N'),
	(47, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-10 18:36:47', '0000-00-00 00:00:00', 'N'),
	(48, 0, 'transcode-media-and-deliver', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-10 18:37:55', '0000-00-00 00:00:00', 'N'),
	(49, 0, 'transcode-media-and-deliver', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-10 18:37:55', '0000-00-00 00:00:00', 'N'),
	(50, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '2011-06-10 18:38:05', '0000-00-00 00:00:00', 'N'),
	(51, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '2011-06-10 18:38:05', '0000-00-00 00:00:00', 'N'),
	(52, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '2011-06-10 18:38:05', '0000-00-00 00:00:00', 'N'),
	(53, 0, 'transfer-file-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '2011-06-10 18:38:05', '0000-00-00 00:00:00', 'N'),
	(54, 0, 'transfer-folder-to-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:7:"/itunes";s:5:"count";s:1:"1";}', NULL, '2011-06-10 18:38:09', '0000-00-00 00:00:00', 'N'),
	(55, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 18:52:58', '0000-00-00 00:00:00', 'N'),
	(56, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 18:56:14', '0000-00-00 00:00:00', 'N'),
	(57, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 18:58:31', '0000-00-00 00:00:00', 'N'),
	(58, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 19:00:14', '0000-00-00 00:00:00', 'N'),
	(59, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 19:00:20', '0000-00-00 00:00:00', 'N'),
	(60, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 19:00:35', '0000-00-00 00:00:00', 'N'),
	(61, 0, 'delete-file-on-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', NULL, '2011-06-10 19:00:45', '0000-00-00 00:00:00', 'N'),
	(62, 0, 'delete-file-on-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', NULL, '2011-06-10 19:00:45', '0000-00-00 00:00:00', 'N'),
	(63, 0, 'delete-file-on-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', NULL, '2011-06-10 19:00:45', '0000-00-00 00:00:00', 'N'),
	(64, 0, 'delete-file-on-media-server', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', NULL, '2011-06-10 19:00:45', '0000-00-00 00:00:00', 'N'),
	(65, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-10 19:00:50', '0000-00-00 00:00:00', 'N'),
	(66, 0, 'status', 'a:1:{s:4:"data";s:15:"some data here!";}', NULL, '2011-06-13 11:51:33', '0000-00-00 00:00:00', 'Y'),
	(67, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-13 11:58:14', '0000-00-00 00:00:00', 'N'),
	(68, 0, 'transcode-media', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', NULL, '2011-06-13 11:58:14', '0000-00-00 00:00:00', 'N');
/*!40000 ALTER TABLE `queue_commands` ENABLE KEYS */;


# Dumping structure for table admin-api.queue_messages
DROP TABLE IF EXISTS `queue_messages`;
CREATE TABLE IF NOT EXISTS `queue_messages` (
  `mq_index` int(10) NOT NULL DEFAULT '0',
  `mq_time_start` datetime DEFAULT NULL,
  `mq_time_complete` datetime DEFAULT NULL,
  `mq_status` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mq_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.queue_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `queue_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_messages` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
