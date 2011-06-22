# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-22 16:43:09
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


# Dumping structure for table admin-api.api_end_points
DROP TABLE IF EXISTS `api_end_points`;
CREATE TABLE IF NOT EXISTS `api_end_points` (
  `ep_index` int(10) NOT NULL DEFAULT '0',
  `ep_filetype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ep_path` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ep_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ep_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.api_end_points: ~2 rows (approximately)
/*!40000 ALTER TABLE `api_end_points` DISABLE KEYS */;
INSERT INTO `api_end_points` (`ep_index`, `ep_filetype`, `ep_path`, `ep_update`) VALUES
	(1, 'video-wide', '/video-wide', '2011-06-10 10:02:09'),
	(2, 'audio', '/audio', '2011-06-10 10:01:59');
/*!40000 ALTER TABLE `api_end_points` ENABLE KEYS */;


# Dumping structure for table admin-api.api_log
DROP TABLE IF EXISTS `api_log`;
CREATE TABLE IF NOT EXISTS `api_log` (
  `al_index` int(10) NOT NULL AUTO_INCREMENT,
  `al_message` text COLLATE utf8_unicode_ci,
  `al_reply` text COLLATE utf8_unicode_ci,
  `al_result_data` text COLLATE utf8_unicode_ci,
  `al_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`al_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table admin-api.api_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `api_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_log` ENABLE KEYS */;


# Dumping structure for table admin-api.api_workflows
DROP TABLE IF EXISTS `api_workflows`;
CREATE TABLE IF NOT EXISTS `api_workflows` (
  `wf_index` int(10) NOT NULL AUTO_INCREMENT,
  `wf_cr_index` int(10) DEFAULT NULL,
  `wf_ad_index` int(10) DEFAULT NULL,
  `wf_step` int(10) DEFAULT NULL,
  `wf_steps` int(10) DEFAULT NULL,
  `wf_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wf_function` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wf_index`),
  KEY `wf_command_id` (`wf_cr_index`),
  KEY `wf_ad_index` (`wf_ad_index`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# Dumping data for table admin-api.api_workflows: ~18 rows (approximately)
/*!40000 ALTER TABLE `api_workflows` DISABLE KEYS */;
INSERT INTO `api_workflows` (`wf_index`, `wf_cr_index`, `wf_ad_index`, `wf_step`, `wf_steps`, `wf_command`, `wf_function`) VALUES
	(1, 1, 2, 1, 6, 'push-next-command', 'doPushNextCommand'),
	(2, 1, 4, 2, 6, 'encoder-pull-file', 'doEncoderPullFile'),
	(3, 1, 2, 3, 6, 'push-next-command', 'doPushNextCommand'),
	(4, 1, 4, 4, 6, 'encoder-check-output', 'doEncoderCheckOutput'),
	(5, 1, 4, 5, 6, 'encoder-push-to-media', 'doEncoderPushToMedia'),
	(6, 1, 3, 6, 6, 'media-move-file', 'doMediaMoveFile'),
	(7, 3, 2, 1, 3, 'media-push-file', 'doMediaPushFile'),
	(8, 3, 2, 2, 3, 'push-next-command', 'doPushNextCommand'),
	(9, 3, 3, 3, 3, 'media-move-file', 'doMediaMoveFile'),
	(10, 7, 2, 1, 2, 'push-next-command', 'doPushCommand'),
	(11, 7, 3, 2, 2, 'update-metadata', 'doUpdateMetadata'),
	(12, 10, 2, 1, 2, 'push-next-command', 'doPushNextCommand'),
	(13, 10, 3, 2, 2, 'update-permisssions', 'doUpdatePermissions'),
	(14, 5, 2, 1, 2, 'push-next-command', 'doPushNextCommand'),
	(15, 5, 3, 2, 2, 'delete-file', 'doDeleteFile'),
	(16, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, NULL, NULL, NULL, NULL, NULL, NULL);
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
	(2, 'admin-api', 'encoder-api', 'encoder-api', 'transcode-media-deliver', 'doTranscodeMediaAndDeliver', 'transcode-media-and-deliver', 'queue'),
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
  `cq_mq_index` int(10) DEFAULT '0',
  `cq_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `cq_data` text COLLATE utf8_unicode_ci,
  `cq_result` text COLLATE utf8_unicode_ci,
  `cq_time` datetime DEFAULT NULL,
  `cq_update` datetime DEFAULT NULL,
  `cq_wf_step` int(11) NOT NULL DEFAULT '1',
  `cq_status` enum('Y','N','F','R') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`cq_index`),
  KEY `ma_command` (`cq_mq_index`,`cq_command`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.queue_commands: ~1 rows (approximately)
/*!40000 ALTER TABLE `queue_commands` DISABLE KEYS */;
INSERT INTO `queue_commands` (`cq_index`, `cq_mq_index`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_wf_step`, `cq_status`) VALUES
	(1, 1, 'transfer-file-to-media-server', 'a:6:{s:13:"collection_id";s:0:"";s:6:"infile";s:31:"dd205-globalised-world-rss2.xml";s:7:"outfile";s:31:"dd205-globalised-world-rss2.xml";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', NULL, '2011-06-21 12:21:30', '0000-00-00 00:00:00', 2, 'N');
/*!40000 ALTER TABLE `queue_commands` ENABLE KEYS */;


# Dumping structure for table admin-api.queue_messages
DROP TABLE IF EXISTS `queue_messages`;
CREATE TABLE IF NOT EXISTS `queue_messages` (
  `mq_index` int(10) NOT NULL AUTO_INCREMENT,
  `mq_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mq_time_start` datetime DEFAULT NULL,
  `mq_time_complete` datetime DEFAULT NULL,
  `mq_status` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mq_index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

# Dumping data for table admin-api.queue_messages: ~1 rows (approximately)
/*!40000 ALTER TABLE `queue_messages` DISABLE KEYS */;
INSERT INTO `queue_messages` (`mq_index`, `mq_command`, `mq_time_start`, `mq_time_complete`, `mq_status`) VALUES
	(1, 'transfer-file-to-media-server', '2011-06-21 12:21:30', NULL, NULL);
/*!40000 ALTER TABLE `queue_messages` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
