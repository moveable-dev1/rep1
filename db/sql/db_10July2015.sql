-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2015 at 01:12 PM
-- Server version: 5.5.37-cll-lve
-- PHP Version: 5.4.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `marsaec`
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
-- Table structure for table `aec_gf_addon_feed`
--

CREATE TABLE IF NOT EXISTS `aec_gf_addon_feed` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `meta` longtext,
  `addon_slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_form` (`addon_slug`,`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=570 ;

--
-- Dumping data for table `aec_options`
--

INSERT INTO `aec_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://marsaec.lnx-local.com', 'yes'),
(2, 'home', 'http://marsaec.lnx-local.com', 'yes'),
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
(33, 'active_plugins', 'a:3:{i:0;s:29:"gravityforms/gravityforms.php";i:1;s:39:"gravity-forms-salesforce/salesforce.php";i:2;s:19:"profile/profile.php";}', 'yes'),
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
(101, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1436503945;s:15:"version_checked";s:5:"4.2.2";s:12:"translations";a:0:{}}', 'yes'),
(106, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1436503946;s:7:"checked";a:3:{s:13:"twentyfifteen";s:3:"1.2";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(107, '_transient_random_seed', 'bac8764022d574cf024899060b03ba32', 'yes'),
(111, 'can_compress_scripts', '1', 'yes'),
(130, 'recently_activated', 'a:0:{}', 'yes'),
(132, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1436516904;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.2";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.2.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}}}', 'yes'),
(151, '_site_transient_timeout_browser_a7cef1cfa83607636f838b5bc2f2e819', '1435037361', 'yes'),
(152, '_site_transient_browser_a7cef1cfa83607636f838b5bc2f2e819', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"43.0.2357.124";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(172, '_transient_doing_cron', '1436533731.3227310180664062500000', 'yes'),
(213, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(214, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(215, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(217, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(306, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1435572343;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(307, 'current_theme', 'Marsaec', 'yes'),
(308, 'theme_mods_marsaec', 'a:1:{i:0;b:0;}', 'yes'),
(309, 'theme_switched', '', 'yes'),
(314, 'WPLANG', '', 'yes'),
(319, 'vimeo_url', 'http://player.vimeo.com/video/60122989', 'yes'),
(320, 'profile_email', 'test@example.com', 'yes'),
(390, 'rewrite_rules', 'a:69:{s:18:"^profile/([^/]*)/?";s:40:"index.php?page_id=39&profile=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(474, '_transient_timeout_plugin_slugs', '1436603304', 'no'),
(475, '_transient_plugin_slugs', 'a:5:{i:0;s:19:"akismet/akismet.php";i:1;s:19:"profile/profile.php";i:2;s:29:"gravityforms/gravityforms.php";i:3;s:39:"gravity-forms-salesforce/salesforce.php";i:4;s:9:"hello.php";}', 'no'),
(480, 'category_children', 'a:24:{i:8;a:6:{i:0;i:3;i:1;i:9;i:2;i:34;i:3;i:64;i:4;i:71;i:5;i:77;}i:3;a:7:{i:0;i:4;i:1;i:16;i:2;i:20;i:3;i:30;i:4;i:31;i:5;i:32;i:6;i:33;}i:4;a:3:{i:0;i:5;i:1;i:6;i:2;i:7;}i:9;a:4:{i:0;i:10;i:1;i:15;i:2;i:45;i:3;i:46;}i:10;a:4:{i:0;i:11;i:1;i:12;i:2;i:13;i:3;i:14;}i:16;a:3:{i:0;i:17;i:1;i:18;i:2;i:19;}i:20;a:9:{i:0;i:21;i:1;i:22;i:2;i:23;i:3;i:24;i:4;i:25;i:5;i:26;i:6;i:27;i:7;i:28;i:8;i:29;}i:34;a:6:{i:0;i:35;i:1;i:36;i:2;i:38;i:3;i:39;i:4;i:49;i:5;i:83;}i:39;a:5:{i:0;i:40;i:1;i:41;i:2;i:42;i:3;i:43;i:4;i:44;}i:35;a:1:{i:0;i:47;}i:36;a:1:{i:0;i:48;}i:38;a:1:{i:0;i:50;}i:45;a:1:{i:0;i:51;}i:46;a:12:{i:0;i:52;i:1;i:53;i:2;i:54;i:3;i:55;i:4;i:56;i:5;i:57;i:6;i:58;i:7;i:59;i:8;i:60;i:9;i:61;i:10;i:62;i:11;i:63;}i:64;a:3:{i:0;i:65;i:1;i:66;i:2;i:67;}i:67;a:1:{i:0;i:68;}i:66;a:1:{i:0;i:69;}i:65;a:1:{i:0;i:70;}i:71;a:3:{i:0;i:72;i:1;i:73;i:2;i:74;}i:72;a:1:{i:0;i:75;}i:73;a:1:{i:0;i:76;}i:77;a:4:{i:0;i:78;i:1;i:79;i:2;i:80;i:3;i:81;}i:74;a:1:{i:0;i:82;}i:83;a:1:{i:0;i:84;}}', 'yes'),
(481, '_site_transient_timeout_theme_roots', '1436505745', 'yes'),
(482, '_site_transient_theme_roots', 'a:4:{s:7:"marsaec";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(483, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1436547151', 'no'),
(484, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 66.155.40.250: Network is unreachable</p></div><div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Failed to connect to 66.155.40.249: Network is unreachable</p></div><div class="rss-widget"><ul></ul></div>', 'no'),
(485, 'gravityformsaddon_gravityformswebapi_version', '1.0', 'yes'),
(486, 'gform_enable_background_updates', '1', 'yes'),
(487, 'rg_form_version', '1.9.10.15', 'yes'),
(488, '_transient_timeout_gform_update_info', '1436604629', 'no'),
(490, '_transient_gform_update_info', 'O:8:"WP_Error":2:{s:6:"errors";a:1:{s:19:"http_request_failed";a:1:{i:0;s:59:"Failed to connect to 173.254.93.192: Network is unreachable";}}s:10:"error_data";a:0:{}}', 'no'),
(492, 'gravityformsaddon_sf-a-loader_version', '3.1.2', 'yes'),
(493, 'gravityformsaddon_feed-base_version', '0.11', 'yes'),
(494, 'gravityformsaddon_sf-loader-daddy-analytics_version', '3.1.2', 'yes'),
(497, 'rg_gforms_message', '', 'yes'),
(498, 'rg_gforms_captcha_public_key', '', 'yes'),
(499, 'rg_gforms_captcha_private_key', '', 'yes'),
(500, 'rg_gforms_currency', 'USD', 'yes'),
(521, 'gform_email_count', '2', 'yes'),
(522, '_transient_timeout_GFCache_6ba0c53b43d7aa338e21e5a8a23be851', '1436513429', 'no'),
(523, '_transient_GFCache_6ba0c53b43d7aa338e21e5a8a23be851', '1', 'no'),
(524, '_transient_timeout_GFCache_464bfc041db66a9368f55113a6eadaa6', '1436512393', 'no'),
(525, '_transient_GFCache_464bfc041db66a9368f55113a6eadaa6', '1', 'no'),
(550, '_transient_timeout_GFCache_0c25fa25e7ed9903fb3662d6fd294f0e', '1436530307', 'no'),
(551, '_transient_GFCache_0c25fa25e7ed9903fb3662d6fd294f0e', '1', 'no'),
(552, '_transient_timeout_GFCache_ed2aa2eae817a235740d1d19c33253b5', '1436530741', 'no'),
(553, '_transient_GFCache_ed2aa2eae817a235740d1d19c33253b5', '1', 'no'),
(556, '_transient_timeout_GFCache_2baf93d70a70dcaec002078dce922f97', '1436531797', 'no'),
(557, '_transient_GFCache_2baf93d70a70dcaec002078dce922f97', '1', 'no'),
(558, '_transient_timeout_GFCache_0ba9e9726557080aa30eddc823dc05af', '1436530979', 'no'),
(559, '_transient_GFCache_0ba9e9726557080aa30eddc823dc05af', '1', 'no'),
(560, '_transient_timeout_GFCache_672cdfb2ae226cb1913cac611496ca00', '1436531002', 'no'),
(561, '_transient_GFCache_672cdfb2ae226cb1913cac611496ca00', '1', 'no'),
(562, '_transient_timeout_GFCache_22ac0d3351a1a9e98e274363b75fb451', '1436531470', 'no'),
(563, '_transient_GFCache_22ac0d3351a1a9e98e274363b75fb451', '1', 'no'),
(564, '_transient_timeout_GFCache_416bd9d26bd8fb487a9638f7fcde9759', '1436531795', 'no'),
(565, '_transient_GFCache_416bd9d26bd8fb487a9638f7fcde9759', '1', 'no'),
(568, '_transient_timeout_GFCache_2904f98f816637c181c870345b399d23', '1436533693', 'no'),
(569, '_transient_GFCache_2904f98f816637c181c870345b399d23', '1', 'no');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=53 ;

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
(16, 11, '_edit_lock', '1436527715:1'),
(17, 2, '_wp_trash_meta_status', 'publish'),
(18, 2, '_wp_trash_meta_time', '1435643577'),
(19, 14, '_edit_last', '1'),
(20, 14, '_edit_lock', '1436516158:1'),
(21, 16, '_edit_last', '1'),
(22, 16, '_edit_lock', '1436529997:1'),
(23, 18, '_edit_last', '1'),
(24, 18, '_edit_lock', '1436353182:1'),
(25, 20, '_edit_last', '1'),
(26, 20, '_edit_lock', '1435753139:1'),
(27, 22, '_edit_last', '1'),
(28, 22, '_edit_lock', '1436529788:1'),
(29, 24, '_edit_last', '1'),
(30, 24, '_edit_lock', '1436516176:1'),
(32, 20, '_wp_page_template', 'page-templates/submit-profile.php'),
(33, 24, '_wp_page_template', 'page-templates/rss-feed.php'),
(34, 28, '_edit_last', '1'),
(35, 28, '_edit_lock', '1436516185:1'),
(36, 28, '_wp_page_template', 'page-templates/search-result.php'),
(37, 35, '_edit_last', '1'),
(38, 35, '_edit_lock', '1436261687:1'),
(39, 35, '_wp_page_template', 'page-templates/thankyou.php'),
(40, 39, '_edit_last', '1'),
(41, 39, '_edit_lock', '1435909802:1'),
(42, 39, '_wp_page_template', 'page-templates/profle-detail.php'),
(43, 11, '_wp_page_template', 'default'),
(44, 14, '_wp_page_template', 'default'),
(45, 16, '_wp_page_template', 'default'),
(46, 22, '_wp_page_template', 'default'),
(47, 66, '_edit_last', '1'),
(48, 66, '_edit_lock', '1436530485:1'),
(49, 66, '_wp_page_template', 'default'),
(50, 68, '_edit_last', '1'),
(51, 68, '_wp_page_template', 'default'),
(52, 68, '_edit_lock', '1436531501:1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=70 ;

--
-- Dumping data for table `aec_posts`
--

INSERT INTO `aec_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-06-15 07:08:21', '2015-06-15 07:08:21', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world', '', '', '2015-06-18 08:41:37', '2015-06-18 08:41:37', '', 0, 'http://marsaec.lnx-local.com/?p=1', 0, 'post', '', 1),
(2, 1, '2015-06-15 07:08:21', '2015-06-15 07:08:21', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://marsaec.lnx-local.com/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'open', 'open', '', 'sample-page', '', '', '2015-06-30 05:52:57', '2015-06-30 05:52:57', '', 0, 'http://marsaec.lnx-local.com/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-06-15 07:08:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-15 07:08:56', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=3', 0, 'post', '', 0),
(4, 1, '2015-06-15 12:10:16', '2015-06-15 12:10:16', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-06-15 12:10:16', '2015-06-15 12:10:16', '', 1, 'http://marsaec.lnx-local.com/2015/06/15/1-revision-v1/', 0, 'revision', '', 0),
(5, 1, '2015-06-16 06:29:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-16 06:29:08', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=5', 0, 'post', '', 0),
(6, 1, '2015-06-16 06:38:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-16 06:38:25', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=6', 0, 'post', '', 0),
(7, 1, '2015-06-16 09:45:34', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-16 09:45:34', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=7', 0, 'post', '', 0),
(8, 1, '2015-06-19 06:28:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-19 06:28:31', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=8', 0, 'post', '', 0),
(9, 1, '2015-06-19 10:21:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-06-19 10:21:32', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=9', 0, 'post', '', 0),
(10, 1, '2015-06-29 10:25:15', '2015-06-29 10:25:15', '', '2000px-000080_Navy_Blue_Square.svg', '', 'inherit', 'open', 'open', '', '2000px-000080_navy_blue_square-svg', '', '', '2015-06-29 10:25:15', '2015-06-29 10:25:15', '', 0, 'http://marsaec.lnx-local.com/wp-content/uploads/2015/06/2000px-000080_Navy_Blue_Square.svg_.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2015-06-30 05:52:08', '2015-06-30 05:52:08', 'The Advanced Energy Centreâ€™s mission is to foster the adoption of innovative energy technologies in Ontario and Canada, and to leverage those successes and experiences into international energy markets.\r\n\r\nSince inception, the Advanced Energy Centre has been a catalyst for the adoption of energy innovation by facilitating collaborative solutions-based approaches to addressing complex system problems.\r\nThrough public-private partnerships, the Advanced Energy Centre undertakes programs that engage a diverse set of stakeholders- private companies, government agencies, academics and non-profits- towards integrated energy solutions.\r\n\r\n<a href="http://advancedenergycentre@marsdd.com" target="_blank">Learn more:</a>\r\n\r\n\r\n', 'What is the Advanced Energy Centre?', '', 'publish', 'open', 'open', '', 'about', '', '', '2015-07-10 06:18:39', '2015-07-10 06:18:39', '', 0, 'http://marsaec.lnx-local.com/?page_id=11', 0, 'page', '', 0),
(12, 1, '2015-06-30 05:52:08', '2015-06-30 05:52:08', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'About', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-06-30 05:52:08', '2015-06-30 05:52:08', '', 11, 'http://marsaec.lnx-local.com/2015/06/30/11-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2015-06-30 05:52:57', '2015-06-30 05:52:57', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://marsaec.lnx-local.com/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-06-30 05:52:57', '2015-06-30 05:52:57', '', 2, 'http://marsaec.lnx-local.com/?p=13', 0, 'revision', '', 0),
(14, 1, '2015-06-30 06:08:26', '2015-06-30 06:08:26', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h3>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h3>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\n<strong>Twitter</strong>: @Capgemini\r\n<strong>LinkedIn</strong>: Capgemini\r\n<h3>SIEMENS CANADA</h3>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n<strong>Twitter</strong>: @SiemensinCanada\r\n<strong>LinkedIn</strong>: Siemens Canada\r\n<h3>ONTARIO POWER GENERATION</h3>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\n<strong>Twitter</strong>: @opg\r\n<strong>LinkedIn</strong>: Ontario Power Generation\r\n<h3>HYDRO OTTAWA</h3>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\n<strong>Twitter</strong>: @hydroottawa\r\n<strong>LinkedIn</strong>: Hydro Ottawa\r\n\r\n</div>', 'Advanced Energy Centre Partners', '', 'publish', 'open', 'open', '', 'partners', '', '', '2015-07-10 06:12:06', '2015-07-10 06:12:06', '', 0, 'http://marsaec.lnx-local.com/?page_id=14', 0, 'page', '', 0),
(15, 1, '2015-06-30 06:08:26', '2015-06-30 06:08:26', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-06-30 06:08:26', '2015-06-30 06:08:26', '', 14, 'http://marsaec.lnx-local.com/?p=15', 0, 'revision', '', 0),
(16, 1, '2015-06-30 06:09:27', '2015-06-30 06:09:27', '[gravityform id="1" title="false" description="true" ajax="true"]\r\n\r\n<div class="form-btm-txt">Please note that all responses are up to individual companiesâ€™/projectâ€™s discretion. A Visible AEC administrator will be copied on your message for information purposes only.\r\nPlease donâ€™t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com</div>', 'Contact The Advanced Energy Centre', '', 'publish', 'open', 'open', '', 'contact', '', '', '2015-07-10 08:29:53', '2015-07-10 08:29:53', '', 0, 'http://marsaec.lnx-local.com/?page_id=16', 0, 'page', '', 0),
(17, 1, '2015-06-30 06:09:27', '2015-06-30 06:09:27', '', 'Contact', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-06-30 06:09:27', '2015-06-30 06:09:27', '', 16, 'http://marsaec.lnx-local.com/?p=17', 0, 'revision', '', 0),
(18, 1, '2015-06-30 06:09:51', '2015-06-30 06:09:51', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Terms & Conditions', '', 'publish', 'open', 'open', '', 'terms-conditions', '', '', '2015-06-30 06:09:51', '2015-06-30 06:09:51', '', 0, 'http://marsaec.lnx-local.com/?page_id=18', 0, 'page', '', 0),
(19, 1, '2015-06-30 06:09:51', '2015-06-30 06:09:51', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Terms & Conditions', '', 'inherit', 'open', 'open', '', '18-revision-v1', '', '', '2015-06-30 06:09:51', '2015-06-30 06:09:51', '', 18, 'http://marsaec.lnx-local.com/?p=19', 0, 'revision', '', 0),
(20, 1, '2015-06-30 06:11:28', '2015-06-30 06:11:28', '', 'Submit a Profile', '', 'publish', 'open', 'open', '', 'submit-a-profile', '', '', '2015-06-30 06:45:09', '2015-06-30 06:45:09', '', 0, 'http://marsaec.lnx-local.com/?page_id=20', 0, 'page', '', 0),
(21, 1, '2015-06-30 06:11:28', '2015-06-30 06:11:28', '', 'Submit a Profile', '', 'inherit', 'open', 'open', '', '20-revision-v1', '', '', '2015-06-30 06:11:28', '2015-06-30 06:11:28', '', 20, 'http://marsaec.lnx-local.com/?p=21', 0, 'revision', '', 0),
(22, 1, '2015-06-30 06:12:31', '2015-06-30 06:12:31', '[gravityform id="3" title="false" description="true" ajax="true"]\r\n\r\n<div class="form-btm-txt">Please note that all responses are up to individual companiesâ€™/projectâ€™s discretion. A Visible AEC administrator will be copied on your message for information purposes only.\r\nPlease donâ€™t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com</div>', 'Contact {Company/Project}', '', 'publish', 'open', 'open', '', 'contact-profile', '', '', '2015-07-10 08:30:54', '2015-07-10 08:30:54', '', 0, 'http://marsaec.lnx-local.com/?page_id=22', 0, 'page', '', 0),
(23, 1, '2015-06-30 06:12:31', '2015-06-30 06:12:31', '', 'Contact Profile', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-06-30 06:12:31', '2015-06-30 06:12:31', '', 22, 'http://marsaec.lnx-local.com/?p=23', 0, 'revision', '', 0),
(24, 1, '2015-06-30 06:20:17', '2015-06-30 06:20:17', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'RSS Feed', '', 'publish', 'open', 'open', '', 'rss-feed', '', '', '2015-06-30 07:02:06', '2015-06-30 07:02:06', '', 0, 'http://marsaec.lnx-local.com/?page_id=24', 0, 'page', '', 0),
(25, 1, '2015-06-30 06:20:17', '2015-06-30 06:20:17', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'RSS Feed', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-06-30 06:20:17', '2015-06-30 06:20:17', '', 24, 'http://marsaec.lnx-local.com/24-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2015-06-30 06:53:23', '2015-06-30 06:53:23', '', 'RSS Feed', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-06-30 06:53:23', '2015-06-30 06:53:23', '', 24, 'http://marsaec.lnx-local.com/24-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2015-06-30 07:02:06', '2015-06-30 07:02:06', '<div class="lc">\r\n\r\n<strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n</div>\r\n<div class="rc">\r\n<h2 class="why"></h2>\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'RSS Feed', '', 'inherit', 'open', 'open', '', '24-revision-v1', '', '', '2015-06-30 07:02:06', '2015-06-30 07:02:06', '', 24, 'http://marsaec.lnx-local.com/24-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2015-06-30 10:37:05', '2015-06-30 10:37:05', 'No matches found. Please search again.\r\n\r\nIf you know of an innovative company or project that would benefit from being featured on this website, direct them to submit a profile.', 'Search', '', 'publish', 'open', 'open', '', 'search', '', '', '2015-06-30 11:19:34', '2015-06-30 11:19:34', '', 0, 'http://marsaec.lnx-local.com/?page_id=28', 0, 'page', '', 0),
(29, 1, '2015-06-30 10:37:05', '2015-06-30 10:37:05', 'No results found', 'Search', '', 'inherit', 'open', 'open', '', '28-revision-v1', '', '', '2015-06-30 10:37:05', '2015-06-30 10:37:05', '', 28, 'http://marsaec.lnx-local.com/28-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2015-06-30 11:19:16', '2015-06-30 11:19:16', 'No matches found. Please search again.\n\nIf you know of an innovative company or project that would benefit from being featured on this website, direct them to submit a profile at [profile webform URL]', 'Search', '', 'inherit', 'open', 'open', '', '28-autosave-v1', '', '', '2015-06-30 11:19:16', '2015-06-30 11:19:16', '', 28, 'http://marsaec.lnx-local.com/28-autosave-v1/', 0, 'revision', '', 0),
(31, 1, '2015-06-30 11:19:34', '2015-06-30 11:19:34', 'No matches found. Please search again.\r\n\r\nIf you know of an innovative company or project that would benefit from being featured on this website, direct them to submit a profile.', 'Search', '', 'inherit', 'open', 'open', '', '28-revision-v1', '', '', '2015-06-30 11:19:34', '2015-06-30 11:19:34', '', 28, 'http://marsaec.lnx-local.com/28-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2015-07-02 06:22:36', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-02 06:22:36', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=32', 0, 'post', '', 0),
(33, 1, '2015-07-02 07:32:46', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-02 07:32:46', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?page_id=33', 0, 'page', '', 0),
(34, 1, '2015-07-02 07:33:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-02 07:33:00', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=34', 0, 'post', '', 0),
(35, 1, '2015-07-02 08:59:16', '2015-07-02 08:59:16', 'Thank you, your request has been sent. The AEC endeavours to respond to all enquiries within X business days.\r\n\r\nSubmit another profile:Â Click <a href="/submit-a-profile">here</a>\r\n\r\nHelp spread the word! Share this opportunity with other innovative Canadian energy companies or projects:', 'Thank you', '', 'publish', 'open', 'open', '', 'thankyou', '', '', '2015-07-07 09:36:52', '2015-07-07 09:36:52', '', 20, 'http://marsaec.lnx-local.com/?page_id=35', 0, 'page', '', 0),
(36, 1, '2015-07-02 08:59:16', '2015-07-02 08:59:16', 'Thank you for submitting', 'Thankyou', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2015-07-02 08:59:16', '2015-07-02 08:59:16', '', 35, 'http://marsaec.lnx-local.com/35-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2015-07-02 10:36:02', '2015-07-02 10:36:02', 'Thank you, your request has been sent. The AEC endeavours to respond to all enquiries within X business days.\r\n\r\nSubmit another profile: [link to Submit a Profile webform]\r\n\r\nHelp spread the word! Share this opportunity with other innovative Canadian energy companies or projects:', 'Thankyou', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2015-07-02 10:36:02', '2015-07-02 10:36:02', '', 35, 'http://marsaec.lnx-local.com/35-revision-v1/', 0, 'revision', '', 0),
(38, 1, '2015-07-02 10:36:18', '2015-07-02 10:36:18', 'Thank you, your request has been sent. The AEC endeavours to respond to all enquiries within X business days.\r\n\r\nSubmit another profile: [link to Submit a Profile webform]\r\n\r\nHelp spread the word! Share this opportunity with other innovative Canadian energy companies or projects:', 'Thank you', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2015-07-02 10:36:18', '2015-07-02 10:36:18', '', 35, 'http://marsaec.lnx-local.com/35-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2015-07-03 06:15:28', '2015-07-03 06:15:28', '', 'Profile', '', 'publish', 'open', 'open', '', 'profile', '', '', '2015-07-03 06:42:38', '2015-07-03 06:42:38', '', 0, 'http://marsaec.lnx-local.com/?page_id=39', 0, 'page', '', 0),
(40, 1, '2015-07-03 06:15:28', '2015-07-03 06:15:28', '', 'Profile', '', 'inherit', 'open', 'open', '', '39-revision-v1', '', '', '2015-07-03 06:15:28', '2015-07-03 06:15:28', '', 39, 'http://marsaec.lnx-local.com/39-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2015-07-03 08:58:21', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-03 08:58:21', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=41', 0, 'post', '', 0),
(42, 1, '2015-07-03 08:58:57', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-03 08:58:57', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?page_id=42', 0, 'page', '', 0),
(43, 1, '2015-07-07 05:18:45', '2015-07-07 05:18:45', 'The Advanced Energy Centreâ€™s mission is to foster the adoption of innovative energy technologies in Ontario and Canada, and to leverage those successes and experiences into international energy markets.\n\nSince inception, the Advanced Energy Centre has been a catalyst for the adoption of energy innovation by facilitating collaborative solutions-based approaches to addressing complex system problems.\nThrough public-private partnerships, the Advanced Energy Centre undertakes programs that engage a diverse set of stakeholders- private companies, government agencies, academics and non-profits- towards integrated energy solutions.', 'What is the Advanced Energy Centre?', '', 'inherit', 'open', 'open', '', '11-autosave-v1', '', '', '2015-07-07 05:18:45', '2015-07-07 05:18:45', '', 11, 'http://marsaec.lnx-local.com/11-autosave-v1/', 0, 'revision', '', 0),
(44, 1, '2015-07-07 05:18:57', '2015-07-07 05:18:57', 'The Advanced Energy Centreâ€™s mission is to foster the adoption of innovative energy technologies in Ontario and Canada, and to leverage those successes and experiences into international energy markets.\r\n\r\nSince inception, the Advanced Energy Centre has been a catalyst for the adoption of energy innovation by facilitating collaborative solutions-based approaches to addressing complex system problems.\r\nThrough public-private partnerships, the Advanced Energy Centre undertakes programs that engage a diverse set of stakeholders- private companies, government agencies, academics and non-profits- towards integrated energy solutions.', 'What is the Advanced Energy Centre?', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-07-07 05:18:57', '2015-07-07 05:18:57', '', 11, 'http://marsaec.lnx-local.com/11-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2015-07-07 06:00:03', '2015-07-07 06:00:03', '<div class="lc">\n\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at advancedenergycentre@marsdd.com\n<h2>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h2>\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\nTwitter: @Capgemini\nLinkedIn: Capgemini\n<h2>SIEMENS CANADA</h2>\nSiemens Logo\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\nTwitter: @SiemensinCanada\nLinkedIn: Siemens Canada\n<h2>ONTARIO POWER GENERATION</h2>\nOPG Logo\n\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\nTwitter: @opg\nLinkedIn: Ontario Power Generation\n<h2>HYDRO OTTAWA</h2>\nHO Logo\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\nTwitter: @hydroottawa\nLinkedIn: Hydro Ottawa\n\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-autosave-v1', '', '', '2015-07-07 06:00:03', '2015-07-07 06:00:03', '', 14, 'http://marsaec.lnx-local.com/14-autosave-v1/', 0, 'revision', '', 0),
(46, 1, '2015-07-07 05:59:02', '2015-07-07 05:59:02', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at advancedenergycentre@marsdd.com\r\n<h2>\r\nCAPGEMINI CENTRE FOR DIGITAL UTILITIES</h2>\r\nCapgemini Logo\r\n\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\nTwitter: @Capgemini\r\nLinkedIn: Capgemini\r\n<h2>\r\nSIEMENS CANADA</h2>\r\nSiemens Logo\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\nTwitter: @SiemensinCanada\r\nLinkedIn: Siemens Canada\r\n<h2>\r\nONTARIO POWER GENERATION</h2>\r\nOPG Logo\r\n\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\nTwitter: @opg\r\nLinkedIn: Ontario Power Generation\r\n<h2>\r\nHYDRO OTTAWA</h2>\r\nHO Logo\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\nTwitter: @hydroottawa\r\nLinkedIn: Hydro Ottawa\r\n\r\n</div>\r\n<div class="rc">\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 05:59:02', '2015-07-07 05:59:02', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(47, 1, '2015-07-07 06:00:52', '2015-07-07 06:00:52', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h2>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h2>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\nTwitter: @Capgemini\r\nLinkedIn: Capgemini\r\n<h2>SIEMENS CANADA</h2>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n\r\nTwitter: @SiemensinCanada\r\nLinkedIn: Siemens Canada\r\n<h2>ONTARIO POWER GENERATION</h2>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\nTwitter: @opg\r\nLinkedIn: Ontario Power Generation\r\n<h2>HYDRO OTTAWA</h2>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\nTwitter: @hydroottawa\r\nLinkedIn: Hydro Ottawa\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 06:00:52', '2015-07-07 06:00:52', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2015-07-07 06:01:28', '2015-07-07 06:01:28', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h2>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h2>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\n\r\n&nbsp;\r\nTwitter: @Capgemini\r\nLinkedIn: Capgemini\r\n<h2>SIEMENS CANADA</h2>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n\r\nTwitter: @SiemensinCanada\r\nLinkedIn: Siemens Canada\r\n<h2>ONTARIO POWER GENERATION</h2>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\nTwitter: @opg\r\nLinkedIn: Ontario Power Generation\r\n<h2>HYDRO OTTAWA</h2>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\nTwitter: @hydroottawa\r\nLinkedIn: Hydro Ottawa\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 06:01:28', '2015-07-07 06:01:28', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `aec_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(49, 1, '2015-07-07 06:01:42', '2015-07-07 06:01:42', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h2>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h2>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\nTwitter: @Capgemini\r\nLinkedIn: Capgemini\r\n<h2>SIEMENS CANADA</h2>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n\r\nTwitter: @SiemensinCanada\r\nLinkedIn: Siemens Canada\r\n<h2>ONTARIO POWER GENERATION</h2>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\nTwitter: @opg\r\nLinkedIn: Ontario Power Generation\r\n<h2>HYDRO OTTAWA</h2>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\nTwitter: @hydroottawa\r\nLinkedIn: Hydro Ottawa\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 06:01:42', '2015-07-07 06:01:42', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2015-07-07 06:03:57', '2015-07-07 06:03:57', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h2>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h2>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\n<strong>Twitter</strong>: @Capgemini\r\n<strong>LinkedIn</strong>: Capgemini\r\n<h2>SIEMENS CANADA</h2>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n<strong>Twitter</strong>: @SiemensinCanada\r\n<strong>LinkedIn</strong>: Siemens Canada\r\n<h2>ONTARIO POWER GENERATION</h2>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\n<strong>Twitter</strong>: @opg\r\n<strong>LinkedIn</strong>: Ontario Power Generation\r\n<h2>HYDRO OTTAWA</h2>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\n<strong>Twitter</strong>: @hydroottawa\r\n<strong>LinkedIn</strong>: Hydro Ottawa\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 06:03:57', '2015-07-07 06:03:57', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2015-07-07 06:04:19', '2015-07-07 06:04:19', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h3>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h3>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\n<strong>Twitter</strong>: @Capgemini\r\n<strong>LinkedIn</strong>: Capgemini\r\n<h2>SIEMENS CANADA</h2>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n<strong>Twitter</strong>: @SiemensinCanada\r\n<strong>LinkedIn</strong>: Siemens Canada\r\n<h2>ONTARIO POWER GENERATION</h2>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\n<strong>Twitter</strong>: @opg\r\n<strong>LinkedIn</strong>: Ontario Power Generation\r\n<h2>HYDRO OTTAWA</h2>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\n<strong>Twitter</strong>: @hydroottawa\r\n<strong>LinkedIn</strong>: Hydro Ottawa\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 06:04:19', '2015-07-07 06:04:19', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2015-07-07 06:04:38', '2015-07-07 06:04:38', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h3>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h3>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\n<strong>Twitter</strong>: @Capgemini\r\n<strong>LinkedIn</strong>: Capgemini\r\n<h3>SIEMENS CANADA</h3>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n<strong>Twitter</strong>: @SiemensinCanada\r\n<strong>LinkedIn</strong>: Siemens Canada\r\n<h3>ONTARIO POWER GENERATION</h3>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\n<strong>Twitter</strong>: @opg\r\n<strong>LinkedIn</strong>: Ontario Power Generation\r\n<h3>HYDRO OTTAWA</h3>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\n<strong>Twitter</strong>: @hydroottawa\r\n<strong>LinkedIn</strong>: Hydro Ottawa\r\n\r\n</div>', 'Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-07 06:04:38', '2015-07-07 06:04:38', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2015-07-07 09:36:52', '2015-07-07 09:36:52', 'Thank you, your request has been sent. The AEC endeavours to respond to all enquiries within X business days.\n\nSubmit another profile:Â Click <a href="/submit-a-profile">here</a>\n\nHelp spread the word! Share this opportunity with other innovative Canadian energy companies or projects:', 'Thank you', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2015-07-07 09:36:52', '2015-07-07 09:36:52', '', 35, 'http://marsaec.lnx-local.com/35-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2015-07-10 06:12:06', '2015-07-10 06:12:06', '<div class="lc">\r\n\r\nThe AEC engages with a variety of energy players across the energy system to facilitate the adoption of innovative energy technologies. If you are interested in engaging with the AEC on a project and joining our dynamic partnership network, please contact the Advanced Energy Centre Director of Partnerships at <a href="mailto:advancedenergycentre@marsdd.com">advancedenergycentre@marsdd.com</a>\r\n<h3>CAPGEMINI CENTRE FOR DIGITAL UTILITIES</h3>\r\nCapgemini is one of the worldâ€™s foremost providers of consulting, technology and outsourcing services. With a presence in 40 countries and more than 130,000 employees, the company helps clients create and deliver business and technology solutions that fit their needs and drive the results they want.\r\nAs a founding partner of the Advanced Energy Centre, Capgemini will leverage its global expertise and experience working with utilities serving more than 43 million customers around the world. It will work closely with high-potential Canadian technology providers to shape solutions for growing global markets, while providing insights regarding global solution development and deployment.\r\n<strong>Twitter</strong>: @Capgemini\r\n<strong>LinkedIn</strong>: Capgemini\r\n<h3>SIEMENS CANADA</h3>\r\nFor more than 100 years the innovative ideas from Siemens have helped make Canada a better place. With 46 offices and 18 manufacturing/assembly facilities across Canada, Siemensâ€™ 4,500 Canadian employees work together to provide answers that last in the fields of industry, energy, healthcare and infrastructure solutions for cities. In 2012, Siemens Canada opened a smart grid centre of competence (COC) and a research &amp; development (R&amp;D) centre in Fredericton, New Brunswick. A collaboration between Siemens and NB Power, involving a Smart Grid Reduce and Shift Demand (RASD) modernization plan, the centre will lead to investments in technology and engage customers, offering businesses and residents more choice and control over their energy consumption.\r\nThe centres also focus on building energy road maps, developing smart grid software, creating IT systems for smart grid applications, and developing partnerships with local universities. The Advanced Energy Centre will form an important element of Siemensâ€™ future activities with smart energy grids.\r\n<strong>Twitter</strong>: @SiemensinCanada\r\n<strong>LinkedIn</strong>: Siemens Canada\r\n<h3>ONTARIO POWER GENERATION</h3>\r\nOntario Power Generation is an Ontario-based electricity company. As one of the largest power companies in North America, OPG produces more than half the power used in most homes, schools, hospitals and businesses in Ontario. Through a focus on continuous improvement, OPG has built a solid track record of operational performance excellence, supplying safe and reliable electricity at a low cost. All aspects of OPGâ€™s business are guided by the values of safety, integrity, excellence, people and citizenship. OPG has strong programs in place to ensure that they operate in a safe, open and environmentally responsible manner.\r\n<strong>Twitter</strong>: @opg\r\n<strong>LinkedIn</strong>: Ontario Power Generation\r\n<h3>HYDRO OTTAWA</h3>\r\nHydro Ottawaâ€™s core businesses are delivering electricity, generating renewable power and providing energy conservation/management services. Hydro Ottawa is a community-owned, private company, delivering electricity to more than 319,500 customers in Ottawa and Casselman. It is the largest municipally-owned producer of green power in the province, with hydroelectric and landfill gas-to-energy generating facilities. Hydro Ottawa Holding Inc. (Hydro Ottawa) owns and operates two subsidiary companies, Hydro Ottawa Limited and Energy Ottawa Inc. The goal of Hydro Ottawaâ€™s partnership with the AEC is to rethink opportunities for better energy solutions, by driving innovation.\r\n<strong>Twitter</strong>: @hydroottawa\r\n<strong>LinkedIn</strong>: Hydro Ottawa\r\n\r\n</div>', 'Advanced Energy Centre Partners', '', 'inherit', 'open', 'open', '', '14-revision-v1', '', '', '2015-07-10 06:12:06', '2015-07-10 06:12:06', '', 14, 'http://marsaec.lnx-local.com/14-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2015-07-10 06:18:39', '2015-07-10 06:18:39', 'The Advanced Energy Centreâ€™s mission is to foster the adoption of innovative energy technologies in Ontario and Canada, and to leverage those successes and experiences into international energy markets.\r\n\r\nSince inception, the Advanced Energy Centre has been a catalyst for the adoption of energy innovation by facilitating collaborative solutions-based approaches to addressing complex system problems.\r\nThrough public-private partnerships, the Advanced Energy Centre undertakes programs that engage a diverse set of stakeholders- private companies, government agencies, academics and non-profits- towards integrated energy solutions.\r\n\r\n<a href="http://advancedenergycentre@marsdd.com" target="_blank">Learn more:</a>\r\n\r\n\r\n', 'What is the Advanced Energy Centre?', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-07-10 06:18:39', '2015-07-10 06:18:39', '', 11, 'http://marsaec.lnx-local.com/11-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2015-07-10 06:36:51', '2015-07-10 06:36:51', '[gravityform id="1" title="true" description="true" ajax="true"]', 'Contact', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-07-10 06:36:51', '2015-07-10 06:36:51', '', 16, 'http://marsaec.lnx-local.com/16-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2015-07-10 06:37:27', '2015-07-10 06:37:27', '[gravityform id="1" title="false" description="true" ajax="true"]', 'Contact The Advanced Energy Centre', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-07-10 06:37:27', '2015-07-10 06:37:27', '', 16, 'http://marsaec.lnx-local.com/16-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2015-07-10 07:37:24', '2015-07-10 07:37:24', '[gravityform id="3" title="false" description="true" ajax="true"]', 'Contact Profile', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-07-10 07:37:24', '2015-07-10 07:37:24', '', 22, 'http://marsaec.lnx-local.com/22-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2015-07-10 07:38:40', '2015-07-10 07:38:40', '[gravityform id="3" title="false" description="true" ajax="true"]', 'Contact {Company/Project}', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-07-10 07:38:40', '2015-07-10 07:38:40', '', 22, 'http://marsaec.lnx-local.com/22-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2015-07-10 08:27:28', '2015-07-10 08:27:28', '[gravityform id="3" title="false" description="true" ajax="true"]\r\n\r\nProin vulputate condimentum risus, nec congue arcu tempor et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer bibendum nunc nec libero bibendum, in eleifend felis egestas. Maecenas viverra bibendum quam non fermentum.', 'Contact {Company/Project}', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-07-10 08:27:28', '2015-07-10 08:27:28', '', 22, 'http://marsaec.lnx-local.com/22-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2015-07-10 08:27:55', '2015-07-10 08:27:55', '[gravityform id="3" title="false" description="true" ajax="true"]\r\n\r\n<div class="form-btm-txt">Proin vulputate condimentum risus, nec congue arcu tempor et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer bibendum nunc nec libero bibendum, in eleifend felis egestas. Maecenas viverra bibendum quam non fermentum.</div>', 'Contact {Company/Project}', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-07-10 08:27:55', '2015-07-10 08:27:55', '', 22, 'http://marsaec.lnx-local.com/22-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2015-07-10 08:29:07', '2015-07-10 08:29:07', '[gravityform id="1" title="false" description="true" ajax="true"]\r\n\r\n<div class="form-btm-txt">Proin vulputate condimentum risus, nec congue arcu tempor et. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer bibendum nunc nec libero bibendum, in eleifend felis egestas. Maecenas viverra bibendum quam non fermentum.</div>', 'Contact The Advanced Energy Centre', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-07-10 08:29:07', '2015-07-10 08:29:07', '', 16, 'http://marsaec.lnx-local.com/16-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2015-07-10 08:29:53', '2015-07-10 08:29:53', '[gravityform id="1" title="false" description="true" ajax="true"]\r\n\r\n<div class="form-btm-txt">Please note that all responses are up to individual companiesâ€™/projectâ€™s discretion. A Visible AEC administrator will be copied on your message for information purposes only.\r\nPlease donâ€™t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com</div>', 'Contact The Advanced Energy Centre', '', 'inherit', 'open', 'open', '', '16-revision-v1', '', '', '2015-07-10 08:29:53', '2015-07-10 08:29:53', '', 16, 'http://marsaec.lnx-local.com/16-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2015-07-10 08:30:54', '2015-07-10 08:30:54', '[gravityform id="3" title="false" description="true" ajax="true"]\r\n\r\n<div class="form-btm-txt">Please note that all responses are up to individual companiesâ€™/projectâ€™s discretion. A Visible AEC administrator will be copied on your message for information purposes only.\r\nPlease donâ€™t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com</div>', 'Contact {Company/Project}', '', 'inherit', 'open', 'open', '', '22-revision-v1', '', '', '2015-07-10 08:30:54', '2015-07-10 08:30:54', '', 22, 'http://marsaec.lnx-local.com/22-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2015-07-10 10:45:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-07-10 10:45:53', '0000-00-00 00:00:00', '', 0, 'http://marsaec.lnx-local.com/?p=65', 0, 'post', '', 0),
(66, 1, '2015-07-10 12:16:02', '2015-07-10 12:16:02', 'Thank you, your message has been sent. Please note that all responses are up to individual companiesâ€™/projectâ€™s discretion.\r\n\r\nPlease donâ€™t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com', 'Thank You', '', 'publish', 'open', 'open', '', 'thank-you', '', '', '2015-07-10 12:16:02', '2015-07-10 12:16:02', '', 22, 'http://marsaec.lnx-local.com/?page_id=66', 0, 'page', '', 0),
(67, 1, '2015-07-10 12:16:02', '2015-07-10 12:16:02', 'Thank you, your message has been sent. Please note that all responses are up to individual companiesâ€™/projectâ€™s discretion.\r\n\r\nPlease donâ€™t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com', 'Thank You', '', 'inherit', 'open', 'open', '', '66-revision-v1', '', '', '2015-07-10 12:16:02', '2015-07-10 12:16:02', '', 66, 'http://marsaec.lnx-local.com/66-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2015-07-10 12:17:43', '2015-07-10 12:17:43', 'Thank you, your message has been sent. The AEC endeavours to respond to all inquiries within 10 business days.', 'Thank You', '', 'publish', 'open', 'open', '', 'thank-you', '', '', '2015-07-10 12:17:43', '2015-07-10 12:17:43', '', 16, 'http://marsaec.lnx-local.com/?page_id=68', 0, 'page', '', 0),
(69, 1, '2015-07-10 12:17:43', '2015-07-10 12:17:43', 'Thank you, your message has been sent. The AEC endeavours to respond to all inquiries within 10 business days.', 'Thank You', '', 'inherit', 'open', 'open', '', '68-revision-v1', '', '', '2015-07-10 12:17:43', '2015-07-10 12:17:43', '', 68, 'http://marsaec.lnx-local.com/68-revision-v1/', 0, 'revision', '', 0);

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
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) NOT NULL,
  `website` varchar(150) NOT NULL,
  `facebook` varchar(150) NOT NULL,
  `twitter` varchar(150) NOT NULL,
  `linkedin` varchar(150) NOT NULL,
  `awards` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `permalink` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `profile_author` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=176 ;

--
-- Dumping data for table `aec_profile`
--

INSERT INTO `aec_profile` (`id`, `profile_type`, `name`, `logo`, `region`, `description`, `email`, `website`, `facebook`, `twitter`, `linkedin`, `awards`, `is_featured`, `status`, `permalink`, `created_at`, `updated_at`, `profile_author`) VALUES
(114, 2, '2MW Minto Flywheel System', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1.jpg', 1, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario electricity grid. The project was developed by Toronto based firm NRStor Inc and has been providing +/-2MWs of regulation services to the Ontario grid since July 2014.', 'aaron.lampe@temporalpower.com', 'http://temporalpower.com', '', '', '', '', 0, 1, '2mw-minto-flywheel-system', '0000-00-00 00:00:00', '2015-07-08 11:44:27', 0),
(118, 2, 'Essex Power Lines', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img2.jpg', 3, 'Smart Map provides the engineering and operational groups at an electric utility with a geographic analysis tool of their medium voltage distribution system. It helps you build an analytic model of your system and combines that with data from smart meters, wholesale meter points and other sensors to', 'gmoody@utilismartcorp.com', 'http://utilismartcorp.com', 'utilismart', '@utilismart', 'utilismart', '', 1, 1, 'essex-power-lines', '0000-00-00 00:00:00', '2015-07-09 06:19:50', 0),
(119, 2, 'Prolucid Smart Grid Power Technologies (Smart Grid Fund)', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img11.jpg', 3, 'Test Description', 'bob.leigh@prolucid.ca', 'http://prolucid.ca', '', '', '', '', 0, 1, 'prolucid-smart-grid-power-technologies-smart-grid-fund', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(120, 2, 'Upper Grand Solar Project', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img21.jpg', 1, 'Lorem Ipsum dummy text', 'mpochtaruk@heliene.ca', 'http://heliene.ca', '', '', '', '', 0, 1, 'upper-grand-solar-project', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(121, 2, 'Green Button', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img22.jpg', 3, 'The Green Button standard allows consumers to access and share their energy consumption data in a consistent, electronic and secure manner. The standard is also extensible to water data.  The st', 'ssud@marsdd.com', 'http://marsdd.com', '', '', '', '', 0, 1, 'green-button', '0000-00-00 00:00:00', '2015-07-09 12:13:23', 0),
(122, 2, 'Powerstream Fault Detection, Isolation, Restoration (FDIR) project', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img23.jpg', 3, 'As one of the largest utilities in Ontario serving nine municipalities, Powerstream operates on a fully integrated automatic isolation and restoration system developed by Survalent Technology. Survalentâ€™s FDIR solution enables automated switching and', 'nwijesundera@survalent.com', 'http://survalent.com', 'https://www.facebook.com/survalent', 'https://twitter.com/#%21/survalent', 'https://www.linkedin.com/company/survalent-technology', '', 0, 1, 'powerstream-fault-detection-isolation-restoration-fdir-project', '0000-00-00 00:00:00', '2015-07-08 11:42:39', 0),
(123, 1, 'Enbala Power (Colombia)', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img25.jpg', 3, 'Enbala operates the Grid Operational Flexibility (GOFlex) platform, a multi-service, integrated grid software platform that offers a widespread and adaptable suite of grid optimization applications to support three operational areas within the indust', 'admin@aec.com', 'http://www.enbala.com', '', 'https://twitter.com/ENBALA', 'https://www.linkedin.com/company/enbala-power-networks', '', 0, 1, 'enbala-power-colombia', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(124, 1, 'Heliene', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img12.jpg', 3, 'Core ECOP competencies include complex lighting retrofits via Sun Industries, high-quality and low-cost LED lighting products, wireless energy management systems that are plug-and-play and compatible with multiple technologies (HVAC, plug load, etc.)', 'mpochtaruk@heliene.ca', 'http://www.heliene.ca/projects/details.aspx?l=0,9,589,590,598', '', '', '', '', 0, 1, 'heliene', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(125, 1, 'Hydrostor', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img26.jpg', 3, 'Hydrostor develops underwater compressed air energy storage systems. The companyâ€™s patent-protected technology efficiently converts electrical energy into compressed air, then stores it in a series of flexible energy accumulators located 50 to 500 me', 'test@test.com', 'http://hydrostor.ca', '', '', '', '', 0, 1, 'hydrostor', '0000-00-00 00:00:00', '2015-07-08 11:42:02', 0),
(130, 1, 'EyeDro Green Solutions Inc', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img13.jpg', 3, 'Eyedro Green Solutions Inc. is a software and electronics design company making electricity usage easy to understand. The company provides simple solutions for monitoring your electricity in real time. Combined with the MyEyedro cloud service, Eyedro', 'test@test.com', 'http://www.eyedro.com', 'https://www.facebook.com/eyedro1', 'https://twitter.com/Eyedro', 'https://www.linkedin.com/company/eyedro-green-solutions-inc-?trk=biz-companies-cym', '', 0, 1, 'eyedro-green-solutions-inc', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(131, 1, 'SPARQ Systems Inc.', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img14.jpg', 3, 'SPARQ Systems develops and sells advanced photovoltaic microinverters for residential solar systems that convert power produced from solar panels into electricity that can be used by the grid. The companyâ€™s user-friendly software-based system elimina', 'test@test.com', 'http://www.sparqsys.com', 'test2', 'test', 'test3', '<a href=\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;http://this\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\" target=\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;_blank\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\">testlink</a>', 1, 1, 'sparq-systems-inc', '0000-00-00 00:00:00', '2015-07-09 05:56:53', 0),
(132, 1, 'Utilismart Corporation (Colombia)', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img15.jpg', 1, 'Utilismart has created and operates its own secure, cloud-based Meter Data Management system along with a wide range of AMI software solutions and data services for utilities, municipalities, industrial, commercial and residential consumers. Utilisma', 'test2@test.com', 'http://xyz.com', '', '', '', '', 1, 1, 'utilismart-corporation-colombia', '0000-00-00 00:00:00', '2015-07-08 11:43:17', 0),
(133, 1, 'Amway', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img167.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'amway', '2015-07-10 04:41:25', '2015-07-10 08:57:04', 0),
(134, 1, 'Essex Power Lines', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img168.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosedsfsfs Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario eTemporal Powerâ€™s breakt', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'essex-power-lines-test-by-dev2', '2015-07-10 04:41:49', '2015-07-10 08:51:06', 0),
(135, 1, 'Cargill', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img169.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'cargill', '2015-07-10 04:42:13', '2015-07-10 08:52:51', 0),
(136, 1, 'Koach', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img170.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'koach', '2015-07-10 04:42:37', '2015-07-10 08:53:32', 0),
(137, 1, 'Bechtel', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img171.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'bechtel', '2015-07-10 04:43:02', '2015-07-10 08:53:51', 0),
(138, 1, 'Pilot J', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img172.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'pilot-j', '2015-07-10 04:43:26', '2015-07-10 08:55:54', 0),
(139, 1, 'Ernst & young', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img173.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'ernst-young', '2015-07-10 05:11:07', '2015-07-10 08:56:20', 0),
(140, 1, 'Cox', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img174.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'cox', '2015-07-10 05:12:20', '2015-07-10 08:56:48', 0),
(141, 1, 'Gaint', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img175.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'gaint', '2015-07-10 05:14:41', '2015-07-10 08:59:24', 0),
(142, 1, 'Alliges', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img176.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'alliges', '2015-07-10 05:18:38', '2015-07-10 08:59:51', 0),
(143, 1, 'BI-LO Holding', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img177.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'bi-lo-holding', '2015-07-10 05:20:33', '2015-07-10 09:00:12', 0),
(144, 1, 'SC JHONSON', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img178.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'sc-jhonson', '2015-07-10 05:21:01', '2015-07-10 09:00:37', 0),
(145, 1, 'Tenska', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img179.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'tenska', '2015-07-10 05:21:27', '2015-07-10 09:00:55', 0),
(146, 1, 'WAWA', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img180.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'wawa', '2015-07-10 05:21:55', '2015-07-10 09:01:09', 0),
(147, 1, 'HEARST', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img181.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'hearst', '2015-07-10 05:22:19', '2015-07-10 09:01:25', 0),
(148, 1, 'BLOOMBURG', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img182.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'bloomburg', '2015-07-10 05:22:44', '2015-07-10 09:01:45', 0),
(149, 1, 'MANARD', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img183.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'manard', '2015-07-10 05:23:09', '2015-07-10 09:02:01', 0),
(150, 1, 'HY VEE', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img184.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'hy-vee', '2015-07-10 05:23:35', '2015-07-10 09:02:15', 0),
(151, 1, 'GULF STATE', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img185.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'gulf-state', '2015-07-10 05:24:01', '2015-07-10 09:02:36', 0),
(152, 1, 'CAPTIAL GROUP ', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img186.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'captial-group', '2015-07-10 05:24:26', '2015-07-10 09:03:01', 0),
(153, 1, 'MOMENTIVE', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img187.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'momentive', '2015-07-10 05:24:51', '2015-07-10 09:03:20', 0),
(154, 1, 'SCHINCLEAR', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img188.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'schinclear', '2015-07-10 05:25:17', '2015-07-10 09:03:53', 0),
(155, 1, 'GOLDEN STATE ', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img189.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'golden-state', '2015-07-10 05:25:42', '2015-07-10 09:05:50', 0),
(156, 1, 'SHEETZ', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img190.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'sheetz', '2015-07-10 05:26:06', '2015-07-10 09:06:07', 0),
(157, 1, 'OIS GROUP', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img191.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'ois-group', '2015-07-10 05:26:31', '2015-07-10 09:06:33', 0),
(158, 1, 'SCOULAR', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img192.jpg', 2, 'this is test message.', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'scoular', '2015-07-10 05:26:57', '2015-07-10 09:06:58', 0),
(159, 1, 'PERDUE', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img193.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'perdue', '2015-07-10 05:41:24', '2015-07-10 09:07:32', 0),
(160, 1, 'JR SIMPLOT', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img194.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 1, 'jr-simplot', '2015-07-10 05:41:51', '2015-07-10 09:07:53', 0),
(161, 1, 'DOLE', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img195.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 1, 1, 'dole', '2015-07-10 05:44:28', '2015-07-10 09:23:10', 0),
(162, 1, 'WINCO', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img196.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'winco', '2015-07-10 05:53:33', '2015-07-10 09:08:41', 0),
(163, 1, 'EBY BROWN', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img197.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'eby-brown', '2015-07-10 05:54:00', '2015-07-10 09:09:04', 0),
(164, 1, 'CALSON', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img198.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'calson', '2015-07-10 05:54:25', '2015-07-10 09:23:27', 0),
(165, 1, 'APEX OIL', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img199.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'apex-oil', '2015-07-10 05:54:51', '2015-07-10 09:09:19', 0),
(166, 1, 'DOT FOOD ', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1100.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'dot-food', '2015-07-10 05:55:19', '2015-07-10 09:15:20', 0),
(167, 1, 'GILBANE', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1101.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'gilbane', '2015-07-10 05:55:45', '2015-07-10 09:26:39', 0),
(168, 1, 'RENCO', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1102.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'renco', '2015-07-10 05:56:11', '2015-07-10 09:18:16', 0),
(169, 1, 'BELK', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1103.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'belk', '2015-07-10 05:56:51', '2015-07-10 09:26:52', 0),
(170, 1, 'KOHLER', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1104.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'kohler', '2015-07-10 05:57:18', '2015-07-10 09:18:30', 0),
(171, 1, 'BELK2', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1105.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'belk2', '2015-07-10 05:57:45', '2015-07-10 10:57:24', 0),
(172, 1, 'RENCO GROUP', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1106.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'renco-group', '2015-07-10 05:58:15', '2015-07-10 09:18:48', 0),
(173, 1, 'SHI INTERNATIONAL ', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1107.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'shi-international', '2015-07-10 05:58:41', '2015-07-10 09:19:07', 0),
(174, 1, 'HUNT', 'http://marsaec.lnx-local.com/wp-content/uploads/profile/logo/company-img1108.jpg', 2, 'Temporal Powerâ€™s breakthrough flywheel energy storage system was chosen by the Independent Electricity System Operator (IESO) in the Province of Ontario to deliver regulation services to the Ontario e', 'aaron.lampe@temporalpower.com', 'http://www.autolubricator.com/', 'utilismart', '@TomMoodyCricket', 'utilismart-corporation', '', 0, 0, 'hunt', '2015-07-10 05:59:07', '2015-07-10 09:22:51', 0);

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
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`valueid`),
  KEY `id` (`id`),
  KEY `metaid` (`metaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9089 ;

--
-- Dumping data for table `aec_profilevalue`
--

INSERT INTO `aec_profilevalue` (`valueid`, `id`, `metaid`, `fieldid`, `value`) VALUES
(738, 119, 16, 1, '15'),
(902, 124, 9, 2, '2'),
(1005, 130, 9, 2, '2'),
(2013, 118, 9, 1, '1'),
(2014, 118, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic11.jpg'),
(2023, 119, 9, 1, '1'),
(2024, 119, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic2.jpg'),
(2036, 120, 9, 3, '3'),
(2037, 120, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/2000px-000080_Navy_Blue_Square.svg_2.png'),
(2038, 120, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/red-052.jpg'),
(2039, 120, 8, 3, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic12.jpg'),
(2056, 121, 9, 1, '1'),
(2057, 121, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic13.jpg'),
(2066, 122, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/demo-image-2.jpg'),
(2067, 122, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/red-05.jpg'),
(2068, 122, 8, 3, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic14.jpg'),
(2079, 123, 9, 1, '1'),
(2088, 123, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic15.jpg'),
(2089, 123, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic16.jpg'),
(2098, 124, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/demo-image-21.jpg'),
(2099, 124, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/red-051.jpg'),
(2100, 124, 8, 3, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic21.jpg'),
(2213, 131, 9, 1, '1'),
(2383, 130, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic22.jpg'),
(2743, 119, 1, 1, 'LocalGrid; Smart Grid Fund '),
(2744, 119, 3, 1, 'Regus City West'),
(2745, 119, 4, 1, 'Leeds'),
(2746, 119, 5, 1, 'London'),
(2747, 119, 6, 1, 'United Kingdom'),
(2748, 119, 7, 1, 'LS12 6LN'),
(2749, 119, 15, 1, ''),
(2750, 120, 1, 1, 'Heliene'),
(2751, 120, 3, 1, 'Test street'),
(2752, 120, 4, 1, 'London'),
(2753, 120, 5, 1, 'London'),
(2754, 120, 6, 1, 'United Kingdom'),
(2755, 120, 7, 1, 'N6E 1A2'),
(2756, 120, 15, 1, ''),
(2757, 120, 16, 1, '77'),
(2782, 123, 1, 1, 'test company'),
(2783, 123, 3, 1, '930 1st St W #211'),
(2784, 123, 4, 1, 'North Vancouver'),
(2785, 123, 5, 1, 'North Vancouver'),
(2786, 123, 6, 1, 'United Kingdom'),
(2787, 123, 7, 1, 'BC V7P 3N4'),
(2788, 123, 15, 1, ''),
(2789, 123, 16, 1, '77'),
(2790, 124, 1, 1, 'test company'),
(2791, 124, 3, 1, 'Test street'),
(2792, 124, 4, 1, 'Leeds'),
(2793, 124, 5, 1, 'London'),
(2794, 124, 6, 1, 'United Kingdom'),
(2795, 124, 7, 1, 'LS12 6LN'),
(2796, 124, 15, 1, ''),
(2797, 124, 16, 1, '9'),
(2798, 124, 16, 2, '15'),
(2810, 130, 1, 1, 'test company'),
(2811, 130, 3, 1, 'Test street'),
(2812, 130, 4, 1, 'London'),
(2813, 130, 5, 1, 'London'),
(2814, 130, 6, 1, 'United Kingdom'),
(2815, 130, 7, 1, 'N6E 1A2'),
(2816, 130, 12, 1, 'Burlington Hydro'),
(2817, 130, 15, 1, ''),
(2818, 130, 16, 1, '77'),
(2819, 130, 16, 2, '71'),
(2820, 130, 16, 3, '73'),
(2821, 130, 16, 4, '72'),
(2822, 130, 16, 5, '76'),
(4466, 132, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic211.jpg'),
(4467, 132, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic123.jpg'),
(4610, 114, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic1.jpg'),
(4611, 114, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic126.jpg'),
(4612, 114, 8, 3, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic127.jpg'),
(4613, 114, 8, 4, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic128.jpg'),
(6590, 131, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic23.jpg'),
(6591, 131, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic135.jpg'),
(6592, 131, 8, 3, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss130.png'),
(6593, 131, 8, 4, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img17.jpg'),
(6594, 131, 8, 5, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images6.jpg'),
(6595, 131, 8, 6, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/19.jpg'),
(6596, 131, 8, 7, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss131.png'),
(6597, 131, 8, 8, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img18.jpg'),
(6598, 131, 8, 9, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images7.jpg'),
(6599, 131, 8, 10, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/110.jpg'),
(6600, 131, 8, 11, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img24.jpg'),
(6601, 131, 8, 12, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img19.jpg'),
(6687, 125, 1, 1, 'Test User'),
(6688, 125, 3, 1, 'Test street'),
(6689, 125, 4, 1, 'Leeds'),
(6690, 125, 5, 1, 'London'),
(6691, 125, 6, 1, 'United Kingdom'),
(6692, 125, 7, 1, 'LS12 6LN'),
(6693, 125, 15, 1, ''),
(6694, 125, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic17.jpg'),
(6695, 125, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic226.jpg'),
(6696, 125, 16, 1, '3'),
(6697, 125, 16, 2, '64'),
(6698, 125, 16, 3, '20'),
(6699, 125, 16, 4, '32'),
(6700, 125, 9, 2, '2'),
(6701, 122, 1, 1, 'PowerStream'),
(6702, 122, 1, 2, 'Survalent'),
(6703, 122, 3, 1, 'Test street'),
(6704, 122, 4, 1, 'London'),
(6705, 122, 5, 1, 'London'),
(6706, 122, 6, 1, 'United Kingdom'),
(6707, 122, 7, 1, 'N6E 1A2'),
(6708, 122, 15, 1, ''),
(6709, 122, 16, 1, '9'),
(6710, 122, 9, 3, '3'),
(6711, 132, 1, 1, 'test company'),
(6712, 132, 3, 1, 'Test street'),
(6713, 132, 4, 1, 'London'),
(6714, 132, 5, 1, 'London'),
(6715, 132, 6, 1, 'United Kingdom'),
(6716, 132, 7, 1, 'LS12 6LN'),
(6717, 132, 15, 1, ''),
(6718, 132, 16, 1, '64'),
(6719, 132, 16, 2, '9'),
(6720, 132, 16, 3, '65'),
(6721, 132, 16, 4, '66'),
(6722, 132, 16, 5, '15'),
(6723, 132, 9, 2, '2'),
(6724, 114, 1, 1, 'Temporal Power; NRStor Inc; IESO'),
(6725, 114, 3, 1, 'Test street'),
(6726, 114, 4, 1, 'Leeds'),
(6727, 114, 5, 1, 'London'),
(6728, 114, 6, 1, 'United Kingdom'),
(6729, 114, 7, 1, 'LS12 6LN'),
(6730, 114, 15, 1, ''),
(6731, 114, 16, 1, '9'),
(6732, 114, 16, 2, '77'),
(6733, 114, 16, 3, '45'),
(6734, 114, 16, 4, '46'),
(6735, 114, 16, 5, '79'),
(6736, 114, 16, 6, '60'),
(6737, 114, 16, 7, '57'),
(6738, 114, 9, 4, '4'),
(6842, 131, 1, 1, 'test company'),
(6843, 131, 3, 1, '555 '),
(6844, 131, 4, 1, 'Southdale '),
(6845, 131, 5, 1, ' 01, London, ON'),
(6846, 131, 6, 1, ' United Kingdom'),
(6847, 131, 7, 1, 'N6E 1A2'),
(6848, 131, 12, 1, 'Invester 1'),
(6849, 131, 13, 1, 'testUrl'),
(6850, 131, 15, 1, ''),
(6851, 131, 14, 1, 'http://player.vimeo.com/video/60122989'),
(6852, 131, 14, 2, 'http://player.vimeo.com/video/132068126'),
(6853, 131, 16, 1, '3'),
(6854, 131, 16, 2, '64'),
(6855, 131, 16, 3, '9'),
(6856, 131, 16, 4, '4'),
(6857, 131, 16, 5, '10'),
(6858, 131, 16, 6, '5'),
(6859, 131, 16, 7, '6'),
(6928, 118, 1, 1, 'Utilismart Corporation, SmartMap'),
(6929, 118, 3, 1, '555 Southdale Rd E #201'),
(6930, 118, 4, 1, 'London'),
(6931, 118, 5, 1, 'London'),
(6932, 118, 6, 1, 'United Kingdom'),
(6933, 118, 7, 1, 'N6E 1A2'),
(6934, 118, 15, 1, ''),
(6935, 118, 16, 1, '9'),
(6936, 118, 16, 2, '77'),
(6937, 118, 16, 3, '45'),
(6938, 118, 16, 4, '15'),
(6939, 118, 16, 5, '10'),
(6940, 118, 16, 6, '51'),
(6941, 118, 16, 7, '14'),
(6942, 118, 16, 8, '11'),
(6943, 118, 16, 9, '12'),
(6944, 118, 16, 10, '13'),
(7619, 121, 1, 1, 'Aegent'),
(7620, 121, 1, 2, 'BuiltSpace'),
(7621, 121, 1, 3, 'Bidgle'),
(7622, 121, 1, 4, 'Frontier'),
(7623, 121, 1, 5, 'Energent'),
(7624, 121, 3, 1, 'Test street'),
(7625, 121, 4, 1, 'Leeds'),
(7626, 121, 5, 1, 'London'),
(7627, 121, 6, 1, 'United Kingdom'),
(7628, 121, 7, 1, 'LS12 6LN'),
(7629, 121, 15, 1, ''),
(7630, 121, 16, 1, '3'),
(7631, 121, 16, 2, '64'),
(7632, 121, 16, 3, '9'),
(7633, 121, 16, 4, '66'),
(7634, 121, 16, 5, '67'),
(7635, 121, 16, 6, '20'),
(7664, 134, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss159.png'),
(7679, 135, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss160.png'),
(7694, 136, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss161.png'),
(7709, 137, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss162.png'),
(7724, 138, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss163.png'),
(7740, 139, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images9.jpg'),
(7756, 140, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images10.jpg'),
(7772, 141, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images11.jpg'),
(7788, 142, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images12.jpg'),
(7803, 143, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images13.jpg'),
(7818, 144, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images14.jpg'),
(7833, 145, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images15.jpg'),
(7848, 146, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images16.jpg'),
(7863, 147, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images17.jpg'),
(7878, 148, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images18.jpg'),
(7893, 149, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images19.jpg'),
(7908, 150, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images20.jpg'),
(7923, 151, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images21.jpg'),
(7938, 152, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images22.jpg'),
(7953, 153, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images23.jpg'),
(7968, 154, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images24.jpg'),
(7983, 155, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images25.jpg'),
(7998, 156, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images26.jpg'),
(8013, 157, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/images27.jpg'),
(8106, 159, 9, 1, '1'),
(8155, 162, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic142.jpg'),
(8156, 162, 9, 1, '1'),
(8171, 163, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic143.jpg'),
(8172, 163, 9, 1, '1'),
(8187, 164, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic144.jpg'),
(8188, 164, 9, 1, '1'),
(8203, 165, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic145.jpg'),
(8204, 165, 9, 1, '1'),
(8219, 166, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic146.jpg'),
(8220, 166, 9, 1, '1'),
(8235, 167, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic147.jpg'),
(8236, 167, 9, 1, '1'),
(8251, 168, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic148.jpg'),
(8252, 168, 9, 1, '1'),
(8267, 169, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic149.jpg'),
(8268, 169, 9, 1, '1'),
(8283, 170, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic150.jpg'),
(8284, 170, 9, 1, '1'),
(8299, 171, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic151.jpg'),
(8300, 171, 9, 1, '1'),
(8315, 172, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic152.jpg'),
(8316, 172, 9, 1, '1'),
(8331, 173, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic153.jpg'),
(8332, 173, 9, 1, '1'),
(8347, 174, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic154.jpg'),
(8348, 174, 9, 1, '1'),
(8410, 133, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss158.png'),
(8411, 133, 8, 2, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic229.jpg'),
(8412, 133, 8, 3, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img111.jpg'),
(8413, 133, 8, 4, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img25.jpg'),
(8414, 133, 8, 5, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic155.jpg'),
(8415, 133, 8, 6, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss164.png'),
(8416, 133, 8, 7, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic230.jpg'),
(8417, 133, 8, 8, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/company-img112.jpg'),
(8418, 133, 8, 9, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/ss165.png'),
(8425, 133, 9, 5, '5'),
(8460, 134, 1, 1, 'Avon Seals Private Limited'),
(8461, 134, 3, 1, '555'),
(8462, 134, 4, 1, ' Rd E #201'),
(8463, 134, 5, 1, 'Southdale'),
(8464, 134, 6, 1, 'London'),
(8465, 134, 7, 1, 'ON N6E 1A2'),
(8466, 134, 12, 1, 'Human Impact Engineering'),
(8467, 134, 15, 1, ' Hydraulics DY'),
(8468, 134, 16, 1, '3'),
(8469, 134, 16, 2, '30'),
(8470, 134, 16, 3, '16'),
(8471, 134, 16, 4, '17'),
(8472, 134, 16, 5, '18'),
(8473, 134, 16, 6, '19'),
(8488, 135, 1, 1, 'APIL'),
(8489, 135, 3, 1, '555'),
(8490, 135, 4, 1, ' Rd E #201'),
(8491, 135, 5, 1, 'Southdale'),
(8492, 135, 6, 1, 'London'),
(8493, 135, 7, 1, 'ON N6E 1A2'),
(8494, 135, 12, 1, 'Human Impact Engineering'),
(8495, 135, 15, 1, 'DK Hydraulics'),
(8496, 135, 16, 1, '3'),
(8497, 135, 16, 2, '30'),
(8498, 135, 16, 3, '16'),
(8499, 135, 16, 4, '17'),
(8500, 135, 16, 5, '18'),
(8501, 135, 16, 6, '19'),
(8502, 136, 1, 1, 'APIL'),
(8503, 136, 3, 1, '555'),
(8504, 136, 4, 1, ' Rd E #201'),
(8505, 136, 5, 1, 'Southdale'),
(8506, 136, 6, 1, 'London'),
(8507, 136, 7, 1, 'ON N6E 1A2'),
(8508, 136, 12, 1, 'Human Impact Engineering'),
(8509, 136, 15, 1, 'DK Hydraulics'),
(8510, 136, 16, 1, '3'),
(8511, 136, 16, 2, '30'),
(8512, 136, 16, 3, '16'),
(8513, 136, 16, 4, '17'),
(8514, 136, 16, 5, '18'),
(8515, 136, 16, 6, '19'),
(8516, 137, 1, 1, 'Avon Seals Private Limited'),
(8517, 137, 3, 1, '555'),
(8518, 137, 4, 1, ' Rd E #201'),
(8519, 137, 5, 1, 'Southdale'),
(8520, 137, 6, 1, 'London'),
(8521, 137, 7, 1, 'ON N6E 1A2'),
(8522, 137, 12, 1, 'Human Impact Engineering'),
(8523, 137, 15, 1, ' Hydraulics DY'),
(8524, 137, 16, 1, '3'),
(8525, 137, 16, 2, '30'),
(8526, 137, 16, 3, '16'),
(8527, 137, 16, 4, '17'),
(8528, 137, 16, 5, '18'),
(8529, 137, 16, 6, '19'),
(8530, 138, 1, 1, 'APIL'),
(8531, 138, 3, 1, '555'),
(8532, 138, 4, 1, ' Rd E #201'),
(8533, 138, 5, 1, 'Southdale'),
(8534, 138, 6, 1, 'London'),
(8535, 138, 7, 1, 'ON N6E 1A2'),
(8536, 138, 12, 1, 'Human Impact Engineering'),
(8537, 138, 15, 1, 'DK Hydraulics'),
(8538, 138, 16, 1, '3'),
(8539, 138, 16, 2, '30'),
(8540, 138, 16, 3, '16'),
(8541, 138, 16, 4, '17'),
(8542, 138, 16, 5, '18'),
(8543, 138, 16, 6, '19'),
(8544, 139, 1, 1, 'APIL'),
(8545, 139, 3, 1, '555'),
(8546, 139, 4, 1, ' Rd E #201'),
(8547, 139, 5, 1, 'Southdale'),
(8548, 139, 6, 1, 'London'),
(8549, 139, 7, 1, 'ON N6E 1A2'),
(8550, 139, 12, 1, 'Human Impact Engineering'),
(8551, 139, 15, 1, 'DK Hydraulics'),
(8552, 139, 16, 1, '9'),
(8553, 139, 16, 2, '77'),
(8554, 139, 16, 3, '71'),
(8555, 139, 16, 4, '74'),
(8556, 139, 16, 5, '73'),
(8557, 139, 16, 6, '72'),
(8558, 139, 16, 7, '76'),
(8559, 140, 1, 1, 'APIL'),
(8560, 140, 3, 1, '555'),
(8561, 140, 4, 1, ' Rd E #201'),
(8562, 140, 5, 1, 'Southdale'),
(8563, 140, 6, 1, 'London'),
(8564, 140, 7, 1, 'ON N6E 1A2'),
(8565, 140, 12, 1, 'Human Impact Engineering'),
(8566, 140, 15, 1, 'DK Hydraulics'),
(8567, 140, 16, 1, '3'),
(8568, 140, 16, 2, '9'),
(8569, 140, 16, 3, '77'),
(8570, 140, 16, 4, '71'),
(8571, 140, 16, 5, '74'),
(8572, 140, 16, 6, '73'),
(8573, 140, 16, 7, '72'),
(8574, 140, 16, 8, '76'),
(8575, 133, 1, 1, 'APIL'),
(8576, 133, 1, 2, 'Temporal Power; NRStor Inc; IESO'),
(8577, 133, 1, 3, 'Utilismart Corporation, SmartMap'),
(8578, 133, 1, 4, 'LocalGrid'),
(8579, 133, 1, 5, 'Smart Grid Fund'),
(8580, 133, 3, 1, '555'),
(8581, 133, 4, 1, ' Rd E #201'),
(8582, 133, 5, 1, 'Southdale'),
(8583, 133, 6, 1, 'London'),
(8584, 133, 7, 1, 'ON N6E 1A2'),
(8585, 133, 12, 1, 'Human Impact Engineering'),
(8586, 133, 15, 1, 'DK Hydraulics'),
(8587, 133, 14, 1, 'http://player.vimeo.com/video/60122989'),
(8588, 133, 14, 2, 'http://player.vimeo.com/video/132068126'),
(8589, 133, 16, 1, '3'),
(8590, 133, 16, 2, '30'),
(8591, 133, 16, 3, '16'),
(8592, 133, 16, 4, '17'),
(8593, 133, 16, 5, '18'),
(8594, 133, 16, 6, '19'),
(8595, 141, 1, 1, 'Avon Seals Private Limited'),
(8596, 141, 3, 1, '555'),
(8597, 141, 4, 1, ' Rd E #201'),
(8598, 141, 5, 1, 'Southdale'),
(8599, 141, 6, 1, 'London'),
(8600, 141, 7, 1, 'ON N6E 1A2'),
(8601, 141, 12, 1, 'Human Impact Engineering'),
(8602, 141, 15, 1, ' Hydraulics DY'),
(8603, 141, 16, 1, '9'),
(8604, 141, 16, 2, '77'),
(8605, 141, 16, 3, '71'),
(8606, 141, 16, 4, '74'),
(8607, 141, 16, 5, '73'),
(8608, 141, 16, 6, '72'),
(8609, 141, 16, 7, '76'),
(8610, 142, 1, 1, 'Avon Seals Private Limited'),
(8611, 142, 3, 1, '555'),
(8612, 142, 4, 1, ' Rd E #201'),
(8613, 142, 5, 1, 'Southdale'),
(8614, 142, 6, 1, 'London'),
(8615, 142, 7, 1, 'ON N6E 1A2'),
(8616, 142, 12, 1, 'Human Impact Engineering'),
(8617, 142, 15, 1, ' Hydraulics DY'),
(8618, 142, 16, 1, '9'),
(8619, 142, 16, 2, '77'),
(8620, 142, 16, 3, '71'),
(8621, 142, 16, 4, '74'),
(8622, 142, 16, 5, '73'),
(8623, 142, 16, 6, '72'),
(8624, 142, 16, 7, '76'),
(8625, 143, 1, 1, 'APIL'),
(8626, 143, 3, 1, '555'),
(8627, 143, 4, 1, ' Rd E #201'),
(8628, 143, 5, 1, 'Southdale'),
(8629, 143, 6, 1, 'London'),
(8630, 143, 7, 1, 'ON N6E 1A2'),
(8631, 143, 12, 1, 'Human Impact Engineering'),
(8632, 143, 15, 1, 'DK Hydraulics'),
(8633, 143, 16, 1, '3'),
(8634, 143, 16, 2, '30'),
(8635, 143, 16, 3, '16'),
(8636, 143, 16, 4, '17'),
(8637, 143, 16, 5, '18'),
(8638, 143, 16, 6, '19'),
(8639, 144, 1, 1, 'APIL'),
(8640, 144, 3, 1, '555'),
(8641, 144, 4, 1, ' Rd E #201'),
(8642, 144, 5, 1, 'Southdale'),
(8643, 144, 6, 1, 'London'),
(8644, 144, 7, 1, 'ON N6E 1A2'),
(8645, 144, 12, 1, 'Human Impact Engineering'),
(8646, 144, 15, 1, 'DK Hydraulics'),
(8647, 144, 16, 1, '3'),
(8648, 144, 16, 2, '30'),
(8649, 144, 16, 3, '16'),
(8650, 144, 16, 4, '17'),
(8651, 144, 16, 5, '18'),
(8652, 144, 16, 6, '19'),
(8653, 145, 1, 1, 'Avon Seals Private Limited'),
(8654, 145, 3, 1, '555'),
(8655, 145, 4, 1, ' Rd E #201'),
(8656, 145, 5, 1, 'Southdale'),
(8657, 145, 6, 1, 'London'),
(8658, 145, 7, 1, 'ON N6E 1A2'),
(8659, 145, 12, 1, 'Human Impact Engineering'),
(8660, 145, 15, 1, ' Hydraulics DY'),
(8661, 145, 16, 1, '3'),
(8662, 145, 16, 2, '30'),
(8663, 145, 16, 3, '16'),
(8664, 145, 16, 4, '17'),
(8665, 145, 16, 5, '18'),
(8666, 145, 16, 6, '19'),
(8667, 146, 1, 1, 'APIL'),
(8668, 146, 3, 1, '555'),
(8669, 146, 4, 1, ' Rd E #201'),
(8670, 146, 5, 1, 'Southdale'),
(8671, 146, 6, 1, 'London'),
(8672, 146, 7, 1, 'ON N6E 1A2'),
(8673, 146, 12, 1, 'Human Impact Engineering'),
(8674, 146, 15, 1, 'DK Hydraulics'),
(8675, 146, 16, 1, '3'),
(8676, 146, 16, 2, '30'),
(8677, 146, 16, 3, '16'),
(8678, 146, 16, 4, '17'),
(8679, 146, 16, 5, '18'),
(8680, 146, 16, 6, '19'),
(8681, 147, 1, 1, 'APIL'),
(8682, 147, 3, 1, '555'),
(8683, 147, 4, 1, ' Rd E #201'),
(8684, 147, 5, 1, 'Southdale'),
(8685, 147, 6, 1, 'London'),
(8686, 147, 7, 1, 'ON N6E 1A2'),
(8687, 147, 12, 1, 'Human Impact Engineering'),
(8688, 147, 15, 1, 'DK Hydraulics'),
(8689, 147, 16, 1, '3'),
(8690, 147, 16, 2, '30'),
(8691, 147, 16, 3, '16'),
(8692, 147, 16, 4, '17'),
(8693, 147, 16, 5, '18'),
(8694, 147, 16, 6, '19'),
(8695, 148, 1, 1, 'Avon Seals Private Limited'),
(8696, 148, 3, 1, '555'),
(8697, 148, 4, 1, ' Rd E #201'),
(8698, 148, 5, 1, 'Southdale'),
(8699, 148, 6, 1, 'London'),
(8700, 148, 7, 1, 'ON N6E 1A2'),
(8701, 148, 12, 1, 'Human Impact Engineering'),
(8702, 148, 15, 1, ' Hydraulics DY'),
(8703, 148, 16, 1, '3'),
(8704, 148, 16, 2, '30'),
(8705, 148, 16, 3, '16'),
(8706, 148, 16, 4, '17'),
(8707, 148, 16, 5, '18'),
(8708, 148, 16, 6, '19'),
(8709, 149, 1, 1, 'APIL'),
(8710, 149, 3, 1, '555'),
(8711, 149, 4, 1, ' Rd E #201'),
(8712, 149, 5, 1, 'Southdale'),
(8713, 149, 6, 1, 'London'),
(8714, 149, 7, 1, 'ON N6E 1A2'),
(8715, 149, 12, 1, 'Human Impact Engineering'),
(8716, 149, 15, 1, 'DK Hydraulics'),
(8717, 149, 16, 1, '3'),
(8718, 149, 16, 2, '30'),
(8719, 149, 16, 3, '16'),
(8720, 149, 16, 4, '17'),
(8721, 149, 16, 5, '18'),
(8722, 149, 16, 6, '19'),
(8723, 150, 1, 1, 'APIL'),
(8724, 150, 3, 1, '555'),
(8725, 150, 4, 1, ' Rd E #201'),
(8726, 150, 5, 1, 'Southdale'),
(8727, 150, 6, 1, 'London'),
(8728, 150, 7, 1, 'ON N6E 1A2'),
(8729, 150, 12, 1, 'Human Impact Engineering'),
(8730, 150, 15, 1, 'DK Hydraulics'),
(8731, 150, 16, 1, '3'),
(8732, 150, 16, 2, '30'),
(8733, 150, 16, 3, '16'),
(8734, 150, 16, 4, '17'),
(8735, 150, 16, 5, '18'),
(8736, 150, 16, 6, '19'),
(8737, 151, 1, 1, 'Avon Seals Private Limited'),
(8738, 151, 3, 1, '555'),
(8739, 151, 4, 1, ' Rd E #201'),
(8740, 151, 5, 1, 'Southdale'),
(8741, 151, 6, 1, 'London'),
(8742, 151, 7, 1, 'ON N6E 1A2'),
(8743, 151, 12, 1, 'Human Impact Engineering'),
(8744, 151, 15, 1, ' Hydraulics DY'),
(8745, 151, 16, 1, '3'),
(8746, 151, 16, 2, '30'),
(8747, 151, 16, 3, '16'),
(8748, 151, 16, 4, '17'),
(8749, 151, 16, 5, '18'),
(8750, 151, 16, 6, '19'),
(8751, 152, 1, 1, 'APIL'),
(8752, 152, 3, 1, '555'),
(8753, 152, 4, 1, ' Rd E #201'),
(8754, 152, 5, 1, 'Southdale'),
(8755, 152, 6, 1, 'London'),
(8756, 152, 7, 1, 'ON N6E 1A2'),
(8757, 152, 12, 1, 'Human Impact Engineering'),
(8758, 152, 15, 1, 'DK Hydraulics'),
(8759, 152, 16, 1, '3'),
(8760, 152, 16, 2, '30'),
(8761, 152, 16, 3, '16'),
(8762, 152, 16, 4, '17'),
(8763, 152, 16, 5, '18'),
(8764, 152, 16, 6, '19'),
(8765, 153, 1, 1, 'Avon Seals Private Limited'),
(8766, 153, 3, 1, '555'),
(8767, 153, 4, 1, ' Rd E #201'),
(8768, 153, 5, 1, 'Southdale'),
(8769, 153, 6, 1, 'London'),
(8770, 153, 7, 1, 'ON N6E 1A2'),
(8771, 153, 12, 1, 'Human Impact Engineering'),
(8772, 153, 15, 1, ' Hydraulics DY'),
(8773, 153, 16, 1, '3'),
(8774, 153, 16, 2, '30'),
(8775, 153, 16, 3, '16'),
(8776, 153, 16, 4, '17'),
(8777, 153, 16, 5, '18'),
(8778, 153, 16, 6, '19'),
(8779, 154, 1, 1, 'APIL'),
(8780, 154, 3, 1, '555'),
(8781, 154, 4, 1, ' Rd E #201'),
(8782, 154, 5, 1, 'Southdale'),
(8783, 154, 6, 1, 'London'),
(8784, 154, 7, 1, 'ON N6E 1A2'),
(8785, 154, 12, 1, 'Human Impact Engineering'),
(8786, 154, 15, 1, 'DK Hydraulics'),
(8787, 154, 16, 1, '3'),
(8788, 154, 16, 2, '30'),
(8789, 154, 16, 3, '16'),
(8790, 154, 16, 4, '17'),
(8791, 154, 16, 5, '18'),
(8792, 154, 16, 6, '19'),
(8793, 155, 1, 1, 'Avon Seals Private Limited'),
(8794, 155, 3, 1, '555'),
(8795, 155, 4, 1, ' Rd E #201'),
(8796, 155, 5, 1, 'Southdale'),
(8797, 155, 6, 1, 'London'),
(8798, 155, 7, 1, 'ON N6E 1A2'),
(8799, 155, 12, 1, 'Human Impact Engineering'),
(8800, 155, 15, 1, ' Hydraulics DY'),
(8801, 155, 16, 1, '3'),
(8802, 155, 16, 2, '30'),
(8803, 155, 16, 3, '16'),
(8804, 155, 16, 4, '17'),
(8805, 155, 16, 5, '18'),
(8806, 155, 16, 6, '19'),
(8807, 156, 1, 1, 'APIL'),
(8808, 156, 3, 1, '555'),
(8809, 156, 4, 1, ' Rd E #201'),
(8810, 156, 5, 1, 'Southdale'),
(8811, 156, 6, 1, 'London'),
(8812, 156, 7, 1, 'ON N6E 1A2'),
(8813, 156, 12, 1, 'Human Impact Engineering'),
(8814, 156, 15, 1, 'DK Hydraulics'),
(8815, 156, 16, 1, '3'),
(8816, 156, 16, 2, '30'),
(8817, 156, 16, 3, '16'),
(8818, 156, 16, 4, '17'),
(8819, 156, 16, 5, '18'),
(8820, 156, 16, 6, '19'),
(8821, 157, 1, 1, 'APIL'),
(8822, 157, 3, 1, '555'),
(8823, 157, 4, 1, ' Rd E #201'),
(8824, 157, 5, 1, 'Southdale'),
(8825, 157, 6, 1, 'London'),
(8826, 157, 7, 1, 'ON N6E 1A2'),
(8827, 157, 12, 1, 'Human Impact Engineering'),
(8828, 157, 15, 1, 'DK Hydraulics'),
(8829, 157, 16, 1, '3'),
(8830, 157, 16, 2, '30'),
(8831, 157, 16, 3, '16'),
(8832, 157, 16, 4, '17'),
(8833, 157, 16, 5, '18'),
(8834, 157, 16, 6, '19'),
(8835, 158, 1, 1, 'Avon Seals Private Limited'),
(8836, 158, 3, 1, '555'),
(8837, 158, 4, 1, ' Rd E #201'),
(8838, 158, 5, 1, 'Southdale'),
(8839, 158, 6, 1, 'London'),
(8840, 158, 7, 1, 'ON N6E 1A2'),
(8841, 158, 12, 1, 'Human Impact Engineering'),
(8842, 158, 15, 1, ' Hydraulics DY'),
(8843, 158, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic141.jpg'),
(8844, 158, 16, 1, '3'),
(8845, 158, 16, 2, '30'),
(8846, 158, 16, 3, '16'),
(8847, 158, 16, 4, '17'),
(8848, 158, 16, 5, '18'),
(8849, 158, 16, 6, '19'),
(8850, 158, 9, 1, '1'),
(8851, 159, 1, 1, 'APIL'),
(8852, 159, 3, 1, '555'),
(8853, 159, 4, 1, ' Rd E #201'),
(8854, 159, 5, 1, 'Southdale'),
(8855, 159, 6, 1, 'London'),
(8856, 159, 7, 1, 'ON N6E 1A2'),
(8857, 159, 12, 1, 'Human Impact Engineering'),
(8858, 159, 15, 1, 'DK Hydraulics'),
(8861, 159, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic231.jpg'),
(8862, 159, 16, 1, '9'),
(8863, 159, 16, 2, '77'),
(8864, 159, 16, 3, '71'),
(8865, 159, 16, 4, '74'),
(8866, 159, 16, 5, '73'),
(8867, 159, 16, 6, '72'),
(8868, 159, 16, 7, '76'),
(8869, 160, 1, 1, 'APIL'),
(8870, 160, 3, 1, '555'),
(8871, 160, 4, 1, ' Rd E #201'),
(8872, 160, 5, 1, 'Southdale'),
(8873, 160, 6, 1, 'London'),
(8874, 160, 7, 1, 'ON N6E 1A2'),
(8875, 160, 12, 1, 'Human Impact Engineering'),
(8876, 160, 15, 1, 'DK Hydraulics'),
(8879, 160, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic232.jpg'),
(8880, 160, 16, 1, '9'),
(8881, 160, 16, 2, '77'),
(8882, 160, 16, 3, '71'),
(8883, 160, 16, 4, '74'),
(8884, 160, 16, 5, '73'),
(8885, 160, 16, 6, '72'),
(8886, 160, 16, 7, '76'),
(8887, 160, 9, 1, '1'),
(8888, 162, 1, 1, 'APIL'),
(8889, 162, 3, 1, '555'),
(8890, 162, 4, 1, ' Rd E #201'),
(8891, 162, 5, 1, 'Southdale'),
(8892, 162, 6, 1, 'London'),
(8893, 162, 7, 1, 'ON N6E 1A2'),
(8894, 162, 12, 1, 'Human Impact Engineering'),
(8895, 162, 15, 1, 'DK Hydraulics'),
(8896, 162, 16, 1, '3'),
(8897, 162, 16, 2, '30'),
(8898, 162, 16, 3, '16'),
(8899, 162, 16, 4, '17'),
(8900, 162, 16, 5, '18'),
(8901, 162, 16, 6, '19'),
(8902, 163, 1, 1, 'APIL'),
(8903, 163, 3, 1, '555'),
(8904, 163, 4, 1, ' Rd E #201'),
(8905, 163, 5, 1, 'Southdale'),
(8906, 163, 6, 1, 'London'),
(8907, 163, 7, 1, 'ON N6E 1A2'),
(8908, 163, 12, 1, 'Human Impact Engineering'),
(8909, 163, 15, 1, 'DK Hydraulics'),
(8910, 163, 16, 1, '3'),
(8911, 163, 16, 2, '30'),
(8912, 163, 16, 3, '16'),
(8913, 163, 16, 4, '17'),
(8914, 163, 16, 5, '18'),
(8915, 163, 16, 6, '19'),
(8916, 165, 1, 1, 'APIL'),
(8917, 165, 3, 1, '555'),
(8918, 165, 4, 1, ' Rd E #201'),
(8919, 165, 5, 1, 'Southdale'),
(8920, 165, 6, 1, 'London'),
(8921, 165, 7, 1, 'ON N6E 1A2'),
(8922, 165, 12, 1, 'Human Impact Engineering'),
(8923, 165, 15, 1, 'DK Hydraulics'),
(8924, 165, 16, 1, '3'),
(8925, 165, 16, 2, '30'),
(8926, 165, 16, 3, '16'),
(8927, 165, 16, 4, '17'),
(8928, 165, 16, 5, '18'),
(8929, 165, 16, 6, '19'),
(8930, 166, 1, 1, 'APIL'),
(8931, 166, 3, 1, '555'),
(8932, 166, 4, 1, ' Rd E #201'),
(8933, 166, 5, 1, 'Southdale'),
(8934, 166, 6, 1, 'London'),
(8935, 166, 7, 1, 'ON N6E 1A2'),
(8936, 166, 12, 1, 'Human Impact Engineering'),
(8937, 166, 15, 1, 'DK Hydraulics'),
(8938, 166, 16, 1, '3'),
(8939, 166, 16, 2, '30'),
(8940, 166, 16, 3, '16'),
(8941, 166, 16, 4, '17'),
(8942, 166, 16, 5, '18'),
(8943, 166, 16, 6, '19'),
(8944, 168, 1, 1, 'APIL'),
(8945, 168, 3, 1, '555'),
(8946, 168, 4, 1, ' Rd E #201'),
(8947, 168, 5, 1, 'Southdale'),
(8948, 168, 6, 1, 'London'),
(8949, 168, 7, 1, 'ON N6E 1A2'),
(8950, 168, 12, 1, 'Human Impact Engineering'),
(8951, 168, 15, 1, 'DK Hydraulics'),
(8952, 168, 16, 1, '3'),
(8953, 168, 16, 2, '30'),
(8954, 168, 16, 3, '16'),
(8955, 168, 16, 4, '17'),
(8956, 168, 16, 5, '18'),
(8957, 168, 16, 6, '19'),
(8958, 170, 1, 1, 'APIL'),
(8959, 170, 3, 1, '555'),
(8960, 170, 4, 1, ' Rd E #201'),
(8961, 170, 5, 1, 'Southdale'),
(8962, 170, 6, 1, 'London'),
(8963, 170, 7, 1, 'ON N6E 1A2'),
(8964, 170, 12, 1, 'Human Impact Engineering'),
(8965, 170, 15, 1, 'DK Hydraulics'),
(8966, 170, 16, 1, '3'),
(8967, 170, 16, 2, '30'),
(8968, 170, 16, 3, '16'),
(8969, 170, 16, 4, '17'),
(8970, 170, 16, 5, '18'),
(8971, 170, 16, 6, '19'),
(8972, 172, 1, 1, 'APIL'),
(8973, 172, 3, 1, '555'),
(8974, 172, 4, 1, ' Rd E #201'),
(8975, 172, 5, 1, 'Southdale'),
(8976, 172, 6, 1, 'London'),
(8977, 172, 7, 1, 'ON N6E 1A2'),
(8978, 172, 12, 1, 'Human Impact Engineering'),
(8979, 172, 15, 1, 'DK Hydraulics'),
(8980, 172, 16, 1, '3'),
(8981, 172, 16, 2, '30'),
(8982, 172, 16, 3, '16'),
(8983, 172, 16, 4, '17'),
(8984, 172, 16, 5, '18'),
(8985, 172, 16, 6, '19'),
(8986, 173, 1, 1, 'APIL'),
(8987, 173, 3, 1, '555'),
(8988, 173, 4, 1, ' Rd E #201'),
(8989, 173, 5, 1, 'Southdale'),
(8990, 173, 6, 1, 'London'),
(8991, 173, 7, 1, 'ON N6E 1A2'),
(8992, 173, 12, 1, 'Human Impact Engineering'),
(8993, 173, 15, 1, 'DK Hydraulics'),
(8994, 173, 16, 1, '3'),
(8995, 173, 16, 2, '30'),
(8996, 173, 16, 3, '16'),
(8997, 173, 16, 4, '17'),
(8998, 173, 16, 5, '18'),
(8999, 173, 16, 6, '19'),
(9000, 174, 1, 1, 'Avon Seals Private Limited'),
(9001, 174, 3, 1, '555'),
(9002, 174, 4, 1, ' Rd E #201'),
(9003, 174, 5, 1, 'Southdale'),
(9004, 174, 6, 1, 'London'),
(9005, 174, 7, 1, 'ON N6E 1A2'),
(9006, 174, 12, 1, 'Human Impact Engineering'),
(9007, 174, 15, 1, ' Hydraulics DY'),
(9008, 174, 16, 1, '3'),
(9009, 174, 16, 2, '30'),
(9010, 174, 16, 3, '16'),
(9011, 174, 16, 4, '17'),
(9012, 174, 16, 5, '18'),
(9013, 174, 16, 6, '19'),
(9014, 161, 1, 1, 'Avon Seals Private Limited'),
(9015, 161, 3, 1, '555'),
(9016, 161, 4, 1, ' Rd E #201'),
(9017, 161, 5, 1, 'Southdale'),
(9018, 161, 6, 1, 'London'),
(9019, 161, 7, 1, 'ON N6E 1A2'),
(9020, 161, 12, 1, 'Human Impact Engineering'),
(9021, 161, 15, 1, ' Hydraulics DY'),
(9024, 161, 8, 1, 'http://marsaec.lnx-local.com/wp-content/uploads/profile/profile-pic233.jpg'),
(9025, 161, 16, 1, '9'),
(9026, 161, 16, 2, '77'),
(9027, 161, 16, 3, '71'),
(9028, 161, 16, 4, '74'),
(9029, 161, 16, 5, '73'),
(9030, 161, 16, 6, '72'),
(9031, 161, 16, 7, '76'),
(9032, 161, 9, 1, '1'),
(9033, 164, 1, 1, 'Avon Seals Private Limited'),
(9034, 164, 3, 1, '555'),
(9035, 164, 4, 1, ' Rd E #201'),
(9036, 164, 5, 1, 'Southdale'),
(9037, 164, 6, 1, 'London'),
(9038, 164, 7, 1, 'ON N6E 1A2'),
(9039, 164, 12, 1, 'Human Impact Engineering'),
(9040, 164, 15, 1, ' Hydraulics DY'),
(9041, 164, 16, 1, '3'),
(9042, 164, 16, 2, '30'),
(9043, 164, 16, 3, '16'),
(9044, 164, 16, 4, '17'),
(9045, 164, 16, 5, '18'),
(9046, 164, 16, 6, '19'),
(9047, 167, 1, 1, 'Avon Seals Private Limited'),
(9048, 167, 3, 1, '555'),
(9049, 167, 4, 1, ' Rd E #201'),
(9050, 167, 5, 1, 'Southdale'),
(9051, 167, 6, 1, 'London'),
(9052, 167, 7, 1, 'ON N6E 1A2'),
(9053, 167, 12, 1, 'Human Impact Engineering'),
(9054, 167, 15, 1, ' Hydraulics DY'),
(9055, 167, 16, 1, '3'),
(9056, 167, 16, 2, '30'),
(9057, 167, 16, 3, '16'),
(9058, 167, 16, 4, '17'),
(9059, 167, 16, 5, '18'),
(9060, 167, 16, 6, '19'),
(9061, 169, 1, 1, 'Avon Seals Private Limited'),
(9062, 169, 3, 1, '555'),
(9063, 169, 4, 1, ' Rd E #201'),
(9064, 169, 5, 1, 'Southdale'),
(9065, 169, 6, 1, 'London'),
(9066, 169, 7, 1, 'ON N6E 1A2'),
(9067, 169, 12, 1, 'Human Impact Engineering'),
(9068, 169, 15, 1, ' Hydraulics DY'),
(9069, 169, 16, 1, '3'),
(9070, 169, 16, 2, '30'),
(9071, 169, 16, 3, '16'),
(9072, 169, 16, 4, '17'),
(9073, 169, 16, 5, '18'),
(9074, 169, 16, 6, '19'),
(9075, 171, 1, 1, 'Avon Seals Private Limited'),
(9076, 171, 3, 1, '555'),
(9077, 171, 4, 1, ' Rd E #201'),
(9078, 171, 5, 1, 'Southdale'),
(9079, 171, 6, 1, 'London'),
(9080, 171, 7, 1, 'ON N6E 1A2'),
(9081, 171, 12, 1, 'Human Impact Engineering'),
(9082, 171, 15, 1, ' Hydraulics DY'),
(9083, 171, 16, 1, '3'),
(9084, 171, 16, 2, '30'),
(9085, 171, 16, 3, '16'),
(9086, 171, 16, 4, '17'),
(9087, 171, 16, 5, '18'),
(9088, 171, 16, 6, '19');

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_form`
--

CREATE TABLE IF NOT EXISTS `aec_rg_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `aec_rg_form`
--

INSERT INTO `aec_rg_form` (`id`, `title`, `date_created`, `is_active`, `is_trash`) VALUES
(1, 'Contact Us Web Form', '2015-07-10 06:08:33', 1, 0),
(2, 'Inline HTML', '2015-07-10 06:41:11', 1, 0),
(3, 'Contact Us Supplier Form', '2015-07-10 07:21:47', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_form_meta`
--

CREATE TABLE IF NOT EXISTS `aec_rg_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext,
  `entries_grid_meta` longtext,
  `confirmations` longtext,
  `notifications` longtext,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aec_rg_form_meta`
--

INSERT INTO `aec_rg_form_meta` (`form_id`, `display_meta`, `entries_grid_meta`, `confirmations`, `notifications`) VALUES
(1, '{"title":"Contact Us Web Form","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Submit","imageUrl":""},"fields":[{"type":"text","id":1,"label":"Your Name","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"formId":1,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"email","id":2,"label":"Your Email","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"emailConfirmEnabled":false,"formId":1,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"checkbox","id":3,"label":"Agrement","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","choices":[{"text":"By submitting your email, you have read and agree to the <a href=\\"#\\">terms of use<\\/a>","value":"By submitting your email, you have read and agree to the terms of use","isSelected":false,"price":""}],"inputs":[{"id":"3.1","label":"By submitting your email, you have read and agree to the <a href=\\"#\\">terms of use<\\/a>","name":""}],"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"enableChoiceValue":true,"defaultValue":"","description":"","formId":1,"pageNumber":1,"inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"conditionalLogic":"","displayOnly":""},{"type":"textarea","id":4,"label":"Your Message","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"above","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"description":"Please provide additional details so we can respond appropriately.","defaultValue":"","formId":1,"pageNumber":1,"inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"choices":"","conditionalLogic":"","displayOnly":""}],"version":"1.9.10.15","id":1,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null,"notifications":{"559f616151746":{"id":"559f616151746","to":"{admin_email}","name":"Admin Notification","event":"form_submission","toType":"email","subject":"New submission from {form_title}","message":"{all_fields}"}},"confirmations":{"559f61615b773":{"id":"559f61615b773","name":"Default Confirmation","isDefault":true,"type":"page","message":"","url":"","pageId":35,"queryString":"","disableAutoformat":false,"conditionalLogic":[]}},"subLabelPlacement":"below","cssClass":"","enableHoneypot":false,"enableAnimation":false,"save":{"enabled":false,"button":{"type":"link","text":"Save and Continue Later"}},"limitEntries":false,"limitEntriesCount":"","limitEntriesPeriod":"","limitEntriesMessage":"","scheduleForm":false,"scheduleStart":"","scheduleStartHour":"","scheduleStartMinute":"","scheduleStartAmpm":"","scheduleEnd":"","scheduleEndHour":"","scheduleEndMinute":"","scheduleEndAmpm":"","schedulePendingMessage":"","scheduleMessage":"","requireLogin":false,"requireLoginMessage":""}', '', '{"559f61615b773":{"id":"559f61615b773","name":"Default Confirmation","isDefault":true,"type":"page","message":"","url":"","pageId":68,"queryString":"","disableAutoformat":false,"conditionalLogic":[]}}', '{"559f616151746":{"isActive":true,"id":"559f616151746","name":"Admin Notification","event":"form_submission","to":"{admin_email}","toType":"email","bcc":"","subject":"Visible AEC Website: Contact Us Webform Submission","message":"Attention: The following contact us message was submitted via the Visible AEC Website:\\r\\n\\r\\nName: {Your Name:1}\\r\\nEmail: {Your Email:2}\\r\\nMessage: {Your Message:4}\\r\\n","from":"{admin_email}","fromName":"","replyTo":"no-reply@marsdd.com","routing":null,"conditionalLogic":null,"disableAutoformat":false}}'),
(2, '{"labelPlacement":"top_label","useCurrentUserAsAuthor":"1","title":"Inline HTML","description":"This is a simple form to demonstrate the inline HTML blocks introduced in version 1.3.13.","confirmation":{"type":"message","message":"{Name (First):1.3}, Thanks for trying out the demo. You''re totally awesome and we really mean that."},"button":{"type":"text","text":"Submit","conditionalLogic":{"actionType":"show","logicType":"all","rules":[{"fieldId":"6","operator":"is","value":"I agree to the terms of service"}]}},"fields":[{"type":"section","id":"8","size":"medium","displayOnly":"1","label":"Personal Information","description":"please tell us a little about yourself and let us know what''s on your mind","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"name","id":"1","isRequired":"1","size":"medium","label":"Name","inputs":[{"id":"1.3","label":"First"},{"id":"1.6","label":"Last"}],"pageNumber":1,"choices":"","conditionalLogic":""},{"type":"email","id":"2","isRequired":"1","size":"medium","noDuplicates":"1","label":"Email","errorMessage":"please supply a valid email address","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"address","id":"10","size":"medium","label":"Address","inputs":[{"id":"10.1","label":"Street Address"},{"id":"10.2","label":"Address Line 2"},{"id":"10.3","label":"City"},{"id":"10.4","label":"State \\/ Province"},{"id":"10.5","label":"Zip \\/ Postal Code"},{"id":"10.6","label":"Country"}],"pageNumber":1,"choices":"","conditionalLogic":""},{"type":"section","id":"11","size":"medium","displayOnly":"1","label":"Inline HTML content","description":"you can add all sorts of goodies inline with your form fields","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"html","id":"3","size":"medium","displayOnly":"1","label":"Paragraph Text","content":"<div style=\\"margin:10px 0;\\">\\n<img src=\\"http:\\/\\/dl.dropbox.com\\/u\\/688846\\/gravityhelp\\/demologo.png\\" width=\\"120\\" height=\\"120\\" alt=\\"\\" title=\\"\\" style=\\"float:right;\\" \\/>\\n<h4>This is a block of inline HTML content<\\/h4>\\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<\\/p>\\n\\n<p> Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.<\\/p>\\n\\n<p> In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, <\\/p>\\n<\\/div>","disableMargins":"1","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"section","id":"12","size":"medium","displayOnly":"1","label":"Your Message","description":"Tell us what''s on your mind.","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"text","id":"4","isRequired":"1","size":"medium","label":"Message Subject","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"textarea","id":"5","isRequired":"1","size":"medium","label":"Your Message","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"section","id":"9","size":"medium","displayOnly":"1","label":"Legal Stuff","description":"you knew it was coming.. please agree to our terms of service so everyone in our legal department can be happy.","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"html","id":"7","size":"medium","displayOnly":"1","label":"Terms of Service","content":"<div style=\\"border:1px solid #CCC; padding:10px; margin:20px 0;  background-color:#eee; width:90%; height:200px; overflow:auto;\\">\\n\\n\\n<h3>Terms of use for yourcompanyname.com<\\/h3> \\n<h4>1. Acceptance of terms of use and amendments<\\/h4><p>Each time you use or cause access to this web site, you agree to be bound by these <a href=\\"#\\">Terms of use<\\/a>, as amended from time to time with or without notice to you. In addition, if you are using a particular service on this web site or accessed via this web site, you will be subject to any rules or guidelines applicable to those services, and they will be incorporated by reference within these <a href=\\"#\\">Terms of use<\\/a>. Please read the site''s <a href=\\"legal-privacy.html\\">Privacy policy<\\/a>, which is incorporated within these <a  href=\\"legal.html\\">Terms of use<\\/a> by reference.<\\/p> \\n \\n<h4>2. The site editor''s service<\\/h4><p>  This web site and the services provided to you on and via this web site are provided on an &quot;AS IS&quot; basis. You agree that the site editor reserves the right to modify or discontinue provision of this web site and its services, and to remove the data you provide, either temporarily or permanently, at any time, without notice and without any liability towards you, The site editor will not be held responsible or liable for timeliness, removal of information, failure to store information, inaccuracy of information, or improper delivery of information.<\\/p> \\n<h4>3. Your responsibilities and registration obligations<\\/h4><p>In order to use this web site or certain parts of it, you may be required to <a href=\\"http:\\/\\/www.yourcompanyname.com\\/user.html\\">register for a user account<\\/a> on this web site; in this case, you agree to provide truthful information when requested, and -- if a minimum age is required for eligibility for a user account -- you undertake that you are at least the required age. By registering for a user account, you explicitly agree to this site''s <a href=\\"#\\">Terms of use<\\/a>, including any amendments made by the site editor that are published herein.<\\/p> \\n \\n<h4>4. Privacy policy<\\/h4><p>Registration data and other personally identifiable information that the site may collect is subject to the terms of the site editor''s <a href=\\"legal-privacy.html\\">Privacy policy<\\/a>.<\\/p> \\n<h4>5. Registration and password<\\/h4><p>You are responsible for maintaining the confidentiality of your password, and you will be responsible for all usage of your user account and\\/or user name, whether authorized or not authorized by you. You agree to immediately notify the site editor of any unauthorized use of your user account, user name or password.<\\/p> \\n<h4>6. Your conduct<\\/h4><p>You agree that all information or data of any kind, whether text, software, code, music or sound, photographs or graphics, video or other materials (&quot;content&quot;), made available publicly or privately, will be under the sole responsibility of the person providing the said content, or of the person whose user account is used. You agree that this web site may expose you to content that may be objectionable or offensive. The site editor will not be responsible to you in any way for content displayed on this web site, nor for any error or omission.<\\/p> \\n<p>By using this web site or any service provided, you explicitly agree that:<br \\/>   (a) you will not provide any content or conduct yourself in any way that may be construed as: unlawful; illegal; threatening; harmful; abusive; harassing; stalking; tortious; defamatory; libelous; vulgar; obscene; offensive; objectionable; pornographic; designed to interfere with or disrupt the operation of this web site or any service provided; infected with a virus or other destructive or deleterious programming routine; giving rise to civil or criminal liability; or in violation of an applicable local, national or international law;<br \\/>(b) you will not impersonate or misrepresent your association with any person or entity; you will not forge or otherwise seek to conceal or misrepresent the origin of any content provided by you;<br \\/> (c) you will not collect or harvest any information about other users;<br \\/>(d) you will not provide, and you will not use this web site to provide, any content or service in any commercial manner, or in any manner that would involve junk mail, spam, chain letters, pyramid schemes, or any other form of unauthorized advertising or commerce; you will not use this web site to promote or operate any service or content without the site editor''s prior written consent; <br \\/>(e) you will not provide any content that may give rise to the site editor being held civilly or criminally liable, or that may be considered a violation of any local, national or international law, including -- but not limited to -- laws relating to copyrights, trademarks, patents, or trade secrets.<br \\/><\\/p> \\n \\n<h4>7. Submission of content on this web site<\\/h4><p>By providing any content to this web site:<br \\/>(a) you agree to grant the site editor a worldwide, royalty-free, perpetual, non-exclusive right and license (including any moral rights or other necessary rights.) to use, display, reproduce, modify, adapt, publish, distribute, perform, promote,   archive, translate, and to create derivative works and compilations, in whole or in part. Such license will apply with respect to any form, media, technology already known at the time of provision or developed subsequently;<br \\/>(b) you warrant and represent that you have all legal, moral, and other rights that may be necessary to grant the site editor the license specified in this section 7;<br \\/>(c) you acknowledge and agree that the site editor will have the right (but not obligation), at the site editor''s entire discretion, to refuse to publish, or to remove, or to block access to any content you provide, at any time and for any reason, with or without notice.<br \\/><\\/p> \\n<h4>8. Third-party services<\\/h4><p>Goods and services of third parties may be advertised and\\/or may be made available on or through this web site. Representations made regarding products and services   provided by third parties will be governed by the policies and representations made by these third parties. The site editor will not in any manner be liable for or responsible for any of your dealings or interaction with third parties.<\\/p> \\n<h4>9. Indemnification<\\/h4><p>You agree to indemnify and hold harmless the site editor and the site editor''s representatives, subsidiaries, affiliates, related parties, officers, directors, employees, agents, independent contractors, advertisers, partners, and co-branders, from any claim or demand, including reasonable legal fees, that may be filed by any third party, arising out of your conduct or connection with this web site or service, your provision of content, your violation of these <a href=\\"#\\">Terms of use<\\/a>, or any other violation by you of the rights of another person or party.<\\/p> \\n<h4>10. DISCLAIMER OF WARRANTIES<\\/h4><p>YOU UNDERSTAND AND AGREE THAT YOUR USE OF THIS WEB SITE AND OF ANY SERVICES OR  CONTENT PROVIDED (THE &quot;SERVICE&quot;) IS AT YOUR OWN RISK. SERVICES AND CONTENT ARE PROVIDED TO YOU &quot;AS IS&quot;, AND THE SITE EDITOR EXPRESSLY DISCLAIMS ALL WARRANTIES OF ANY KIND, EITHER IMPLIED OR EXPRESS, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.<\\/p> \\n \\n<p>THE SITE EDITOR MAKES NO WARRANTY, EITHER IMPLIED OR EXPRESS, THAT ANY PART OF THE SERVICE WILL  BE UNINTERRUPTED, ERROR-FREE, VIRUS-FREE, TIMELY, SECURE, ACCURATE, RELIABLE, OR OF ANY QUALITY, NOR IS IT WARRANTED EITHER IMPLICITLY OR EXPRESSLY THAT ANY CONTENT IS SAFE IN ANY MANNER FOR DOWNLOAD. YOU UNDERSTAND AND AGREE THAT NEITHER THE SITE EDITOR NOR ANY PARTICIPANT IN THE SERVICE PROVIDES   PROFESSIONAL ADVICE OF ANY KIND AND THAT ANY ADVICE OR ANY OTHER INFORMATION OBTAINED VIA THIS WEB SITE MAY BE USED SOLELY AT YOUR OWN RISK, AND THAT THE SITE EDITOR WILL NOT BE HELD LIABLE IN ANY WAY.<\\/p> \\n<p>Some jurisdictions may not allow disclaimers of implied warranties, and certain statements in the above disclaimer may not apply to you as regards implied warranties; the other terms and conditions remain enforceable notwithstanding.<\\/p> \\n<h4>11. LIMITATION OF LIABILITY<\\/h4><p>YOU EXPRESSLY UNDERSTAND AND AGREE THAT THE SITE EDTIOR WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL, CONSEQUENTIAL OR EXEMPLARY DAMAGES; THIS INCLUDES, BUT IS NOT LIMITED TO, DAMAGES FOR LOSS OF PROFITS, GOODWILL, USE, DATA OR OTHER   INTANGIBLE LOSSES (EVEN IF THE SITE EDITOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES), RESULTING FROM (I) THE USE OF SERVICES OR THE INABILITY TO USE SERVICES, (II) THE COST OF OBTAINING SUBSTITUTE GOODS AND\\/OR SERVICES RESULTING  FROM ANY TRANSACTION ENTERED INTO ON THROUGH SERVICES, (III) UNAUTHORIZED ACCESS TO OR ALTERATION OF YOUR DATA TRANSMISSIONS, (IV) STATEMENTS BY ANY THIRD PARTY OR CONDUCT OF ANY THIRD PARTY USING SERVICES, OR (V) ANY OTHER MATTER RELATING TO SERVICES.<\\/p> \\n<p>In some jurisdictions, it is not permitted to limit liability and, therefore, such limitations may not apply to you.<br \\/><\\/p> \\n<h4>12. Reservation of rights<\\/h4><p>  The site editor reserves all of the site editor''s rights, including but not limited to any and all copyrights, trademarks, patents, trade secrets, and any other proprietary right that the site editor may have in respect of this web site, its content, and goods and services that may be  provided. The use of the site editor''s rights. and property requires the site editor''s prior written consent. By making services available to you, the site editor is not providing you with any implied or express licenses or rights, and you will have no rights to make any commercial use of this web site or provided services without the site editor''s prior written consent.<\\/p> \\n<h4>13. Notification of copyright infringement<\\/h4><p>If you believe that your property has been used in any way that could be considered a copyright infringement or a violation of your intellectual property rights,  the site editor\\\\''s copyright agent may be contacted via:<br \\/><br \\/><a href=\\"mailto:info&#109;&#064;&#102;yourcompanyname.com\\">e-mail to the site administrator<\\/a><br \\/><br \\/>[<i>Other contact information, if published on the site:<\\/i>]<\\/p> \\n \\n<h4>14. Applicable law<\\/h4><p>You agree that these <a href=\\"#\\">Terms of use<\\/a> and any dispute arising out of your use of this web site or products or services provided will be governed by and construed in accordance with local laws applicable at the site editor''s domicile, notwithstanding any  differences between the said applicable legislation and legislation in force at your location. By registering for a user account on this web site, or by using this web site and the services it provides, you accept that jurisdiction is granted to the courts having jurisdiction over the site editor''s domicile, and that any disputes will be heard by the said courts.<\\/p> \\n    \\n<h4>15. Miscellaneous information<\\/h4><p>(i) In the event that any provision of these <a href=\\"#\\">Terms of use<\\/a> is deemed to conflict with legislation by a court with jurisdiction over the parties, the said provision will be interpreted to reflect the original intentions of the parties in accordance with applicable law, and the remainder of these <a href=\\"#\\">Terms of use<\\/a> will remain valid and applicable; (ii) The failure of either party to assert any right under these <a href=\\"#\\">Terms of use<\\/a> will not be considered to be a waiver of that party''s right, and the said right will remain in full force and effect; (iii) You agree that any claim or cause in respect of this web site or its services must be filed within one (1) year after such claim or cause arose, or the said claim or cause will be forever barred, without regard to any contrary legislation; (iv) The site editor may assign the site editor''s rights and obligations under these <a href=\\"#\\">Terms of use<\\/a>; in this event, the site editor will be relieved of any further obligation.<\\/p>\\n\\n<\\/div>","disableMargins":"1","pageNumber":1,"choices":"","inputs":"","conditionalLogic":""},{"type":"checkbox","id":"6","isRequired":"1","size":"medium","enableChoiceValue":"1","label":"Agreement","choices":[{"text":"I agree to the terms of service","value":"I agree to the terms of service"}],"pageNumber":1,"inputs":[{"id":"6.1","label":"I agree to the terms of service"}],"conditionalLogic":""}],"enableHoneypot":"1","notification":{"from":"{admin_email}"},"autoResponder":{"toField":"2","from":"{admin_email}","subject":"Gravity Forms Test Submission from {Name (First):1.3} - {Email:2}","message":"{all_fields}\\r\\n\\r\\n<div style=\\"background-color: #FFEBE8; padding:20px; border:1px solid #CC0000; margin-bottom:20px;\\">Please note: This is a test submission from the Gravity Forms plugin demo at http:\\/\\/www.gravityforms.com\\/demo - this is not a solicitation or sales message. If you received this message in error, please disregard. Thank you.<\\/div>"},"descriptionPlacement":"above","id":2}', NULL, '{"51794c8d49856":{"type":"message","id":"51794c8d49856","isDefault":"1","message":"{Name (First):1.3}, Thanks for trying out the demo. You''re totally awesome and we really mean that.","name":"Default Confirmation"}}', '{"51794c8d4a858":{"id":"51794c8d4a858","toField":"2","from":"{admin_email}","subject":"Gravity Forms Test Submission from {Name (First):1.3} - {Email:2}","message":"{all_fields}\\r\\n\\r\\n<div style=\\"background-color: #FFEBE8; padding:20px; border:1px solid #CC0000; margin-bottom:20px;\\">Please note: This is a test submission from the Gravity Forms plugin demo at http:\\/\\/www.gravityforms.com\\/demo - this is not a solicitation or sales message. If you received this message in error, please disregard. Thank you.<\\/div>","toType":"field","to":"2","event":"form_submission","name":"User Notification","type":"user","isActive":"0"}}'),
(3, '{"title":"Contact Us Supplier Form","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Submit","imageUrl":""},"fields":[{"type":"text","id":1,"label":"Your Name","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"maxLength":"","formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"email","id":2,"label":"Your Email","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"checkbox","id":3,"label":"Agrement","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","choices":[{"text":"By submitting your email, you have read and agree to the <a href=\\"#\\">terms of use<\\/a>.","value":"By submitting your email, you have read and agree to the terms of use.","isSelected":false,"price":""}],"inputs":[{"id":"3.1","label":"By submitting your email, you have read and agree to the <a href=\\"#\\">terms of use<\\/a>.","name":""}],"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"enableChoiceValue":true,"formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","displayOnly":""},{"type":"text","id":4,"label":"Company\\/ Organization Affiliation (Optional)","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"phone","id":5,"label":"Your Telephone Number (Optional)","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"phoneFormat":"standard","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"select","id":6,"label":"Subject","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"choices":[{"text":"Please Select","value":"","isSelected":false,"price":""},{"text":"Updating\\/Revising Profile Content","value":"Updating\\/Revising Profile Content","isSelected":false,"price":""},{"text":"How to Get Featured","value":"How to Get Featured","isSelected":false,"price":""},{"text":"Errors Submitting a Profile","value":"Errors Submitting a Profile","isSelected":false,"price":""},{"text":"General Website Inquiries","value":"General Website Inquiries","isSelected":false,"price":""},{"text":"Other","value":"Other","isSelected":false,"price":""}],"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"enableChoiceValue":true,"formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","displayOnly":""},{"type":"textarea","id":7,"label":"Your Message","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"above","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":false,"description":"Please provide additional details so we can respond appropriately.","formId":3,"pageNumber":1,"inputType":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"hidden","id":8,"label":"Receiver Email","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":true,"inputName":"email","formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""},{"type":"hidden","id":9,"label":"Receiver Name","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"inputMask":false,"inputMaskValue":"","allowsPrepopulate":true,"inputName":"sname","formId":3,"pageNumber":1,"description":"","inputType":"","cssClass":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","displayOnly":""}],"version":"1.9.10.15","id":3,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null}', '', '{"559f728bc7a10":{"id":"559f728bc7a10","name":"Default Confirmation","isDefault":true,"type":"page","message":"","url":"","pageId":66,"queryString":"","disableAutoformat":false,"conditionalLogic":[]}}', '{"559f728bbd601":{"isActive":true,"id":"559f728bbd601","name":"Admin Notification","event":"form_submission","to":"{admin_email}","toType":"email","bcc":"{Receiver Email:8}","subject":"Visible AEC Website: {Receiver Name:9} Request for Info received {date_mdy}","message":"Attention: The following Request for Info was submitted to {Receiver Name:9} via the Visible AEC Website:\\r\\n\\r\\nName: {Your Name:1}\\r\\nEmail: {Your Email:2}\\r\\nCompany\\/Organization Affiliation: {Company\\/ Organization Affiliation (Optional):4}\\r\\nTelephone Number: {Your Telephone Number (Optional):5}\\r\\nSubject: {Subject:6}\\r\\nYour Message: {Your Message:7}\\r\\n\\r\\nA Visible AEC administrator has been copied on this email for information purposes only.\\r\\n\\r\\nSincerely,\\r\\nAdvanced Energy Centre Team at the MaRS Discovery District\\r\\n\\r\\nPlease note that all responses are up to individual companies\\u2019\\/project\\u2019s discretion.\\r\\nPlease don\\u2019t hesitate to contact the Advanced Energy Centre if you would like to collaborate further: advancedenergycentre@marsdd.com","from":"{admin_email}","fromName":"","replyTo":"{admin_email}","routing":null,"conditionalLogic":null,"disableAutoformat":false}}');

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_form_view`
--

CREATE TABLE IF NOT EXISTS `aec_rg_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `aec_rg_form_view`
--

INSERT INTO `aec_rg_form_view` (`id`, `form_id`, `date_created`, `ip`, `count`) VALUES
(1, 1, '2015-07-10 06:37:56', '192.168.0.174', 1),
(2, 3, '2015-07-10 08:38:57', '192.168.0.169', 14),
(3, 3, '2015-07-10 09:01:35', '192.168.0.169', 15),
(4, 3, '2015-07-10 10:10:41', '192.168.0.169', 20),
(5, 1, '2015-07-10 10:27:22', '192.168.0.169', 7),
(6, 3, '2015-07-10 11:03:48', '192.168.0.169', 7),
(7, 1, '2015-07-10 11:10:29', '192.168.0.169', 3),
(8, 3, '2015-07-10 12:09:43', '192.168.0.169', 2),
(9, 1, '2015-07-10 12:11:59', '192.168.0.169', 1);

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_incomplete_submissions`
--

CREATE TABLE IF NOT EXISTS `aec_rg_incomplete_submissions` (
  `uuid` char(32) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(39) NOT NULL,
  `source_url` longtext NOT NULL,
  `submission` longtext NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_lead`
--

CREATE TABLE IF NOT EXISTS `aec_rg_lead` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) NOT NULL,
  `source_url` varchar(200) NOT NULL DEFAULT '',
  `user_agent` varchar(250) NOT NULL DEFAULT '',
  `currency` varchar(5) DEFAULT NULL,
  `payment_status` varchar(15) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `aec_rg_lead`
--

INSERT INTO `aec_rg_lead` (`id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `payment_method`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`, `status`) VALUES
(1, 1, NULL, '2015-07-10 07:05:25', 0, 0, '192.168.0.174', 'http://marsaec.lnx-local.com/contact/', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(2, 3, NULL, '2015-07-10 08:03:21', 0, 0, '192.168.0.174', 'http://marsaec.lnx-local.com/contact-profile/', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_lead_detail`
--

CREATE TABLE IF NOT EXISTS `aec_rg_lead_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `field_number` float NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_field_number` (`lead_id`,`field_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `aec_rg_lead_detail`
--

INSERT INTO `aec_rg_lead_detail` (`id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
(1, 1, 1, 1, 'Test'),
(2, 1, 1, 2, 'test@test.com'),
(3, 1, 1, 3.1, 'By submitting your email, you have read and agree to the terms of use'),
(4, 1, 1, 4, 'Test'),
(5, 2, 3, 1, 'Test'),
(6, 2, 3, 2, 't@t.com'),
(7, 2, 3, 3.1, 'By submitting your email, you have read and agree to the terms of use.'),
(8, 2, 3, 5, 'hfgfghghfgghf'),
(9, 2, 3, 7, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_lead_detail_long`
--

CREATE TABLE IF NOT EXISTS `aec_rg_lead_detail_long` (
  `lead_detail_id` bigint(20) unsigned NOT NULL,
  `value` longtext,
  PRIMARY KEY (`lead_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_lead_meta`
--

CREATE TABLE IF NOT EXISTS `aec_rg_lead_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lead_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `lead_id` (`lead_id`),
  KEY `form_id_meta_key` (`form_id`,`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aec_rg_lead_notes`
--

CREATE TABLE IF NOT EXISTS `aec_rg_lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext,
  `note_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_user_key` (`lead_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=85 ;

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
(81, 'Systems integration', 'systems-integration', 0),
(82, 'Control Technology', 'control-technology-control-technology', 0),
(83, 'Testing', 'testing', 0),
(84, 'Cable Joining', 'cable-joining-testing', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=85 ;

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
(49, 49, 'category', '', 34, 0),
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
(81, 81, 'category', '', 77, 0),
(82, 82, 'category', '', 74, 0),
(83, 83, 'category', '', 34, 0),
(84, 84, 'category', '', 83, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=24 ;

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
(14, 1, 'session_tokens', 'a:5:{s:64:"6a38a1c23c9575d5846a957fa6e37608d5967023325e1f486e25d766790f4142";a:4:{s:10:"expiration";i:1436608943;s:2:"ip";s:13:"192.168.0.134";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0";s:5:"login";i:1436436143;}s:64:"e6b481ff248bbb87479051fd0966b26a534f933e07c135ac871142d67ae5aa55";a:4:{s:10:"expiration";i:1436676744;s:2:"ip";s:13:"192.168.0.111";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36";s:5:"login";i:1436503944;}s:64:"78a678d9a5f5a79833e984d218c89de8be6f365f8f3ffb38199da9b9f386ad63";a:4:{s:10:"expiration";i:1436679351;s:2:"ip";s:13:"192.168.0.134";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0";s:5:"login";i:1436506551;}s:64:"7324a05345bf237867526d39c636a856d6bc88e20480eb1594bd0b4414b365ec";a:4:{s:10:"expiration";i:1436681003;s:2:"ip";s:13:"192.168.0.174";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0";s:5:"login";i:1436508203;}s:64:"0e3a25ee372d1726898e60985333ec4ab5f8985fa91839347010146f5932f139";a:4:{s:10:"expiration";i:1436681452;s:2:"ip";s:13:"192.168.0.132";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1436508652;}}'),
(15, 1, 'aec_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'closedpostboxes_post', 'a:0:{}'),
(17, 1, 'metaboxhidden_post', 'a:5:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:16:"commentstatusdiv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";}'),
(18, 1, 'aec_user-settings', 'libraryContent=browse&mfold=o&hidetb=1&editor=html'),
(19, 1, 'aec_user-settings-time', '1436530659'),
(20, 1, 'closedpostboxes_page', 'a:0:{}'),
(21, 1, 'metaboxhidden_page', 'a:4:{i:0;s:16:"commentstatusdiv";i:1;s:11:"commentsdiv";i:2;s:7:"slugdiv";i:3;s:9:"authordiv";}'),
(22, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}');

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
