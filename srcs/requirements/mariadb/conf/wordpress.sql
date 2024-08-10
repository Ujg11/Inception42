-- Creem la base de dades
CREATE 	DATABASE IF NOT EXISTS wordpress;

USE wordpress

-- Creem la taula wp_options
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--La ultima linea es per definir com es gestionaran i organitzaran les dades en termes de motor

-- Creem la taula per als usuaris
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Creem la taula `wp_posts` (informacio dels posts)
CREATE TABLE IF NOT EXISTS `wp_posts` (
    `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
    `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `post_content` longtext COLLATE utf8mb4_unicode_ci,
    `post_title` text COLLATE utf8mb4_unicode_ci,
    `post_excerpt` text COLLATE utf8mb4_unicode_ci,
    `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
    `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
    `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
    `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `to_ping` text COLLATE utf8mb4_unicode_ci,
    `pinged` text COLLATE utf8mb4_unicode_ci,
    `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci,
    `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
    `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `menu_order` int(11) NOT NULL DEFAULT '0',
    `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
    `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `comment_count` bigint(20) NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`),
    KEY `post_name` (`post_name`),
    KEY `post_parent` (`post_parent`),
    KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Creem la taula que emmagatzema les metadates adicionals dels usuaris, com configuracions de perfil
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

