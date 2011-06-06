# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.8
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-06-03 17:07:41
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping data for table podcast_media.media_actions: ~0 rows (approximately)
/*!40000 ALTER TABLE `media_actions` DISABLE KEYS */;
INSERT INTO `media_actions` (`ma_index`, `ma_command`, `ma_data`, `ma_time`, `ma_update`, `ma_status`) VALUES
	(1, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.m4v";s:4:"type";s:5:"utube";s:6:"encode";s:6:"500kbs";s:5:"count";s:1:"1";}', '2011-06-03 15:32:52', '0000-00-00 00:00:00', 'N'),
	(2, 'addfile', 'a:5:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.m4v";s:4:"type";s:6:"itunes";s:6:"encode";s:6:"196kbs";s:5:"count";s:1:"2";}', '2011-06-03 15:32:52', '0000-00-00 00:00:00', 'N'),
	(3, 'checkfile', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', '2011-06-03 15:32:54', '0000-00-00 00:00:00', 'N'),
	(4, 'checkfile', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', '2011-06-03 15:32:54', '0000-00-00 00:00:00', 'N'),
	(5, 'checkfile', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', '2011-06-03 15:32:54', '0000-00-00 00:00:00', 'N'),
	(6, 'checkfile', 'a:3:{s:9:"custom_id";s:0:"";s:5:"fname";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', '2011-06-03 15:32:54', '0000-00-00 00:00:00', 'N'),
	(7, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', '2011-06-03 15:32:56', '0000-00-00 00:00:00', 'N'),
	(8, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', '2011-06-03 15:32:56', '0000-00-00 00:00:00', 'N'),
	(9, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', '2011-06-03 15:32:56', '0000-00-00 00:00:00', 'N'),
	(10, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', '2011-06-03 15:32:56', '0000-00-00 00:00:00', 'N'),
	(11, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"firstfile.mp4";s:5:"count";s:1:"1";}', '2011-06-03 15:32:59', '0000-00-00 00:00:00', 'N'),
	(12, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"secondfile.mp4";s:5:"count";s:1:"2";}', '2011-06-03 15:32:59', '0000-00-00 00:00:00', 'N'),
	(13, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:13:"thirdfile.mp4";s:5:"count";s:1:"3";}', '2011-06-03 15:32:59', '0000-00-00 00:00:00', 'N'),
	(14, 'deletefile', 'a:3:{s:9:"custom_id";s:0:"";s:8:"filename";s:14:"fourthfile.mp4";s:5:"count";s:1:"4";}', '2011-06-03 15:32:59', '0000-00-00 00:00:00', 'N'),
	(15, 'deletefolder', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:7:"/itunes";s:5:"count";s:1:"1";}', '2011-06-03 15:33:01', '0000-00-00 00:00:00', 'N'),
	(16, 'deletefolder', 'a:3:{s:9:"custom_id";s:0:"";s:10:"foldername";s:6:"/utube";s:5:"count";s:1:"2";}', '2011-06-03 15:33:01', '0000-00-00 00:00:00', 'N'),
	(17, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"1";}', '2011-06-03 15:35:51', '0000-00-00 00:00:00', 'N'),
	(18, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"2";}', '2011-06-03 15:35:51', '0000-00-00 00:00:00', 'N'),
	(19, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"3";}', '2011-06-03 15:35:51', '0000-00-00 00:00:00', 'N'),
	(20, 'metadata', 'a:13:{s:9:"custom_id";s:0:"";s:5:"fname";s:13:"firstfile.mp4";s:7:"account";s:11:"The account";s:6:"author";s:10:"The author";s:8:"comments";s:18:"Some comments here";s:9:"contentId";s:12:"A content ID";s:14:"expirationDate";s:10:"24/09/2011";s:11:"releaseDate";s:10:"24/09/2010";s:8:"revision";s:4:"1.01";s:13:"securityGroup";s:12:"secure group";s:5:"title";s:7:"Title 1";s:4:"type";s:13:"the data type";s:5:"count";s:1:"4";}', '2011-06-03 15:35:51', '0000-00-00 00:00:00', 'N');
/*!40000 ALTER TABLE `media_actions` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
