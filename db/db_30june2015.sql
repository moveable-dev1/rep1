-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 30, 2015 at 12:16 PM
-- Server version: 5.5.37-cll-lve
-- PHP Version: 5.4.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `marcaec`
--

-- --------------------------------------------------------

--
-- Table structure for table `aec_commentmeta`
--

CREATE TABLE IF NOT EXISTS `aec_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aec_comments`
--

CREATE TABLE IF NOT EXISTS `aec_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `aec_comments`
--

INSERT INTO `aec_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-06-15 07:08:21', '2015-06-15 07:08:21', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aec_links`
--

CREATE TABLE IF NOT EXISTS `aec_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aec_options`
--

CREATE TABLE IF NOT EXISTS `aec_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=329 ;

--
-- Dumping data for table `aec_options`
--

INSERT INTO `aec_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://marcaec.lnx-local.com', 'yes'),
(2, 'home', 'http://marcaec.lnx-local.com', 'yes'),
(3, 'blogname', 'AEC', 'yes'),
(4, 'blogdescription', 'Associates with Visible AEC', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'test@example.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:19:"profile/profile.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'marsaec', 'yes'),
(42, 'stylesheet', 'marsaec', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31535', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '0', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:4:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:0:"";s:4:"text";s:38:"http://player.vimeo.com/video/60122989";s:6:"filter";b:0;}i:3;a:3:{s:5:"title";s:0:"";s:4:"text";s:167:"Cras varius molestie risus, sed aliquet tellus pulvinar sed. Pellentesque dignissim enim et augue lacinia elementum. Proin felis augue, pharetra sed condimentum vitae.";s:6:"filter";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31535', 'yes'),
(89, 'aec_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:5:{s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:19:"wp_inactive_widgets";a:0:{}s:14:"vimeo-homepage";a:1:{i:0;s:6:"text-2";}s:13:"vimeo-content";a:1:{i:0;s:6:"text-3";}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:5:{i:1434438503;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1434438775;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1434440820;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1434522548;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1435638977;s:15:"version_checked";s:5:"4.2.2";s:12:"translations";a:0:{}}', 'yes'),
(106, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1435638978;s:7:"checked";a:3:{s:13:"twentyfifteen";s:3:"1.2";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(107, '_transient_random_seed', 'eb6ad542bf3d2724fa51133470d43fed', 'yes'),
(111, 'can_compress_scripts', '1', 'yes'),
(130, 'recently_activated', 'a:0:{}', 'yes'),
(132, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1435638977;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.2";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.2.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes'),
(151, '_site_transient_timeout_browser_a7cef1cfa83607636f838b5bc2f2e819', '1435037361', 'yes'),
(152, '_site_transient_browser_a7cef1cfa83607636f838b5bc2f2e819', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"43.0.2357.124";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(172, '_transient_doing_cron', '1435666489.7590749263763427734375', 'yes'),
(213, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(214, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(215, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(217, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(299, 'category_children', 'a:23:{i:8;a:6:{i:0;i:3;i:1;i:9;i:2;i:34;i:3;i:64;i:4;i:71;i:5;i:77;}i:3;a:7:{i:0;i:4;i:1;i:16;i:2;i:20;i:3;i:30;i:4;i:31;i:5;i:32;i:6;i:33;}i:4;a:3:{i:0;i:5;i:1;i:6;i:2;i:7;}i:9;a:4:{i:0;i:10;i:1;i:15;i:2;i:45;i:3;i:46;}i:10;a:4:{i:0;i:11;i:1;i:12;i:2;i:13;i:3;i:14;}i:16;a:3:{i:0;i:17;i:1;i:18;i:2;i:19;}i:20;a:9:{i:0;i:21;i:1;i:22;i:2;i:23;i:3;i:24;i:4;i:25;i:5;i:26;i:6;i:27;i:7;i:28;i:8;i:29;}i:34;a:5:{i:0;i:35;i:1;i:36;i:2;i:37;i:3;i:38;i:4;i:39;}i:39;a:5:{i:0;i:40;i:1;i:41;i:2;i:42;i:3;i:43;i:4;i:44;}i:35;a:1:{i:0;i:47;}i:36;a:1:{i:0;i:48;}i:37;a:1:{i:0;i:49;}i:38;a:1:{i:0;i:50;}i:45;a:1:{i:0;i:51;}i:46;a:12:{i:0;i:52;i:1;i:53;i:2;i:54;i:3;i:55;i:4;i:56;i:5;i:57;i:6;i:58;i:7;i:59;i:8;i:60;i:9;i:61;i:10;i:62;i:11;i:63;}i:64;a:3:{i:0;i:65;i:1;i:66;i:2;i:67;}i:67;a:1:{i:0;i:68;}i:66;a:1:{i:0;i:69;}i:65;a:1:{i:0;i:70;}i:71;a:3:{i:0;i:72;i:1;i:73;i:2;i:74;}i:72;a:1:{i:0;i:75;}i:73;a:1:{i:0;i:76;}i:77;a:4:{i:0;i:78;i:1;i:79;i:2;i:80;i:3;i:81;}}', 'yes'),
(302, '_transient_timeout_plugin_slugs', '1435658125', 'no'),
(303, '_transient_plugin_slugs', 'a:3:{i:0;s:19:"akismet/akismet.php";i:1;s:19:"profile/profile.php";i:2;s:9:"hello.php";}', 'no'),
(306, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1435572343;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(307, 'current_theme', 'Marsaec', 'yes'),
(308, 'theme_mods_marsaec', 'a:1:{i:0;b:0;}', 'yes'),
(309, 'theme_switched', '', 'yes'),
(310, '_site_transient_timeout_theme_roots', '1435640777', 'yes'),
(311, '_site_transient_theme_roots', 'a:4:{s:7:"marsaec";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(312, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1435682179', 'no'),
(313, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 66.155.40.250: Network is unreachable</p></div><div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 66.155.40.250: Network is unreachable</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(314, 'WPLANG', '', 'yes'),
(318, 'rewrite_rules', 'a:68:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(319, 'vimeo_url', 'http://player.vimeo.com/video/60122989', 'yes'),
(320, 'profile_email', 'test@example.com', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `aec_postmeta`
--

CREATE TABLE IF NOT EXISTS `aec_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `aec_postmeta`
--

INSERT INTO `aec_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1434450580:1'),
(3, 1, '_edit_last', '1'),
(4, 5, '_edit_last', '1'),
(5, 5, '_edit_lock', '1434436569:1'),
(6, 7, '_edit_last', '1'),
(7, 7, '_edit_lock', '1434450578:1'),
(8, 1, '_wp_trash_meta_status', 'publish'),
(9, 1, '_wp_trash_meta_time', '1434616897'),
(10, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(11, 8, '_edit_last', '1'),
(12, 8, '_edit_lock', '1434695281:1'),
(13, 10, '_wp_attached_file', '2015/06/2000px-000080_Navy_Blue_Square.svg_.png'),
(14, 10, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2000;s:6:"height";i:2000;s:4:"file";s:47:"2015/06/2000px-000080_Navy_Blue_Square.svg_.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:47:"2000px-000080_Navy_Blue_Square.svg_-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:47:"2000px-000080_Navy_Blue_Square.svg_-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:49:"2000px-000080_Navy_Blue_Square.svg_-1024x1024.png";s:5:"width";i:1024;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:47:"2000px-000080_Navy_Blue_Square.svg_-825x510.png";s:5:"width";i:825;s:6:"height";i:510;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(15, 11, '_edit_last', '1'),
(16, 11, '_edit_lock', '1435646550:1'),
(17, 2, '_wp_trash_meta_status', 'publish'),
(18, 2, '_wp_trash_meta_time', '1435643577'),
(19, 14, '_edit_last', '1'),
(20, 14, '_edit_lock', '1435644412:1'),
(21, 16, '_edit_last', '1'),
(22, 16, '_edit_lock', '1435644432:1'),
(23, 18, '_edit_last', '1'),
(24, 18, '_edit_lock', '1435644466:1'),
(25, 20, '_edit_last', '1'),
(26, 20, '_edit_lock', '1435647017:1'),
(27, 22, '_edit_last', '1'),
(28, 22, '_edit_lock', '1435644874:1'),
(29, 24, '_edit_last', '1'),
(30, 24, '_edit_lock', '1435648444:1'),
(31, 11, 'sub-heading', 'Lorem Ipsum is simply dummy'),
(32, 20, '_wp_page_template', 'page-templates/submit-profile.php'),
(33, 24, '_wp_page_template', 'page-templates/rss-feed.php'),
(34, 28, '_edit_last', '1'),
(35, 28, '_edit_lock', '1435663175:1'),
(36, 28, '_wp_page_template', 'page-templates/search-result.php');

-- --------------------------------------------------------

--
-- Table structure for table `aec_posts`
--

CREATE TABLE IF NOT EXISTS `aec_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `aec_posts`
--

INSERT INTO `aec_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-06-15 07:08:21', '2015-06-15 07:08:21', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world', '', '', '2015-06-18 08:41:37', '2015-06-18 08:41:37', '', 0, 'http://marcaec.lnx-local.com/?p=1', 0, 'post', '', 1),
(2, 1, '2015-06-15 07:08:21', '2015-06-15 07:08:21', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://marcaec.lnx-local.com/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'open', 'open', '', 'sample-page', '', '', '2015-06-30 05:52:57', '2015-06-30 05:52:57', '', 0, 'http://marcaec.lnx-local.com/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-06-15 07:08:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-15 07:08:56', '0000-00-00 00:00:00', '', 0, 'http://marcaec.lnx-local.com/?p=3', 0, 'post', '', 0),
(4, 1, '2015-06-15 12:10:16', '2015-06-15 12:10:16', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-06-15 12:10:16', '2015-06-15 12:10:16', '', 1, 'http://marcaec.lnx-local.com/2015/06/15/1-revision-v1/', 0, 'revision', '', 0),
(5, 1, '2015-06-16 06:29:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-16 06:29:08', '0000-00-00 00:00:00', '', 0, 'http://marcaec.lnx-local.com/?p=5', 0, 'post', '', 0),
(6, 1, '2015-06-16 06:38:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-16 06:38:25', '0000-00-00 00:00:00', '', 0, 'http://marcaec.lnx-local.com/?p=6', 0, 'post', '', 0),
(7, 1, '2015-06-16 09:45:34', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-16 09:45:34', '0000-00-00 00:00:00', '', 0, 'http://marcaec.lnx-local.com/?p=7', 0, 'post', '', 0),
(8, 1, '2015-06-19 06:28:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-19 06:28:31', '0000-00-00 00:00:00', '', 0, 'http://marcaec.lnx-local.com/?p=8', 0, 'post', '', 0),
(9, 1, '2015-06-19 10:21:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-19 10:21:32', '0000-00-00 00:00:00', '', 0, 'http://marcaec.lnx-local.com/?p=9', 0, 'post', '', 0),
(10, 1, '2015-06-29 10:25:15', '2015-06-29 10:25:15', '', '2000px-000080_Navy_Blue_Square.svg', '', 'inherit', 'open', 'open', '', '2000px-000080_navy_blue_square-svg', '', '', '2015-06-29 10:25:15', '2015-06-29 10:25:15', '', 0, 'http://marcaec.lnx-local.com/wp-content/uploads/2015/06/2000px-000080_Navy_Blue_Square.svg_.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2015-06-30 05:52:08', '2015-06-30 05:52:08', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'About', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-06-30 06:33:30', '2015-06-30 06:33:30', '', 0, 'http://marcaec.lnx-local.com/?page_id=11', 0, 'page', '', 0),
(12, 1, '2015-06-30 05:52:08', '2015-06-30 05:52:08', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-06-30 05:52:08', '2015-06-30 05:52:08', '', 11, 'http://marcaec.lnx-local.com/2015/06/30/11-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2015-06-30 05:52:57', '2015-06-30 05:52:57', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://marcaec.lnx-local.com/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-06-30 05:52:57', '2015-06-30 05:52:57', '', 2, 'http://marcaec.lnx-local.com/?p=13', 0, 'revision', '', 0),
(14, 1, '2015-06-30 06:08:26', '2015-06-30 06:08:26', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Partners', '', 'publish', 'open', 'open', '', 'partners', '', '', '2015-06-30 06:08:26', '2015-06-30 06:08:26', '', 0, 'http://marcaec.lnx-local.com/?page_id=14', 0, 'page', '', 0),
(15, 1, '2015-06-30 06:08:26', '2015-06-30 06:08:26', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-06-30 06:08:26', '2015-06-30 06:08:26', '', 14, 'http://marcaec.lnx-local.com/?p=15', 0, 'revision', '', 0),
(16, 1, '2015-06-30 06:09:27', '2015-06-30 06:09:27', '', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2015-06-30 06:09:27', '2015-06-30 06:09:27', '', 0, 'http://marcaec.lnx-local.com/?page_id=16', 0, 'page', '', 0),
(17, 1, '2015-06-30 06:09:27', '2015-06-30 06:09:27', '', 'Contact', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-06-30 06:09:27', '2015-06-30 06:09:27', '', 16, 'http://marcaec.lnx-local.com/?p=17', 0, 'revision', '', 0),
(18, 1, '2015-06-30 06:09:51', '2015-06-30 06:09:51', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Terms & Conditions', '', 'publish', 'open', 'open', '', 'terms-conditions', '', '', '2015-06-30 06:09:51', '2015-06-30 06:09:51', '', 0, 'http://marcaec.lnx-local.com/?page_id=18', 0, 'page', '', 0),
(19, 1, '2015-06-30 06:09:51', '2015-06-30 06:09:51', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Terms & Conditions', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2015-06-30 06:09:51', '2015-06-30 06:09:51', '', 18, 'http://marcaec.lnx-local.com/?p=19', 0, 'revision', '', 0),
(20, 1, '2015-06-30 06:11:28', '2015-06-30 06:11:28', '', 'Submit a Profile', '', 'publish', 'open', 'open', '', 'submit-a-profile', '', '', '2015-06-30 06:45:09', '2015-06-30 06:45:09', '', 0, 'http://marcaec.lnx-local.com/?page_id=20', 0, 'page', '', 0),
(21, 1, '2015-06-30 06:11:28', '2015-06-30 06:11:28', '', 'Submit a Profile', '', 'inherit', 'open', 'open', '', '20-revision-v1', '', '', '2015-06-30 06:11:28', '2015-06-30 06:11:28', '', 20, 'http://marcaec.lnx-local.com/?p=21', 0, 'revision', '', 0),
(22, 1, '2015-06-30 06:12:31', '2015-06-30 06:12:31', '', 'Contact Profile', '', 'publish', 'open', 'open', '', 'contact-profile', '', '', '2015-06-30 06:12:31', '2015-06-30 06:12:31', '', 0, 'http://marcaec.lnx-local.com/?page_id=22', 0, 'page', '', 0),
(23, 1, '2015-06-30 06:12:31', '2015-06-30 06:12:31', '', 'Contact Profile', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-06-30 06:12:31', '2015-06-30 06:12:31', '', 22, 'http://marcaec.lnx-local.com/?p=23', 0, 'revision', '', 0),
(24, 1, '2015-06-30 06:20:17', '2015-06-30 06:20:17', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'RSS Feed', '', 'publish', 'open', 'open', '', 'rss-feed', '', '', '2015-06-30 07:02:06', '2015-06-30 07:02:06', '', 0, 'http://marcaec.lnx-local.com/?page_id=24', 0, 'page', '', 0),
(25, 1, '2015-06-30 06:20:17', '2015-06-30 06:20:17', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'RSS Feed', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-06-30 06:20:17', '2015-06-30 06:20:17', '', 24, 'http://marcaec.lnx-local.com/24-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2015-06-30 06:53:23', '2015-06-30 06:53:23', '', 'RSS Feed', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-06-30 06:53:23', '2015-06-30 06:53:23', '', 24, 'http://marcaec.lnx-local.com/24-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2015-06-30 07:02:06', '2015-06-30 07:02:06', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'RSS Feed', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-06-30 07:02:06', '2015-06-30 07:02:06', '', 24, 'http://marcaec.lnx-local.com/24-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2015-06-30 10:37:05', '2015-06-30 10:37:05', 'No matches found. Please search again.\r\n\r\nIf you know of an innovative company or project that would benefit from being featured on this website, direct them to submit a profile.', 'Search', '', 'publish', 'open', 'open', '', 'search', '', '', '2015-06-30 11:19:34', '2015-06-30 11:19:34', '', 0, 'http://marcaec.lnx-local.com/?page_id=28', 0, 'page', '', 0),
(29, 1, '2015-06-30 10:37:05', '2015-06-30 10:37:05', 'No results found', 'Search', '', 'inherit', 'open', 'open', '', '28-revision-v1', '', '', '2015-06-30 10:37:05', '2015-06-30 10:37:05', '', 28, 'http://marcaec.lnx-local.com/28-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2015-06-30 11:19:16', '2015-06-30 11:19:16', 'No matches found. Please search again.\n\nIf you know of an innovative company or project that would benefit from being featured on this website, direct them to submit a profile at [profile webform URL]', 'Search', '', 'inherit', 'open', 'open', '', '28-autosave-v1', '', '', '2015-06-30 11:19:16', '2015-06-30 11:19:16', '', 28, 'http://marcaec.lnx-local.com/28-autosave-v1/', 0, 'revision', '', 0),
(31, 1, '2015-06-30 11:19:34', '2015-06-30 11:19:34', 'No matches found. Please search again.\r\n\r\nIf you know of an innovative company or project that would benefit from being featured on this website, direct them to submit a profile.', 'Search', '', 'inherit', 'open', 'open', '', '28-revision-v1', '', '', '2015-06-30 11:19:34', '2015-06-30 11:19:34', '', 28, 'http://marcaec.lnx-local.com/28-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aec_profile`
--

CREATE TABLE IF NOT EXISTS `aec_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_type` smallint(6) NOT NULL,
  `name` varchar(150) NOT NULL,
  `logo` varchar(150) NOT NULL,
  `region` smallint(6) NOT NULL,
  `description` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(150) NOT NULL,
  `facebook` varchar(150) NOT NULL,
  `twitter` varchar(150) NOT NULL,
  `linkedin` varchar(150) NOT NULL,
  `awards` varchar(300) NOT NULL,
  `is_featured` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `aec_profile`
--

INSERT INTO `aec_profile` (`id`, `profile_type`, `name`, `logo`, `region`, `description`, `email`, `website`, `facebook`, `twitter`, `linkedin`, `awards`, `is_featured`, `status`) VALUES
(114, 2, '2MW Minto Flywheel System', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/2000px-000080_Navy_Blue_Square.svg_.png', 1, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario electricity grid. The project was developed by Toronto based firm NRStor Inc and has been providing +/-2MWs of regulation services to the Ontario grid since July 2014.', 'aaron.lampe@temporalpower.com', 'http://temporalpower.com', '', '', '', '', 0, 1),
(118, 2, 'Essex Power Lines', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/2000px-000080_Navy_Blue_Square.svg_9.png', 3, 'Smart Map provides the engineering and operational groups at an electric utility with a geographic analysis tool of their medium voltage distribution system. It helps you build an analytic model of your system and combines that with data from smart meters, wholesale meter points and other sensors to create a sophisticated simulation of your distribution system. Smart Map helps you understand, plan and operate your system more effectively. Using the data provided by Utility Data Manager, Smart M', 'gmoody@utilismartcorp.com', 'http://utilismartcorp.com', '', '', '', '', 1, 0),
(119, 2, 'Prolucid Smart Grid Power Technologies (Smart Grid Fund)', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/demo-image-21.jpg', 3, 'Test Description', 'bob.leigh@prolucid.ca', 'http://prolucid.ca', '', '', '', '', 1, 1),
(120, 2, 'Upper Grand Solar Project', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/red-05.jpg', 1, 'Lorem Ipsum dummy text', 'mpochtaruk@heliene.ca', 'http://heliene.ca', '', '', '', '', 0, 1),
(121, 2, 'Green Button', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/2000px-000080_Navy_Blue_Square.svg_12.png', 3, 'The Green Button standard allows consumers to access and share their energy consumption data in a consistent, electronic and secure manner. The standard is also extensible to water data.  The st', 'ssud@marsdd.com', 'http://marsdd.com', '', '', '', '', 0, 1),
(122, 2, 'Powerstream Fault Detection, Isolation, Restoration (FDIR) project', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/demo-image-23.jpg', 3, 'As one of the largest utilities in Ontario serving nine municipalities, Powerstream operates on a fully integrated automatic isolation and restoration system developed by Survalent Technology. Survalentâ€™s FDIR solution enables automated switching and', 'nwijesundera@survalent.com', 'http://survalent.com', 'https://www.facebook.com/survalent', 'https://twitter.com/#%21/survalent', 'https://www.linkedin.com/company/survalent-technology', '', 1, 1),
(123, 1, 'Enbala Power (Colombia)', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/red-054.jpg', 3, 'Enbala operates the Grid Operational Flexibility (GOFlex) platform, a multi-service, integrated grid software platform that offers a widespread and adaptable suite of grid optimization applications to support three operational areas within the indust', 'admin@aec.com', 'http://www.enbala.com', '', 'https://twitter.com/ENBALA', 'https://www.linkedin.com/company/enbala-power-networks', '', 1, 1),
(124, 1, 'Heliene', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/demo-image-24.jpg', 3, 'Core ECOP competencies include complex lighting retrofits via Sun Industries, high-quality and low-cost LED lighting products, wireless energy management systems that are plug-and-play and compatible with multiple technologies (HVAC, plug load, etc.)', 'mpochtaruk@heliene.ca', 'http://www.heliene.ca/projects/details.aspx?l=0,9,589,590,598', '', '', '', '', 0, 1),
(125, 1, 'Hydrostor', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/demo-image-Copy1.jpg', 3, 'Hydrostor develops underwater compressed air energy storage systems. The companyâ€™s patent-protected technology efficiently converts electrical energy into compressed air, then stores it in a series of flexible energy accumulators located 50 to 500 me', 'test@test.com', 'http://hydrostor.ca', '', '', '', '', 0, 1),
(130, 1, 'EyeDro Green Solutions Inc', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/demo-image-25.jpg', 3, 'Eyedro Green Solutions Inc. is a software and electronics design company making electricity usage easy to understand. The company provides simple solutions for monitoring your electricity in real time. Combined with the MyEyedro cloud service, Eyedro', 'test@test.com', 'http://www.eyedro.com', 'https://www.facebook.com/eyedro1', 'https://twitter.com/Eyedro', 'https://www.linkedin.com/company/eyedro-green-solutions-inc-?trk=biz-companies-cym', '', 0, 1),
(131, 1, 'SPARQ Systems Inc.', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/2000px-000080_Navy_Blue_Square.svg_17.png', 3, 'SPARQ Systems develops and sells advanced photovoltaic microinverters for residential solar systems that convert power produced from solar panels into electricity that can be used by the grid. The companyâ€™s user-friendly software-based system elimina', 'test@test.com', 'http://www.sparqsys.com', '', '', '', '', 0, 1),
(132, 1, 'Utilismart Corporation (Colombia)', 'http://marcaec.lnx-local.com/wp-content/uploads/profile/logo/demo-image-26.jpg', 1, 'Utilismart has created and operates its own secure, cloud-based Meter Data Management system along with a wide range of AMI software solutions and data services for utilities, municipalities, industrial, commercial and residential consumers. Utilisma', 'test2@test.com', 'http://xyz.com', '', '', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `aec_profilemeta`
--

CREATE TABLE IF NOT EXISTS `aec_profilemeta` (
  `metaid` int(11) NOT NULL AUTO_INCREMENT,
  `meta_name` varchar(255) NOT NULL,
  PRIMARY KEY (`metaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `aec_profilemeta`
--

INSERT INTO `aec_profilemeta` (`metaid`, `meta_name`) VALUES
(1, 'affiliate_company'),
(2, 'affiliate_url'),
(3, 'street_address'),
(4, 'city'),
(5, 'state'),
(6, 'country'),
(7, 'postal_code'),
(8, 'featured_image'),
(9, 'is_featured_image'),
(10, 'project_funder'),
(11, 'project_funderurl'),
(12, 'company_investor'),
(13, 'company_investorurl'),
(14, 'video'),
(15, 'profile_tags'),
(16, 'term_taxonomy_id');

-- --------------------------------------------------------

--
-- Table structure for table `aec_profileregion`
--

CREATE TABLE IF NOT EXISTS `aec_profileregion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `aec_profileregion`
--

INSERT INTO `aec_profileregion` (`id`, `region`) VALUES
(1, 'Ontario'),
(2, 'Canada'),
(3, 'Worldwide');

-- --------------------------------------------------------

--
-- Table structure for table `aec_profiletype`
--

CREATE TABLE IF NOT EXISTS `aec_profiletype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` char(50) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `aec_profiletype`
--

INSERT INTO `aec_profiletype` (`typeid`, `typename`) VALUES
(1, 'Company'),
(2, 'Project');

-- --------------------------------------------------------

--
-- Table structure for table `aec_profilevalue`
--

CREATE TABLE IF NOT EXISTS `aec_profilevalue` (
  `valueid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `metaid` int(5) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`valueid`),
  KEY `id` (`id`),
  KEY `metaid` (`metaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1310 ;

--
-- Dumping data for table `aec_profilevalue`
--

INSERT INTO `aec_profilevalue` (`valueid`, `id`, `metaid`, `fieldid`, `value`) VALUES
(575, 114, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/2000px-000080_Navy_Blue_Square.svg_.png'),
(576, 114, 9, 1, '1'),
(721, 118, 1, 1, 'Utilismart Corporation, SmartMap'),
(722, 118, 3, 1, '555 Southdale Rd E #201'),
(723, 118, 4, 1, 'London'),
(724, 118, 5, 1, 'London'),
(725, 118, 6, 1, 'United Kingdom'),
(726, 118, 7, 1, 'N6E 1A2'),
(727, 118, 16, 1, '66'),
(728, 118, 16, 2, '67'),
(729, 118, 16, 3, '45'),
(730, 118, 16, 4, '15'),
(731, 118, 15, 1, ''),
(732, 119, 1, 1, 'LocalGrid; Smart Grid Fund '),
(733, 119, 3, 1, 'Regus City West'),
(734, 119, 4, 1, 'Leeds'),
(735, 119, 5, 1, 'London'),
(736, 119, 6, 1, 'United Kingdom'),
(737, 119, 7, 1, 'LS12 6LN'),
(738, 119, 16, 1, '15'),
(739, 119, 15, 1, ''),
(854, 121, 1, 1, 'Aegent'),
(855, 121, 1, 2, 'BuiltSpace'),
(856, 121, 1, 3, 'Bidgle'),
(857, 121, 1, 4, 'Frontier'),
(858, 121, 1, 5, 'Energent'),
(859, 121, 3, 1, 'Test street'),
(860, 121, 4, 1, 'Leeds'),
(861, 121, 5, 1, 'London'),
(862, 121, 6, 1, 'United Kingdom'),
(863, 121, 7, 1, 'LS12 6LN'),
(864, 121, 15, 1, ''),
(865, 121, 16, 1, '64'),
(866, 121, 16, 2, '9'),
(867, 121, 16, 3, '66'),
(868, 121, 16, 4, '67'),
(869, 122, 1, 1, 'PowerStream'),
(870, 122, 1, 2, 'Survalent'),
(871, 122, 3, 1, 'Test street'),
(872, 122, 4, 1, 'London'),
(873, 122, 5, 1, 'London'),
(874, 122, 6, 1, 'United Kingdom'),
(875, 122, 7, 1, 'N6E 1A2'),
(876, 122, 16, 1, '9'),
(877, 122, 16, 2, '66'),
(878, 122, 16, 3, '67'),
(879, 122, 16, 4, '68'),
(880, 122, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/demo-image-2.jpg'),
(881, 122, 8, 2, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/red-05.jpg'),
(882, 122, 15, 1, ''),
(883, 123, 1, 1, 'test company'),
(884, 123, 3, 1, '930 1st St W #211'),
(885, 123, 4, 1, 'North Vancouver'),
(886, 123, 5, 1, 'North Vancouver'),
(887, 123, 6, 1, 'United Kingdom'),
(888, 123, 7, 1, 'BC V7P 3N4'),
(889, 123, 16, 1, '77'),
(890, 123, 16, 2, '65'),
(891, 123, 15, 1, ''),
(900, 124, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/demo-image-21.jpg'),
(901, 124, 8, 2, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/red-051.jpg'),
(902, 124, 9, 2, '2'),
(912, 125, 1, 1, 'Test User'),
(913, 125, 3, 1, 'Test street'),
(914, 125, 4, 1, 'Leeds'),
(915, 125, 5, 1, 'London'),
(916, 125, 6, 1, 'United Kingdom'),
(917, 125, 7, 1, 'LS12 6LN'),
(918, 125, 15, 1, ''),
(919, 125, 16, 1, '3'),
(920, 125, 16, 2, '64'),
(921, 125, 16, 3, '20'),
(922, 125, 16, 4, '32'),
(923, 124, 1, 1, 'test company'),
(924, 124, 3, 1, 'Test street'),
(925, 124, 4, 1, 'Leeds'),
(926, 124, 5, 1, 'London'),
(927, 124, 6, 1, 'United Kingdom'),
(928, 124, 7, 1, 'LS12 6LN'),
(929, 124, 15, 1, ''),
(930, 124, 16, 1, '9'),
(931, 124, 16, 2, '15'),
(1002, 130, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/2000px-000080_Navy_Blue_Square.svg_1.png'),
(1003, 130, 8, 2, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/demo-image-22.jpg'),
(1004, 130, 8, 3, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/demo-image-Copy.jpg'),
(1005, 130, 9, 2, '2'),
(1083, 130, 1, 1, 'test company'),
(1084, 130, 3, 1, 'Test street'),
(1085, 130, 4, 1, 'London'),
(1086, 130, 5, 1, 'London'),
(1087, 130, 6, 1, 'United Kingdom'),
(1088, 130, 7, 1, 'N6E 1A2'),
(1089, 130, 12, 1, 'Burlington Hydro'),
(1090, 130, 15, 1, ''),
(1091, 130, 16, 1, '77'),
(1092, 130, 16, 2, '71'),
(1093, 130, 16, 3, '73'),
(1094, 130, 16, 4, '72'),
(1095, 130, 16, 5, '76'),
(1120, 114, 1, 1, 'Temporal Power; NRStor Inc; IESO'),
(1121, 114, 3, 1, 'Test street'),
(1122, 114, 4, 1, 'Leeds'),
(1123, 114, 5, 1, 'London'),
(1124, 114, 6, 1, 'United Kingdom'),
(1125, 114, 7, 1, 'LS12 6LN'),
(1126, 114, 15, 1, ''),
(1127, 114, 16, 1, '9'),
(1128, 114, 16, 2, '77'),
(1129, 114, 16, 3, '45'),
(1130, 114, 16, 4, '46'),
(1131, 114, 16, 5, '79'),
(1132, 114, 16, 6, '60'),
(1133, 114, 16, 7, '57'),
(1134, 120, 1, 1, 'Heliene'),
(1135, 120, 3, 1, 'Test street'),
(1136, 120, 4, 1, 'London'),
(1137, 120, 5, 1, 'London'),
(1138, 120, 6, 1, 'United Kingdom'),
(1139, 120, 7, 1, 'N6E 1A2'),
(1140, 120, 15, 1, ''),
(1143, 120, 16, 1, '77'),
(1144, 120, 9, 2, '2'),
(1145, 120, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/2000px-000080_Navy_Blue_Square.svg_2.png'),
(1146, 120, 8, 2, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/red-052.jpg'),
(1265, 131, 1, 1, 'test company'),
(1266, 131, 3, 1, 'Test street'),
(1267, 131, 4, 1, 'London'),
(1268, 131, 5, 1, 'London'),
(1269, 131, 6, 1, 'United Kingdom'),
(1270, 131, 7, 1, 'LS12 6LN'),
(1271, 131, 15, 1, ''),
(1273, 131, 16, 1, '3'),
(1274, 131, 16, 2, '64'),
(1275, 131, 16, 3, '9'),
(1276, 131, 16, 4, '4'),
(1277, 131, 16, 5, '10'),
(1278, 131, 16, 6, '5'),
(1279, 131, 16, 7, '6'),
(1280, 131, 9, 1, '1'),
(1281, 131, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/demo-image-Copy1.jpg'),
(1297, 132, 1, 1, 'test company'),
(1298, 132, 3, 1, 'Test street'),
(1299, 132, 4, 1, 'London'),
(1300, 132, 5, 1, 'London'),
(1301, 132, 6, 1, 'United Kingdom'),
(1302, 132, 7, 1, 'LS12 6LN'),
(1303, 132, 15, 1, ''),
(1304, 132, 16, 1, '64'),
(1305, 132, 16, 2, '65'),
(1306, 132, 16, 3, '66'),
(1307, 132, 9, 1, '1'),
(1308, 132, 8, 1, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/demo-image-23.jpg'),
(1309, 132, 8, 2, 'http://marcaec.lnx-local.com/wp-content/uploads/profile/red-053.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `aec_terms`
--

CREATE TABLE IF NOT EXISTS `aec_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=82 ;

--
-- Dumping data for table `aec_terms`
--

INSERT INTO `aec_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(3, 'Centralized Generation', 'centralized-generation', 0),
(4, 'Solar PV', 'solar-pv', 0),
(5, 'Inverters', 'inverters', 0),
(6, 'Photovoltaic panels', 'photovoltaic-panels', 0),
(7, 'Racking &amp; Mounting Technology', 'racking-mounting-technology', 0),
(8, 'Profile', 'profile', 0),
(9, 'Distribution', 'distribution', 0),
(10, 'Distributed Generation', 'distributed-generation', 0),
(11, 'Small-Hydro Equipment', 'small-hydro-equipment', 0),
(12, 'Solar Equipment', 'solar-equipment', 0),
(13, 'Wind Equipment', 'wind-equipment', 0),
(14, 'Hydrogen', 'hydrogen', 0),
(15, 'Advanced Metering Infrastructure', 'advanced-metering-infrastructure', 0),
(16, 'Wind', 'wind', 0),
(17, 'Blades', 'blades', 0),
(18, 'Towers', 'towers', 0),
(19, 'Turbines', 'turbines', 0),
(20, 'Hydro', 'hydro', 0),
(21, 'Turbines', 'turbines-hydro', 0),
(22, 'Generators', 'generators', 0),
(23, 'Digital Switches', 'digital-switches', 0),
(24, 'Inductors', 'inductors', 0),
(25, 'Switchgear', 'switchgear', 0),
(26, 'Transformers', 'transformers', 0),
(27, 'Electrostatic Precipitators', 'electrostatic-precipitators', 0),
(28, 'Electrical Equipment', 'electrical-equipment', 0),
(29, 'Electric Insulators', 'electric-insulators', 0),
(30, 'Bio Energy', 'bio-energy', 0),
(31, 'Nuclear', 'nuclear', 0),
(32, 'Natural Gas', 'natural-gas', 0),
(33, 'Other', 'other', 0),
(34, 'Transmission', 'transmission', 0),
(35, 'Equipment', 'equipment', 0),
(36, 'Controls', 'controls', 0),
(37, 'Testing', 'testing', 0),
(38, 'Monitoring', 'monitoring', 0),
(39, 'Storage', 'storage', 0),
(40, 'Dynamic Systems Controls', 'dynamic-systems-controls', 0),
(41, 'Circuit Breaker Test Instruments', 'circuit-breaker-test-instruments', 0),
(42, 'Power Linke Stringing Equipment', 'power-linke-stringing-equipment', 0),
(43, 'Supervisory Control &amp; Data Acquisition (SCADA)', 'supervisory-control-data-acquisition-scada', 0),
(44, 'Instrumentation and controls', 'instrumentation-and-controls', 0),
(45, 'Advanced Distribution Systems', 'advanced-distribution-systems', 0),
(46, 'Energy Storage', 'energy-storage', 0),
(47, 'Transformers', 'transformers-equipment', 0),
(48, 'Cable', 'cable', 0),
(49, 'Cable Joining', 'cable-joining', 0),
(50, 'Control Interfaces', 'control-interfaces', 0),
(51, 'Electric Meters', 'electric-meters', 0),
(52, 'Supervisory Control &amp; Data Acquisition (SCADA)', 'supervisory-control-data-acquisition-scada-energy-storage', 0),
(53, 'Operational Technologies', 'operational-technologies', 0),
(54, 'Cyber Security', 'cyber-security', 0),
(55, 'Storage', 'storage-energy-storage', 0),
(56, 'Battery Chargers &amp; Power Inverters', 'battery-chargers-power-inverters', 0),
(57, 'Hydrogen', 'hydrogen-energy-storage', 0),
(58, 'Smart Grid', 'smart-grid', 0),
(59, 'Data Management', 'data-management', 0),
(60, 'Grid Automation', 'grid-automation', 0),
(61, 'Meter Technology &amp; Services', 'meter-technology-services', 0),
(62, 'Advanced Metering Infrastructure', 'advanced-metering-infrastructure-energy-storage', 0),
(63, 'Broadband Over Powerline', 'broadband-over-powerline', 0),
(64, 'Customer Technologies', 'customer-technologies', 0),
(65, 'Commercial &amp; Industrial', 'commercial-industrial', 0),
(66, 'Institutional (Hospital, Schools)', 'institutional-hospital-schools', 0),
(67, 'Residential', 'residential', 0),
(68, 'Analytics', 'analytics', 0),
(69, 'Energy Efficiency Products', 'energy-efficiency-products', 0),
(70, 'Sub-Metering &amp; Measurement', 'sub-metering-measurement', 0),
(71, 'Microgrid', 'microgrid', 0),
(72, 'Generation', 'generation', 0),
(73, 'Energy Storage', 'energy-storage-microgrid', 0),
(74, 'Control Technology', 'control-technology', 0),
(75, 'Renewable generation', 'renewable-generation', 0),
(76, 'Storage', 'storage-energy-storage-microgrid', 0),
(77, 'Grid Operation', 'grid-operation', 0),
(78, 'Smart Grid Optimization', 'smart-grid-optimization', 0),
(79, 'Power systems analysis', 'power-systems-analysis', 0),
(80, 'Modeling', 'modeling', 0),
(81, 'Systems integration', 'systems-integration', 0);

-- --------------------------------------------------------

--
-- Table structure for table `aec_term_relationships`
--

CREATE TABLE IF NOT EXISTS `aec_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aec_term_relationships`
--

INSERT INTO `aec_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 3, 0),
(1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aec_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `aec_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=82 ;

--
-- Dumping data for table `aec_term_taxonomy`
--

INSERT INTO `aec_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(3, 3, 'category', '', 8, 0),
(4, 4, 'category', '', 3, 0),
(5, 5, 'category', '', 4, 0),
(6, 6, 'category', '', 4, 0),
(7, 7, 'category', '', 4, 0),
(8, 8, 'category', '', 0, 0),
(9, 9, 'category', '', 8, 0),
(10, 10, 'category', '', 9, 0),
(11, 11, 'category', '', 10, 0),
(12, 12, 'category', '', 10, 0),
(13, 13, 'category', '', 10, 0),
(14, 14, 'category', '', 10, 0),
(15, 15, 'category', '', 9, 0),
(16, 16, 'category', '', 3, 0),
(17, 17, 'category', '', 16, 0),
(18, 18, 'category', '', 16, 0),
(19, 19, 'category', '', 16, 0),
(20, 20, 'category', '', 3, 0),
(21, 21, 'category', '', 20, 0),
(22, 22, 'category', '', 20, 0),
(23, 23, 'category', '', 20, 0),
(24, 24, 'category', '', 20, 0),
(25, 25, 'category', '', 20, 0),
(26, 26, 'category', '', 20, 0),
(27, 27, 'category', '', 20, 0),
(28, 28, 'category', '', 20, 0),
(29, 29, 'category', '', 20, 0),
(30, 30, 'category', '', 3, 0),
(31, 31, 'category', '', 3, 0),
(32, 32, 'category', '', 3, 0),
(33, 33, 'category', '', 3, 0),
(34, 34, 'category', '', 8, 0),
(35, 35, 'category', '', 34, 0),
(36, 36, 'category', '', 34, 0),
(37, 37, 'category', '', 34, 0),
(38, 38, 'category', '', 34, 0),
(39, 39, 'category', '', 34, 0),
(40, 40, 'category', '', 39, 0),
(41, 41, 'category', '', 39, 0),
(42, 42, 'category', '', 39, 0),
(43, 43, 'category', '', 39, 0),
(44, 44, 'category', '', 39, 0),
(45, 45, 'category', '', 9, 0),
(46, 46, 'category', '', 9, 0),
(47, 47, 'category', '', 35, 0),
(48, 48, 'category', '', 36, 0),
(49, 49, 'category', '', 37, 0),
(50, 50, 'category', '', 38, 0),
(51, 51, 'category', '', 45, 0),
(52, 52, 'category', '', 46, 0),
(53, 53, 'category', '', 46, 0),
(54, 54, 'category', '', 46, 0),
(55, 55, 'category', '', 46, 0),
(56, 56, 'category', '', 46, 0),
(57, 57, 'category', '', 46, 0),
(58, 58, 'category', '', 46, 0),
(59, 59, 'category', '', 46, 0),
(60, 60, 'category', '', 46, 0),
(61, 61, 'category', '', 46, 0),
(62, 62, 'category', '', 46, 0),
(63, 63, 'category', '', 46, 0),
(64, 64, 'category', '', 8, 0),
(65, 65, 'category', '', 64, 0),
(66, 66, 'category', '', 64, 0),
(67, 67, 'category', '', 64, 0),
(68, 68, 'category', '', 67, 0),
(69, 69, 'category', '', 66, 0),
(70, 70, 'category', '', 65, 0),
(71, 71, 'category', '', 8, 0),
(72, 72, 'category', '', 71, 0),
(73, 73, 'category', '', 71, 0),
(74, 74, 'category', '', 71, 0),
(75, 75, 'category', '', 72, 0),
(76, 76, 'category', '', 73, 0),
(77, 77, 'category', '', 8, 0),
(78, 78, 'category', '', 77, 0),
(79, 79, 'category', '', 77, 0),
(80, 80, 'category', '', 77, 0),
(81, 81, 'category', '', 77, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aec_usermeta`
--

CREATE TABLE IF NOT EXISTS `aec_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `aec_usermeta`
--

INSERT INTO `aec_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'aec_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'aec_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:2:{s:64:"79b3d647813ebee1f2efb45bcb7740b1b6ca564797bdc2993f68d9316303529b";a:4:{s:10:"expiration";i:1435744519;s:2:"ip";s:13:"192.168.0.134";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1435571719;}s:64:"e3bf587019d50d641895d77237336ed9e6fb74bb9b894b9feebb8cef0a067a79";a:4:{s:10:"expiration";i:1435811775;s:2:"ip";s:13:"192.168.0.134";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1435638975;}}'),
(15, 1, 'aec_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'closedpostboxes_post', 'a:0:{}'),
(17, 1, 'metaboxhidden_post', 'a:5:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:16:"commentstatusdiv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";}'),
(18, 1, 'aec_user-settings', 'libraryContent=browse'),
(19, 1, 'aec_user-settings-time', '1435573586'),
(20, 1, 'closedpostboxes_page', 'a:0:{}'),
(21, 1, 'metaboxhidden_page', 'a:4:{i:0;s:16:"commentstatusdiv";i:1;s:11:"commentsdiv";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";}');

-- --------------------------------------------------------

--
-- Table structure for table `aec_users`
--

CREATE TABLE IF NOT EXISTS `aec_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `aec_users`
--

INSERT INTO `aec_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BNU23IePN0Bs21V9tU6xvTh53cJXk00', 'admin', 'test@example.com', '', '2015-06-15 07:08:20', '', 0, 'admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aec_profilevalue`
--
ALTER TABLE `aec_profilevalue`
  ADD CONSTRAINT `aec_profilevalue_ibfk_1` FOREIGN KEY (`id`) REFERENCES `aec_profile` (`id`),
  ADD CONSTRAINT `aec_profilevalue_ibfk_2` FOREIGN KEY (`metaid`) REFERENCES `aec_profilemeta` (`metaid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
