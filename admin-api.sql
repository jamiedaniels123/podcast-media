# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-17 13:50:00
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


# Dumping structure for table admin-api.api_log
DROP TABLE IF EXISTS `api_log`;
CREATE TABLE IF NOT EXISTS `api_log` (
  `al_index` int(10) NOT NULL AUTO_INCREMENT,
  `al_datastream` text COLLATE utf8_unicode_ci,
  `al_message` text COLLATE utf8_unicode_ci,
  `al_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`al_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table admin-api.api_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_log` ENABLE KEYS */;


# Dumping structure for table admin-api.api_workflows
DROP TABLE IF EXISTS `api_workflows`;
CREATE TABLE IF NOT EXISTS `api_workflows` (
  `wf_index` int(10) NOT NULL DEFAULT '0',
  `wf_cr_index` int(10) DEFAULT NULL,
  `wf_step` int(10) DEFAULT NULL,
  `wf_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wf_index`),
  KEY `wf_command_id` (`wf_cr_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table admin-api.api_workflows: ~0 rows (approximately)
/*!40000 ALTER TABLE `api_workflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_workflows` ENABLE KEYS */;


# Dumping structure for table admin-api.command_routes
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

# Dumping data for table admin-api.command_routes: ~15 rows (approximately)
/*!40000 ALTER TABLE `command_routes` DISABLE KEYS */;
INSERT INTO `command_routes` (`cr_index`, `cr_source`, `cr_destination`, `cr_execute`, `cr_action`, `cr_function`, `cr_callback`, `cr_route_type`) VALUES
	(1, 'admin-api', 'encoder-api', 'encoder-api', 'transcode-media', 'doTranscodeMedia', 'transcode-media', 'queue'),
	(2, 'admin-api', 'encoder-api', 'encoder-api', 'transcode-media-and-deliver', 'doTranscodeMediaAndDeliver', 'transcode-media-and-deliver', 'queue'),
	(3, 'admin-api', 'media-api', 'admin-api', 'transfer-file-to-media-server', 'doTransferFileToMediaServer', 'transfer-file-to-media-server', 'queue'),
	(4, 'admin-api', 'media-api', 'admin-api', 'transfer-folder-to-media-server', 'doTransferFolderToMediaServer', 'transfer-folder-to-media-server', 'queue'),
	(5, 'admin-api', 'media-api', 'media-api', 'delete-file-on-media-server', 'doDeleteFileOnMediaServer', 'delete-file-on-media-server', 'direct'),
	(6, 'admin-api', 'media-api', 'media-api', 'delete-folder-on-media-server', 'doDeleteFolderOnMediaServer', 'delete-folder-on-media-server', 'direct'),
	(7, 'admin-api', 'media-api', 'media-api', 'update-file-metadata', 'doUpdateFileMetaData', 'update-file-metadata', 'queue'),
	(8, 'admin-api', 'media-api', 'media-api', 'update-folder-metadata', 'doUpdateFolderMetaData', 'update-folder-metadata', 'queue'),
	(9, 'admin-api', 'media-api', 'media-api', 'update-list-of-files-metadata', 'doUpdateListOfFilesMetaData', 'update-list-of-files-metadata', 'queue'),
	(10, 'admin-api', 'media-api', 'media-api', 'set-permissions-folder', 'doSetPermisssionsFolder', 'set-permissions-folder', 'queue'),
	(11, 'admin-api', 'media-api', 'media-api', 'check-file-exists', 'doCheckFileExists', 'check-file-exists', 'direct'),
	(12, 'admin-api', 'media-api', 'media-api', 'check-list-of-files-exists', 'doCheckListOfFilesExists', 'check-list-of-files-exists', 'direct'),
	(13, 'admin-api', 'media-api', 'media-api', 'check-folder-exists', 'doCheckFolderExists', 'check-folder-exists', 'direct'),
	(14, 'admin-api', 'media-api', 'media-api', 'status-media', 'doStatusMedia', 'status-media', 'direct'),
	(15, 'admin-api', 'encoder-api', 'encoder-api', 'status-encoder', 'doStatusEncoder', 'status-encoder', 'direct');
/*!40000 ALTER TABLE `command_routes` ENABLE KEYS */;


# Dumping structure for table admin-api.queue_commands
DROP TABLE IF EXISTS `queue_commands`;
CREATE TABLE IF NOT EXISTS `queue_commands` (
  `cq_index` int(10) NOT NULL AUTO_INCREMENT,
  `cq_message_id` int(10) DEFAULT '0',
  `cq_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `cq_data` text COLLATE utf8_unicode_ci,
  `cq_result` text COLLATE utf8_unicode_ci,
  `cq_time` datetime DEFAULT NULL,
  `cq_update` datetime DEFAULT NULL,
  `cq_status` enum('Y','N','F','R') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`cq_index`),
  KEY `ma_command` (`cq_message_id`,`cq_command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.queue_commands: ~0 rows (approximately)
/*!40000 ALTER TABLE `queue_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_commands` ENABLE KEYS */;


# Dumping structure for table admin-api.queue_messages
DROP TABLE IF EXISTS `queue_messages`;
CREATE TABLE IF NOT EXISTS `queue_messages` (
  `mq_index` int(10) NOT NULL DEFAULT '0',
  `mq_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
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
