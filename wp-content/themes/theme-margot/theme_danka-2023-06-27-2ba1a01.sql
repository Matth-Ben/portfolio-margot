-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for osx10.15 (x86_64)
--
-- Host: localhost    Database: theme_danka
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES
(1,1,'Un commentateur ou commentatrice WordPress','wapuu@wordpress.example','https://fr.wordpress.org/','','2023-06-26 13:34:45','2023-06-26 11:34:45','Bonjour, ceci est un commentaire.\nPour débuter avec la modération, la modification et la suppression de commentaires, veuillez visiter l’écran des Commentaires dans le Tableau de bord.\nLes avatars des personnes qui commentent arrivent depuis <a href=\"https://fr.gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'siteurl','http://theme-danka.test','yes'),
(2,'home','http://theme-danka.test','yes'),
(3,'blogname','Thème Danka','yes'),
(4,'blogdescription','','yes'),
(5,'users_can_register','0','yes'),
(6,'admin_email','test@gmail.com','yes'),
(7,'start_of_week','1','yes'),
(8,'use_balanceTags','0','yes'),
(9,'use_smilies','1','yes'),
(10,'require_name_email','1','yes'),
(11,'comments_notify','1','yes'),
(12,'posts_per_rss','10','yes'),
(13,'rss_use_excerpt','0','yes'),
(14,'mailserver_url','mail.example.com','yes'),
(15,'mailserver_login','login@example.com','yes'),
(16,'mailserver_pass','password','yes'),
(17,'mailserver_port','110','yes'),
(18,'default_category','1','yes'),
(19,'default_comment_status','open','yes'),
(20,'default_ping_status','open','yes'),
(21,'default_pingback_flag','1','yes'),
(22,'posts_per_page','10','yes'),
(23,'date_format','j F Y','yes'),
(24,'time_format','G\\hi','yes'),
(25,'links_updated_date_format','d F Y G\\hi','yes'),
(26,'comment_moderation','0','yes'),
(27,'moderation_notify','1','yes'),
(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),
(29,'rewrite_rules','a:120:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:8:\"event/?$\";s:25:\"index.php?post_type=event\";s:38:\"event/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=event&feed=$matches[1]\";s:33:\"event/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=event&feed=$matches[1]\";s:25:\"event/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=event&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:33:\"event/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"event/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"event/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"event/([^/]+)/embed/?$\";s:38:\"index.php?event=$matches[1]&embed=true\";s:26:\"event/([^/]+)/trackback/?$\";s:32:\"index.php?event=$matches[1]&tb=1\";s:46:\"event/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?event=$matches[1]&feed=$matches[2]\";s:41:\"event/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?event=$matches[1]&feed=$matches[2]\";s:34:\"event/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?event=$matches[1]&paged=$matches[2]\";s:41:\"event/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?event=$matches[1]&cpage=$matches[2]\";s:30:\"event/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?event=$matches[1]&page=$matches[2]\";s:22:\"event/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"event/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"event/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),
(30,'hack_file','0','yes'),
(31,'blog_charset','UTF-8','yes'),
(32,'moderation_keys','','no'),
(33,'active_plugins','a:3:{i:0;s:29:\"acf-extended/acf-extended.php\";i:1;s:34:\"advanced-custom-fields-pro/acf.php\";i:2;s:33:\"classic-editor/classic-editor.php\";}','yes'),
(34,'category_base','','yes'),
(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
(36,'comment_max_links','2','yes'),
(37,'gmt_offset','0','yes'),
(38,'default_email_category','1','yes'),
(39,'recently_edited','','no'),
(40,'template','theme-danka','yes'),
(41,'stylesheet','theme-danka','yes'),
(42,'comment_registration','0','yes'),
(43,'html_type','text/html','yes'),
(44,'use_trackback','0','yes'),
(45,'default_role','subscriber','yes'),
(46,'db_version','53496','yes'),
(47,'uploads_use_yearmonth_folders','1','yes'),
(48,'upload_path','','yes'),
(49,'blog_public','1','yes'),
(50,'default_link_category','2','yes'),
(51,'show_on_front','page','yes'),
(52,'tag_base','','yes'),
(53,'show_avatars','1','yes'),
(54,'avatar_rating','G','yes'),
(55,'upload_url_path','','yes'),
(56,'thumbnail_size_w','150','yes'),
(57,'thumbnail_size_h','150','yes'),
(58,'thumbnail_crop','1','yes'),
(59,'medium_size_w','300','yes'),
(60,'medium_size_h','300','yes'),
(61,'avatar_default','mystery','yes'),
(62,'large_size_w','1024','yes'),
(63,'large_size_h','1024','yes'),
(64,'image_default_link_type','none','yes'),
(65,'image_default_size','','yes'),
(66,'image_default_align','','yes'),
(67,'close_comments_for_old_posts','0','yes'),
(68,'close_comments_days_old','14','yes'),
(69,'thread_comments','1','yes'),
(70,'thread_comments_depth','5','yes'),
(71,'page_comments','0','yes'),
(72,'comments_per_page','50','yes'),
(73,'default_comments_page','newest','yes'),
(74,'comment_order','asc','yes'),
(75,'sticky_posts','a:0:{}','yes'),
(76,'widget_categories','a:0:{}','yes'),
(77,'widget_text','a:0:{}','yes'),
(78,'widget_rss','a:0:{}','yes'),
(79,'uninstall_plugins','a:0:{}','no'),
(80,'timezone_string','Europe/Paris','yes'),
(81,'page_for_posts','0','yes'),
(82,'page_on_front','5','yes'),
(83,'default_post_format','0','yes'),
(84,'link_manager_enabled','0','yes'),
(85,'finished_splitting_shared_terms','1','yes'),
(86,'site_icon','0','yes'),
(87,'medium_large_size_w','768','yes'),
(88,'medium_large_size_h','0','yes'),
(89,'wp_page_for_privacy_policy','3','yes'),
(90,'show_comments_cookies_opt_in','1','yes'),
(91,'admin_email_lifespan','1703331284','yes'),
(92,'disallowed_keys','','no'),
(93,'comment_previously_approved','1','yes'),
(94,'auto_plugin_theme_update_emails','a:0:{}','no'),
(95,'auto_update_core_dev','enabled','yes'),
(96,'auto_update_core_minor','enabled','yes'),
(97,'auto_update_core_major','enabled','yes'),
(98,'wp_force_deactivated_plugins','a:0:{}','yes'),
(99,'initial_db_version','53496','yes'),
(100,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
(101,'fresh_site','0','yes'),
(102,'WPLANG','fr_FR','yes'),
(103,'user_count','1','no'),
(104,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:159:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Articles récents</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:233:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Commentaires récents</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:151:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Catégories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','yes'),
(105,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','yes'),
(106,'cron','a:8:{i:1687883685;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1687908885;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1687908893;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1687952085;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1687952093;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1687952094;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1688470485;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes'),
(107,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(108,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(109,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(110,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(111,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(112,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(113,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(114,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(115,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(116,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(117,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(118,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(119,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(120,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(122,'recovery_keys','a:1:{s:22:\"bm07G5Dsoit1HBWX7VDrCH\";a:2:{s:10:\"hashed_key\";s:34:\"$P$B..uqQ/LZlD6EDvyMc/GL/V6zpatpb1\";s:10:\"created_at\";i:1687855252;}}','yes'),
(123,'https_detection_errors','a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:28:\"La demande HTTPS a échoué.\";}}','yes'),
(136,'_site_transient_timeout_browser_5f0ff5d8799ed4c0ed355fa474a7bbc2','1688384094','no'),
(137,'_site_transient_browser_5f0ff5d8799ed4c0ed355fa474a7bbc2','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"114.0.0.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
(138,'_site_transient_timeout_php_check_475fa6a70d684a8085025ad09dfbf764','1688384094','no'),
(139,'_site_transient_php_check_475fa6a70d684a8085025ad09dfbf764','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),
(147,'can_compress_scripts','1','no'),
(159,'finished_updating_comment_type','1','yes'),
(170,'theme_mods_twentytwentythree','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1687782215;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','yes'),
(171,'current_theme','WP Base','yes'),
(172,'theme_mods_theme-danka','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:14:\"header-primary\";i:2;}s:18:\"custom_css_post_id\";i:-1;}','yes'),
(173,'theme_switched','','yes'),
(176,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),
(187,'recently_activated','a:0:{}','yes'),
(188,'acf_version','5.10.2','yes'),
(192,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-6.2.2.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-6.2.2.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.2.2\";s:7:\"version\";s:5:\"6.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1687865688;s:15:\"version_checked\";s:5:\"6.2.2\";s:12:\"translations\";a:0:{}}','no'),
(194,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1687865688;s:7:\"checked\";a:1:{s:11:\"theme-danka\";s:3:\"1.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}','no'),
(197,'acfe','a:2:{s:7:\"version\";s:7:\"0.8.9.3\";s:7:\"modules\";a:4:{s:11:\"block_types\";a:0:{}s:13:\"options_pages\";a:0:{}s:10:\"post_types\";a:1:{s:5:\"event\";a:40:{s:4:\"name\";s:5:\"event\";s:5:\"label\";s:11:\"Évènement\";s:6:\"active\";b:1;s:11:\"description\";s:0:\"\";s:12:\"hierarchical\";b:0;s:8:\"supports\";a:5:{i:0;s:5:\"title\";i:1;s:6:\"author\";i:2;s:9:\"thumbnail\";i:3;s:7:\"excerpt\";i:4;s:9:\"revisions\";}s:10:\"taxonomies\";a:0:{}s:6:\"public\";b:1;s:19:\"exclude_from_search\";b:0;s:18:\"publicly_queryable\";b:1;s:10:\"can_export\";b:1;s:16:\"delete_with_user\";N;s:6:\"labels\";a:0:{}s:13:\"menu_position\";i:10;s:9:\"menu_icon\";s:22:\"dashicons-calendar-alt\";s:7:\"show_ui\";b:1;s:12:\"show_in_menu\";b:1;s:17:\"show_in_nav_menus\";b:1;s:17:\"show_in_admin_bar\";b:1;s:11:\"has_archive\";b:1;s:7:\"rewrite\";b:1;s:15:\"capability_type\";s:4:\"post\";s:12:\"capabilities\";a:0:{}s:12:\"map_meta_cap\";N;s:12:\"show_in_rest\";b:0;s:9:\"rest_base\";s:0:\"\";s:21:\"rest_controller_class\";s:24:\"WP_REST_Posts_Controller\";s:21:\"acfe_archive_template\";s:0:\"\";s:16:\"acfe_archive_ppp\";i:10;s:20:\"acfe_archive_orderby\";s:4:\"date\";s:18:\"acfe_archive_order\";s:4:\"DESC\";s:21:\"acfe_archive_meta_key\";s:0:\"\";s:22:\"acfe_archive_meta_type\";s:0:\"\";s:20:\"acfe_single_template\";s:0:\"\";s:18:\"acfe_admin_archive\";b:1;s:14:\"acfe_admin_ppp\";i:10;s:18:\"acfe_admin_orderby\";s:4:\"date\";s:16:\"acfe_admin_order\";s:4:\"DESC\";s:19:\"acfe_admin_meta_key\";s:0:\"\";s:20:\"acfe_admin_meta_type\";s:0:\"\";}}s:10:\"taxonomies\";a:0:{}}}','yes'),
(199,'recovery_mode_email_last_sent','1687855252','yes'),
(200,'category_children','a:0:{}','yes'),
(208,'_transient_timeout_acf_plugin_updates','1688031679','no'),
(209,'_transient_acf_plugin_updates','a:4:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.1.6\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.2\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}}}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:6:\"5.10.2\";}}','no'),
(212,'_site_transient_timeout_theme_roots','1687867486','no'),
(213,'_site_transient_theme_roots','a:1:{s:11:\"theme-danka\";s:7:\"/themes\";}','no'),
(214,'_transient_health-check-site-status-result','{\"good\":15,\"recommended\":6,\"critical\":0}','yes'),
(216,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1687865689;s:8:\"response\";a:11:{s:43:\"custom-post-type-ui/custom-post-type-ui.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:33:\"w.org/plugins/custom-post-type-ui\";s:4:\"slug\";s:19:\"custom-post-type-ui\";s:6:\"plugin\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:11:\"new_version\";s:6:\"1.13.6\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/custom-post-type-ui/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.13.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=2744389\";s:2:\"1x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=2744389\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=2744389\";s:2:\"1x\";s:74:\"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=2744389\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"5.6\";}s:25:\"forminator/forminator.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:24:\"w.org/plugins/forminator\";s:4:\"slug\";s:10:\"forminator\";s:6:\"plugin\";s:25:\"forminator/forminator.php\";s:11:\"new_version\";s:6:\"1.24.1\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/forminator/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/forminator.1.24.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/forminator/assets/icon-256x256.png?rev=2746202\";s:2:\"1x\";s:63:\"https://ps.w.org/forminator/assets/icon-128x128.png?rev=2746202\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/forminator/assets/banner-1544x500.png?rev=2626060\";s:2:\"1x\";s:65:\"https://ps.w.org/forminator/assets/banner-772x250.png?rev=2626060\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:6:\"5.6.20\";}s:51:\"google-listings-and-ads/google-listings-and-ads.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:37:\"w.org/plugins/google-listings-and-ads\";s:4:\"slug\";s:23:\"google-listings-and-ads\";s:6:\"plugin\";s:51:\"google-listings-and-ads/google-listings-and-ads.php\";s:11:\"new_version\";s:6:\"2.4.10\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/google-listings-and-ads/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/google-listings-and-ads.2.4.10.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:68:\"https://ps.w.org/google-listings-and-ads/assets/icon.svg?rev=2775988\";s:3:\"svg\";s:68:\"https://ps.w.org/google-listings-and-ads/assets/icon.svg?rev=2775988\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/google-listings-and-ads/assets/banner-1544x500.png?rev=2542080\";s:2:\"1x\";s:78:\"https://ps.w.org/google-listings-and-ads/assets/banner-772x250.png?rev=2542080\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.9\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"7.4\";}s:19:\"jetpack/jetpack.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/jetpack\";s:4:\"slug\";s:7:\"jetpack\";s:6:\"plugin\";s:19:\"jetpack/jetpack.php\";s:11:\"new_version\";s:6:\"12.2.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/jetpack/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/jetpack.12.2.1.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=2819237\";s:3:\"svg\";s:52:\"https://ps.w.org/jetpack/assets/icon.svg?rev=2819237\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/jetpack/assets/banner-1544x500.png?rev=2653649\";s:2:\"1x\";s:62:\"https://ps.w.org/jetpack/assets/banner-772x250.png?rev=2653649\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.1\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"5.6\";}s:21:\"mailpoet/mailpoet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:22:\"w.org/plugins/mailpoet\";s:4:\"slug\";s:8:\"mailpoet\";s:6:\"plugin\";s:21:\"mailpoet/mailpoet.php\";s:11:\"new_version\";s:6:\"4.19.0\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/mailpoet/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/mailpoet.4.19.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/mailpoet/assets/icon-256x256.png?rev=2784430\";s:2:\"1x\";s:61:\"https://ps.w.org/mailpoet/assets/icon-128x128.png?rev=2784430\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/mailpoet/assets/banner-1544x500.png?rev=2046588\";s:2:\"1x\";s:63:\"https://ps.w.org/mailpoet/assets/banner-772x250.png?rev=2046588\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.0\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"7.3\";}s:17:\"matomo/matomo.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:20:\"w.org/plugins/matomo\";s:4:\"slug\";s:6:\"matomo\";s:6:\"plugin\";s:17:\"matomo/matomo.php\";s:11:\"new_version\";s:6:\"4.14.2\";s:3:\"url\";s:37:\"https://wordpress.org/plugins/matomo/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/matomo.4.14.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/matomo/assets/icon-256x256.png?rev=2309115\";s:2:\"1x\";s:59:\"https://ps.w.org/matomo/assets/icon-128x128.png?rev=2309115\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/matomo/assets/banner-1544x500.png?rev=2309115\";s:2:\"1x\";s:61:\"https://ps.w.org/matomo/assets/banner-772x250.png?rev=2309115\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/matomo/assets/banner-1544x500-rtl.png?rev=2309115\";s:2:\"1x\";s:65:\"https://ps.w.org/matomo/assets/banner-772x250-rtl.png?rev=2309115\";}s:8:\"requires\";s:3:\"4.8\";s:6:\"tested\";s:5:\"6.2.0\";s:12:\"requires_php\";s:5:\"7.2.5\";}s:55:\"pinterest-for-woocommerce/pinterest-for-woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:39:\"w.org/plugins/pinterest-for-woocommerce\";s:4:\"slug\";s:25:\"pinterest-for-woocommerce\";s:6:\"plugin\";s:55:\"pinterest-for-woocommerce/pinterest-for-woocommerce.php\";s:11:\"new_version\";s:5:\"1.3.4\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/pinterest-for-woocommerce/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/pinterest-for-woocommerce.1.3.4.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:70:\"https://ps.w.org/pinterest-for-woocommerce/assets/icon.svg?rev=2619817\";s:3:\"svg\";s:70:\"https://ps.w.org/pinterest-for-woocommerce/assets/icon.svg?rev=2619817\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/pinterest-for-woocommerce/assets/banner-1544x500.png?rev=2619817\";s:2:\"1x\";s:80:\"https://ps.w.org/pinterest-for-woocommerce/assets/banner-772x250.png?rev=2619817\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.6\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"7.3\";}s:21:\"polylang/polylang.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:22:\"w.org/plugins/polylang\";s:4:\"slug\";s:8:\"polylang\";s:6:\"plugin\";s:21:\"polylang/polylang.php\";s:11:\"new_version\";s:5:\"3.4.3\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/polylang/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/polylang.3.4.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/polylang/assets/icon-256x256.png?rev=1331499\";s:2:\"1x\";s:61:\"https://ps.w.org/polylang/assets/icon-128x128.png?rev=1331499\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/polylang/assets/banner-1544x500.png?rev=1405299\";s:2:\"1x\";s:63:\"https://ps.w.org/polylang/assets/banner-772x250.png?rev=1405299\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"5.6\";}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"7.8.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.7.8.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.gif?rev=2869506\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.gif?rev=2869506\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2366418\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2366418\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.1\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"7.3\";}s:45:\"woocommerce-payments/woocommerce-payments.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:34:\"w.org/plugins/woocommerce-payments\";s:4:\"slug\";s:20:\"woocommerce-payments\";s:6:\"plugin\";s:45:\"woocommerce-payments/woocommerce-payments.php\";s:11:\"new_version\";s:5:\"6.0.0\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/woocommerce-payments/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/woocommerce-payments.6.0.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/woocommerce-payments/assets/icon-256x256.png?rev=2429229\";s:2:\"1x\";s:73:\"https://ps.w.org/woocommerce-payments/assets/icon-128x128.png?rev=2429229\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/woocommerce-payments/assets/banner-1544x500.png?rev=2429229\";s:2:\"1x\";s:75:\"https://ps.w.org/woocommerce-payments/assets/banner-772x250.png?rev=2429229\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.0\";s:6:\"tested\";s:5:\"6.2.2\";s:12:\"requires_php\";s:3:\"7.3\";}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"6.1.6\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:3:\"6.2\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:5:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"6.1.6\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.6.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=2892919\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=2892919\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.7\";}s:29:\"acf-extended/acf-extended.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:26:\"w.org/plugins/acf-extended\";s:4:\"slug\";s:12:\"acf-extended\";s:6:\"plugin\";s:29:\"acf-extended/acf-extended.php\";s:11:\"new_version\";s:7:\"0.8.9.3\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/acf-extended/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/acf-extended.0.8.9.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/acf-extended/assets/icon-256x256.png?rev=2071550\";s:2:\"1x\";s:65:\"https://ps.w.org/acf-extended/assets/icon-128x128.png?rev=2071550\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/acf-extended/assets/banner-1544x500.png?rev=2071550\";s:2:\"1x\";s:67:\"https://ps.w.org/acf-extended/assets/banner-772x250.png?rev=2071550\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:25:\"timber-library/timber.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/timber-library\";s:4:\"slug\";s:14:\"timber-library\";s:6:\"plugin\";s:25:\"timber-library/timber.php\";s:11:\"new_version\";s:6:\"1.22.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/timber-library/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/timber-library.1.22.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/timber-library/assets/icon-256x256.png?rev=1482054\";s:2:\"1x\";s:67:\"https://ps.w.org/timber-library/assets/icon-128x128.png?rev=1482055\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/timber-library/assets/banner-1544x500.jpg?rev=1481635\";s:2:\"1x\";s:69:\"https://ps.w.org/timber-library/assets/banner-772x250.jpg?rev=1481619\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:5:\"5.3.0\";}s:45:\"woocommerce-services/woocommerce-services.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:34:\"w.org/plugins/woocommerce-services\";s:4:\"slug\";s:20:\"woocommerce-services\";s:6:\"plugin\";s:45:\"woocommerce-services/woocommerce-services.php\";s:11:\"new_version\";s:5:\"2.2.5\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/woocommerce-services/\";s:7:\"package\";s:69:\"https://downloads.wordpress.org/plugin/woocommerce-services.2.2.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-256x256.png?rev=2398959\";s:2:\"1x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-128x128.png?rev=2398959\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/woocommerce-services/assets/banner-1544x500.png?rev=2398959\";s:2:\"1x\";s:75:\"https://ps.w.org/woocommerce-services/assets/banner-772x250.png?rev=2398959\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:19:{s:30:\"advanced-custom-fields/acf.php\";s:5:\"6.1.6\";s:29:\"acf-extended/acf-extended.php\";s:7:\"0.8.9.3\";s:34:\"advanced-custom-fields-pro/acf.php\";s:6:\"5.10.2\";s:43:\"advanced-custom-fields-test-wysiwyg/acf.php\";s:5:\"6.1.6\";s:29:\"advancedform/advancedform.php\";s:3:\"1.0\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.3\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:6:\"1.11.1\";s:25:\"forminator/forminator.php\";s:7:\"1.15.12\";s:51:\"google-listings-and-ads/google-listings-and-ads.php\";s:5:\"2.4.6\";s:19:\"jetpack/jetpack.php\";s:6:\"12.1.1\";s:21:\"mailpoet/mailpoet.php\";s:6:\"4.17.1\";s:17:\"matomo/matomo.php\";s:5:\"4.6.0\";s:55:\"pinterest-for-woocommerce/pinterest-for-woocommerce.php\";s:5:\"1.3.0\";s:21:\"polylang/polylang.php\";s:5:\"3.1.4\";s:25:\"timber-library/timber.php\";s:6:\"1.22.1\";s:57:\"WP-TinyMCE-Dev-Starter-Kit-master/tinymce-dev-starter.php\";s:3:\"1.0\";s:27:\"woocommerce/woocommerce.php\";s:5:\"7.7.2\";s:45:\"woocommerce-payments/woocommerce-payments.php\";s:5:\"5.9.0\";s:45:\"woocommerce-services/woocommerce-services.php\";s:5:\"2.2.5\";}}','no');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(1,2,'_wp_page_template','default'),
(2,3,'_wp_page_template','default'),
(3,5,'_edit_lock','1687878361:1'),
(4,7,'_menu_item_type','custom'),
(5,7,'_menu_item_menu_item_parent','0'),
(6,7,'_menu_item_object_id','7'),
(7,7,'_menu_item_object','custom'),
(8,7,'_menu_item_target',''),
(9,7,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(10,7,'_menu_item_xfn',''),
(11,7,'_menu_item_url','#0'),
(13,8,'_menu_item_type','custom'),
(14,8,'_menu_item_menu_item_parent','0'),
(15,8,'_menu_item_object_id','8'),
(16,8,'_menu_item_object','custom'),
(17,8,'_menu_item_target',''),
(18,8,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(19,8,'_menu_item_xfn',''),
(20,8,'_menu_item_url','#0'),
(22,9,'_menu_item_type','custom'),
(23,9,'_menu_item_menu_item_parent','0'),
(24,9,'_menu_item_object_id','9'),
(25,9,'_menu_item_object','custom'),
(26,9,'_menu_item_target',''),
(27,9,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(28,9,'_menu_item_xfn',''),
(29,9,'_menu_item_url','#0'),
(31,10,'_menu_item_type','custom'),
(32,10,'_menu_item_menu_item_parent','0'),
(33,10,'_menu_item_object_id','10'),
(34,10,'_menu_item_object','custom'),
(35,10,'_menu_item_target',''),
(36,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(37,10,'_menu_item_xfn',''),
(38,10,'_menu_item_url','#0'),
(40,11,'_edit_last','1'),
(42,11,'_edit_lock','1687855342:1'),
(43,12,'_edit_last','1'),
(44,12,'_edit_lock','1687856117:1'),
(45,14,'_edit_last','1'),
(46,14,'_edit_lock','1687867862:1'),
(47,36,'_edit_last','1'),
(48,36,'_edit_lock','1687869698:1'),
(49,5,'_edit_last','1'),
(50,5,'_wp_page_template','default'),
(51,5,'hero_image',''),
(52,5,'_hero_image','field_649ac7b87efe8'),
(53,5,'hero_title','Lorem ipsum dolor sit amet'),
(54,5,'_hero_title','field_649ac8067efe9'),
(55,5,'hero_subtitle','Culpa exercitation eiusmod facilis eveniet voluptas'),
(56,5,'_hero_subtitle','field_649ac8347efea'),
(57,5,'hero_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(58,5,'_hero_button','field_649ac85f7efeb'),
(59,5,'hero',''),
(60,5,'_hero','field_649ac7b07efe7'),
(61,5,'content_0_carousel_cards_type_of_posts','events'),
(62,5,'_content_0_carousel_cards_type_of_posts','field_649aa8d8abaec'),
(63,5,'content_0_carousel_cards',''),
(64,5,'_content_0_carousel_cards','field_649ac926921b0_field_649aa4a3abaea'),
(65,5,'content','a:2:{i:0;s:14:\"carousel_cards\";i:1;s:13:\"carousel_full\";}'),
(66,5,'_content','field_649ac8bb921af'),
(67,48,'hero_image',''),
(68,48,'_hero_image','field_649ac7b87efe8'),
(69,48,'hero_title','Lorem ipsum dolor sit amet'),
(70,48,'_hero_title','field_649ac8067efe9'),
(71,48,'hero_subtitle','Culpa exercitation eiusmod facilis eveniet voluptas'),
(72,48,'_hero_subtitle','field_649ac8347efea'),
(73,48,'hero_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(74,48,'_hero_button','field_649ac85f7efeb'),
(75,48,'hero',''),
(76,48,'_hero','field_649ac7b07efe7'),
(77,48,'content_0_carousel_cards_type_of_posts','events'),
(78,48,'_content_0_carousel_cards_type_of_posts','field_649aa8d8abaec'),
(79,48,'content_0_carousel_cards',''),
(80,48,'_content_0_carousel_cards','field_649ac926921b0_field_649aa4a3abaea'),
(81,48,'content','a:1:{i:0;s:14:\"carousel_cards\";}'),
(82,48,'_content','field_649ac8bb921af'),
(83,49,'_edit_last','1'),
(84,49,'_edit_lock','1687867783:1'),
(85,51,'_edit_last','1'),
(86,51,'_edit_lock','1687867790:1'),
(87,53,'_edit_last','1'),
(88,53,'_edit_lock','1687871589:1'),
(89,5,'content_0_carousel_cards_events','a:4:{i:0;s:2:\"12\";i:1;s:2:\"49\";i:2;s:2:\"51\";i:3;s:2:\"53\";}'),
(90,5,'_content_0_carousel_cards_events','field_649aa83fabaeb'),
(91,5,'content_1_carousel_full_title','Lorem donec nec'),
(92,5,'_content_1_carousel_full_title','field_649aa9d51f6a7'),
(93,5,'content_1_carousel_full_items_0_text','Eget tempus donec nec aliquet ipsum amet tincidunt viverra orci suscipit'),
(94,5,'_content_1_carousel_full_items_0_text','field_649aaa1c1f6a9'),
(95,5,'content_1_carousel_full_items_0_image',''),
(96,5,'_content_1_carousel_full_items_0_image','field_649aaa281f6aa'),
(97,5,'content_1_carousel_full_items_0_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(98,5,'_content_1_carousel_full_items_0_button','field_649aaa3b1f6ab'),
(99,5,'content_1_carousel_full_items_1_text','Eget tempus donec nec aliquet ipsum amet tincidunt viverra orci suscipit'),
(100,5,'_content_1_carousel_full_items_1_text','field_649aaa1c1f6a9'),
(101,5,'content_1_carousel_full_items_1_image',''),
(102,5,'_content_1_carousel_full_items_1_image','field_649aaa281f6aa'),
(103,5,'content_1_carousel_full_items_1_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(104,5,'_content_1_carousel_full_items_1_button','field_649aaa3b1f6ab'),
(105,5,'content_1_carousel_full_items','2'),
(106,5,'_content_1_carousel_full_items','field_649aa9ff1f6a8'),
(107,5,'content_1_carousel_full',''),
(108,5,'_content_1_carousel_full','field_649acf43cc82f_field_649aa9af1f6a6'),
(109,55,'hero_image',''),
(110,55,'_hero_image','field_649ac7b87efe8'),
(111,55,'hero_title','Lorem ipsum dolor sit amet'),
(112,55,'_hero_title','field_649ac8067efe9'),
(113,55,'hero_subtitle','Culpa exercitation eiusmod facilis eveniet voluptas'),
(114,55,'_hero_subtitle','field_649ac8347efea'),
(115,55,'hero_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(116,55,'_hero_button','field_649ac85f7efeb'),
(117,55,'hero',''),
(118,55,'_hero','field_649ac7b07efe7'),
(119,55,'content_0_carousel_cards_type_of_posts','events'),
(120,55,'_content_0_carousel_cards_type_of_posts','field_649aa8d8abaec'),
(121,55,'content_0_carousel_cards',''),
(122,55,'_content_0_carousel_cards','field_649ac926921b0_field_649aa4a3abaea'),
(123,55,'content','a:2:{i:0;s:14:\"carousel_cards\";i:1;s:13:\"carousel_full\";}'),
(124,55,'_content','field_649ac8bb921af'),
(125,55,'content_0_carousel_cards_events','a:4:{i:0;s:2:\"12\";i:1;s:2:\"49\";i:2;s:2:\"51\";i:3;s:2:\"53\";}'),
(126,55,'_content_0_carousel_cards_events','field_649aa83fabaeb'),
(127,55,'content_1_carousel_full_title',''),
(128,55,'_content_1_carousel_full_title','field_649aa9d51f6a7'),
(129,55,'content_1_carousel_full_items_0_text','Eget tempus donec nec aliquet ipsum amet tincidunt viverra orci suscipit'),
(130,55,'_content_1_carousel_full_items_0_text','field_649aaa1c1f6a9'),
(131,55,'content_1_carousel_full_items_0_image',''),
(132,55,'_content_1_carousel_full_items_0_image','field_649aaa281f6aa'),
(133,55,'content_1_carousel_full_items_0_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(134,55,'_content_1_carousel_full_items_0_button','field_649aaa3b1f6ab'),
(135,55,'content_1_carousel_full_items_1_text','Eget tempus donec nec aliquet ipsum amet tincidunt viverra orci suscipit'),
(136,55,'_content_1_carousel_full_items_1_text','field_649aaa1c1f6a9'),
(137,55,'content_1_carousel_full_items_1_image',''),
(138,55,'_content_1_carousel_full_items_1_image','field_649aaa281f6aa'),
(139,55,'content_1_carousel_full_items_1_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(140,55,'_content_1_carousel_full_items_1_button','field_649aaa3b1f6ab'),
(141,55,'content_1_carousel_full_items','2'),
(142,55,'_content_1_carousel_full_items','field_649aa9ff1f6a8'),
(143,55,'content_1_carousel_full',''),
(144,55,'_content_1_carousel_full','field_649acf43cc82f_field_649aa9af1f6a6'),
(145,5,'content_0_variation','test'),
(146,5,'_content_0_variation','field_649ad45563329'),
(147,55,'content_0_variation','test'),
(148,55,'_content_0_variation','field_649ad45563329'),
(149,5,'content_0_','test'),
(150,5,'_content_0_','field_649ad45563329'),
(151,57,'hero_image',''),
(152,57,'_hero_image','field_649ac7b87efe8'),
(153,57,'hero_title','Lorem ipsum dolor sit amet'),
(154,57,'_hero_title','field_649ac8067efe9'),
(155,57,'hero_subtitle','Culpa exercitation eiusmod facilis eveniet voluptas'),
(156,57,'_hero_subtitle','field_649ac8347efea'),
(157,57,'hero_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(158,57,'_hero_button','field_649ac85f7efeb'),
(159,57,'hero',''),
(160,57,'_hero','field_649ac7b07efe7'),
(161,57,'content_0_carousel_cards_type_of_posts','events'),
(162,57,'_content_0_carousel_cards_type_of_posts','field_649aa8d8abaec'),
(163,57,'content_0_carousel_cards',''),
(164,57,'_content_0_carousel_cards','field_649ac926921b0_field_649aa4a3abaea'),
(165,57,'content','a:2:{i:0;s:14:\"carousel_cards\";i:1;s:13:\"carousel_full\";}'),
(166,57,'_content','field_649ac8bb921af'),
(167,57,'content_0_carousel_cards_events','a:4:{i:0;s:2:\"12\";i:1;s:2:\"49\";i:2;s:2:\"51\";i:3;s:2:\"53\";}'),
(168,57,'_content_0_carousel_cards_events','field_649aa83fabaeb'),
(169,57,'content_1_carousel_full_title','Lorem donec nec'),
(170,57,'_content_1_carousel_full_title','field_649aa9d51f6a7'),
(171,57,'content_1_carousel_full_items_0_text','Eget tempus donec nec aliquet ipsum amet tincidunt viverra orci suscipit'),
(172,57,'_content_1_carousel_full_items_0_text','field_649aaa1c1f6a9'),
(173,57,'content_1_carousel_full_items_0_image',''),
(174,57,'_content_1_carousel_full_items_0_image','field_649aaa281f6aa'),
(175,57,'content_1_carousel_full_items_0_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(176,57,'_content_1_carousel_full_items_0_button','field_649aaa3b1f6ab'),
(177,57,'content_1_carousel_full_items_1_text','Eget tempus donec nec aliquet ipsum amet tincidunt viverra orci suscipit'),
(178,57,'_content_1_carousel_full_items_1_text','field_649aaa1c1f6a9'),
(179,57,'content_1_carousel_full_items_1_image',''),
(180,57,'_content_1_carousel_full_items_1_image','field_649aaa281f6aa'),
(181,57,'content_1_carousel_full_items_1_button','a:3:{s:5:\"title\";s:10:\"Découvrir\";s:3:\"url\";s:2:\"#0\";s:6:\"target\";s:0:\"\";}'),
(182,57,'_content_1_carousel_full_items_1_button','field_649aaa3b1f6ab'),
(183,57,'content_1_carousel_full_items','2'),
(184,57,'_content_1_carousel_full_items','field_649aa9ff1f6a8'),
(185,57,'content_1_carousel_full',''),
(186,57,'_content_1_carousel_full','field_649acf43cc82f_field_649aa9af1f6a6'),
(187,57,'content_0_variation','test'),
(188,57,'_content_0_variation','field_649ad45563329'),
(189,57,'content_0_','test'),
(190,57,'_content_0_','field_649ad45563329');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(1,1,'2023-06-26 13:34:45','2023-06-26 11:34:45','<!-- wp:paragraph -->\n<p>Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis commencez à écrire !</p>\n<!-- /wp:paragraph -->','Bonjour tout le monde !','','publish','open','open','','bonjour-tout-le-monde','','','2023-06-26 13:34:45','2023-06-26 11:34:45','',0,'http://theme-danka.test/?p=1',0,'post','',1),
(2,1,'2023-06-26 13:34:45','2023-06-26 11:34:45','<!-- wp:paragraph -->\n<p>Ceci est une page d’exemple. C’est différent d’un article de blog parce qu’elle restera au même endroit et apparaîtra dans la navigation de votre site (dans la plupart des thèmes). La plupart des gens commencent par une page « À propos » qui les présente aux personnes visitant le site. Cela pourrait ressembler à quelque chose comme cela :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Bonjour ! Je suis un mécanicien qui aspire à devenir acteur, et voici mon site. J’habite à Bordeaux, j’ai un super chien baptisé Russell, et j’aime la vodka (ainsi qu’être surpris par la pluie soudaine lors de longues balades sur la plage au coucher du soleil).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>…ou quelque chose comme cela :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La société 123 Machin Truc a été créée en 1971, et n’a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules supers pour la communauté bouzemontoise.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>En tant que nouvel utilisateur ou utilisatrice de WordPress, vous devriez vous rendre sur <a href=\"http://theme-danka.test/wp-admin/\">votre tableau de bord</a> pour supprimer cette page et créer de nouvelles pages pour votre contenu. Amusez-vous bien !</p>\n<!-- /wp:paragraph -->','Page d’exemple','','publish','closed','open','','page-d-exemple','','','2023-06-26 13:34:45','2023-06-26 11:34:45','',0,'http://theme-danka.test/?page_id=2',0,'page','',0),
(3,1,'2023-06-26 13:34:45','2023-06-26 11:34:45','<!-- wp:heading --><h2>Qui sommes-nous ?</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>L’adresse de notre site est : http://theme-danka.test.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Commentaires</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Quand vous laissez un commentaire sur notre site, les données inscrites dans le formulaire de commentaire, ainsi que votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Une chaîne anonymisée créée à partir de votre adresse e-mail (également appelée hash) peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar sont disponibles ici : https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Médias</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous téléversez des images sur le site, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF de coordonnées GPS. Les personnes visitant votre site peuvent télécharger et extraire des données de localisation depuis ces images.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous déposez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse e-mail et site dans des cookies. C’est uniquement pour votre confort afin de ne pas avoir à saisir ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d’un an.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si vous vous rendez sur la page de connexion, un cookie temporaire sera créé afin de déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un cookie de connexion est de deux jours, celle d’un cookie d’option d’écran est d’un an. Si vous cochez « Se souvenir de moi », votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le cookie de connexion sera effacé.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l’ID de la publication que vous venez de modifier. Il expire au bout d’un jour.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Contenu embarqué depuis d’autres sites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). Le contenu intégré depuis d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d’un compte connecté sur leur site web.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Utilisation et transmission de vos données personnelles</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous demandez une réinitialisation de votre mot de passe, votre adresse IP sera incluse dans l’e-mail de réinitialisation.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Durées de stockage de vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Pour les comptes qui s’inscrivent sur notre site (le cas échéant), nous stockons également les données personnelles indiquées dans leur profil. Tous les comptes peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur identifiant). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Les droits que vous avez sur vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Où vos données sont envoyées</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p><!-- /wp:paragraph -->','Politique de confidentialité','','draft','closed','open','','politique-de-confidentialite','','','2023-06-26 13:34:45','2023-06-26 11:34:45','',0,'http://theme-danka.test/?page_id=3',0,'page','',0),
(4,1,'2023-06-26 13:34:54','0000-00-00 00:00:00','','Brouillon auto','','auto-draft','open','open','','','','','2023-06-26 13:34:54','0000-00-00 00:00:00','',0,'http://theme-danka.test/?p=4',0,'post','',0),
(5,1,'2023-06-26 14:22:29','2023-06-26 12:22:29','','Accueil','','publish','closed','closed','','accueil','','','2023-06-27 17:06:00','2023-06-27 15:06:00','',0,'http://theme-danka.test/?page_id=5',0,'page','',0),
(6,1,'2023-06-26 14:22:29','2023-06-26 12:22:29','','Accueil','','inherit','closed','closed','','5-revision-v1','','','2023-06-26 14:22:29','2023-06-26 12:22:29','',5,'http://theme-danka.test/?p=6',0,'revision','',0),
(7,1,'2023-06-26 16:06:13','2023-06-26 14:06:13','','Item 1','','publish','closed','closed','','item-1','','','2023-06-26 16:06:13','2023-06-26 14:06:13','',0,'http://theme-danka.test/?p=7',1,'nav_menu_item','',0),
(8,1,'2023-06-26 16:06:13','2023-06-26 14:06:13','','Item 2','','publish','closed','closed','','item-2','','','2023-06-26 16:06:13','2023-06-26 14:06:13','',0,'http://theme-danka.test/?p=8',2,'nav_menu_item','',0),
(9,1,'2023-06-26 16:06:13','2023-06-26 14:06:13','','Item 3','','publish','closed','closed','','item-3','','','2023-06-26 16:06:13','2023-06-26 14:06:13','',0,'http://theme-danka.test/?p=9',3,'nav_menu_item','',0),
(10,1,'2023-06-26 16:06:13','2023-06-26 14:06:13','','Item 4','','publish','closed','closed','','item-4','','','2023-06-26 16:06:13','2023-06-26 14:06:13','',0,'http://theme-danka.test/?p=10',4,'nav_menu_item','',0),
(11,1,'2023-06-27 10:38:52','2023-06-27 08:38:52','a:40:{s:4:\"name\";s:5:\"event\";s:5:\"label\";s:11:\"Évènement\";s:6:\"active\";b:1;s:11:\"description\";s:0:\"\";s:12:\"hierarchical\";b:0;s:8:\"supports\";a:5:{i:0;s:5:\"title\";i:1;s:6:\"author\";i:2;s:9:\"thumbnail\";i:3;s:7:\"excerpt\";i:4;s:9:\"revisions\";}s:10:\"taxonomies\";a:0:{}s:6:\"public\";b:1;s:19:\"exclude_from_search\";b:0;s:18:\"publicly_queryable\";b:1;s:10:\"can_export\";b:1;s:16:\"delete_with_user\";N;s:6:\"labels\";a:0:{}s:13:\"menu_position\";i:10;s:9:\"menu_icon\";s:22:\"dashicons-calendar-alt\";s:7:\"show_ui\";b:1;s:12:\"show_in_menu\";b:1;s:17:\"show_in_nav_menus\";b:1;s:17:\"show_in_admin_bar\";b:1;s:11:\"has_archive\";b:1;s:7:\"rewrite\";b:1;s:15:\"capability_type\";s:4:\"post\";s:12:\"capabilities\";a:0:{}s:12:\"map_meta_cap\";N;s:12:\"show_in_rest\";b:0;s:9:\"rest_base\";s:0:\"\";s:21:\"rest_controller_class\";s:24:\"WP_REST_Posts_Controller\";s:21:\"acfe_archive_template\";s:0:\"\";s:16:\"acfe_archive_ppp\";i:10;s:20:\"acfe_archive_orderby\";s:4:\"date\";s:18:\"acfe_archive_order\";s:4:\"DESC\";s:21:\"acfe_archive_meta_key\";s:0:\"\";s:22:\"acfe_archive_meta_type\";s:0:\"\";s:20:\"acfe_single_template\";s:0:\"\";s:18:\"acfe_admin_archive\";b:1;s:14:\"acfe_admin_ppp\";i:10;s:18:\"acfe_admin_orderby\";s:4:\"date\";s:16:\"acfe_admin_order\";s:4:\"DESC\";s:19:\"acfe_admin_meta_key\";s:0:\"\";s:20:\"acfe_admin_meta_type\";s:0:\"\";}','Évènement','','publish','closed','closed','','event','','','2023-06-27 10:44:45','2023-06-27 08:44:45','',0,'http://theme-danka.test/?post_type=acfe-dpt&#038;p=11',0,'acfe-dpt','',0),
(12,1,'2023-06-27 10:42:45','0000-00-00 00:00:00','','Évènement 1','','draft','closed','open','','','','','2023-06-27 10:42:45','2023-06-27 08:42:45','',0,'http://theme-danka.test/?post_type=event&#038;p=12',0,'event','',0),
(13,1,'2023-06-27 10:42:45','2023-06-27 08:42:45','','Évènement 1','','inherit','closed','closed','','12-revision-v1','','','2023-06-27 10:42:45','2023-06-27 08:42:45','',12,'http://theme-danka.test/?p=13',0,'revision','',0),
(14,1,'2023-06-27 11:17:25','2023-06-27 09:17:25','a:12:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:4:\"left\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:18:\"acfe_display_title\";s:0:\"\";s:13:\"acfe_autosync\";s:0:\"\";s:9:\"acfe_form\";i:0;s:9:\"acfe_meta\";s:0:\"\";s:9:\"acfe_note\";s:0:\"\";}','Composants','composants','acf-disabled','closed','closed','','group_649aa48985805','','','2023-06-27 14:11:02','2023-06-27 12:11:02','',0,'http://theme-danka.test/?post_type=acf-field-group&#038;p=14',0,'acf-field-group','',0),
(15,1,'2023-06-27 11:17:25','2023-06-27 09:17:25','a:13:{s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:6:\"layout\";s:5:\"block\";s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_group_modal\";i:0;s:10:\"sub_fields\";a:0:{}s:22:\"acfe_group_modal_close\";i:0;s:23:\"acfe_group_modal_button\";s:0:\"\";s:21:\"acfe_group_modal_size\";s:5:\"large\";}','Carrousel de cartes (composant)','carousel_cards','publish','closed','closed','','field_649aa4a3abaea','','','2023-06-27 14:02:15','2023-06-27 12:02:15','',14,'http://theme-danka.test/?post_type=acf-field&#038;p=15',0,'acf-field','',0),
(16,1,'2023-06-27 11:17:25','2023-06-27 09:17:25','a:16:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:7:\"choices\";a:1:{s:6:\"events\";s:12:\"Évènements\";}s:13:\"default_value\";b:0;s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:13:\"return_format\";s:5:\"value\";s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";s:12:\"allow_custom\";i:0;s:18:\"search_placeholder\";s:0:\"\";}','Type de publication','type_of_posts','publish','closed','closed','','field_649aa8d8abaec','','','2023-06-27 11:18:06','2023-06-27 09:18:06','',15,'http://theme-danka.test/?post_type=acf-field&#038;p=16',0,'acf-field','',0),
(17,1,'2023-06-27 11:17:25','2023-06-27 09:17:25','a:14:{s:4:\"type\";s:12:\"relationship\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_649aa8d8abaec\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"events\";}}}s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:9:\"post_type\";a:1:{i:0;s:5:\"event\";}s:8:\"taxonomy\";s:0:\"\";s:7:\"filters\";a:2:{i:0;s:6:\"search\";i:1;s:8:\"taxonomy\";}s:8:\"elements\";a:1:{i:0;s:14:\"featured_image\";}s:3:\"min\";i:3;s:3:\"max\";i:10;s:13:\"return_format\";s:6:\"object\";s:18:\"acfe_bidirectional\";a:1:{s:26:\"acfe_bidirectional_enabled\";s:1:\"0\";}}','','events','publish','closed','closed','','field_649aa83fabaeb','','','2023-06-27 14:08:52','2023-06-27 12:08:52','',15,'http://theme-danka.test/?post_type=acf-field&#038;p=17',1,'acf-field','',0),
(18,1,'2023-06-27 11:18:06','2023-06-27 09:18:06','a:13:{s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:6:\"layout\";s:5:\"block\";s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_group_modal\";i:0;s:10:\"sub_fields\";a:0:{}s:22:\"acfe_group_modal_close\";i:0;s:23:\"acfe_group_modal_button\";s:0:\"\";s:21:\"acfe_group_modal_size\";s:5:\"large\";}','Témoignage (composant)','testimony','publish','closed','closed','','field_649aa931576a1','','','2023-06-27 14:02:15','2023-06-27 12:02:15','',14,'http://theme-danka.test/?post_type=acf-field&#038;p=18',3,'acf-field','',0),
(19,1,'2023-06-27 11:19:39','2023-06-27 09:19:39','a:11:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";i:4;s:9:\"new_lines\";s:2:\"br\";s:18:\"acfe_textarea_code\";i:0;}','Texte','text','publish','closed','closed','','field_649aa95b5ffa2','','','2023-06-27 11:19:39','2023-06-27 09:19:39','',18,'http://theme-danka.test/?post_type=acf-field&p=19',0,'acf-field','',0),
(20,1,'2023-06-27 11:19:39','2023-06-27 09:19:39','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Auteur','author','publish','closed','closed','','field_649aa97d5ffa3','','','2023-06-27 11:19:39','2023-06-27 09:19:39','',18,'http://theme-danka.test/?post_type=acf-field&p=20',1,'acf-field','',0),
(21,1,'2023-06-27 11:19:39','2023-06-27 09:19:39','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Bouton','button','publish','closed','closed','','field_649aa9865ffa4','','','2023-06-27 11:19:39','2023-06-27 09:19:39','',18,'http://theme-danka.test/?post_type=acf-field&p=21',2,'acf-field','',0),
(22,1,'2023-06-27 11:23:13','2023-06-27 09:23:13','a:13:{s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:6:\"layout\";s:5:\"block\";s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_group_modal\";i:0;s:10:\"sub_fields\";a:0:{}s:22:\"acfe_group_modal_close\";i:0;s:23:\"acfe_group_modal_button\";s:0:\"\";s:21:\"acfe_group_modal_size\";s:5:\"large\";}','Carrousel pleine largeur (composant)','carousel_full','publish','closed','closed','','field_649aa9af1f6a6','','','2023-06-27 14:02:15','2023-06-27 12:02:15','',14,'http://theme-danka.test/?post_type=acf-field&#038;p=22',1,'acf-field','',0),
(23,1,'2023-06-27 11:23:13','2023-06-27 09:23:13','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Titre','title','publish','closed','closed','','field_649aa9d51f6a7','','','2023-06-27 11:23:13','2023-06-27 09:23:13','',22,'http://theme-danka.test/?post_type=acf-field&p=23',0,'acf-field','',0),
(24,1,'2023-06-27 11:23:13','2023-06-27 09:23:13','a:12:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:29:\"acfe_repeater_stylised_button\";i:0;s:9:\"collapsed\";s:19:\"field_649aaa1c1f6a9\";s:3:\"min\";i:2;s:3:\"max\";i:10;s:6:\"layout\";s:5:\"block\";s:12:\"button_label\";s:0:\"\";}','','items','publish','closed','closed','','field_649aa9ff1f6a8','','','2023-06-27 14:11:02','2023-06-27 12:11:02','',22,'http://theme-danka.test/?post_type=acf-field&#038;p=24',1,'acf-field','',0),
(25,1,'2023-06-27 11:23:13','2023-06-27 09:23:13','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Texte','text','publish','closed','closed','','field_649aaa1c1f6a9','','','2023-06-27 11:23:13','2023-06-27 09:23:13','',24,'http://theme-danka.test/?post_type=acf-field&p=25',0,'acf-field','',0),
(26,1,'2023-06-27 11:23:13','2023-06-27 09:23:13','a:17:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:8:\"uploader\";s:0:\"\";s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:14:\"acfe_thumbnail\";i:0;s:7:\"library\";s:3:\"all\";}','Image','image','publish','closed','closed','','field_649aaa281f6aa','','','2023-06-27 11:23:13','2023-06-27 09:23:13','',24,'http://theme-danka.test/?post_type=acf-field&p=26',1,'acf-field','',0),
(27,1,'2023-06-27 11:23:13','2023-06-27 09:23:13','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Bouton','button','publish','closed','closed','','field_649aaa3b1f6ab','','','2023-06-27 11:23:13','2023-06-27 09:23:13','',24,'http://theme-danka.test/?post_type=acf-field&p=27',2,'acf-field','',0),
(28,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:13:{s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:6:\"layout\";s:5:\"block\";s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_group_modal\";i:0;s:10:\"sub_fields\";a:0:{}s:22:\"acfe_group_modal_close\";i:0;s:23:\"acfe_group_modal_button\";s:0:\"\";s:21:\"acfe_group_modal_size\";s:5:\"large\";}','Fichier (composant)','file','publish','closed','closed','','field_649aab1b44a29','','','2023-06-27 14:02:15','2023-06-27 12:02:15','',14,'http://theme-danka.test/?post_type=acf-field&#038;p=28',2,'acf-field','',0),
(29,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Texte','text','publish','closed','closed','','field_649aab8444a2b','','','2023-06-27 11:29:47','2023-06-27 09:29:47','',28,'http://theme-danka.test/?post_type=acf-field&p=29',0,'acf-field','',0),
(30,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:11:{s:4:\"type\";s:4:\"file\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:8:\"uploader\";s:0:\"\";s:13:\"return_format\";s:5:\"array\";s:8:\"min_size\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:7:\"library\";s:3:\"all\";}','','file','publish','closed','closed','','field_649aab8d44a2c','','','2023-06-27 11:29:47','2023-06-27 09:29:47','',28,'http://theme-danka.test/?post_type=acf-field&p=30',1,'acf-field','',0),
(31,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:13:{s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:6:\"layout\";s:5:\"block\";s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_group_modal\";i:0;s:10:\"sub_fields\";a:0:{}s:22:\"acfe_group_modal_close\";i:0;s:23:\"acfe_group_modal_button\";s:0:\"\";s:21:\"acfe_group_modal_size\";s:5:\"large\";}','Accordéons (composant)','accordions','publish','closed','closed','','field_649aab7244a2a','','','2023-06-27 14:02:15','2023-06-27 12:02:15','',14,'http://theme-danka.test/?post_type=acf-field&#038;p=31',4,'acf-field','',0),
(32,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:10:{s:4:\"type\";s:10:\"true_false\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"message\";s:0:\"\";s:13:\"default_value\";i:0;s:2:\"ui\";i:1;s:10:\"ui_on_text\";s:0:\"\";s:11:\"ui_off_text\";s:0:\"\";}','Ouvrir un seul à la fois ?','one_by_one','publish','closed','closed','','field_649aabba44a2d','','','2023-06-27 11:29:47','2023-06-27 09:29:47','',31,'http://theme-danka.test/?post_type=acf-field&p=32',0,'acf-field','',0),
(33,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:12:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:29:\"acfe_repeater_stylised_button\";i:0;s:9:\"collapsed\";s:19:\"field_649aabd144a2e\";s:3:\"min\";i:1;s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}','','items','publish','closed','closed','','field_649aabde44a2f','','','2023-06-27 11:31:55','2023-06-27 09:31:55','',31,'http://theme-danka.test/?post_type=acf-field&#038;p=33',1,'acf-field','',0),
(34,1,'2023-06-27 11:29:47','2023-06-27 09:29:47','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Titre','title','publish','closed','closed','','field_649aabd144a2e','','','2023-06-27 11:31:55','2023-06-27 09:31:55','',33,'http://theme-danka.test/?post_type=acf-field&#038;p=34',0,'acf-field','',0),
(35,1,'2023-06-27 11:31:55','2023-06-27 09:31:55','a:20:{s:4:\"type\";s:16:\"advanced_wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"has_h1\";i:0;s:6:\"has_h2\";i:0;s:6:\"has_h3\";i:0;s:6:\"has_h4\";i:0;s:6:\"has_h5\";i:0;s:6:\"has_h6\";i:0;s:5:\"has_p\";i:1;s:10:\"has_button\";i:1;s:8:\"has_bold\";i:1;s:10:\"has_italic\";i:1;s:13:\"has_underline\";i:1;s:11:\"has_bullist\";i:1;s:11:\"has_numlist\";i:1;s:8:\"has_link\";i:1;s:13:\"has_forecolor\";i:0;}','Contenu','content','publish','closed','closed','','field_649aac234dbcc','','','2023-06-27 11:31:55','2023-06-27 09:31:55','',33,'http://theme-danka.test/?post_type=acf-field&p=35',1,'acf-field','',0),
(36,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:12:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"page_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:10:\"front_page\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:4:\"left\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";a:14:{i:0;s:9:\"permalink\";i:1;s:12:\"block_editor\";i:2;s:11:\"the_content\";i:3;s:7:\"excerpt\";i:4;s:10:\"discussion\";i:5;s:8:\"comments\";i:6;s:4:\"slug\";i:7;s:6:\"author\";i:8;s:6:\"format\";i:9;s:15:\"page_attributes\";i:10;s:14:\"featured_image\";i:11;s:10:\"categories\";i:12;s:4:\"tags\";i:13;s:15:\"send-trackbacks\";}s:11:\"description\";s:0:\"\";s:18:\"acfe_display_title\";s:0:\"\";s:13:\"acfe_autosync\";s:0:\"\";s:9:\"acfe_form\";i:0;s:9:\"acfe_meta\";s:0:\"\";s:9:\"acfe_note\";s:0:\"\";}','Type de page - Accueil','type-de-page-accueil','publish','closed','closed','','group_649aaee0cd654','','','2023-06-27 14:41:38','2023-06-27 12:41:38','',0,'http://theme-danka.test/?post_type=acf-field-group&#038;p=36',0,'acf-field-group','',0),
(37,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Écran d\'accueil','ecran_daccueil','publish','closed','closed','','field_649aaf317efe6','','','2023-06-27 13:30:58','2023-06-27 11:30:58','',36,'http://theme-danka.test/?post_type=acf-field&p=37',0,'acf-field','',0),
(38,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:12:{s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_group_modal\";i:0;s:10:\"sub_fields\";a:0:{}s:22:\"acfe_group_modal_close\";i:0;s:23:\"acfe_group_modal_button\";s:0:\"\";s:21:\"acfe_group_modal_size\";s:5:\"large\";}','','hero','publish','closed','closed','','field_649ac7b07efe7','','','2023-06-27 13:30:58','2023-06-27 11:30:58','',36,'http://theme-danka.test/?post_type=acf-field&p=38',1,'acf-field','',0),
(39,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:18:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:8:\"uploader\";s:0:\"\";s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:6:\"medium\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:14:\"acfe_thumbnail\";i:0;s:7:\"library\";s:3:\"all\";}','Image','image','publish','closed','closed','','field_649ac7b87efe8','','','2023-06-27 14:06:29','2023-06-27 12:06:29','',38,'http://theme-danka.test/?post_type=acf-field&#038;p=39',0,'acf-field','',0),
(40,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Titre','title','publish','closed','closed','','field_649ac8067efe9','','','2023-06-27 14:06:29','2023-06-27 12:06:29','',38,'http://theme-danka.test/?post_type=acf-field&#038;p=40',1,'acf-field','',0),
(41,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:11:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}','Sous-titre','subtitle','publish','closed','closed','','field_649ac8347efea','','','2023-06-27 13:30:58','2023-06-27 11:30:58','',38,'http://theme-danka.test/?post_type=acf-field&p=41',2,'acf-field','',0),
(42,1,'2023-06-27 13:30:58','2023-06-27 11:30:58','a:6:{s:4:\"type\";s:4:\"link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";}','Bouton','button','publish','closed','closed','','field_649ac85f7efeb','','','2023-06-27 13:30:58','2023-06-27 11:30:58','',38,'http://theme-danka.test/?post_type=acf-field&p=42',3,'acf-field','',0),
(43,1,'2023-06-27 13:34:08','2023-06-27 11:34:08','a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}','Contenu','contenu','publish','closed','closed','','field_649ac8ae921ae','','','2023-06-27 13:34:08','2023-06-27 11:34:08','',36,'http://theme-danka.test/?post_type=acf-field&p=43',2,'acf-field','',0),
(44,1,'2023-06-27 13:34:08','2023-06-27 11:34:08','a:25:{s:4:\"type\";s:16:\"flexible_content\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:14:\"acfe_save_meta\";i:0;s:22:\"acfe_flexible_advanced\";i:0;s:7:\"layouts\";a:3:{s:20:\"layout_649ac8cc74236\";a:14:{s:3:\"key\";s:20:\"layout_649ac8cc74236\";s:5:\"label\";s:19:\"Carrousel de cartes\";s:4:\"name\";s:14:\"carousel_cards\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:29:\"acfe_flexible_render_template\";b:0;s:26:\"acfe_flexible_render_style\";b:0;s:27:\"acfe_flexible_render_script\";b:0;s:23:\"acfe_flexible_thumbnail\";b:0;s:22:\"acfe_flexible_settings\";b:0;s:27:\"acfe_flexible_settings_size\";s:6:\"medium\";s:29:\"acfe_flexible_modal_edit_size\";b:0;s:22:\"acfe_flexible_category\";b:0;}s:20:\"layout_649acf2ecc82e\";a:14:{s:3:\"key\";s:20:\"layout_649acf2ecc82e\";s:5:\"label\";s:24:\"Carrousel pleine largeur\";s:4:\"name\";s:13:\"carousel_full\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:29:\"acfe_flexible_render_template\";b:0;s:26:\"acfe_flexible_render_style\";b:0;s:27:\"acfe_flexible_render_script\";b:0;s:23:\"acfe_flexible_thumbnail\";b:0;s:22:\"acfe_flexible_settings\";b:0;s:27:\"acfe_flexible_settings_size\";s:6:\"medium\";s:29:\"acfe_flexible_modal_edit_size\";b:0;s:22:\"acfe_flexible_category\";b:0;}s:20:\"layout_649acdf0cc82c\";a:14:{s:3:\"key\";s:20:\"layout_649acdf0cc82c\";s:5:\"label\";s:11:\"Témoignage\";s:4:\"name\";s:9:\"testimony\";s:7:\"display\";s:5:\"block\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:29:\"acfe_flexible_render_template\";b:0;s:26:\"acfe_flexible_render_style\";b:0;s:27:\"acfe_flexible_render_script\";b:0;s:23:\"acfe_flexible_thumbnail\";b:0;s:22:\"acfe_flexible_settings\";b:0;s:27:\"acfe_flexible_settings_size\";s:6:\"medium\";s:29:\"acfe_flexible_modal_edit_size\";b:0;s:22:\"acfe_flexible_category\";b:0;}}s:12:\"button_label\";s:20:\"Ajouter un élément\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:29:\"acfe_flexible_stylised_button\";b:0;s:32:\"acfe_flexible_hide_empty_message\";b:0;s:27:\"acfe_flexible_empty_message\";s:0:\"\";s:31:\"acfe_flexible_layouts_templates\";b:0;s:30:\"acfe_flexible_layouts_previews\";b:0;s:33:\"acfe_flexible_layouts_placeholder\";b:0;s:32:\"acfe_flexible_layouts_thumbnails\";b:0;s:30:\"acfe_flexible_layouts_settings\";b:0;s:19:\"acfe_flexible_async\";a:0:{}s:25:\"acfe_flexible_add_actions\";a:0:{}s:27:\"acfe_flexible_remove_button\";a:0:{}s:27:\"acfe_flexible_layouts_state\";b:0;s:24:\"acfe_flexible_modal_edit\";a:2:{s:32:\"acfe_flexible_modal_edit_enabled\";b:0;s:29:\"acfe_flexible_modal_edit_size\";s:5:\"large\";}s:19:\"acfe_flexible_modal\";a:5:{s:27:\"acfe_flexible_modal_enabled\";b:0;s:25:\"acfe_flexible_modal_title\";b:0;s:24:\"acfe_flexible_modal_size\";s:4:\"full\";s:23:\"acfe_flexible_modal_col\";s:1:\"4\";s:30:\"acfe_flexible_modal_categories\";b:0;}}','','content','publish','closed','closed','','field_649ac8bb921af','','','2023-06-27 14:10:27','2023-06-27 12:10:27','',36,'http://theme-danka.test/?post_type=acf-field&#038;p=44',3,'acf-field','',0),
(45,1,'2023-06-27 13:34:08','2023-06-27 11:34:08','a:17:{s:4:\"type\";s:5:\"clone\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_649ac8cc74236\";s:14:\"acfe_save_meta\";i:0;s:5:\"clone\";a:1:{i:0;s:19:\"field_649aa4a3abaea\";}s:7:\"display\";s:8:\"seamless\";s:6:\"layout\";s:5:\"block\";s:12:\"prefix_label\";i:0;s:11:\"prefix_name\";i:0;s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_clone_modal\";i:0;s:22:\"acfe_clone_modal_close\";i:0;s:23:\"acfe_clone_modal_button\";s:0:\"\";s:21:\"acfe_clone_modal_size\";s:5:\"large\";}','','','publish','closed','closed','','field_649ac926921b0','','','2023-06-27 14:01:23','2023-06-27 12:01:23','',44,'http://theme-danka.test/?post_type=acf-field&#038;p=45',0,'acf-field','',0),
(46,1,'2023-06-27 14:01:23','2023-06-27 12:01:23','a:16:{s:4:\"type\";s:5:\"clone\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_649acf2ecc82e\";s:5:\"clone\";a:1:{i:0;s:19:\"field_649aa9af1f6a6\";}s:7:\"display\";s:8:\"seamless\";s:6:\"layout\";s:5:\"block\";s:12:\"prefix_label\";i:0;s:11:\"prefix_name\";i:0;s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_clone_modal\";i:0;s:22:\"acfe_clone_modal_close\";i:0;s:23:\"acfe_clone_modal_button\";s:0:\"\";s:21:\"acfe_clone_modal_size\";s:5:\"large\";}','','','publish','closed','closed','','field_649acf43cc82f','','','2023-06-27 14:01:23','2023-06-27 12:01:23','',44,'http://theme-danka.test/?post_type=acf-field&p=46',0,'acf-field','',0),
(47,1,'2023-06-27 14:01:23','2023-06-27 12:01:23','a:16:{s:4:\"type\";s:5:\"clone\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_649acdf0cc82c\";s:5:\"clone\";a:1:{i:0;s:19:\"field_649aa931576a1\";}s:7:\"display\";s:8:\"seamless\";s:6:\"layout\";s:5:\"block\";s:12:\"prefix_label\";i:0;s:11:\"prefix_name\";i:0;s:19:\"acfe_seamless_style\";i:0;s:16:\"acfe_clone_modal\";i:0;s:22:\"acfe_clone_modal_close\";i:0;s:23:\"acfe_clone_modal_button\";s:0:\"\";s:21:\"acfe_clone_modal_size\";s:5:\"large\";}','','','publish','closed','closed','','field_649ace16cc82d','','','2023-06-27 14:01:23','2023-06-27 12:01:23','',44,'http://theme-danka.test/?post_type=acf-field&p=47',0,'acf-field','',0),
(48,1,'2023-06-27 14:07:40','2023-06-27 12:07:40','','Accueil','','inherit','closed','closed','','5-revision-v1','','','2023-06-27 14:07:40','2023-06-27 12:07:40','',5,'http://theme-danka.test/?p=48',0,'revision','',0),
(49,1,'2023-06-27 14:12:05','0000-00-00 00:00:00','','Évènement 2','','draft','closed','closed','','','','','2023-06-27 14:12:05','2023-06-27 12:12:05','',0,'http://theme-danka.test/?post_type=event&#038;p=49',0,'event','',0),
(50,1,'2023-06-27 14:12:05','2023-06-27 12:12:05','','Évènement 2','','inherit','closed','closed','','49-revision-v1','','','2023-06-27 14:12:05','2023-06-27 12:12:05','',49,'http://theme-danka.test/?p=50',0,'revision','',0),
(51,1,'2023-06-27 14:12:13','0000-00-00 00:00:00','','Évènement 3','','draft','closed','closed','','','','','2023-06-27 14:12:13','2023-06-27 12:12:13','',0,'http://theme-danka.test/?post_type=event&#038;p=51',0,'event','',0),
(52,1,'2023-06-27 14:12:13','2023-06-27 12:12:13','','Évènement 3','','inherit','closed','closed','','51-revision-v1','','','2023-06-27 14:12:13','2023-06-27 12:12:13','',51,'http://theme-danka.test/?p=52',0,'revision','',0),
(53,1,'2023-06-27 14:12:20','0000-00-00 00:00:00','','Évènement 4','','draft','closed','closed','','','','','2023-06-27 14:12:20','2023-06-27 12:12:20','',0,'http://theme-danka.test/?post_type=event&#038;p=53',0,'event','',0),
(54,1,'2023-06-27 14:12:20','2023-06-27 12:12:20','','Évènement 4','','inherit','closed','closed','','53-revision-v1','','','2023-06-27 14:12:20','2023-06-27 12:12:20','',53,'http://theme-danka.test/?p=54',0,'revision','',0),
(55,1,'2023-06-27 14:12:29','2023-06-27 12:12:29','','Accueil','','inherit','closed','closed','','5-revision-v1','','','2023-06-27 14:12:29','2023-06-27 12:12:29','',5,'http://theme-danka.test/?p=55',0,'revision','',0),
(56,1,'2023-06-27 14:22:00','2023-06-27 12:22:00','a:8:{s:4:\"type\";s:11:\"acfe_hidden\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"parent_layout\";s:20:\"layout_649ac8cc74236\";s:14:\"acfe_save_meta\";i:0;s:13:\"default_value\";s:4:\"test\";}','','','publish','closed','closed','','field_649ad45563329','','','2023-06-27 14:41:38','2023-06-27 12:41:38','',44,'http://theme-danka.test/?post_type=acf-field&#038;p=56',1,'acf-field','',0),
(57,1,'2023-06-27 17:06:00','2023-06-27 15:06:00','','Accueil','','inherit','closed','closed','','5-revision-v1','','','2023-06-27 17:06:00','2023-06-27 15:06:00','',5,'http://theme-danka.test/?p=57',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(1,1,0),
(7,2,0),
(8,2,0),
(9,2,0),
(10,2,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,1),
(2,2,'nav_menu','',0,4);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Non classé','non-classe',0),
(2,'En tête (primaire)','en-tete-primaire',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','danka'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','fresh'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers',''),
(15,1,'show_welcome_panel','1'),
(16,1,'session_tokens','a:2:{s:64:\"d0a684d91b9d28a6e49a50d3b896f53d5509e9ad0f189dfe352e26cd09051894\";a:4:{s:10:\"expiration\";i:1687952093;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\";s:5:\"login\";i:1687779293;}s:64:\"e0f0fb9e3b6f21d968a8187943c8d983af95161ae501d94023a4c416e543d291\";a:4:{s:10:\"expiration\";i:1687961083;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36\";s:5:\"login\";i:1687788283;}}'),
(17,1,'wp_dashboard_quick_press_last_post_id','4'),
(18,1,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19,1,'wp_persisted_preferences','a:2:{s:14:\"core/edit-post\";a:2:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;}s:9:\"_modified\";s:24:\"2023-06-26T12:22:22.577Z\";}'),
(20,1,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(21,1,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}'),
(22,1,'nav_menu_recently_edited','2'),
(23,1,'closedpostboxes_event','a:0:{}'),
(24,1,'metaboxhidden_event','a:2:{i:0;s:16:\"commentstatusdiv\";i:1;s:7:\"slugdiv\";}');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'danka','$P$B8nFChVwHnFt4STZS52sJDxqARl7Tq1','danka','test@gmail.com','http://theme-danka.test','2023-06-26 11:34:45','',0,'danka');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-27 18:10:34
