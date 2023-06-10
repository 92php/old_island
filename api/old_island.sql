/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.12 : Database - wxapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wxapp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wxapp`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `author` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `isbn` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fav_nums` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_book_deleted_at` (`deleted_at`),
  KEY `isbn` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`created_at`,`updated_at`,`deleted_at`,`book_id`,`author`,`image`,`title`,`isbn`,`fav_nums`) values 
(1,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,6021440,'[美]保罗·格雷厄姆','https://img3.doubanio.com/lpic/s4669554.jpg','黑客与画家','9787115249494',0),
(2,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,3628911,'MarkPilgrim','https://img3.doubanio.com/lpic/s4059293.jpg','Dive Into Python 3','9781430224150',0),
(3,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,4866934,'MagnusLieHetland','https://img3.doubanio.com/lpic/s4387251.jpg','Python基础教程','9787115230270',0),
(4,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,6082808,'[哥伦比亚]加西亚·马尔克斯','https://img3.doubanio.com/lpic/s6384944.jpg','百年孤独','9787544253994',0),
(5,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1080370,'[日]岩井俊二','https://img1.doubanio.com/view/subject/l/public/s29775868.jpg','情书','9787201048161',0),
(6,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1336330,'[美]乔治·R·R·马丁','https://img3.doubanio.com/lpic/s1358984.jpg','冰与火之歌（卷一）','9787536671256',0),
(7,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,3259440,'[日]东野圭吾','https://img3.doubanio.com/lpic/s4610502.jpg','白夜行','9787544242516',0),
(8,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1255625,'金庸','https://img1.doubanio.com/lpic/s23632058.jpg','天龙八部','9787108006721',0),
(9,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,3646172,'[日]东野圭吾','https://img3.doubanio.com/lpic/s3814606.jpg','恶意','9787544244428',0),
(10,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1071241,'[英]J·K·罗琳','https://img3.doubanio.com/lpic/s1074376.jpg','哈利·波特与阿兹卡班的囚徒','9787020033454',0),
(11,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,3394338,'韩寒','https://img1.doubanio.com/lpic/s3557848.jpg','他的国','9787807592099',0),
(12,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,2295163,'[英]J·K·罗琳','https://img1.doubanio.com/lpic/s2752367.jpg','哈利·波特与死亡圣器','9787020063659',0),
(13,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,3264665,'王小波','https://img1.doubanio.com/lpic/s3463069.jpg','三十而立','9787545201475',0),
(14,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,4071859,'[伊朗]玛赞·莎塔碧','https://img3.doubanio.com/lpic/s6144591.jpg','我在伊朗长大','9787108033215',0),
(15,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,6126821,'[日]村上春树','https://img1.doubanio.com/lpic/s29494718.jpg','远方的鼓声','9787532754533',0),
(16,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,2070844,'三毛','https://img3.doubanio.com/lpic/s2393243.jpg','梦里花落知多少','9787530208922',0),
(17,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1009160,'韩寒','https://img1.doubanio.com/lpic/s1080179.jpg','像少年啦飞驰','9787506322522',0),
(18,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1100152,'鲁迅','https://img3.doubanio.com/lpic/s27970504.jpg','朝花夕拾','9787533914196',0),
(19,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,1221515,'[日]井上雄彦','https://img3.doubanio.com/lpic/s2853431.jpg','灌篮高手31','9787806649343',0),
(20,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,26871297,'[日]新井一二三','https://img3.doubanio.com/lpic/s29034294.jpg','东京时味记','9787544762069',0);

/*Table structure for table `book_comment` */

DROP TABLE IF EXISTS `book_comment`;

CREATE TABLE `book_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `nums` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `idx_book_comment_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

/*Data for the table `book_comment` */

insert  into `book_comment`(`id`,`created_at`,`updated_at`,`deleted_at`,`content`,`book_id`,`nums`) values 
(4,'2018-10-02 14:04:58','2018-10-27 17:59:16',NULL,'程序员也有艺术的人生',6021440,1004),
(5,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'黑客and',6021440,475),
(6,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'七月老师好',6021440,107),
(7,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'a',6021440,28),
(8,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'一二三四五六七八九十十一',6021440,26),
(9,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'666',6021440,10),
(10,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'好好的',6021440,8),
(11,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'艺术',6021440,7),
(12,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'555',6021440,6),
(13,'2018-10-02 14:04:59','2018-10-02 14:07:57',NULL,'ABC',6021440,6),
(14,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'来个沙发！',3628911,478),
(15,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'888',3628911,167),
(16,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'测试一下',3628911,102),
(17,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'444',3628911,2),
(18,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'我喜欢Python很久了',3628911,2),
(19,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'a',3628911,2),
(20,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'测试',3628911,2),
(21,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'刑警本色',3628911,1),
(22,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'qwewqe',3628911,1),
(23,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'你的',3628911,1),
(24,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'人生苦短，我用Py',4866934,292),
(25,'2018-10-02 14:04:59','2018-10-27 17:50:56',NULL,'I like Py',4866934,114),
(26,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'life',4866934,53),
(27,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'lifeisshort',4866934,2),
(28,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'你好，七月',4866934,2),
(29,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'七月，好python ',4866934,1),
(30,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'经典致敬',4866934,1),
(31,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'还不错',4866934,1),
(32,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'cool',4866934,1),
(33,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'公司',4866934,1),
(34,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'魔幻第一书',6082808,173),
(35,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'永恒的经典',6082808,171),
(36,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'一百年，一世纪',6082808,39),
(37,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'Nice',6082808,1),
(38,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'我很喜欢',6082808,1),
(39,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'推图',6082808,1),
(40,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'啦咯啦咯啦咯啦咯啦咯啦',6082808,1),
(41,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'凝聚态',6082808,1),
(42,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'怎么了？',6082808,1),
(43,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'我写作业了',6082808,1),
(44,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'致敬经典',1080370,109),
(45,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'天亦老',1080370,60),
(46,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'人生亦相逢',1080370,26),
(47,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'爱而不得',1080370,3),
(48,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'眼泪成诗',1080370,2),
(49,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'程序员',1080370,2),
(50,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'大师经典之作',1080370,1),
(51,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'123',1080370,1),
(52,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'岩井俊二',1080370,1),
(53,'2018-10-02 14:04:59','2018-10-02 14:04:59',NULL,'大师',1080370,1),
(54,'2018-10-02 14:07:43','2018-10-02 14:07:49',NULL,'wutong',6021440,2),
(55,'2018-10-27 17:44:59','2018-10-27 17:44:59',NULL,'测试',1071241,1),
(56,'2018-10-27 18:05:40','2018-10-27 18:05:40',NULL,'123',1100152,1);

/*Table structure for table `classic` */

DROP TABLE IF EXISTS `classic`;

CREATE TABLE `classic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `image` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `index` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_classic_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `classic` */

