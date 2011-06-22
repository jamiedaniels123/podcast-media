# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-22 17:18:14
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table media-api.command_queue: ~0 rows (approximately)
/*!40000 ALTER TABLE `command_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `command_queue` ENABLE KEYS */;


# Dumping structure for table media-api.command_routes
DROP TABLE IF EXISTS `command_routes`;
CREATE TABLE IF NOT EXISTS `command_routes` (
  `cr_index` int(10) NOT NULL AUTO_INCREMENT,
  `cr_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_destination` enum('admin-app','admin-api','encoder-api','media-api') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_execute` enum('admin-app','admin-api','encoder-api','media-api') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_function` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci DEFAULT NULL,
  `cr_callback` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_route_type` enum('queue','direct') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cr_index`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table media-api.command_routes: ~12 rows (approximately)
/*!40000 ALTER TABLE `command_routes` DISABLE KEYS */;
INSERT INTO `command_routes` (`cr_index`, `cr_source`, `cr_destination`, `cr_execute`, `cr_action`, `cr_function`, `cr_callback`, `cr_route_type`) VALUES
	(1, 'admin-api', 'media-api', 'media-api', 'media-move-file', 'doMediaMoveFile', 'media-move-file', 'queue'),
	(2, 'admin-api', 'media-api', 'media-api', 'media-delete-file', 'doMediaDeleteFile', 'media-delete-file', 'queue'),
	(3, 'admin-api', 'media-api', 'media-api', 'media-delete-folder', 'doMediaDeleteFolder', 'media-delete-folder', 'queue'),
	(4, 'admin-api', 'media-api', 'media-api', 'media-update-metadata', 'doMediaUpdateMetadata', 'media-update-metadata', 'queue'),
	(5, 'admin-api', 'media-api', 'media-api', 'media-set-permissions', 'doSetPermisssions', 'media-set-permissions', 'queue'),
	(6, 'admin-api', 'media-api', 'media-api', 'media-check-file', 'doMediaCheckFile', 'media-check-file', 'direct'),
	(7, 'admin-api', 'media-api', 'media-api', 'media-check-folder', 'doMediaCheckFolder', 'media-check-folder', 'direct'),
	(8, 'admin-api', 'media-api', 'media-api', 'status-media', 'doStatusMedia', 'status-media', 'direct');
/*!40000 ALTER TABLE `command_routes` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
