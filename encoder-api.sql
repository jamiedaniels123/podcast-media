-- phpMyAdmin SQL Dump
-- version 3.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 08, 2011 at 06:06 PM
-- Server version: 5.0.91
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `encoder-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_destinations`
--

DROP TABLE IF EXISTS `api_destinations`;
CREATE TABLE IF NOT EXISTS `api_destinations` (
  `ad_index` int(10) NOT NULL default '0',
  `ad_name` varchar(50) collate utf8_unicode_ci default NULL,
  `ad_url` varchar(50) collate utf8_unicode_ci default NULL,
  `ad_ip` varchar(50) collate utf8_unicode_ci default NULL,
  `ad_update` datetime default NULL,
  PRIMARY KEY  (`ad_index`),
  KEY `ad_name` (`ad_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `api_destinations`
--

INSERT INTO `api_destinations` (`ad_index`, `ad_name`, `ad_url`, `ad_ip`, `ad_update`) VALUES
(1, 'admin-api', 'http://podcast-api-dev.open.ac.uk', '137.108.130.170', '2011-06-10 10:02:09'),
(2, 'admin-app', 'http://podcast-admin-dev.open.ac.uk/callback/', '137.108.130.70', '2011-06-10 10:01:59'),
(3, 'media-api', 'http://media-podcast-api-dev.open.ac.uk', '137.108.130.115', '2011-06-10 10:05:04'),
(4, 'encoder-api', 'http://kmi-encoder04/', '137.108.24.36', '2011-06-10 10:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

DROP TABLE IF EXISTS `api_log`;
CREATE TABLE IF NOT EXISTS `api_log` (
  `al_index` int(10) NOT NULL auto_increment,
  `al_message` text collate utf8_unicode_ci,
  `al_reply` text collate utf8_unicode_ci,
  `al_timestamp` datetime default NULL,
  PRIMARY KEY  (`al_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=9 ;

--
-- Dumping data for table `api_log`
--

INSERT INTO `api_log` (`al_index`, `al_message`, `al_reply`, `al_timestamp`) VALUES
(1, 'mess={"command":"encoder-pull-file","number":1,"data":{"workflow":"video","source_path":"1488_ianpodcast12/","filename":"12597_drop.avi"},"cqIndex":"331","mqIndex":"36","step":"2","timestamp":1310143528}', 'a:5:{s:7:"command";s:17:"encoder-pull-file";s:6:"number";i:1;s:4:"data";a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1488_ianpodcast12/";s:8:"filename";s:14:"12597_drop.avi";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}', '2011-07-08 17:45:28'),
(2, '', 'a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1310143545;}', '2011-07-08 17:45:45'),
(3, 'mess={"command":"encoder-pull-file","number":1,"data":{"workflow":"video","source_path":"1488_ianpodcast12/","filename":"12598_drop.avi"},"cqIndex":"332","mqIndex":"37","step":"2","timestamp":1310143605}', 'a:5:{s:7:"command";s:17:"encoder-pull-file";s:6:"number";i:1;s:4:"data";a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1488_ianpodcast12/";s:8:"filename";s:14:"12598_drop.avi";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}', '2011-07-08 17:46:45'),
(4, '', 'a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1310143615;}', '2011-07-08 17:46:55'),
(5, 'mess={"command":"encoder-pull-file","number":1,"data":{"workflow":"video","source_path":"1488_ianpodcast12/","filename":"12599_BSG_4.2.avi"},"cqIndex":"333","mqIndex":"38","step":"2","timestamp":1310143691}', 'a:5:{s:7:"command";s:17:"encoder-pull-file";s:6:"number";i:1;s:4:"data";a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1488_ianpodcast12/";s:8:"filename";s:17:"12599_BSG_4.2.avi";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}', '2011-07-08 17:48:11'),
(6, '', 'a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1310143929;}', '2011-07-08 17:52:09'),
(7, '', 'a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1310144485;}', '2011-07-08 18:01:25'),
(8, '', 'a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1310144586;}', '2011-07-08 18:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `api_process`
--

DROP TABLE IF EXISTS `api_process`;
CREATE TABLE IF NOT EXISTS `api_process` (
  `ap_index` int(10) NOT NULL auto_increment,
  `ap_process_id` int(10) default '0',
  `ap_script` varchar(50) collate utf8_unicode_ci default '0',
  `ap_timestamp` datetime NOT NULL,
  `ap_last_checked` datetime NOT NULL,
  `ap_status` enum('Y','N') collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`ap_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `command_routes`
--

DROP TABLE IF EXISTS `command_routes`;
CREATE TABLE IF NOT EXISTS `command_routes` (
  `cr_index` int(10) NOT NULL auto_increment,
  `cr_source` varchar(50) collate utf8_unicode_ci default NULL,
  `cr_destination` enum('admin-app','admin-api','encoder-api','media-api') collate utf8_unicode_ci default NULL,
  `cr_execute` enum('admin-app','admin-api','encoder-api','media-api') collate utf8_unicode_ci default NULL,
  `cr_action` varchar(50) collate utf8_unicode_ci default NULL,
  `cr_function` varchar(50) character set ucs2 collate ucs2_unicode_ci default NULL,
  `cr_callback` varchar(50) collate utf8_unicode_ci default NULL,
  `cr_route_type` enum('queue','direct') collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`cr_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=10 ;

--
-- Dumping data for table `command_routes`
--

INSERT INTO `command_routes` (`cr_index`, `cr_source`, `cr_destination`, `cr_execute`, `cr_action`, `cr_function`, `cr_callback`, `cr_route_type`) VALUES
(1, 'admin-api', 'encoder-api', 'encoder-api', 'encoder-pull-file', 'doEncoderPullFile', 'encoder-pull-file', 'queue'),
(2, 'admin-api', 'encoder-api', 'encoder-api', 'encoder-check-output', 'doEncoderCheckOutput', 'encoder-check-output', 'queue'),
(3, 'admin-api', 'encoder-api', 'encoder-api', 'encoder-push-to-media', 'doEncoderPushToMedia', 'encoder-push-to-media', 'queue'),
(4, 'admin-api', 'encoder-api', 'encoder-api', '', '', '', 'queue'),
(5, 'admin-api', 'encoder-api', 'encoder-api', '', '', '', 'queue'),
(6, 'admin-api', 'encoder-api', 'encoder-api', '', '', '', 'direct'),
(7, 'admin-api', 'encoder-api', 'encoder-api', '', '', '', 'direct'),
(8, 'admin-api', 'encoder-api', 'encoder-api', 'status-encoder', 'doStatusEncoder', 'status-encoder', 'direct'),
(9, 'admin-api', 'encoder-api', 'encoder-api', 'poll-encoder', 'doPollEncoder', 'poll-encoder', 'direct');

-- --------------------------------------------------------

--
-- Table structure for table `queue_commands`
--

DROP TABLE IF EXISTS `queue_commands`;
CREATE TABLE IF NOT EXISTS `queue_commands` (
  `cq_index` int(10) NOT NULL auto_increment,
  `cq_cq_index` int(10) NOT NULL default '0',
  `cq_mq_index` int(10) NOT NULL,
  `cq_step` int(10) NOT NULL,
  `cq_command` varchar(255) collate utf8_unicode_ci default '0',
  `cq_data` text collate utf8_unicode_ci,
  `cq_result` text collate utf8_unicode_ci,
  `cq_time` datetime default NULL,
  `cq_update` datetime default NULL,
  `cq_status` enum('Y','N','F','R') collate utf8_unicode_ci default 'N',
  PRIMARY KEY  (`cq_index`),
  KEY `ma_command` (`cq_cq_index`,`cq_command`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=10 ;

--
-- Dumping data for table `queue_commands`
--

INSERT INTO `queue_commands` (`cq_index`, `cq_cq_index`, `cq_mq_index`, `cq_step`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_status`) VALUES
(1, 16, 2, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1465_ianpodcast10/";s:8:"filename";s:14:"12590_drop.avi";}', NULL, '2011-07-07 17:43:58', '0000-00-00 00:00:00', 'N'),
(2, 214, 19, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:22:"1487_myrubbishpodcast/";s:8:"filename";s:20:"12591_1300469084.wmv";}', NULL, '2011-07-08 16:14:48', '0000-00-00 00:00:00', 'N'),
(3, 248, 24, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"audio";s:11:"source_path";s:22:"1487_myrubbishpodcast/";s:8:"filename";s:50:"12592_344__Anton__dog_Bark_somedistorted_water.wav";}', NULL, '2011-07-08 16:18:06', '0000-00-00 00:00:00', 'N'),
(4, 268, 29, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:22:"1487_myrubbishpodcast/";s:8:"filename";s:20:"12594_1300469084.wmv";}', NULL, '2011-07-08 16:48:14', '0000-00-00 00:00:00', 'N'),
(5, 269, 30, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:22:"1487_myrubbishpodcast/";s:8:"filename";s:16:"12595_test_2.mov";}', NULL, '2011-07-08 16:56:48', '0000-00-00 00:00:00', 'N'),
(6, 270, 31, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:22:"1487_myrubbishpodcast/";s:8:"filename";s:46:"12596_dd205-mexico-hazardous-crossing-360p.m4v";}', NULL, '2011-07-08 16:58:22', '0000-00-00 00:00:00', 'N'),
(7, 331, 36, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1488_ianpodcast12/";s:8:"filename";s:14:"12597_drop.avi";}', NULL, '2011-07-08 17:45:28', '0000-00-00 00:00:00', 'N'),
(8, 332, 37, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1488_ianpodcast12/";s:8:"filename";s:14:"12598_drop.avi";}', NULL, '2011-07-08 17:46:45', '0000-00-00 00:00:00', 'N'),
(9, 333, 38, 2, 'encoder-pull-file', 'a:3:{s:8:"workflow";s:5:"video";s:11:"source_path";s:18:"1488_ianpodcast12/";s:8:"filename";s:17:"12599_BSG_4.2.avi";}', NULL, '2011-07-08 17:48:11', '0000-00-00 00:00:00', 'N');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