insert  into `classic`(`id`,`created_at`,`updated_at`,`deleted_at`,`content`,`image`,`url`,`index`,`title`,`type`) values 
(1,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'谁念过 千字文章 秋收冬已藏','music.7.png','http://music.163.com/song/media/outer/url?id=29719651.mp3',7,'不才 《参商》',200),
(2,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'心上无垢，林间有风','sentence.6.png','',6,'未名',300),
(3,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'许多人来来去去，相聚又别离','music.5.png','http://music.163.com/song/media/outer/url?id=26427662.mp3',5,'好妹妹 《一个人的北京》',200),
(4,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'在变换的生命里，岁月原来是最大的小偷','movie.4.png','',4,'罗启锐《岁月神偷》',100),
(5,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'你陪我步入蝉夏 越过城市喧嚣','music.1.png','http://music.163.com/song/media/outer/url?id=557581284.mp3',3,'花粥 《纸短情长》',200),
(6,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'这个夏天又是一个毕业季','sentence.2.png','',2,'未名',300),
(7,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'岁月长，衣裳薄','music.3.png','http://music.163.com/song/media/outer/url?id=317245.mp3',1,'杨千嬅《再见二丁目》',200),
(8,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'人生不能像做菜，把所有的料准备好才下锅','movie.8.png','',8,'李安《饮食男女 》',100);

/*Table structure for table `favor` */

DROP TABLE IF EXISTS `favor`;

CREATE TABLE `favor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_favor_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `favor` */

/*Table structure for table `flow` */

DROP TABLE IF EXISTS `flow`;

CREATE TABLE `flow` (
  `created_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

/*Data for the table `flow` */

