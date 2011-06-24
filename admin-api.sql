-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2011 at 06:03 PM
-- Server version: 5.1.52
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `admin-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_destinations`
--

CREATE TABLE IF NOT EXISTS `api_destinations` (
  `ad_index` int(10) NOT NULL DEFAULT '0',
  `ad_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `api_destinations`
--

INSERT INTO `api_destinations` (`ad_index`, `ad_name`, `ad_url`, `ad_ip`, `ad_update`) VALUES
(1, 'admin-api', 'http://podcast-api-dev.open.ac.uk', '137.108.130.170', '2011-06-10 10:02:09'),
(2, 'admin-app', 'http://podcast-callback-dev.open.ac.uk', '137.108.130.70', '2011-06-10 10:01:59'),
(3, 'media-api', 'http://media-podcast-api-dev.open.ac.uk', '137.108.130.115', '2011-06-10 10:05:04'),
(4, 'encoder-api', 'http://kmi-encoder04/', '137.108.24.36', '2011-06-10 10:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `api_end_points`
--

CREATE TABLE IF NOT EXISTS `api_end_points` (
  `ep_index` int(10) NOT NULL DEFAULT '0',
  `ep_filetype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ep_path` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ep_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ep_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `api_end_points`
--

INSERT INTO `api_end_points` (`ep_index`, `ep_filetype`, `ep_path`, `ep_update`) VALUES
(1, 'video-wide', '/video-wide', '2011-06-10 10:02:09'),
(2, 'audio', '/audio', '2011-06-10 10:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

CREATE TABLE IF NOT EXISTS `api_log` (
  `al_index` int(10) NOT NULL AUTO_INCREMENT,
  `al_message` text COLLATE utf8_unicode_ci,
  `al_reply` text COLLATE utf8_unicode_ci,
  `al_result_data` text COLLATE utf8_unicode_ci,
  `al_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`al_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=374 ;

--
-- Dumping data for table `api_log`
--

INSERT INTO `api_log` (`al_index`, `al_message`, `al_reply`, `al_result_data`, `al_timestamp`) VALUES
(335, 'mess={"command":"transfer-file-to-media-server","number":3,"data":[{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"P_1471.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"P_1471_std.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"P_1471_thm.jpg"}],"timestamp":1308923447}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:3;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308923447;s:7:"mqIndex";i:72;}}', NULL, '2011-06-24 14:50:47'),
(336, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1471_itunesstuff/3gp/","destination_path":"1471_itunesstuff/3gp/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/audio/","destination_path":"1471_itunesstuff/audio/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop/","destination_path":"1471_itunesstuff/desktop/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/hd/","destination_path":"1471_itunesstuff/hd/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/iphone/","destination_path":"1471_itunesstuff/iphone/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod/","destination_path":"1471_itunesstuff/ipod/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/large/","destination_path":"1471_itunesstuff/large/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/transcript/","destination_path":"1471_itunesstuff/transcript/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/youtube/","destination_path":"1471_itunesstuff/youtube/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/extra/","destination_path":"1471_itunesstuff/extra/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/high/","destination_path":"1471_itunesstuff/high/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod-all/","destination_path":"1471_itunesstuff/ipod-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop-all/","destination_path":"1471_itunesstuff/desktop-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/epub/","destination_path":"1471_itunesstuff/epub/","filename":"rss2.xml"}],"timestamp":1308923448}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308923448;s:7:"mqIndex";i:73;}}', NULL, '2011-06-24 14:50:48'),
(337, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308923714;}}', NULL, '2011-06-24 14:55:14'),
(338, 'mess={"command":"transfer-file-to-media-server","number":3,"data":[{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"H_1471.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"H_1471_std.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"H_1471_thm.jpg"}],"timestamp":1308923739}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:3;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308923739;s:7:"mqIndex";i:74;}}', NULL, '2011-06-24 14:55:39'),
(339, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1471_itunesstuff/3gp/","destination_path":"1471_itunesstuff/3gp/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/audio/","destination_path":"1471_itunesstuff/audio/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop/","destination_path":"1471_itunesstuff/desktop/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/hd/","destination_path":"1471_itunesstuff/hd/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/iphone/","destination_path":"1471_itunesstuff/iphone/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod/","destination_path":"1471_itunesstuff/ipod/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/large/","destination_path":"1471_itunesstuff/large/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/transcript/","destination_path":"1471_itunesstuff/transcript/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/youtube/","destination_path":"1471_itunesstuff/youtube/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/extra/","destination_path":"1471_itunesstuff/extra/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/high/","destination_path":"1471_itunesstuff/high/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod-all/","destination_path":"1471_itunesstuff/ipod-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop-all/","destination_path":"1471_itunesstuff/desktop-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/epub/","destination_path":"1471_itunesstuff/epub/","filename":"rss2.xml"}],"timestamp":1308923740}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308923740;s:7:"mqIndex";i:75;}}', NULL, '2011-06-24 14:55:40'),
(340, 'mess={"command":"transfer-file-to-media-server","number":3,"data":[{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"T_1471.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"T_1471_std.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"T_1471_thm.jpg"}],"timestamp":1308923950}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:3;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308923950;s:7:"mqIndex";i:76;}}', NULL, '2011-06-24 14:59:10'),
(341, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1471_itunesstuff/3gp/","destination_path":"1471_itunesstuff/3gp/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/audio/","destination_path":"1471_itunesstuff/audio/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop/","destination_path":"1471_itunesstuff/desktop/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/hd/","destination_path":"1471_itunesstuff/hd/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/iphone/","destination_path":"1471_itunesstuff/iphone/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod/","destination_path":"1471_itunesstuff/ipod/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/large/","destination_path":"1471_itunesstuff/large/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/transcript/","destination_path":"1471_itunesstuff/transcript/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/youtube/","destination_path":"1471_itunesstuff/youtube/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/extra/","destination_path":"1471_itunesstuff/extra/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/high/","destination_path":"1471_itunesstuff/high/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod-all/","destination_path":"1471_itunesstuff/ipod-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop-all/","destination_path":"1471_itunesstuff/desktop-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/epub/","destination_path":"1471_itunesstuff/epub/","filename":"rss2.xml"}],"timestamp":1308923951}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308923951;s:7:"mqIndex";i:77;}}', NULL, '2011-06-24 14:59:11'),
(342, 'mess={"command":"transfer-file-to-media-server","number":3,"data":[{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"1471_itunesstuff.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"1471_itunesstuff_std.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"1471_itunesstuff_thm.jpg"}],"timestamp":1308924166}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:3;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308924166;s:7:"mqIndex";i:78;}}', NULL, '2011-06-24 15:02:46'),
(343, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1471_itunesstuff/3gp/","destination_path":"1471_itunesstuff/3gp/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/audio/","destination_path":"1471_itunesstuff/audio/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop/","destination_path":"1471_itunesstuff/desktop/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/hd/","destination_path":"1471_itunesstuff/hd/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/iphone/","destination_path":"1471_itunesstuff/iphone/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod/","destination_path":"1471_itunesstuff/ipod/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/large/","destination_path":"1471_itunesstuff/large/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/transcript/","destination_path":"1471_itunesstuff/transcript/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/youtube/","destination_path":"1471_itunesstuff/youtube/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/extra/","destination_path":"1471_itunesstuff/extra/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/high/","destination_path":"1471_itunesstuff/high/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod-all/","destination_path":"1471_itunesstuff/ipod-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop-all/","destination_path":"1471_itunesstuff/desktop-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/epub/","destination_path":"1471_itunesstuff/epub/","filename":"rss2.xml"}],"timestamp":1308924168}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308924168;s:7:"mqIndex";i:79;}}', NULL, '2011-06-24 15:02:48'),
(344, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308924314;}}', NULL, '2011-06-24 15:05:14'),
(345, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308924914;}}', NULL, '2011-06-24 15:15:14'),
(346, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1472_podcast9/3gp/","destination_path":"1472_podcast9/3gp/","filename":"rss2.xml"},{"source_path":"1472_podcast9/audio/","destination_path":"1472_podcast9/audio/","filename":"rss2.xml"},{"source_path":"1472_podcast9/desktop/","destination_path":"1472_podcast9/desktop/","filename":"rss2.xml"},{"source_path":"1472_podcast9/hd/","destination_path":"1472_podcast9/hd/","filename":"rss2.xml"},{"source_path":"1472_podcast9/iphone/","destination_path":"1472_podcast9/iphone/","filename":"rss2.xml"},{"source_path":"1472_podcast9/ipod/","destination_path":"1472_podcast9/ipod/","filename":"rss2.xml"},{"source_path":"1472_podcast9/large/","destination_path":"1472_podcast9/large/","filename":"rss2.xml"},{"source_path":"1472_podcast9/transcript/","destination_path":"1472_podcast9/transcript/","filename":"rss2.xml"},{"source_path":"1472_podcast9/youtube/","destination_path":"1472_podcast9/youtube/","filename":"rss2.xml"},{"source_path":"1472_podcast9/extra/","destination_path":"1472_podcast9/extra/","filename":"rss2.xml"},{"source_path":"1472_podcast9/","destination_path":"1472_podcast9/","filename":"rss2.xml"},{"source_path":"1472_podcast9/high/","destination_path":"1472_podcast9/high/","filename":"rss2.xml"},{"source_path":"1472_podcast9/ipod-all/","destination_path":"1472_podcast9/ipod-all/","filename":"rss2.xml"},{"source_path":"1472_podcast9/desktop-all/","destination_path":"1472_podcast9/desktop-all/","filename":"rss2.xml"},{"source_path":"1472_podcast9/epub/","destination_path":"1472_podcast9/epub/","filename":"rss2.xml"}],"timestamp":1308925150}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308925150;s:7:"mqIndex";i:80;}}', NULL, '2011-06-24 15:19:10'),
(347, 'mess={"command":"transfer-file-to-media-server","number":3,"data":[{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"1471_itunesstuff.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"1471_itunesstuff_std.jpg"},{"source_path":"1471_itunesstuff","destination_path":"1471_itunesstuff","filename":"1471_itunesstuff_thm.jpg"}],"timestamp":1308925204}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:3;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308925204;s:7:"mqIndex";i:81;}}', NULL, '2011-06-24 15:20:04'),
(348, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1471_itunesstuff/3gp/","destination_path":"1471_itunesstuff/3gp/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/audio/","destination_path":"1471_itunesstuff/audio/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop/","destination_path":"1471_itunesstuff/desktop/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/hd/","destination_path":"1471_itunesstuff/hd/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/iphone/","destination_path":"1471_itunesstuff/iphone/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod/","destination_path":"1471_itunesstuff/ipod/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/large/","destination_path":"1471_itunesstuff/large/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/transcript/","destination_path":"1471_itunesstuff/transcript/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/youtube/","destination_path":"1471_itunesstuff/youtube/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/extra/","destination_path":"1471_itunesstuff/extra/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/high/","destination_path":"1471_itunesstuff/high/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod-all/","destination_path":"1471_itunesstuff/ipod-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop-all/","destination_path":"1471_itunesstuff/desktop-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/epub/","destination_path":"1471_itunesstuff/epub/","filename":"rss2.xml"}],"timestamp":1308925205}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308925205;s:7:"mqIndex";i:82;}}', NULL, '2011-06-24 15:20:05'),
(349, 'mess={"command":"transfer-file-to-media-server","number":3,"data":[{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"1471_itunesstuff.jpg"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"1471_itunesstuff_std.jpg"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"1471_itunesstuff_thm.jpg"}],"timestamp":1308925294}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:3;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308925294;s:7:"mqIndex";i:83;}}', NULL, '2011-06-24 15:21:34'),
(350, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1471_itunesstuff/3gp/","destination_path":"1471_itunesstuff/3gp/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/audio/","destination_path":"1471_itunesstuff/audio/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop/","destination_path":"1471_itunesstuff/desktop/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/hd/","destination_path":"1471_itunesstuff/hd/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/iphone/","destination_path":"1471_itunesstuff/iphone/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod/","destination_path":"1471_itunesstuff/ipod/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/large/","destination_path":"1471_itunesstuff/large/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/transcript/","destination_path":"1471_itunesstuff/transcript/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/youtube/","destination_path":"1471_itunesstuff/youtube/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/extra/","destination_path":"1471_itunesstuff/extra/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/","destination_path":"1471_itunesstuff/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/high/","destination_path":"1471_itunesstuff/high/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/ipod-all/","destination_path":"1471_itunesstuff/ipod-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/desktop-all/","destination_path":"1471_itunesstuff/desktop-all/","filename":"rss2.xml"},{"source_path":"1471_itunesstuff/epub/","destination_path":"1471_itunesstuff/epub/","filename":"rss2.xml"}],"timestamp":1308925295}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308925295;s:7:"mqIndex";i:84;}}', NULL, '2011-06-24 15:21:35'),
(351, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308925514;}}', NULL, '2011-06-24 15:25:14'),
(352, 'mess={"command":"transfer-file-to-media-server","number":1,"data":["/.htaccess"],"timestamp":1308925839}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:1;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308925839;s:7:"mqIndex";i:85;}}', NULL, '2011-06-24 15:30:39'),
(353, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308926114;}}', NULL, '2011-06-24 15:35:14'),
(354, 'mess={"command":"delete-file-on-media-server","number":1,"data":[{"source_path":"1471_itunesstuff/","file_name":".htaccess"}],"timestamp":1308926555}', 'a:1:{i:0;a:6:{s:7:"command";s:27:"delete-file-on-media-server";s:6:"number";i:1;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308926555;s:7:"mqIndex";i:86;}}', NULL, '2011-06-24 15:42:35'),
(355, 'mess={"command":"transfer-file-to-media-server","number":3,"data":{"source_path":"/","target_path":"/","filename":".htaccess"},"timestamp":1308926566}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:0;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308926566;s:7:"mqIndex";i:87;}}', NULL, '2011-06-24 15:42:46'),
(356, 'mess={"command":"delete-file-on-media-server","number":1,"data":[{"source_path":"1471_itunesstuff/","file_name":".htaccess"}],"timestamp":1308926594}', 'a:1:{i:0;a:6:{s:7:"command";s:27:"delete-file-on-media-server";s:6:"number";i:1;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308926594;s:7:"mqIndex";i:88;}}', NULL, '2011-06-24 15:43:14'),
(357, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308926714;}}', NULL, '2011-06-24 15:45:14'),
(358, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308927314;}}', NULL, '2011-06-24 15:55:14'),
(359, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308927914;}}', NULL, '2011-06-24 16:05:14'),
(360, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308928514;}}', NULL, '2011-06-24 16:15:14'),
(361, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308929114;}}', NULL, '2011-06-24 16:25:14'),
(362, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308929714;}}', NULL, '2011-06-24 16:35:14'),
(363, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308930314;}}', NULL, '2011-06-24 16:45:14'),
(364, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308930914;}}', NULL, '2011-06-24 16:55:14'),
(365, 'mess={"command":"transcode-media","number":1,"data":{"data":{"source_path":"1471_itunesstuff","filename":"BSG_4.2.avi"}},"timestamp":1308931021}', 'a:1:{i:0;a:6:{s:7:"command";s:15:"transcode-media";s:6:"number";i:0;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308931021;s:7:"mqIndex";i:89;}}', NULL, '2011-06-24 16:57:01'),
(366, 'mess={"command":"transcode-media","number":1,"data":{"data":{"source_path":"1473_test1","filename":"1300469084.wmv"}},"timestamp":1308931343}', 'a:1:{i:0;a:6:{s:7:"command";s:15:"transcode-media";s:6:"number";i:0;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308931343;s:7:"mqIndex";i:90;}}', NULL, '2011-06-24 17:02:23'),
(367, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308931514;}}', NULL, '2011-06-24 17:05:14'),
(368, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308932114;}}', NULL, '2011-06-24 17:15:14'),
(369, 'mess={"command":"transfer-file-to-media-server","number":15,"data":[{"source_path":"1473_test1/3gp/","destination_path":"1473_test1/3gp/","filename":"rss2.xml"},{"source_path":"1473_test1/audio/","destination_path":"1473_test1/audio/","filename":"rss2.xml"},{"source_path":"1473_test1/desktop/","destination_path":"1473_test1/desktop/","filename":"rss2.xml"},{"source_path":"1473_test1/hd/","destination_path":"1473_test1/hd/","filename":"rss2.xml"},{"source_path":"1473_test1/iphone/","destination_path":"1473_test1/iphone/","filename":"rss2.xml"},{"source_path":"1473_test1/ipod/","destination_path":"1473_test1/ipod/","filename":"rss2.xml"},{"source_path":"1473_test1/large/","destination_path":"1473_test1/large/","filename":"rss2.xml"},{"source_path":"1473_test1/transcript/","destination_path":"1473_test1/transcript/","filename":"rss2.xml"},{"source_path":"1473_test1/youtube/","destination_path":"1473_test1/youtube/","filename":"rss2.xml"},{"source_path":"1473_test1/extra/","destination_path":"1473_test1/extra/","filename":"rss2.xml"},{"source_path":"1473_test1/","destination_path":"1473_test1/","filename":"rss2.xml"},{"source_path":"1473_test1/high/","destination_path":"1473_test1/high/","filename":"rss2.xml"},{"source_path":"1473_test1/ipod-all/","destination_path":"1473_test1/ipod-all/","filename":"rss2.xml"},{"source_path":"1473_test1/desktop-all/","destination_path":"1473_test1/desktop-all/","filename":"rss2.xml"},{"source_path":"1473_test1/epub/","destination_path":"1473_test1/epub/","filename":"rss2.xml"}],"timestamp":1308932610}', 'a:1:{i:0;a:6:{s:7:"command";s:29:"transfer-file-to-media-server";s:6:"number";i:15;s:4:"data";s:17:"Queued admin-api!";s:6:"status";s:3:"ACK";s:9:"timestamp";i:1308932610;s:7:"mqIndex";i:91;}}', NULL, '2011-06-24 17:23:30'),
(370, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308932714;}}', NULL, '2011-06-24 17:25:14'),
(371, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308933314;}}', NULL, '2011-06-24 17:35:14'),
(372, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308933914;}}', NULL, '2011-06-24 17:45:14'),
(373, '', 'a:1:{i:0;a:3:{s:6:"status";s:4:"NACK";s:4:"data";s:22:"No request values set!";s:9:"timestamp";i:1308934514;}}', NULL, '2011-06-24 17:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `api_workflows`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=112 ;

--
-- Dumping data for table `api_workflows`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `command_routes`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=16 ;

--
-- Dumping data for table `command_routes`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `queue_commands`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=896 ;

--
-- Dumping data for table `queue_commands`
--

INSERT INTO `queue_commands` (`cq_index`, `cq_mq_index`, `cq_command`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_wf_step`, `cq_status`) VALUES
(827, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:18:"1472_podcast9/3gp/";s:16:"destination_path";s:18:"1472_podcast9/3gp/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"827";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:18:"1472_podcast9/3gp/";s:16:"destination_path";s:18:"1472_podcast9/3gp/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:34', 3, 'N'),
(828, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:20:"1472_podcast9/audio/";s:16:"destination_path";s:20:"1472_podcast9/audio/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"828";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:20:"1472_podcast9/audio/";s:16:"destination_path";s:20:"1472_podcast9/audio/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:34', 3, 'N'),
(829, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1472_podcast9/desktop/";s:16:"destination_path";s:22:"1472_podcast9/desktop/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"829";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:22:"1472_podcast9/desktop/";s:16:"destination_path";s:22:"1472_podcast9/desktop/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:34', 3, 'N'),
(830, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1472_podcast9/hd/";s:16:"destination_path";s:17:"1472_podcast9/hd/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"830";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:17:"1472_podcast9/hd/";s:16:"destination_path";s:17:"1472_podcast9/hd/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:34', 3, 'N'),
(831, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:21:"1472_podcast9/iphone/";s:16:"destination_path";s:21:"1472_podcast9/iphone/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"831";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:21:"1472_podcast9/iphone/";s:16:"destination_path";s:21:"1472_podcast9/iphone/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(832, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:19:"1472_podcast9/ipod/";s:16:"destination_path";s:19:"1472_podcast9/ipod/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"832";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:19:"1472_podcast9/ipod/";s:16:"destination_path";s:19:"1472_podcast9/ipod/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(833, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:20:"1472_podcast9/large/";s:16:"destination_path";s:20:"1472_podcast9/large/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"833";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:20:"1472_podcast9/large/";s:16:"destination_path";s:20:"1472_podcast9/large/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(834, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:25:"1472_podcast9/transcript/";s:16:"destination_path";s:25:"1472_podcast9/transcript/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"834";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:25:"1472_podcast9/transcript/";s:16:"destination_path";s:25:"1472_podcast9/transcript/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(835, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1472_podcast9/youtube/";s:16:"destination_path";s:22:"1472_podcast9/youtube/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"835";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:22:"1472_podcast9/youtube/";s:16:"destination_path";s:22:"1472_podcast9/youtube/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(836, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:20:"1472_podcast9/extra/";s:16:"destination_path";s:20:"1472_podcast9/extra/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"836";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:20:"1472_podcast9/extra/";s:16:"destination_path";s:20:"1472_podcast9/extra/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(837, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:14:"1472_podcast9/";s:16:"destination_path";s:14:"1472_podcast9/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"837";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:14:"1472_podcast9/";s:16:"destination_path";s:14:"1472_podcast9/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(838, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:19:"1472_podcast9/high/";s:16:"destination_path";s:19:"1472_podcast9/high/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"838";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:19:"1472_podcast9/high/";s:16:"destination_path";s:19:"1472_podcast9/high/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(839, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1472_podcast9/ipod-all/";s:16:"destination_path";s:23:"1472_podcast9/ipod-all/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"839";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:23:"1472_podcast9/ipod-all/";s:16:"destination_path";s:23:"1472_podcast9/ipod-all/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(840, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:26:"1472_podcast9/desktop-all/";s:16:"destination_path";s:26:"1472_podcast9/desktop-all/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"840";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:26:"1472_podcast9/desktop-all/";s:16:"destination_path";s:26:"1472_podcast9/desktop-all/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(841, 80, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:19:"1472_podcast9/epub/";s:16:"destination_path";s:19:"1472_podcast9/epub/";s:8:"filename";s:8:"rss2.xml";}', 'a:4:{s:7:"cqIndex";s:3:"841";s:6:"number";i:1;s:6:"result";s:1:"Y";s:5:"debug";a:5:{s:7:"command";s:15:"media-move-file";s:6:"number";i:1;s:4:"data";a:3:{s:11:"source_path";s:19:"1472_podcast9/epub/";s:16:"destination_path";s:19:"1472_podcast9/epub/";s:8:"filename";s:8:"rss2.xml";}s:6:"status";s:1:"Y";s:5:"error";s:0:"";}}', '2011-06-24 15:19:10', '2011-06-24 17:56:35', 3, 'N'),
(842, 81, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:16:"1471_itunesstuff";s:16:"destination_path";s:16:"1471_itunesstuff";s:8:"filename";s:20:"1471_itunesstuff.jpg";}', NULL, '2011-06-24 15:20:04', '0000-00-00 00:00:00', 1, 'Y'),
(843, 81, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:16:"1471_itunesstuff";s:16:"destination_path";s:16:"1471_itunesstuff";s:8:"filename";s:24:"1471_itunesstuff_std.jpg";}', NULL, '2011-06-24 15:20:04', '0000-00-00 00:00:00', 1, 'Y'),
(844, 81, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:16:"1471_itunesstuff";s:16:"destination_path";s:16:"1471_itunesstuff";s:8:"filename";s:24:"1471_itunesstuff_thm.jpg";}', NULL, '2011-06-24 15:20:04', '0000-00-00 00:00:00', 1, 'Y'),
(845, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:21:"1471_itunesstuff/3gp/";s:16:"destination_path";s:21:"1471_itunesstuff/3gp/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(846, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1471_itunesstuff/audio/";s:16:"destination_path";s:23:"1471_itunesstuff/audio/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(847, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:25:"1471_itunesstuff/desktop/";s:16:"destination_path";s:25:"1471_itunesstuff/desktop/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(848, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:20:"1471_itunesstuff/hd/";s:16:"destination_path";s:20:"1471_itunesstuff/hd/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(849, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:24:"1471_itunesstuff/iphone/";s:16:"destination_path";s:24:"1471_itunesstuff/iphone/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(850, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1471_itunesstuff/ipod/";s:16:"destination_path";s:22:"1471_itunesstuff/ipod/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(851, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1471_itunesstuff/large/";s:16:"destination_path";s:23:"1471_itunesstuff/large/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(852, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:28:"1471_itunesstuff/transcript/";s:16:"destination_path";s:28:"1471_itunesstuff/transcript/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(853, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:25:"1471_itunesstuff/youtube/";s:16:"destination_path";s:25:"1471_itunesstuff/youtube/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(854, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1471_itunesstuff/extra/";s:16:"destination_path";s:23:"1471_itunesstuff/extra/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(855, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1471_itunesstuff/";s:16:"destination_path";s:17:"1471_itunesstuff/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(856, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1471_itunesstuff/high/";s:16:"destination_path";s:22:"1471_itunesstuff/high/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(857, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:26:"1471_itunesstuff/ipod-all/";s:16:"destination_path";s:26:"1471_itunesstuff/ipod-all/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(858, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:29:"1471_itunesstuff/desktop-all/";s:16:"destination_path";s:29:"1471_itunesstuff/desktop-all/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(859, 82, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1471_itunesstuff/epub/";s:16:"destination_path";s:22:"1471_itunesstuff/epub/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:20:05', '0000-00-00 00:00:00', 1, 'Y'),
(860, 83, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1471_itunesstuff/";s:16:"destination_path";s:17:"1471_itunesstuff/";s:8:"filename";s:20:"1471_itunesstuff.jpg";}', NULL, '2011-06-24 15:21:34', '0000-00-00 00:00:00', 1, 'Y'),
(861, 83, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1471_itunesstuff/";s:16:"destination_path";s:17:"1471_itunesstuff/";s:8:"filename";s:24:"1471_itunesstuff_std.jpg";}', NULL, '2011-06-24 15:21:34', '0000-00-00 00:00:00', 1, 'Y'),
(862, 83, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1471_itunesstuff/";s:16:"destination_path";s:17:"1471_itunesstuff/";s:8:"filename";s:24:"1471_itunesstuff_thm.jpg";}', NULL, '2011-06-24 15:21:34', '0000-00-00 00:00:00', 1, 'Y'),
(863, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:21:"1471_itunesstuff/3gp/";s:16:"destination_path";s:21:"1471_itunesstuff/3gp/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(864, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1471_itunesstuff/audio/";s:16:"destination_path";s:23:"1471_itunesstuff/audio/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(865, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:25:"1471_itunesstuff/desktop/";s:16:"destination_path";s:25:"1471_itunesstuff/desktop/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(866, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:20:"1471_itunesstuff/hd/";s:16:"destination_path";s:20:"1471_itunesstuff/hd/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(867, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:24:"1471_itunesstuff/iphone/";s:16:"destination_path";s:24:"1471_itunesstuff/iphone/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(868, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1471_itunesstuff/ipod/";s:16:"destination_path";s:22:"1471_itunesstuff/ipod/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(869, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1471_itunesstuff/large/";s:16:"destination_path";s:23:"1471_itunesstuff/large/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(870, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:28:"1471_itunesstuff/transcript/";s:16:"destination_path";s:28:"1471_itunesstuff/transcript/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(871, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:25:"1471_itunesstuff/youtube/";s:16:"destination_path";s:25:"1471_itunesstuff/youtube/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(872, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1471_itunesstuff/extra/";s:16:"destination_path";s:23:"1471_itunesstuff/extra/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(873, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1471_itunesstuff/";s:16:"destination_path";s:17:"1471_itunesstuff/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(874, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1471_itunesstuff/high/";s:16:"destination_path";s:22:"1471_itunesstuff/high/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(875, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:26:"1471_itunesstuff/ipod-all/";s:16:"destination_path";s:26:"1471_itunesstuff/ipod-all/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(876, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:29:"1471_itunesstuff/desktop-all/";s:16:"destination_path";s:29:"1471_itunesstuff/desktop-all/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(877, 84, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1471_itunesstuff/epub/";s:16:"destination_path";s:22:"1471_itunesstuff/epub/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 15:21:35', '0000-00-00 00:00:00', 1, 'Y'),
(878, 85, 'transfer-file-to-media-server', 's:10:"/.htaccess";', NULL, '2011-06-24 15:30:39', '0000-00-00 00:00:00', 1, 'Y'),
(879, 86, 'delete-file-on-media-server', 'a:2:{s:11:"source_path";s:17:"1471_itunesstuff/";s:9:"file_name";s:9:".htaccess";}', NULL, '2011-06-24 15:42:35', '0000-00-00 00:00:00', 1, 'Y'),
(880, 88, 'delete-file-on-media-server', 'a:2:{s:11:"source_path";s:17:"1471_itunesstuff/";s:9:"file_name";s:9:".htaccess";}', NULL, '2011-06-24 15:43:14', '0000-00-00 00:00:00', 1, 'Y'),
(881, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:15:"1473_test1/3gp/";s:16:"destination_path";s:15:"1473_test1/3gp/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(882, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1473_test1/audio/";s:16:"destination_path";s:17:"1473_test1/audio/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(883, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:19:"1473_test1/desktop/";s:16:"destination_path";s:19:"1473_test1/desktop/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(884, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:14:"1473_test1/hd/";s:16:"destination_path";s:14:"1473_test1/hd/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(885, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:18:"1473_test1/iphone/";s:16:"destination_path";s:18:"1473_test1/iphone/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(886, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:16:"1473_test1/ipod/";s:16:"destination_path";s:16:"1473_test1/ipod/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(887, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1473_test1/large/";s:16:"destination_path";s:17:"1473_test1/large/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(888, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:22:"1473_test1/transcript/";s:16:"destination_path";s:22:"1473_test1/transcript/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(889, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:19:"1473_test1/youtube/";s:16:"destination_path";s:19:"1473_test1/youtube/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(890, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:17:"1473_test1/extra/";s:16:"destination_path";s:17:"1473_test1/extra/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(891, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:11:"1473_test1/";s:16:"destination_path";s:11:"1473_test1/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(892, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:16:"1473_test1/high/";s:16:"destination_path";s:16:"1473_test1/high/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(893, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:20:"1473_test1/ipod-all/";s:16:"destination_path";s:20:"1473_test1/ipod-all/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(894, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:23:"1473_test1/desktop-all/";s:16:"destination_path";s:23:"1473_test1/desktop-all/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y'),
(895, 91, 'transfer-file-to-media-server', 'a:3:{s:11:"source_path";s:16:"1473_test1/epub/";s:16:"destination_path";s:16:"1473_test1/epub/";s:8:"filename";s:8:"rss2.xml";}', NULL, '2011-06-24 17:23:30', '0000-00-00 00:00:00', 1, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `queue_messages`
--

CREATE TABLE IF NOT EXISTS `queue_messages` (
  `mq_index` int(10) NOT NULL AUTO_INCREMENT,
  `mq_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mq_time_start` datetime DEFAULT NULL,
  `mq_time_complete` datetime DEFAULT NULL,
  `mq_status` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mq_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=92 ;

--
-- Dumping data for table `queue_messages`
--

INSERT INTO `queue_messages` (`mq_index`, `mq_command`, `mq_time_start`, `mq_time_complete`, `mq_status`) VALUES
(80, 'transfer-file-to-media-server', '2011-06-24 15:19:10', NULL, 'N'),
(81, 'transfer-file-to-media-server', '2011-06-24 15:20:04', NULL, 'Y'),
(82, 'transfer-file-to-media-server', '2011-06-24 15:20:05', NULL, 'Y'),
(83, 'transfer-file-to-media-server', '2011-06-24 15:21:34', NULL, 'Y'),
(84, 'transfer-file-to-media-server', '2011-06-24 15:21:35', NULL, 'Y'),
(85, 'transfer-file-to-media-server', '2011-06-24 15:30:39', NULL, 'Y'),
(86, 'delete-file-on-media-server', '2011-06-24 15:42:35', NULL, 'Y'),
(87, 'transfer-file-to-media-server', '2011-06-24 15:42:46', NULL, 'Y'),
(88, 'delete-file-on-media-server', '2011-06-24 15:43:14', NULL, 'Y'),
(89, 'transcode-media', '2011-06-24 16:57:01', NULL, 'Y'),
(90, 'transcode-media', '2011-06-24 17:02:23', NULL, 'Y'),
(91, 'transfer-file-to-media-server', '2011-06-24 17:23:30', NULL, 'Y');
