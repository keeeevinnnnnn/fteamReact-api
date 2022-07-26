-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 07 月 26 日 21:54
-- 伺服器版本： 10.4.21-MariaDB
-- PHP 版本： 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `fteampro`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `sid` int(11) NOT NULL,
  `ad_name` varchar(255) NOT NULL,
  `ad_account` varchar(255) NOT NULL,
  `ad_password` varchar(255) NOT NULL,
  `ad_email` varchar(255) NOT NULL,
  `ad_avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`sid`, `ad_name`, `ad_account`, `ad_password`, `ad_email`, `ad_avatar`) VALUES
(1, 'Admin', 'admin', 'admin', '26fteam@gmail.com', 'User_icon_2.svg.png');

-- --------------------------------------------------------

--
-- 資料表結構 `carts`
--

CREATE TABLE `carts` (
  `sid` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `item_price` int(255) NOT NULL,
  `member_id` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `carts`
--

INSERT INTO `carts` (`sid`, `item_id`, `item_type`, `quantity`, `item_price`, `member_id`, `created_at`) VALUES
(15, '2', 'lesson', 1, 3000, '1493', '2022-07-05 15:07:45'),
(20, '4', 'custom', 5, 63400, '1493', '2022-07-24 13:29:39'),
(27, '3', 'product', 1, 7400, '1493', '2022-07-25 10:20:21'),
(28, '4', 'product', 3, 22497, '1493', '2022-07-25 10:20:24'),
(29, '6', 'product', 2, 13200, '1493', '2022-07-25 10:20:31'),
(30, '7', 'product', 3, 17997, '1493', '2022-07-25 10:20:34');

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `sid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_sid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`sid`, `name`, `parent_sid`) VALUES
(1, '滑板', 0),
(2, '技術板', 1),
(3, '長板/交通板', 1),
(4, '板身', 1),
(5, '輪架', 1),
(6, '輪子', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `custom`
--

CREATE TABLE `custom` (
  `sid` int(11) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `custom_product_name` varchar(255) NOT NULL,
  `wheel_style` varchar(255) NOT NULL,
  `carrier` varchar(255) NOT NULL,
  `front_color` varchar(255) NOT NULL,
  `back_style` varchar(255) NOT NULL,
  `back_text` varchar(255) NOT NULL,
  `back_sticker` varchar(255) NOT NULL,
  `back_filter` varchar(255) NOT NULL,
  `back_img` longtext NOT NULL,
  `price` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `custom`
--

INSERT INTO `custom` (`sid`, `member_id`, `custom_product_name`, `wheel_style`, `carrier`, `front_color`, `back_style`, `back_text`, `back_sticker`, `back_filter`, `back_img`, `price`, `created_date`) VALUES
(1, '666', '666', '#6f3979', '', '#6f6dee', 'pop', 'stript', 'dimon', 'nion', 'pic01.png', '2860', '2022-07-07 16:50:46'),
(2, '1493', '2234', '#b13939', '', '#b97979', 'simple', 'wave', 'moon', 'nion', 'pic05.png', '2860', '2022-07-07 17:42:36'),
(3, '1493', '4567', '#6c7dd5', '', '#2843af', 'latino', 'stars', 'colorink', 'grayscale', 'pic04.png', '5120', '2022-07-07 17:43:37'),
(4, '1495', '第二張板', '#778b41', '', '#335729', 'dark', 'stars', 'saturn', 'grayscale', 'pic03.png', '12680', '2022-07-07 17:48:01'),
(5, '1498', '快樂紫色版', '#5a277c', '', '#410dba', 'pop', 'stript', 'dimon', 'darkred', 'pic02.png', '2860', '2022-07-07 17:49:19'),
(6, '1497', '喔喔喔喔喔', '#464aa4', '', '#9c55a5', 'latino', 'wave', 'saturn', 'darkred', 'pic01.png', '2860', '2022-07-07 19:42:31');

-- --------------------------------------------------------

--
-- 資料表結構 `cus_like`
--

CREATE TABLE `cus_like` (
  `id` int(11) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `cus_product_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `cus_message`
--

CREATE TABLE `cus_message` (
  `id` int(11) NOT NULL,
  `anoname` varchar(255) NOT NULL,
  `stars` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `cus_message`
--

INSERT INTO `cus_message` (`id`, `anoname`, `stars`, `comment`, `created_time`) VALUES
(3, '快樂小朋友', '✦✦✦✦', '我覺得還不錯', '2022-07-03'),
(4, '內湖山下智久', '✦✦', '圖案還可以輪子不喜歡', '2022-07-03'),
(5, '松山田馥甄', '✦✦✦✦', '美美的～', '2022-07-03'),
(6, '社子島金城武', '✦✦✦✦', '留言喔喔喔喔喔', '2022-07-03'),
(7, '大安羅時豐', '✦✦✦', '還行還行', '2022-07-03'),
(8, '可愛大嬸', '✦✦✦', '我來看看可不可以留言', '2022-07-03'),
(9, '？？？？？？', '✦✦✦', '？？？？？？', '2022-07-06'),
(10, '蛤蛤蛤', '✦', '蛤蛤蛤蛤', '2022-07-06'),
(11, '!!!!!!!', '✦✦✦', '!!!!!!!', '2022-07-06'),
(12, '3333', '✦✦✦', '3333', '2022-07-07'),
(13, '3333', '✦✦✦', '3333', '2022-07-07'),
(14, '哇哇哇啊哇哇', '✦✦✦✦', '哇嗚啊哇哇啊', '2022-07-07');

-- --------------------------------------------------------

--
-- 資料表結構 `dance_category`
--

CREATE TABLE `dance_category` (
  `sid` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `dance_category`
--

INSERT INTO `dance_category` (`sid`, `type`) VALUES
(1, 'Hip Hop'),
(2, 'Popping'),
(3, 'Locking'),
(4, 'Choreography');

-- --------------------------------------------------------

--
-- 資料表結構 `favorite`
--

CREATE TABLE `favorite` (
  `sid` int(11) NOT NULL,
  `mem_id` varchar(255) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `product_brand` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_info` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `favorite`
--

INSERT INTO `favorite` (`sid`, `mem_id`, `product_img`, `product_brand`, `product_name`, `product_info`, `product_price`, `product_id`) VALUES
(9, '10', '637894482023930000.jpg', 'POLAR', '那隻狗有三對內內0.0 整組滑板 8.0', '已完成組裝✅\r\n板身：POLAR 被正妹瞪好爽 整組滑板 8.0\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F119998000', '7000', 1),
(10, '10', '637894482025330000.jpg', 'POLAR', '他家蠻酷的 整組滑板 8.125', '已完成組裝✅\r\n板身：POLAR 他家蠻酷的 整組滑板 8.125\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F121998125', '6980', 2),
(14, '10', '637889068679000000.jpg', 'INDEPENDENT', '培林', '操你媽', '1200', 21),
(25, '15', '637894482023930000.jpg', 'POLAR', '那隻狗有三對內內0.0 整組滑板 8.0', '已完成組裝✅\r\n板身：POLAR 被正妹瞪好爽 整組滑板 8.0\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F119998000', '7000', 1),
(28, '15', '637894482031430000.jpg', 'POLAR', '真結合 整組滑板 7.875', '已完成組裝✅\r\n板身：（兒童/成人小尺寸）POLAR 真結合 整組滑板 7.875\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F118997875', '7650', 3),
(46, '15', '637894482033000000.jpg', 'POLAR', '鯊魚跳起來 整組滑板 8.25', '已完成組裝✅\r\n板身：POLAR 鯊魚跳起來 整組滑板 8.25\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 質感黑色基本款輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F113998250', '8990', 4),
(47, '1438', '637894482023930000.jpg', 'POLAR', '那隻狗有三對內內0.0 整組滑板 8.0', '已完成組裝✅\r\n板身：POLAR 被正妹瞪好爽 整組滑板 8.0\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F119998000', '7000', 1),
(48, '1438', '637894482025330000.jpg', 'POLAR', '他家蠻酷的 整組滑板 8.125', '已完成組裝✅\r\n板身：POLAR 他家蠻酷的 整組滑板 8.125\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F121998125', '6980', 2),
(49, '1438', '637894482031430000.jpg', 'POLAR', '真結合 整組滑板 7.875', '已完成組裝✅\r\n板身：（兒童/成人小尺寸）POLAR 真結合 整組滑板 7.875\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F118997875', '7650', 3),
(50, '1438', '637894482033000000.jpg', 'POLAR', '鯊魚跳起來 整組滑板 8.25', '已完成組裝✅\r\n板身：POLAR 鯊魚跳起來 整組滑板 8.25\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 質感黑色基本款輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F113998250', '8990', 4),
(51, '1438', '637883215517930000.jpg', 'SANTA CRUZ', 'DECODER HAND 9.51IN x 32.26IN CRUZER SHAPED CRUZER', '11116545-129806', '5600', 9),
(52, '1438', '637883215377670000.jpg', 'SANTA CRUZ', 'PRISMATIC DOT 8.8IN x 27.7IN CRUZER SHARK', '11116543-129804', '6600', 11),
(53, '1490', '637894482023930000.jpg', 'POLAR', '那隻狗有三對內內0.0 整組滑板 8.0', '已完成組裝✅\r\n板身：POLAR 被正妹瞪好爽 整組滑板 8.0\r\n砂紙：MOB x INDEPENDENT 世界第一的砂紙\r\n輪架：INDEPENDENT 中空輕量化輪架\r\n輪子：OJ WHEELS 最高品質系列 101A 54MM\r\n培林：BRONSON G3 高轉速培林\r\nPS211F119998000', '7000', 1),
(54, '1493', '637894482023930000.jpg', 'POLAR', 'ONECSS', 'Shortboard us et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,', '7000', 1),
(55, '1493', '637894482025330000.jpg', 'POLAR', 'StartEnc', 'Shortboard nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo,', '6980', 2),
(56, '1493', '637894482031430000.jpg', 'POLAR', 'VIBECSS', 'Shortboard Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu', '7650', 3),
(57, '1493', '637894482088500000.jpg', 'FUCKING AWESOME', 'KVFOCUS', 'Shortboard Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que', '7880', 8),
(58, '1493', '637883215517930000.jpg', 'SANTA CRUZ', 'DECODER HAND CRUZER', 'Old School Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic', '5600', 9),
(59, '1493', '637883215377670000.jpg', 'SANTA CRUZ', 'PRISMATIC DOT', 'Old School Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.', '6600', 11),
(60, '1493', '637894482063130000.jpg', 'PALACE', 'KVPOST', 'Shortboard At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.', '7650', 7),
(61, '1493', '637883214259270000.jpg', 'SANTA CRUZ', 'AMOEBA STREET SKATE', 'Old School he found himself transformed in his bed into a horrible vermin.', '5300', 15),
(62, '1493', '637894497999700000.jpg', 'HOCKEY', 'HP SYNTHETIC', 'Decks Gregor then turned to look out the window at the dull weather. Drops', '2800', 16),
(63, '1493', '637894498003270000.jpg', 'HOCKEY', 'UNCLE BOB', 'Decks A collection of textile samples lay spread out on the table', '2650', 17),
(64, '1493', '637889068679000000.jpg', 'INDEPENDENT', 'NULLA', 'Wheels accusantium doloremqu', '1200', 21),
(65, '1493', '637884051043030000.jpg', 'OJ WHEELS', 'WOOTEN SCREAMINGHARDLINE', 'Bearings nisi ut aliquid ex ea', '2500', 23),
(66, '1498', '637894482023930000.jpg', 'POLAR', 'ONECSS', 'Shortboard us et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,', '7000', 1),
(67, '1498', '637894482031430000.jpg', 'POLAR', 'VIBECSS', 'Shortboard Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu', '7650', 3),
(68, '1498', '637894482033000000.jpg', 'POLAR', 'MassKV', 'Shortboard the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself,', '8990', 4),
(69, '1498', '637894482056430000.jpg', 'PALACE', 'KoHUB', 'Shortboard Nor again is there anyone who loves or pursues or desires to obtain pain of itself,', '6600', 5),
(70, '1498', '637886525279000000.jpg', 'SANTA CRUZ', 'CLASIC WAVE SPLICS', 'Old School The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of', '4930', 14),
(71, '1498', '637883214259270000.jpg', 'SANTA CRUZ', 'AMOEBA STREET SKATE', 'Old School he found himself transformed in his bed into a horrible vermin.', '5300', 15),
(72, '1498', '637883214704170000.jpg', 'SANTA CRUZ', 'RAINBOW TIE DYE', 'Old School One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed ', '6700', 13),
(73, '1498', '637894497999700000.jpg', 'HOCKEY', 'HP SYNTHETIC', 'Decks Gregor then turned to look out the window at the dull weather. Drops', '2800', 16),
(74, '1498', '637894498003270000.jpg', 'HOCKEY', 'UNCLE BOB', 'Decks A collection of textile samples lay spread out on the table', '2650', 17),
(75, '1498', '637884746574500000.jpg', 'INDEPENDENT', '144 HOLLOW REYNOLDS', 'Trucks and above it there hung a picture that he had recently cut out of an illustrated', '2400', 18),
(76, '1498', '637889068679000000.jpg', 'INDEPENDENT', 'NULLA', 'Wheels accusantium doloremqu', '1200', 21),
(77, '1498', '637890068368500000.jpg', 'BULLET', 'MATTE BLACK DELUXE HELMET', 'Safety Gear qui in ea voluptate velit ess', '1080', 24);

-- --------------------------------------------------------

--
-- 資料表結構 `lesson`
--

CREATE TABLE `lesson` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dance_id` int(11) DEFAULT NULL,
  `duringtime_begin` date NOT NULL,
  `duringtime_end` date NOT NULL,
  `number_of_people` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `quota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `lesson`
--

INSERT INTO `lesson` (`sid`, `name`, `dance_id`, `duringtime_begin`, `duringtime_end`, `number_of_people`, `price`, `teacher_id`, `location`, `quota`) VALUES
(1, 'Key Glock - Ambition For Cash', 1, '2022-08-25', '2022-09-25', 8, 3000, 1, '忠孝館', 8),
(2, 'Collapse - Eminem / Baiba Klints', 1, '2022-09-24', '2022-10-24', 8, 2700, 1, '忠孝館', 8),
(3, 'Easy Dance Routine ', 1, '2022-10-27', '2022-11-27', 8, 2500, 1, '忠孝館', 8),
(4, 'Salute - Competition Dance', 1, '2022-11-28', '2022-12-28', 8, 2700, 1, '忠孝館', 8);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `sid` int(11) NOT NULL,
  `mem_name` varchar(255) NOT NULL,
  `mem_nickname` varchar(255) NOT NULL,
  `mem_level` varchar(255) NOT NULL,
  `mem_account` varchar(255) NOT NULL,
  `mem_password` varchar(255) NOT NULL,
  `mem_email` varchar(255) NOT NULL,
  `mem_mobile` varchar(255) NOT NULL,
  `mem_birthday` date DEFAULT NULL,
  `mem_address` varchar(255) NOT NULL,
  `mem_avatar` varchar(255) NOT NULL,
  `mem_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `mem_bollen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`sid`, `mem_name`, `mem_nickname`, `mem_level`, `mem_account`, `mem_password`, `mem_email`, `mem_mobile`, `mem_birthday`, `mem_address`, `mem_avatar`, `mem_created_at`, `mem_bollen`) VALUES
(12, 'shinder01', 'shinder\'s fans', '平民', 'shinder01', 'shinder01', '', '0912312311', NULL, '', 'images.png', '2022-06-07 00:45:30', 1),
(13, 'shinder02', 'shinder02', '平民', 'shinder02', 'shinder02', '', '', NULL, '', 'images.png', '2022-06-07 22:09:01', 1),
(14, 'shinder03', '', '平民', 'shinder03', 'shinder03', '', '', NULL, '', '02216d360e3ba0dc6a29e7fea1bbec88.jpg', '2022-06-08 13:52:44', 1),
(15, 'kevin', '', '平民', 'kevin', 'kevin', '', '', NULL, '', 'images.png', '2022-06-09 16:28:59', 1),
(1438, '林玟葶', '香蕉人', '平民', '222', '222', 'garylin0969@gmail.com', '', NULL, '', 'eeef5eb70e002b082fb3d1adacbb01db.jpg', '2022-06-05 03:54:23', 1),
(1452, '林宸皞6', '', '平民', '11115', '111145', '', '', NULL, '', 'images.png', '2022-06-07 17:01:52', 1),
(1453, '林宸皞', '', '平民', '888', '888', '', '', NULL, '', 'images.png', '2022-06-07 18:47:10', 1),
(1454, '會員', '', '平民', '555', '555', '', '', NULL, '', 'images.png', '2022-06-06 22:15:17', 1),
(1455, 'gary', '', '平民', '777', '777', '', '', NULL, '', 'images.png', '2022-06-07 23:05:47', 1),
(1456, '好吧', '', '平民', '444', '444', '', '', NULL, '', 'images.png', '2022-06-07 23:14:41', 0),
(1458, 'gary', '', '平民', 'uuu', 'uuu', '', '', NULL, '', 'images.png', '2022-06-08 00:55:15', 1),
(1459, '林玟葶', '', '平民', 'mmm', 'mmm', '', '', NULL, '', 'a53d5f10b80316bc634ff2c4e0fb97cc.jpg', '2022-06-08 02:47:33', 1),
(1461, 'ui', '', '平民', 'uiui', 'uiui', '', '', NULL, '', 'images.png', '2022-06-07 21:32:22', 1),
(1462, '林玟葶', '', '平民', 'ttt', 'ttt', '', '', NULL, '', '1c5b6a049c15ed8e44fb92cc28a05202.jpg', '2022-06-08 23:22:56', 1),
(1467, '林宸皞', '', '平民', '444', '444', '', '', NULL, '', 'images.png', '2022-06-09 03:03:38', 1),
(1468, 'hjkhjkhjkj', '', '平民', 'hjkhjk', 'hjkhjkhjk', '', '', NULL, '', 'images.png', '2022-06-09 03:17:06', 1),
(1469, 'hjkhjkhjkjp55', '', '平民', 'hjkhjk', 'hjkhjkhjk', '', '', NULL, '', 'images.png', '2022-06-09 03:17:49', 1),
(1470, '會員', '', '平民', 'hfghfgh', 'fghfghg', '', '', NULL, '', 'images.png', '2022-06-09 03:17:59', 1),
(1471, '會員', '', '平民', 'yyy', 'yyy', '', '', NULL, '', 'images.png', '2022-06-09 03:18:17', 1),
(1472, '林宸皞', '', '平民', '555', '555', '', '', NULL, '', 'images.png', '2022-06-09 03:19:17', 1),
(1473, '會員', '', '平民', 'erer', 'erer', '', '', NULL, '', 'images.png', '2022-06-09 03:19:25', 1),
(1474, '會員', '', '平民', 'tyty', 'tytyty', '', '', NULL, '', 'images.png', '2022-06-09 03:25:09', 1),
(1475, '林宸皞', '', '平民', 'erer', 'erer', '', '', NULL, '', 'images.png', '2022-06-09 03:25:39', 1),
(1476, '會員', '', '平民', 'uiouio', 'uiouiouio', '', '', NULL, '', 'images.png', '2022-06-09 03:26:30', 1),
(1477, '林玟葶', '', '平民', 'ererere', 'rererewfedfse', '', '', NULL, '', 'images.png', '2022-06-09 03:26:52', 1),
(1478, '好吧', '', '平民', 'fff', 'fffsdfdsfsdf', '', '', NULL, '', 'images.png', '2022-06-09 03:27:52', 1),
(1479, 'hdfgzdhrtyh', '', '平民', 'tytysadtht', 'hdfhaethyet', '', '', NULL, '', '3191872d134ffb077b1a2d6c29d96625.gif', '2022-06-09 03:29:23', 1),
(1480, '會員', '', '平民', 'dfsdfgvw', 'rfgsdafvsdf', '', '', NULL, '', 'images.png', '2022-06-09 03:32:31', 1),
(1481, 'FVAETYHERTH', '', '平民', 'garyfsdf', 'sdfwer21Q3TG', '', '', NULL, '', '39d9c431be99ac82db8269e4482f2b47.gif', '2022-06-09 03:32:49', 0),
(1484, '會員', '', '平民', '5554', '5554', '', '', NULL, '', 'images.png', '2022-06-09 04:08:54', 0),
(1485, 'garyIII', '', '平民', 'III', 'III', '', '', NULL, '', 'images.png', '2022-06-09 04:09:45', 0),
(1486, '幹幹幹', '', '平民', '000', '000', '', '', NULL, '', '81b532bf70063913d76f8b3a5f405135.jpg', '2022-06-09 15:17:34', 1),
(1487, '會員', '', '平民', 'yyy', 'yyy', '', '', NULL, '', 'images.png', '2022-06-09 20:32:24', 1),
(1488, '會員', '', '平民', '444', '444', '', '', NULL, '', 'images.png', '2022-06-10 01:37:44', 1),
(1490, '會員', '', '平民', '7878', '7878', '', '', NULL, '', 'images.png', '2022-06-10 02:17:03', 1),
(1491, 'gary', '', '平民', 'ioio', 'ioio', '', '', NULL, '', 'images.png', '2022-06-10 17:56:19', 1),
(1492, '林玟葶', '', '平民', 'oooo', 'oooo', '', '', NULL, '', 'images.png', '2022-06-10 17:59:45', 1),
(1493, 'ㄏㄏㄏ', '', '平民', 'nnnn', 'nnnn', '', '', NULL, '', 'images.png', '2022-06-10 21:27:33', 0),
(1494, '會員', '', '平民', 'tgtg', 'tgtg', '', '', NULL, '', 'images.png', '2022-06-10 22:05:18', 0),
(1495, '會員', '', '平民', 'mlml', 'mlml', '', '', NULL, '', 'images.png', '2022-06-10 23:28:23', 1),
(1496, '會員', '', '平民', '474', '474', '', '', NULL, '', 'images.png', '2022-06-11 02:22:54', 1),
(1497, '會員', '', '平民', '010', '010', '', '', NULL, '', 'images.png', '2022-06-11 05:52:01', 1),
(1499, '會員', '', '平民', '45454', '45454', '', '', NULL, '', 'images.png', '2022-06-11 14:02:43', 1),
(1501, '會員', '', '平民', 'gygy', 'gygy', '', '', NULL, '', 'images.png', '2022-06-11 20:21:25', 1),
(1502, '會員', '', '平民', 'dfdfd', 'dfdfd', '', '', NULL, '', 'images.png', '2022-06-11 21:23:33', 1),
(1503, '會員', '', '平民', 'fff', 'fff', '', '', NULL, '', 'images.png', '2022-06-12 00:18:06', 1),
(1504, '林宸皞', '', '平民', 'ghgh', 'ghgh', '', '', NULL, '', '8199d7d938b6321974955990a7049f0f.jpg', '2022-06-12 17:35:59', 1),
(1505, '', '', '平民', '', '', '', '', '0000-00-00', '', '', '2022-06-30 20:50:18', 1),
(1506, 'sdfsdf', 'fsdfsdfsd', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'sdfsdf', 'dfsdfsd', '0000-00-00', 'sdfsdf', 'sdfsdfsdf', '2022-06-30 20:51:49', 1),
(1507, '哈哈', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:10:01', 0),
(1508, '哈哈', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:10:47', 0),
(1509, '哈哈', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:11:07', 0),
(1510, 'ㄎㄎ', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:13:16', 0),
(1511, '安安', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:13:50', 0),
(1512, '安安安', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:17:05', 0),
(1513, '安安', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:17:46', 0),
(1514, '安安', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-01', '木柵路三段', '', '2022-06-30 21:18:58', 0),
(1515, 'ㄐㄐ', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '2022-06-21', '木柵路三段', '', '2022-06-30 21:21:59', 0),
(1516, '林', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-06-30 21:22:44', 0),
(1517, '林2', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-06-30 21:23:42', 0),
(1518, '林2', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-06-30 21:38:58', 0),
(1519, '林2', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-06-30 21:39:06', 0),
(1520, '林', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '9f7gNU7TtcnJi3fTJhZiJQG8MnFk12dR1PYQyepJ4mXarRQkfs5', '', '2022-06-30 21:39:44', 0),
(1521, '林宸皞', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '9f7gNU7TtcnJi3fTJhZiJQG8MnFk12dR1PYQyepJ4mXarRQkfs5', '', '2022-06-30 21:40:14', 0),
(1522, '林', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-06-30 21:45:34', 0),
(1523, '安安', 'fsdfsdfsd', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'sdfsdf', 'dfsdfsd', '0000-00-00', 'sdfsdf', 'sdfsdfsdf', '2022-06-30 21:46:20', 1),
(1524, '安安安', '', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '', '', '2022-06-30 21:54:24', 1),
(1525, '安安安', '', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '', '', '2022-06-30 21:59:28', 1),
(1526, '安安', '', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '', '', '2022-06-30 21:59:32', 1),
(1527, '安口', '', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '', '', '2022-06-30 22:03:31', 1),
(1528, '安口', '', '平民', 'sdfsdfsdf', 'dfsdfsdf', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '', '檔案名稱', '2022-06-30 22:09:52', 0),
(1529, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:09:36', 0),
(1530, '林宸皞', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:10:44', 0),
(1531, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:12:01', 0),
(1532, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:12:25', 0),
(1533, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:14:22', 0),
(1534, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:14:34', 0),
(1535, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:14:55', 0),
(1536, 'Gary', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:15:29', 0),
(1537, 'Gary30678', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:15:35', 0),
(1538, '林宸皞', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:15:57', 0),
(1539, '林宸皞', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:16:17', 0),
(1540, '林宸皞', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:17:50', 0),
(1541, '林宸皞喔喔喔', '', '', '', '', 'garylin0969@gmail.com', '0920913633', '0000-00-00', '木柵路三段', '', '2022-07-01 00:17:59', 0),
(1542, '000', '', '平民', 'wewe', '$2a$10$DqeNKPH6W9oXMI2wkbSrY.s.yAK/xdeDdiWprO6lt6c9GN1zTmb/i', '', '', NULL, '', '檔案名稱', '2022-07-02 21:01:15', 1),
(1543, '哈哈', '', '平民', 'wewedfgdfg', '$2a$10$pizRk3ftRGYouetOsooCTeiVI6MXJ9z2MPBmoz5Ti79Y9G7lPGXqm', '', '', NULL, '', '檔案名稱', '2022-07-03 01:15:12', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `sid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `news`
--

INSERT INTO `news` (`sid`, `title`, `info`, `image`, `created_at`, `update_at`) VALUES
(1, '滑板系列', 'Carson經常關注Supreme、A Bathing Ape等潮牌，緊貼潮流時尚，對近兩年高端時尚品牌如Louise Vuitton、Dior與街頭藝術家合作推出的聯乘作品更是不掩欣賞之情。街頭藝術對他來說，已經不是少數人追捧的文化現象，而是漸漸走進高級藝術的殿堂。在購藏這批滑板之前，他亦有收藏過去幾年Supreme推出的部分滑板，而當友人提及蘇富比即將上拍過去二十年所有Supreme滑板時，他知道這就是入手全套滑板千載難逢的良機。', '001.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07'),
(2, '國外選手來台', '「其實台灣街道上有一些很好的板點，甚至很多都尚未被開發，不少國外來的選手都說台灣像滑板天堂，Spot（板點）超多超棒，我相信這也是為什麼，近幾年一直有國外職業選手會選擇來台灣取景拍攝滑板影片的原因」，此次的訪問對象，同時也是台灣少見的職業滑板選手－柯家恩這樣說，趁此機會，就讓他帶我們暢滑台北街頭，一併也聊聊他最喜愛的滑板大小事。\r\n\r\n', '002.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07'),
(3, '台灣滑板店引進nike sb', 'Nike SB 的全稱是skateboarding（滑板運動），在 15年前，街頭流行風格最具代表性的鞋就是 Dunk SB。\r\n200年 Nike SB 系列，發布了第一款鞋 Nike Dunk SB首度問世，俗稱的四大天王 Danny supa、mulder、Gino、Forbes\r\n個人也因為鞋身用料質感以及zoom air鞋墊加持。開始入坑', '003.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07'),
(4, '他花22年滑進東奧！美國「滑板機器人」奪金大熱門竟重摔', '2020東京奧運在本屆賽事中，首次將街頭運動「滑板」（Skateboarding）列入正式比賽項目。世界積分排名第一的「美國滑板機器人」休斯頓（Nyjah Huston）在賽前被外界看好是奪下歷史首面滑板金牌的人選，不料卻在昨（25）日的街道賽中，技巧動作部分多次出現嚴重失誤，不僅摔掉金牌，更僅拿到第七名。儘管無緣獎牌，休斯頓賽後依然維持王者風範，主動擁抱拿下金牌的日本選手堀米雄斗。\r\n\r\n', '004.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07'),
(5, '華麗搖滾學院風！Dior 2022早秋系列時裝秀：女子滑板手帥氣開場、全新包款與晚禮服造型初亮相！', 'Dior 日前首次在首爾舉行時裝秀！在韓國梨花女子大學打造了一座時尚滑板場，展示其 2022 年秋季系列。藉由學院歷史提倡女性權力以促進性別平等，在一眾女子滑板手踩着滑板出場展開序幕，傳遞品牌願景。', '005.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07'),
(6, '領獎選手平均年齡14歲，「滑板」為什麼被奧運青睞？', '日本滑板選手西矢椛以奧運史上第二年輕金牌得主之姿，摘下東京奧運滑板冠軍。第一本滑板雜誌創辦人曾說滑板是一項「沒有歷史的運動」，6月21日滑板迷們慶祝的「滑板日」也聲明，玩滑板是對「獨立」的叛逆慶祝。滑板究竟為什麼吸引年輕人？又為什麼被奧運會看中？', '006.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07'),
(7, '滑板獎落誰家？', 'Carson經常關注Supreme、A Bathing Ape等潮牌，緊貼潮流時尚，對近兩年高端時尚品牌如Louise Vuitton、Dior與街頭藝術家合作推出的聯乘作品更是不掩欣賞之情。街頭藝術對他來說，已經不是少數人追捧的文化現象，而是漸漸走進高級藝術的殿堂。在購藏這批滑板之前，他亦有收藏過去幾年Supreme推出的部分滑板，而當友人提及蘇富比即將上拍過去二十年所有Supreme滑板時，他知道這就是入手全套滑板千載難逢的良機。', '007.jpeg', '2022-06-03 08:40:07', '2022-06-03 08:40:07');

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `sid` int(50) NOT NULL,
  `member_sid` int(50) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `total` int(50) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`sid`, `member_sid`, `recipient`, `address`, `shipping_method`, `total`, `order_date`) VALUES
(202200132, 1493, 'gary', '台北市士林區', 'home_delivery', 15180, '2022-07-06 11:01:41'),
(202200133, 1493, 'kevin', '台北市大安區', 'home_delivery', 0, '2022-07-06 11:01:45'),
(202200134, 1493, 'vivian', '台北市內湖區', 'convenience_delivery', 0, '2022-07-06 11:02:57'),
(202200135, 1493, 'der', '台北市萬華區', 'home_delivery', 0, '2022-07-06 11:18:23'),
(202200136, 1493, 'cooler', '台北市北投區', 'convenience_delivery', 15970, '2022-07-09 16:29:29');

-- --------------------------------------------------------

--
-- 資料表結構 `order_details`
--

CREATE TABLE `order_details` (
  `sid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `order_details`
--

INSERT INTO `order_details` (`sid`, `order_id`, `member_id`, `item_id`, `item_type`, `quantity`, `price`) VALUES
(140, 202200132, 1493, 10, 'lesson', 1, 3000),
(141, 202200132, 1493, 11, 'product', 1, 6600),
(142, 202200132, 1493, 12, 'product', 1, 5580);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `sid` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `info` varchar(255) NOT NULL,
  `category_id` int(15) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`sid`, `img`, `name`, `brand`, `price`, `info`, `category_id`, `color`) VALUES
(0, '637896779815600000.jpg', '', '', '', '', 3, 'green'),
(1, '637894478401770000.jpg', 'GTA cartoon version of the whole set of skateboard', 'POLAR', '6800', 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 2, 'black'),
(2, '637894478778200000.jpg', 'That dog has three pairs of Inner 0.0 The whole set of skateboards', 'POLAR', '6300', 'Wood Technology - A new core technology that mixes different types of wood. Makes the board very durable and lightweight\r\n\r\nFiberglass - Different types of high-quality fiberglass are used depending on the applicable strength required for the board body.\r', 2, 'green'),
(3, '637894478781770000.jpg', 'Zhengmei stares so cool, the whole group of skateboards 8.0', 'POLAR', '7400', 'Scratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 39.4\" Width: 9.45\"\r\n\r\nWheelbase: 22.6\" / 22.6\'\' / 24.6\"\r\n\r\nWeight: 1.7kg\r\n\r\nConstructi', 2, 'blue'),
(4, '637894478801800000.jpg', 'Shark jump up the whole set of skateboards 8.25', 'POLAR', '7499', 'L: 45.6\" | W: 9.25\" | WB: 28.3\" - 29.5\"\r\n\r\nConcave: 0.43\" / 11mm\r\n\r\nRocker + Kicks: 0.8\" / 20mm\r\n\r\nFLEX 1: 70 - 100kg\r\n\r\nFLEX 2: 50 - 85kg\r\n\r\nCarbon fiber\r\n\r\nNatural flax fiber\r\n\r\nSurface material-', 2, 'blue'),
(5, '637894478809030000.jpg', 'Memoirs or something? The whole set of skateboards 8.1', 'PALACE', '7499', 'Innovative combination of materials, hidden in the body structure,\r\n\r\nMaple + natural flax fiber composite material makes the board lighter.\r\n\r\nRocke specially put \"carbon fiber\" in the middle of the board to make a keel design', 2, 'yellow'),
(6, '637894478830100000.jpg', 'Street Scenery Full Skateboard 8.25', 'PALACE', '6600', 'Enhanced for longer service life and flexible elasticity.\r\n\r\nThe second special material \"Flax Fiber\" keeps the board from shattering when damaged,\r\n\r\nUnlike fiberglass, your fingers won\'t be getting shards of glass.', 2, 'yellow'),
(7, '637894479560230000.jpg', 'Doberman Dog Skateboard 8.1', 'PALACE', '5999', 'Innovative combination of materials, hidden in the body structure,\r\n\r\nMaple + natural flax fiber composite material makes the board lighter.\r\n\r\nRocke specially put \"carbon fiber\" in the middle of the board to make a keel design', 2, 'pink'),
(8, '637894482025330000.jpg', 'Chaopai Dou The whole set of skateboards 7.75', 'PALACE', '6999', 'Enhanced for longer service life and flexible elasticity.\r\n\r\nThe second special material \"Flax Fiber\" keeps the board from shattering when damaged,\r\n\r\nUnlike fiberglass, your fingers won\'t be getting shards of glass.', 2, 'yellow'),
(9, '637894482029730000.jpg', 'Renaissance Full Skateboard 8.25', 'PALACE', '8250', 'After playing this longboard, I just want to tell you that it is really very flexible, and you can find the exact position of flipping and hitting,\r\n\r\nLANDYACHTZ 2020\'s latest board type \"Tony Danza\", the board width is improved and narrowed to 8.5 inches', 2, 'blue'),
(10, '637894482038170000.jpg', 'Doberman Dog Skateboard 8.0', 'PALACE', '7480', 'The board body from the board head to the board tail is Rocker. The board body from the board head to the board tail is mainly based on the Rocker overall shape, and the extended Tail is more prominent and lighter to use! Dot more accurately\r\nNext is the ', 2, 'yellow'),
(11, '637894482942270000.jpg', 'Pass time in Paris Full set of skateboards 8.25', 'FUCKING AWESOME', '9566', 'L: 35\" | W: 9.5\" | WB: 18\"\r\n\r\nMaterial: 2021 added special soft and hard, clearer weight and better elastic feedback\r\n\r\n- Purely handmade board body\r\n\r\n- Glass fiber plywood body on the upper and lower panels is waterproof and wear-resistant', 2, 'green'),
(12, '637894482945570000.jpg', 'Lots of people Full set of skateboards 8.25', 'FUCKING AWESOME', '6999', '-Nose/Tails use high-performance silicone rubber (Dragon skin plastic) on the edge of the outer layer, the material is lighter/elastic, 100% impact-resistant, and the moves are too large to be worn out too fast\r\n\r\n- 24cm (9.5\") board width U-Concave press', 2, 'yellow'),
(13, '637894482948870000.jpg', 'One Spider Whole Skateboard 8.0', 'FUCKING AWESOME', '6999', 'Kate wants to be a little shorter than the BASTET 44\",\r\n\r\nTimur wanted a longer board than the City Rat 38\",\r\n\r\nSo FLOW 42\" was born~\r\n\r\nPEPPR BOARDS x SUPERYMMETRY', 2, 'orange'),
(14, '637894482956200000.jpg', 'Summon the beast the whole group of skateboards 8.25', 'FUCKING AWESOME', '6999', 'Kate wants to be a little shorter than the BASTET 44\",\r\n\r\nTimur wanted a longer board than the City Rat 38\",\r\n\r\nSo FLOW 42\" was born~\r\n\r\nPEPPR BOARDS x SUPERYMMETRY', 2, 'pink'),
(15, '637894482992030000.jpg', '17 Smoke a cigarette The whole set of skateboards 8.18', 'FUCKING AWESOME', '6999', 'Mediate/Soft (special specification) is the elasticity between Mediate & Soft, and it is also the most recommended hardness by Ao Sen\r\n\r\nMaterial: 2021 added special soft and hard, clearer weight and better elastic feedback\r\n\r\n- Purely handmade board body', 2, 'green'),
(16, '637894483314000000.jpg', 'They\'re laughing at you The whole set of skateboards 8.25', 'HOCKEY', '6999', '- Glass fiber plywood body on the upper and lower panels is waterproof and wear-resistant\r\n\r\n-Panel body maple 360° fully covered with polyurethane, strong pressure bearing toughness/sturdy\r\n\r\n-Nose/Tails use high-performance silicone rubber (Dragon skin ', 2, 'orange'),
(17, '637894483315400000.jpg', 'Naruto Rock The whole set of skateboards 8.25', 'HOCKEY', '5999', '- 24cm (9.5\") board width U-Concave pressed with Micro Rocker board can\r\n\r\nThe freestyle/Dancing process firmly grasps the foot, easy to find the foot position, locks the foot, and is not easy to slip the foot', 2, 'blue'),
(18, '637894483318370000.jpg', 'Dead Man Whole Skateboard 8.25', 'HOCKEY', '6999', 'L: 48\" | W: 9.5\" | WB: 32\"-33.4\"\r\n\r\n[Recommended experience]\r\nThe material of the board is strong/impact/light/waterproof/wear-resistant\r\nPlayers who like to pursue more advanced/multi-skills/big moves\r\nYou can come and experience the charm of the new mat', 2, 'orange'),
(19, '637894483325030000.jpg', 'Staring at you and dancing The whole set of skateboards 8.25', 'HOCKEY', '5999', '[FLEX]\r\nStiff/Middle (special specification)\r\n[Material]\r\n-2021 added special soft and hard, lighter weight and better elastic feedback.\r\n\r\n- Purely handmade board body\r\n \r\n-The upper and lower panels are waterproof and wear-resistant.\r\n \r\n-Panel body map', 2, 'red'),
(20, '637894483334100000.jpg', 'This is the street full set of skateboards 8.25', 'HOCKEY', '6480', '-Nose/Tails use high performance silicone rubber (Dragon skin plastic) on the outer edge of the board, the material is lighter/elastic\r\n100% crash resistance\r\n \r\n- Body size 122cm (48\") Adjustable wheel base 81-85cm (32\"-33.4\")\r\nWheelbase Sensitivity: Mod', 2, 'pink'),
(21, '637903742589700000.jpg', 'This is art The whole set of skateboards 8.0', 'GX1000', '5899', '- 24cm (9.5\") board width U-Concave pressed with Micro Rocker board can\r\nThe freestyle/Dancing process firmly grasps the foot, easy to find the foot position, locks the foot, and is not easy to slip the foot\r\n \r\n-Kick longth 13/15cm (5.2\"/6\") large space,', 2, 'black'),
(22, '637903780999200000.jpg', 'Grassy World The whole set of skateboards 8.125', 'GX1000', '6780', 'Kate wants to be a little shorter than the BASTET 44\",\r\n\r\nTimur wanted a longer board than the City Rat 38\",\r\n\r\nSo FLOW 42\" was born~\r\n\r\nPEPPR BOARDS x SUPERYMMETRY', 2, 'black'),
(23, '637909744266270000.jpg', 'The hottest skateboard The whole group of skateboards 8.0', 'GX1000 ', '7480', '2021 new flipping pictures,\r\n\r\nIt was designed by a good friend for us.\r\n\r\nTaiwanese designer @supersymmetry__\r\n\r\nFLEX selection suggestions:\r\n\r\nSoft: 30-70kg\r\n\r\nMedium: 40-110kg\r\n\r\nStiff: 60-140kg', 2, 'yellow'),
(24, '637909745618430000.jpg', 'See it all The whole set of skateboards 8.0', 'GX1000', '5780', 'Material: 2021 added special soft and hard, clearer weight and better elastic feedback\r\n\r\n- Purely handmade board body\r\n\r\n- Glass fiber plywood body on the upper and lower panels is waterproof and wear-resistant\r\n\r\n-Panel body maple 360° fully covered wit', 2, 'orange'),
(25, '637896779815600000.jpg', 'CRUZ DECODER HAND 9.51IN x 32.26IN', 'SANTA CRUZ', '5600', 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 3, 'green'),
(26, '637896779822170000.jpg', 'CRUZ FLIER COLLAGE DOT 8.8IN x 27.7IN', 'SANTA CRUZ', '5300', 'Polyurethane Board Edge - Specially formulated 360° PU bumper makes the board durable and waterproof. Don\'t worry about sawdust falling off the board\r\n\r\nWood Technology - A new core technology that mixes different types of wood. Makes the board very durab', 3, 'purple'),
(27, '637896779840330000.jpg', 'CRUZ PRISMATIC DOT 8.8IN x 27.7IN', 'SANTA CRUZ', '5300', 'Carbon Fiber - Carbon fiber is added to make the board stronger and stiffer.\r\n\r\nScratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 39.4\" ', 3, 'black'),
(28, '637896779842700000.jpg', 'Opened the whole set of traffic boards 7.8', 'CREATURE', '5899', 'Wheelbase: 22.6\" / 22.6\'\' / 24.6\"\r\n\r\nWeight: 1.7kg\r\n\r\nConstruction: Lightweight Ash Wood Triple Layer Fiberglass 360pu Bumper Edge\r\n\r\nFlex: 1 (60-100+ kg) / 2 (40 – 80 kg)', 3, 'orange'),
(29, '637896779845030000.jpg', 'Bottle opener Full set of traffic boards 8.6', 'CREATURE', '6499', 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 3, 'purple'),
(30, '637896779853730000.jpg', 'Flip LVLV ORANGE 42\" Morandi Green 50º', 'CREATURE', '8490', 'Polyurethane Board Edge - Specially formulated 360° PU bumper makes the board durable and waterproof. Don\'t worry about sawdust falling off the board\r\n\r\nWood Technology - A new core technology that mixes different types of wood. Makes the board very durab', 3, 'white'),
(31, '637896779856230000.jpg', 'Rayne Longboards - WHIP PEACOCK 44\"', 'CREATURE', '7340', 'Carbon Fiber - Carbon fiber is added to make the board stronger and stiffer.\r\n\r\nScratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 48\" Wi', 3, 'black'),
(32, '637896779865300000.jpg', 'andyachtz - Stratus Spectrum 46\"', 'CREATURE', '9800', 'Length: 48\" Width: 9.64\"\r\n\r\nWheelbase: 29.4\"~31.6\"\r\n\r\nWeight: 2kg\r\n\r\nConstruction: Lightweight Ash Wood Triple Layer Fiberglass 360pu Bumper Edge\r\n\r\nFlex: 1 (60 – 100+ kg) / 2 (40 – 80 kg)', 3, 'black'),
(33, '637896779868100000.jpg', 'SWITCH LONGBOARD - Otter 46\'\'', 'SANTA CRUZ', '6880', 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 3, 'green'),
(34, '637896779870600000.jpg', 'ROCKET Longboards - LINUM 41.7\"', 'SANTA CRUZ', '7880', 'Polyurethane Board Edge - Specially formulated 360° PU bumper makes the board durable and waterproof. Don\'t worry about sawdust falling off the board\r\n\r\nWood Technology - A new core technology that mixes different types of wood. Makes the board very durab', 3, 'white'),
(35, '637907367084030000.jpg', 'Tiger Boards - FORRO 41\"', 'SANTA CRUZ', '7300', 'Carbon Fiber - Carbon fiber is added to make the board stronger and stiffer.\r\n\r\nScratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 46\" Wi', 3, 'black'),
(36, '637907367532670000.jpg', 'CLASSIC DOT 9.35in x 31.7in CRUZER 80s', 'SANTA CRUZ', '5600', 'Wheelbase: 27.1\" / 28.2\'\' / 29.2\"\r\n\r\nWeight: 1.8kg\r\n\r\nConstruction: Lightweight Ash Wood Triple Layer Fiberglass 360pu Bumper Edge\r\n\r\nFlex: 1 (60-100+ kg) / 2 (40 – 80 kg)', 3, 'black'),
(37, '637907367700230000.jpg', 'GROUP DOT 9.51in x 32.26in CRUZER 80s', 'SANTA CRUZ', '5600', 'L: 41.7\" | W: 9.25\" | WB: 24.4\" - 25.6\"\r\n\r\nConcave: 0.43\" / 11mm\r\n\r\nRocker + Kicks: 0.8\" / 20mm\r\n\r\nFLEX 1: 70 - 100kg\r\n\r\nFLEX 2: 50 - 85kg', 3, 'blue'),
(38, '637907367853370000.jpg', '14 Cities', 'CREATURE', '7680', 'Composite material-\r\n\r\nCarbon fiber\r\n\r\nNatural flax fiber\r\n\r\nSurface material-\r\n\r\nEmbossed ABS (Embossed ABS)\r\n\r\nThe main material-\r\n\r\nCanadian Maple (SFI-certified)', 3, 'blue'),
(39, '637915097444700000.jpg', 'ill-fated woman', 'CREATURE', '6999', 'Innovative combination of materials, hidden in the body structure,\r\n\r\nMaple + natural flax fiber composite material makes the board lighter.\r\n\r\nRocke specially placed the \"carbon fiber\" in the middle of the board to make a keel design to enhance longer se', 3, 'red'),
(40, '637897049652570000.jpg', 'DET A LA SOUR 8.0', 'SOUR', '2100', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'pink'),
(41, '637901148616030000.jpg', 'DET A LA SOUR 8.25', 'SOUR', '2400', 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'green'),
(42, '637901149197370000.jpg', 'POLIZEI 8.0', 'SOUR', '2100', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'red'),
(43, '637901304992400000.jpg', 'FILMS – POPSICLE 8.25', 'SOUR', '3299', 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'pink'),
(44, '637901307076670000.jpg', 'FLAMINGOS 8.25', 'SOUR', '2499', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'red'),
(45, '637901309796270000.jpg', 'ALBERT – MGS 8.125', 'SOUR ', '3280', 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'red'),
(46, '637902183627270000.jpg', 'KOFFE - MONTANA', 'SOUR', '1999', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'black'),
(47, '637902238801500000.jpg', 'NISSE - MONEY', 'SOUR', '1999', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'pink'),
(48, '637907368380500000.jpg', 'SPANGS - FREE RANGE', 'SOUR', '2699', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'black'),
(49, '637925492626630000.jpg', 'JOSEF - EURO TEETH', 'SOUR', '1999', 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'purple'),
(50, '637925493988330000.jpg', 'BAD BUOY ZERED 8.1', 'ALLTIMERS', '2200', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'purple'),
(51, '637926316207370000.jpg', 'ROLLIN\' WILL 8.0', 'ALLTIMERS', '2200', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'yellow'),
(52, '637926316352170000.jpg', 'MORNING FUEL DUSTIN 8.25', 'ALLTIMERS', '2499', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'blue'),
(53, '637926317190500000.jpg', 'WHIP NAME PROPER ALEX 8.25', 'ALLTIMERS', '1999', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'black'),
(54, '637928097348700000.jpg', 'SPACE TRASH DUSTIN 8.5', 'ALLTIMERS', '2200', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'green'),
(55, '637932294427000000.jpg', 'SPACE TRASH WILL 8.25', 'ALLTIMERS', '1999', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'white'),
(56, '637932295952970000.jpg', 'SPACE TRASH ZERED 8.3', 'ALLTIMERS', '2680', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'white'),
(57, '637932307998870000.jpg', 'SPACE TRASH ALEXIS 8.125', 'ALLTIMERS', '3280', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'white'),
(58, '637932308525570000.jpg', 'INSULATION STATION 8.1', 'ALLTIMERS', '2880', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'black'),
(59, '637932309156870000.jpg', 'SNEAK PEAK GLASS BRICKS 8.25', 'ALLTIMERS', '2880', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'green'),
(60, '637932334431270000.jpg', 'FLEX BOARD 8.125', 'ALLTIMERS', '1999', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'black'),
(61, '637932336187900000.jpg', 'FLEX BOARD 8.3', 'ALLTIMERS', '2799', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'blue'),
(62, '637932339723670000.jpg', 'BALLOON DECK 8.25', 'ALLTIMERS', '1999', 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'purple'),
(63, '637932341140070000.jpg', 'THE ESSENCE CRUISER 8.5', 'ALLTIMERS', '2799', 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'blue'),
(64, 'mczh-tw2000x2000_small13161.jpg', 'Trucks - V2 180mm 43º GOLD', 'Paris', '2000', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'yellow'),
(65, 'mczh-tw2000x2000_small13162.jpg', 'Trucks - V2 195mm 50º BLACK', 'Paris', '2000', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'black'),
(66, 'mczh-tw2000x2000_small13165.jpg', 'Trucks - V3 180mm 50º Magic Magenta', 'Paris', '2300', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'pink'),
(67, 'mczh-tw2000x2000_small13169.jpg', 'Trucks - V3 180mm 50º', 'Paris', '2300', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'red'),
(68, 'mczh-tw2000x2000_small13175.jpg', 'Trucks - 180mm 50° SAVANT Red/Black', 'Paris', '2300', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'red'),
(69, 'mczh-tw2000x2000_small13176.jpg', 'Trucks - 180mm 50° SAVANT Gunmetal', 'Paris', '2200', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'blue'),
(70, 'mczh-tw2000x2000_small13179.jpg', 'Trucks - Kodiak 180mm BLACK', 'Bear', '6500', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'black'),
(71, 'mczh-tw2000x2000_small28907.jpg', 'Trucks III - RAW/SILVER 184mm 50°', 'Bear', '2000', 'Increased wheel frame strength reduces overall weight, enhances Hanger\'s support, and prevents flexing.\r\n\r\nIn order to satisfy Skater and players, Bushings SET can use various Bushings.\r\n\r\n96A Pivot cups material uses urethane urethane to reduce cracking ', 5, 'white'),
(72, 'mczh-tw2000x2000_small30506.jpg', 'Trucks - 186mm 48°', 'Bear', '2300', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'white'),
(73, 'mczh-tw2000x2000_small51996.jpg', 'rucks - V3 180mm 50º Purple Tide', 'Paris', '2300', 'The new patented T6 heat treatment technology, fine-tuning in the production process, a combination of casting and forging, increases the strength of Hanger!\r\n\r\n50º and 43º marking symbols have been added to the base, so the angle used can be clearly iden', 5, 'purple'),
(74, 'mczh-tw2000x2000_small51997.jpg', 'Trucks - V3 180mm 50º Tropic Green', 'Paris', '2300', 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'green'),
(75, 'mczh-tw2000x2000_small51998.jpg', 'Trucks - V3 180mm 50º Polished', 'Paris', '2200', 'The new patented T6 heat treatment technology, fine-tuning in the production process, a combination of casting and forging, increases the strength of Hanger!\r\n\r\n50º and 43º marking symbols have been added to the base, so the angle used can be clearly iden', 5, 'blue'),
(76, 'mczh-tw2000x2000_small53311.jpg', 'Skateboard Wheels - 54mm Elite Nomads 95a', 'OJ', '1500', 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'black'),
(77, 'mczh-tw2000x2000_small53313.jpg', 'Skateboard Wheels - 53mm Winkowski Mountain Trip Elite Hardline 99a\r\n', 'OJ', '1500', 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'white'),
(78, 'mczh-tw2000x2000_small53442.jpg', 'Skateboard Wheels - 55mm Mini Super Juice Orange Green 78a', 'OJ', '1600', 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'orange'),
(79, 'mczh-tw2000x2000_small56431.jpg', 'Skateboard Wheels - 53mm FRAMEWORK SPARX 99a', 'Ricta', '900', 'RICTA has a long history and is constantly developing new wheels!\r\n\r\nThe biggest feature of RICTA WHEELS is to focus on high hardness, high density and smooth surface.\r\n\r\nRicta Naturals polyurethane material, maintains the best speed and smooth rolling.', 6, 'black'),
(80, 'mczh-tw2000x2000_small57778.jpg', 'Tom Knox- The Love Series 53mm V-Cut 99a', 'Ricta', '1500', 'RICTA has a long history and is constantly developing new wheels!\r\n\r\nThe biggest feature of RICTA WHEELS is to focus on high hardness, high density and smooth surface.\r\n\r\nRicta Naturals polyurethane material, maintains the best speed and smooth rolling.', 6, 'white'),
(81, 'mczh-tw2000x2000_small57779.jpg', 'Sammy Montano- The Love Series 53mm OG Wide 99a', 'Ricta', '1500', 'RICTA has a long history and is constantly developing new wheels!\r\n\r\nThe biggest feature of RICTA WHEELS is to focus on high hardness, high density and smooth surface.\r\n\r\nRicta Naturals polyurethane material, maintains the best speed and smooth rolling.', 6, 'white'),
(82, 'mczh-tw2000x2000_small57907.jpg', 'Skateboard Wheels - 55mm Mini Super Juice Black 78a', 'OJ', '1300', 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'black'),
(83, 'mczh-tw2000x2000_small57912.jpg', 'Skateboard Wheels - 54mm Axel Crusher Ramen Elite Mini Combo 101a', 'OJ', '1500', 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'pink'),
(84, 'mczh-tw2000x2000_small57916.jpg', 'Skateboard Wheels - 54mm Nora Vasconcellos Surfs Up 2 Elite EZ EDGE 101a', 'OJ', '1500', 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'pink'),
(85, 'mczh-tw2000x2000_small68421.jpg', 'Longboards Wheels - Swirl/Teal 60mm 83a', 'Mindless', '1400', 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'blue'),
(86, 'mczh-tw2000x2000_small68422.jpg', 'Longboards Wheels - Swirl/Bronze 60mm 83a', 'Mindless', '1400', 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'yellow'),
(87, 'mczh-tw2000x2000_small68423.jpg', 'Longboards Wheels - TEAL VIPER 65mm 82a', 'Mindless', '1600', 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'blue'),
(88, 'mczh-tw2000x2000_small68424.jpg', 'Longboards Wheels - BLACK VIPER 65mm 82a', 'Mindless', '1600', 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'black');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `teacher_category`
--

CREATE TABLE `teacher_category` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `teacher_category`
--

INSERT INTO `teacher_category` (`sid`, `name`) VALUES
(1, 'Nike'),
(2, '小博'),
(3, '雅君'),
(5, '龔妹'),
(6, '紀威'),
(7, '皓子'),
(9, '阿邦'),
(10, '卡布'),
(11, '小剛'),
(13, '剛一'),
(14, '阿信'),
(15, '球球');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `custom`
--
ALTER TABLE `custom`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `cus_like`
--
ALTER TABLE `cus_like`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `cus_message`
--
ALTER TABLE `cus_message`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `dance_category`
--
ALTER TABLE `dance_category`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- 資料表索引 `teacher_category`
--
ALTER TABLE `teacher_category`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin`
--
ALTER TABLE `admin`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `carts`
--
ALTER TABLE `carts`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `custom`
--
ALTER TABLE `custom`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cus_like`
--
ALTER TABLE `cus_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cus_message`
--
ALTER TABLE `cus_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dance_category`
--
ALTER TABLE `dance_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `favorite`
--
ALTER TABLE `favorite`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `lesson`
--
ALTER TABLE `lesson`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1544;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `sid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202200137;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_details`
--
ALTER TABLE `order_details`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `teacher_category`
--
ALTER TABLE `teacher_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