insert  into `flow`(`created_at`,`status`,`id`,`index`,`type`,`art_id`,`updated_at`,`deleted_at`) values 
('2019-04-05 17:11:14',1,1,1,200,3,NULL,NULL),
('2019-04-05 17:11:21',1,2,2,300,2,NULL,NULL),
('2019-04-05 17:11:27',1,3,3,200,2,NULL,NULL),
('2019-04-02 17:11:50',1,4,4,100,2,NULL,NULL),
('2019-04-17 17:11:56',1,5,6,300,1,NULL,NULL),
('2019-04-05 17:12:00',1,6,7,200,1,NULL,NULL),
('2019-04-05 17:12:04',1,7,8,100,1,NULL,NULL),
('2019-04-05 17:12:07',1,8,5,200,4,NULL,NULL);

/*Table structure for table `hot_book` */

DROP TABLE IF EXISTS `hot_book`;

CREATE TABLE `hot_book` (
  `created_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL,
  `index` int(11) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  `author` varchar(25) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

/*Data for the table `hot_book` */

insert  into `hot_book`(`created_at`,`status`,`id`,`index`,`image`,`author`,`title`,`updated_at`,`deleted_at`) values 
(NULL,1,7,1,'https://img3.doubanio.com/lpic/s4669554.jpg','[美]保罗·格雷厄姆','黑客与画家',NULL,NULL),
(NULL,1,65,2,'https://img3.doubanio.com/lpic/s4059293.jpg','MarkPilgrim','Dive Into Python 3',NULL,NULL),
(NULL,1,183,3,'https://img3.doubanio.com/lpic/s4387251.jpg','MagnusLieHetland','Python基础教程',NULL,NULL),
(NULL,1,1002,4,'https://img3.doubanio.com/lpic/s6384944.jpg','[哥伦比亚]加西亚·马尔克斯','百年孤独',NULL,NULL),
(NULL,1,1049,5,'https://img1.doubanio.com/view/subject/l/public/s29775868.jpg','[日]岩井俊二','情书',NULL,NULL),
(NULL,1,1061,6,'https://img3.doubanio.com/lpic/s1358984.jpg','[美]乔治·R·R·马丁','冰与火之歌（卷一）',NULL,NULL),
(NULL,1,1120,7,'https://img3.doubanio.com/lpic/s4610502.jpg','[日]东野圭吾','白夜行',NULL,NULL),
(NULL,1,1166,8,'https://img1.doubanio.com/lpic/s23632058.jpg','金庸','天龙八部',NULL,NULL),
(NULL,1,1308,9,'https://img3.doubanio.com/lpic/s3814606.jpg','[日]东野圭吾','恶意',NULL,NULL),
(NULL,1,1339,10,'https://img3.doubanio.com/lpic/s1074376.jpg','[英]J·K·罗琳','哈利·波特与阿兹卡班的囚徒',NULL,NULL),
(NULL,1,1383,11,'https://img1.doubanio.com/lpic/s3557848.jpg','韩寒','他的国',NULL,NULL),
(NULL,1,1398,12,'https://img1.doubanio.com/lpic/s2752367.jpg','[英]J·K·罗琳','哈利·波特与死亡圣器',NULL,NULL),
(NULL,1,1560,13,'https://img1.doubanio.com/lpic/s3463069.jpg','王小波','三十而立',NULL,NULL),
(NULL,1,7821,14,'https://img3.doubanio.com/lpic/s6144591.jpg','[伊朗]玛赞·莎塔碧','我在伊朗长大',NULL,NULL),
(NULL,1,8854,15,'https://img1.doubanio.com/lpic/s29494718.jpg','[日]村上春树','远方的鼓声',NULL,NULL),
(NULL,1,8866,16,'https://img3.doubanio.com/lpic/s2393243.jpg','三毛','梦里花落知多少',NULL,NULL),
(NULL,1,15198,17,'https://img1.doubanio.com/lpic/s1080179.jpg','韩寒','像少年啦飞驰',NULL,NULL),
(NULL,1,15984,18,'https://img3.doubanio.com/lpic/s27970504.jpg','鲁迅','朝花夕拾',NULL,NULL),
(NULL,1,21050,19,'https://img3.doubanio.com/lpic/s2853431.jpg','[日]井上雄彦','灌篮高手31',NULL,NULL),
(NULL,1,51664,20,'https://img3.doubanio.com/lpic/s29034294.jpg','[日]新井一二三','东京时味记',NULL,NULL);

/*Table structure for table `hot_keyword` */

DROP TABLE IF EXISTS `hot_keyword`;

CREATE TABLE `hot_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`),
  KEY `idx_hot_keyword_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `hot_keyword` */

insert  into `hot_keyword`(`id`,`created_at`,`updated_at`,`deleted_at`,`text`) values 
(1,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'Python'),
(2,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'哈利·波特'),
(3,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'村上春树'),
(4,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'东野圭吾'),
(5,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'白夜行'),
(6,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'韩寒'),
(7,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'金庸'),
(8,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'王小波');

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `created_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(64) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `pubdate` date DEFAULT NULL,
  `fav_nums` smallint(6) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

/*Data for the table `movie` */

insert  into `movie`(`created_at`,`status`,`id`,`image`,`content`,`pubdate`,`fav_nums`,`title`,`type`,`updated_at`,`deleted_at`) values 
('2019-04-05 17:11:14',1,1,'images/movie.8.png','人生不能像做菜，把所有的料准备好才下锅','2018-06-22',165,'李安《饮食男女 》',100,'2019-04-18 02:40:48',NULL),
('2019-04-05 17:11:14',1,2,'images/movie.4.png','在变换的生命里，岁月原来是最大的小偷','2018-06-22',46,'罗启锐《岁月神偷》',100,'2019-04-09 04:34:38',NULL);

/*Table structure for table `music` */

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `created_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(64) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pubdate` date DEFAULT NULL,
  `fav_nums` smallint(6) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

/*Data for the table `music` */

insert  into `music`(`created_at`,`status`,`id`,`image`,`content`,`url`,`pubdate`,`fav_nums`,`type`,`title`,`deleted_at`,`updated_at`) values 
('2019-04-05 17:11:14',1,1,'images/music.7.png','无人问我粥可温 风雨不见江湖人','http://music.163.com/song/media/outer/url?id=393926.mp3','2018-06-22',95,200,'月之门《枫华谷的枫林》',NULL,'2019-04-17 18:25:12'),
('2019-04-05 17:11:14',1,2,'images/music.1.png','你陪我步入蝉夏 越过城市喧嚣','http://music.163.com/song/media/outer/url?id=516076896.mp3','2018-06-22',47,200,'花粥 《纸短情长》',NULL,'2019-04-10 09:13:12'),
('2019-04-05 17:11:14',1,3,'images/music.3.png','岁月长，衣裳薄','http://music.163.com/song/media/outer/url?id=317245.mp3','2018-06-22',44,200,'杨千嬅《再见二丁目》',NULL,'2019-04-12 11:59:49'),
('2019-04-05 17:11:14',1,4,'images/music.5.png','许多人来来去去，相聚又别离','http://music.163.com/song/media/outer/url?id=26427662.mp3','2018-06-22',68,200,'好妹妹 《一个人的北京》',NULL,'2019-04-12 11:59:49');

/*Table structure for table `sentence` */

DROP TABLE IF EXISTS `sentence`;

CREATE TABLE `sentence` (
  `created_at` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(64) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `pubdate` date DEFAULT NULL,
  `fav_nums` smallint(6) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;

/*Data for the table `sentence` */

insert  into `sentence`(`created_at`,`status`,`id`,`image`,`content`,`pubdate`,`fav_nums`,`title`,`type`,`updated_at`,`deleted_at`) values 
('2019-04-05 17:11:14',1,1,'images/sentence.6.png','心上无垢，林间有风','2018-06-22',72,'未名',300,'2019-04-12 12:13:37',NULL),
('2019-04-05 17:11:14',1,2,'images/sentence.2.png','这个夏天又是一个毕业季','2018-06-22',33,'未名',300,'2019-04-10 09:13:28',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`created_at`,`updated_at`,`deleted_at`,`nickname`,`email`,`password`,`openid`) values 
(1,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'','','',''),
(2,'2018-10-01 19:32:22','2018-10-01 19:32:22',NULL,'','','',''),
(7,'2018-10-02 22:08:57','2018-10-02 22:08:57',NULL,'','','',''),
(8,'2018-10-03 10:45:24','2018-10-03 10:45:24',NULL,'','','',''),
(10,'2018-10-03 10:45:28','2018-10-03 10:45:28',NULL,'','','',''),
(13,'2018-10-06 15:38:28','2018-10-06 15:38:28',NULL,'','','',''),
(14,'2018-10-06 23:49:23','2018-10-06 23:49:23',NULL,'','','',''),
(15,'2018-10-28 12:45:48','2018-10-28 12:45:48',NULL,'','','','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
