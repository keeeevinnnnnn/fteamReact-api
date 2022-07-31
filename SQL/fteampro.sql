-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 07 月 31 日 15:20
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
(70, '1', 'product', 1, 6800, '1546', '2022-07-30 13:35:57');

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
  `member_id` varchar(255) DEFAULT NULL,
  `custom_product_name` varchar(255) DEFAULT NULL,
  `wheel_style` varchar(255) DEFAULT NULL,
  `carrier` varchar(255) DEFAULT NULL,
  `front_color` varchar(255) DEFAULT NULL,
  `back_style` varchar(255) DEFAULT NULL,
  `back_pattern` varchar(255) DEFAULT NULL,
  `back_color` varchar(255) DEFAULT NULL,
  `back_text` varchar(255) DEFAULT NULL,
  `back_sticker` varchar(255) DEFAULT NULL,
  `back_img` longtext DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `custom`
--

INSERT INTO `custom` (`sid`, `member_id`, `custom_product_name`, `wheel_style`, `carrier`, `front_color`, `back_style`, `back_pattern`, `back_color`, `back_text`, `back_sticker`, `back_img`, `price`, `created_date`) VALUES
(2, '1438', 'BANANA', 'PurpleStart', 'copper', '#abff2e', 'style_03', 'Startwave', '#ffdc2e', 'BANANA', 'skew', 'cus89da5736-d27e-43bc-ae83-ef660bff5b58.png', '3990', '2022-07-31 11:16:26'),
(4, '1459', 'HEYYYYYYY', 'BlackBlue', 'iron', '#cdb8ff', 'style_02', 'Disturb', '#ff94c8', 'HAYYY', 'Dot', 'cus4727530c-bf0d-47b7-9f65-192b9243bdc5.png', '3990', '2022-07-31 11:22:55'),
(5, '1461', 'COOL THING', 'NeonGreen', 'black', '#4f4f4f', 'style_02', 'Disturb', '#000000', 'COOL', 'skew', 'cus88ce629b-9a4a-4281-8539-a002c68d1a4f.png', '3990', '2022-07-31 11:24:58'),
(7, '1471', 'Yoyoyo', 'PinkWave', 'iron', '#676ea8', 'style_04', 'Disturb', '#384756', 'WHYYYYY', 'waves', 'cus3779f7fa-6639-46c3-9880-34624c1f4e51.png', '3990', '2022-07-31 11:28:50'),
(8, '1473', 'TEST BOARD', 'PurpleStart', 'black', '#ffaf7a', 'style_02', 'Startwave', '#b4ff94', 'TESTTT', 'Dot', 'cusaabee7e5-fc48-453e-8c8b-74c939839b60.png', '3990', '2022-07-31 11:31:53'),
(9, '1234', '5566', 'PurpleStart', 'iron', '#925454', 'style_02', 'Parallel', '#123456', 'SAMPLE', 'Dot', 'cus2c017d94-f1b9-4759-b74d-71e8cd41f275.png', '3990', '2022-07-31 14:11:29'),
(10, '2234', '2234bbbb', 'PinkWave', 'iron', '#895252', 'style_02', 'Parallel', '#123456', '11111111', 'Waves', 'cus29ba6e0c-3b17-4ce3-9887-1ed8bbfef58a.png', '1990', '2022-07-31 14:44:57'),
(11, '3456', '3456bordddddd', 'PinkWave', 'iron', '#9573d3', 'style_02', 'Disturb', '#a3d1ff', '345666666', 'Waves', 'cusd0b76669-e156-49aa-8db7-e495bd6d77e6.png', '2990', '2022-07-31 14:52:44'),
(12, '4321', '4321board', 'PinkWave', 'iron', '#399027', 'style_02', 'Parallel', '#ffa914', '43211111', 'skew', 'cus4204dbe8-7ab4-43b0-bffa-734a2ad5e94b.png', '3990', '2022-07-31 15:05:32');

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
  `sid` int(10) NOT NULL,
  `memId` int(30) NOT NULL,
  `favoriteImg` varchar(100) NOT NULL,
  `favoriteName` varchar(100) NOT NULL,
  `favoriteBrand` varchar(50) NOT NULL,
  `favoritePrice` int(20) NOT NULL,
  `favoriteId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `favorite`
--

INSERT INTO `favorite` (`sid`, `memId`, `favoriteImg`, `favoriteName`, `favoriteBrand`, `favoritePrice`, `favoriteId`) VALUES
(23, 1544, '637894483325030000.jpg', 'Staring at you and dancing The whole set of skateb...', 'HOCKEY', 5999, 19),
(24, 1544, '637894483334100000.jpg', '	\r\nThis is the street full set of skateboards 8.25', 'HOCKEY', 6480, 20),
(25, 1544, '637903742589700000.jpg', 'This is art The whole set of skateboards 8.0', 'GX1000', 5899, 21);

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
(1, 'Key Glock - Ambition For Cash', 1, '2022-08-25', '2022-09-25', 8, 3000, 1, '忠孝館', 7),
(2, 'Collapse - Eminem / Baiba Klints', 1, '2022-09-24', '2022-10-24', 8, 2700, 1, '忠孝館', 7),
(3, 'Easy Dance Routine ', 1, '2022-10-27', '2022-11-27', 8, 2500, 1, '忠孝館', 8),
(4, 'Salute - Competition Dance', 1, '2022-11-28', '2022-12-28', 8, 2700, 1, '忠孝館', 6);

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
(1544, 'superShinder', '', '平民', 'superShinder', '$2a$10$re/oQiDQDOFP1bmaRnPwvO2XsiB16la6CuTb/kBi4mixOYtuUlXKi', 'superShinder@test.com', '', NULL, '', 'images.png', '2022-07-26 22:23:49', 1),
(1545, 'handsomeShinder', '', '平民', 'handsomeShinder', '$2a$10$mLM8MtwwcVJzPXYX/mXEnOMSPRHqU8ocnfwO6Y/Ax3yxvpN.lS2sS', 'handsomeShinder@test.com', '', NULL, '', 'images.png', '2022-07-27 00:10:01', 1),
(1546, 'superGary', '', '平民', 'superGary', '$2a$10$xuqZ4gEyjypv2p/hDAI02O7QvExU45rjtb/sLLKcpow8xrAkCRS4G', 'superGary@test.com', '', NULL, '', 'images.png', '2022-07-27 23:04:35', 1);

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
(202200148, 1546, '123131', '基隆市信義區243243134', 'toHome', 33799, '2022-07-29 22:27:39'),
(202200149, 1546, '123', '基隆市仁愛區123', 'toHome', 14998, '2022-07-29 22:29:32');

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
(201, 202200148, 1546, 2, 'product', 3, 18900),
(202, 202200148, 1546, 3, 'product', 1, 7400),
(203, 202200148, 1546, 4, 'product', 1, 7499),
(204, 202200149, 1546, 4, 'product', 1, 7499),
(205, 202200149, 1546, 5, 'product', 1, 7499);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `sid` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` int(50) NOT NULL,
  `info` varchar(255) NOT NULL,
  `category_id` int(15) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`sid`, `img`, `name`, `brand`, `price`, `info`, `category_id`, `color`) VALUES
(1, '637894478401770000.jpg', 'GTA cartoon version of the whole set of skateboard', 'POLAR', 6800, 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 2, 'Black'),
(2, '637894478778200000.jpg', 'That dog has three pairs of Inner 0.0 The whole set of skateboards', 'POLAR', 6300, 'Wood Technology - A new core technology that mixes different types of wood. Makes the board very durable and lightweight\r\n\r\nFiberglass - Different types of high-quality fiberglass are used depending on the applicable strength required for the board body.\r', 2, 'Green'),
(3, '637894478781770000.jpg', 'Zhengmei stares so cool, the whole group of skateboards 8.0', 'POLAR', 7400, 'Scratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 39.4\" Width: 9.45\"\r\n\r\nWheelbase: 22.6\" / 22.6\'\' / 24.6\"\r\n\r\nWeight: 1.7kg\r\n\r\nConstructi', 2, 'Blue'),
(4, '637894478801800000.jpg', 'Shark jump up the whole set of skateboards 8.25', 'POLAR', 7499, 'L: 45.6\" | W: 9.25\" | WB: 28.3\" - 29.5\"\r\n\r\nConcave: 0.43\" / 11mm\r\n\r\nRocker + Kicks: 0.8\" / 20mm\r\n\r\nFLEX 1: 70 - 100kg\r\n\r\nFLEX 2: 50 - 85kg\r\n\r\nCarbon fiber\r\n\r\nNatural flax fiber\r\n\r\nSurface material-', 2, 'Blue'),
(5, '637894478809030000.jpg', 'Memoirs or something? The whole set of skateboards 8.1', 'PALACE', 7499, 'Innovative combination of materials, hidden in the body structure,\r\n\r\nMaple + natural flax fiber composite material makes the board lighter.\r\n\r\nRocke specially put \"carbon fiber\" in the middle of the board to make a keel design', 2, 'Yellow'),
(6, '637894478830100000.jpg', 'Street Scenery Full Skateboard 8.25', 'PALACE', 6600, 'Enhanced for longer service life and flexible elasticity.\r\n\r\nThe second special material \"Flax Fiber\" keeps the board from shattering when damaged,\r\n\r\nUnlike fiberglass, your fingers won\'t be getting shards of glass.', 2, 'Yellow'),
(7, '637894479560230000.jpg', 'Doberman Dog Skateboard 8.1', 'PALACE', 5999, 'Innovative combination of materials, hidden in the body structure,\r\n\r\nMaple + natural flax fiber composite material makes the board lighter.\r\n\r\nRocke specially put \"carbon fiber\" in the middle of the board to make a keel design', 2, 'Pink'),
(8, '637894482025330000.jpg', 'Chaopai Dou The whole set of skateboards 7.75', 'PALACE', 6999, 'Enhanced for longer service life and flexible elasticity.\r\n\r\nThe second special material \"Flax Fiber\" keeps the board from shattering when damaged,\r\n\r\nUnlike fiberglass, your fingers won\'t be getting shards of glass.', 2, 'Yellow'),
(9, '637894482029730000.jpg', 'Renaissance Full Skateboard 8.25', 'PALACE', 8250, 'After playing this longboard, I just want to tell you that it is really very flexible, and you can find the exact position of flipping and hitting,\r\n\r\nLANDYACHTZ 2020\'s latest board type \"Tony Danza\", the board width is improved and narrowed to 8.5 inches', 2, 'Blue'),
(10, '637894482038170000.jpg', 'Doberman Dog Skateboard 8.0', 'PALACE', 7480, 'The board body from the board head to the board tail is Rocker. The board body from the board head to the board tail is mainly based on the Rocker overall shape, and the extended Tail is more prominent and lighter to use! Dot more accurately\r\nNext is the ', 2, 'Yellow'),
(11, '637894482942270000.jpg', 'Pass time in Paris Full set of skateboards 8.25', 'FUCKING AWESOME', 9566, 'L: 35\" | W: 9.5\" | WB: 18\"\r\n\r\nMaterial: 2021 added special soft and hard, clearer weight and better elastic feedback\r\n\r\n- Purely handmade board body\r\n\r\n- Glass fiber plywood body on the upper and lower panels is waterproof and wear-resistant', 2, 'Green'),
(12, '637894482945570000.jpg', 'Lots of people Full set of skateboards 8.25', 'FUCKING AWESOME', 6999, '-Nose/Tails use high-performance silicone rubber (Dragon skin plastic) on the edge of the outer layer, the material is lighter/elastic, 100% impact-resistant, and the moves are too large to be worn out too fast\r\n\r\n- 24cm (9.5\") board width U-Concave press', 2, 'Yellow'),
(13, '637894482948870000.jpg', 'One Spider Whole Skateboard 8.0', 'FUCKING AWESOME', 6999, 'Kate wants to be a little shorter than the BASTET 44\",\r\n\r\nTimur wanted a longer board than the City Rat 38\",\r\n\r\nSo FLOW 42\" was born~\r\n\r\nPEPPR BOARDS x SUPERYMMETRY', 2, 'Orange'),
(14, '637894482956200000.jpg', 'Summon the beast the whole group of skateboards 8.25', 'FUCKING AWESOME', 6999, 'Kate wants to be a little shorter than the BASTET 44\",\r\n\r\nTimur wanted a longer board than the City Rat 38\",\r\n\r\nSo FLOW 42\" was born~\r\n\r\nPEPPR BOARDS x SUPERYMMETRY', 2, 'Pink'),
(15, '637894482992030000.jpg', 'Smoke a cigarette The whole set of skateboards 8.18', 'FUCKING AWESOME', 6999, 'Mediate/Soft (special specification) is the elasticity between Mediate & Soft, and it is also the most recommended hardness by Ao Sen\r\n\r\nMaterial: 2021 added special soft and hard, clearer weight and better elastic feedback\r\n\r\n- Purely handmade board body', 2, 'Green'),
(16, '637894483314000000.jpg', 'They\'re laughing at you The whole set of skateboards 8.25', 'HOCKEY', 6999, '- Glass fiber plywood body on the upper and lower panels is waterproof and wear-resistant\r\n\r\n-Panel body maple 360° fully covered with polyurethane, strong pressure bearing toughness/sturdy\r\n\r\n-Nose/Tails use high-performance silicone rubber (Dragon skin ', 2, 'Orange'),
(17, '637894483315400000.jpg', 'Naruto Rock The whole set of skateboards 8.25', 'HOCKEY', 5999, '- 24cm (9.5\") board width U-Concave pressed with Micro Rocker board can\r\n\r\nThe freestyle/Dancing process firmly grasps the foot, easy to find the foot position, locks the foot, and is not easy to slip the foot', 2, 'Blue'),
(18, '637894483318370000.jpg', 'Dead Man Whole Skateboard 8.25', 'HOCKEY', 6999, 'L: 48\" | W: 9.5\" | WB: 32\"-33.4\"\r\n\r\n[Recommended experience]\r\nThe material of the board is strong/impact/light/waterproof/wear-resistant\r\nPlayers who like to pursue more advanced/multi-skills/big moves\r\nYou can come and experience the charm of the new mat', 2, 'Orange'),
(19, '637894483325030000.jpg', 'Staring at you and dancing The whole set of skateboards 8.25', 'HOCKEY', 5999, '[FLEX]\r\nStiff/Middle (special specification)\r\n[Material]\r\n-2021 added special soft and hard, lighter weight and better elastic feedback.\r\n\r\n- Purely handmade board body\r\n \r\n-The upper and lower panels are waterproof and wear-resistant.\r\n \r\n-Panel body map', 2, 'Red'),
(20, '637894483334100000.jpg', 'This is the street full set of skateboards 8.25', 'HOCKEY', 6480, '-Nose/Tails use high performance silicone rubber (Dragon skin plastic) on the outer edge of the board, the material is lighter/elastic\r\n100% crash resistance\r\n \r\n- Body size 122cm (48\") Adjustable wheel base 81-85cm (32\"-33.4\")\r\nWheelbase Sensitivity: Mod', 2, 'Pink'),
(21, '637903742589700000.jpg', 'This is art The whole set of skateboards 8.0', 'GX1000', 5899, '- 24cm (9.5\") board width U-Concave pressed with Micro Rocker board can\r\nThe freestyle/Dancing process firmly grasps the foot, easy to find the foot position, locks the foot, and is not easy to slip the foot\r\n \r\n-Kick longth 13/15cm (5.2\"/6\") large space,', 2, 'Black'),
(22, '637903780999200000.jpg', 'Grassy World The whole set of skateboards 8.125', 'GX1000', 6780, 'Kate wants to be a little shorter than the BASTET 44\",\r\n\r\nTimur wanted a longer board than the City Rat 38\",\r\n\r\nSo FLOW 42\" was born~\r\n\r\nPEPPR BOARDS x SUPERYMMETRY', 2, 'Black'),
(23, '637909744266270000.jpg', 'The hottest skateboard The whole group of skateboards 8.0', 'GX1000 ', 7480, '2021 new flipping pictures,\r\n\r\nIt was designed by a good friend for us.\r\n\r\nTaiwanese designer @supersymmetry__\r\n\r\nFLEX selection suggestions:\r\n\r\nSoft: 30-70kg\r\n\r\nMedium: 40-110kg\r\n\r\nStiff: 60-140kg', 2, 'Yellow'),
(24, '637909745618430000.jpg', 'See it all The whole set of skateboards 8.0', 'GX1000', 5780, 'Material: 2021 added special soft and hard, clearer weight and better elastic feedback\r\n\r\n- Purely handmade board body\r\n\r\n- Glass fiber plywood body on the upper and lower panels is waterproof and wear-resistant\r\n\r\n-Panel body maple 360° fully covered wit', 2, 'Orange'),
(25, '637896779815600000.jpg', 'CRUZ DECODER HAND 9.51IN x 32.26IN', 'SANTA CRUZ', 5600, 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 2, 'Green'),
(26, '637896779822170000.jpg', 'CRUZ FLIER COLLAGE DOT 8.8IN x 27.7IN', 'SANTA CRUZ', 5300, 'Polyurethane Board Edge - Specially formulated 360° PU bumper makes the board durable and waterproof. Don\'t worry about sawdust falling off the board\r\n\r\nWood Technology - A new core technology that mixes different types of wood. Makes the board very durab', 2, 'Purple'),
(27, '637896779840330000.jpg', 'CRUZ PRISMATIC DOT 8.8IN x 27.7IN', 'SANTA CRUZ', 5300, 'Carbon Fiber - Carbon fiber is added to make the board stronger and stiffer.\r\n\r\nScratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 39.4\" ', 2, 'Black'),
(28, '637896779842700000.jpg', 'Opened the whole set of traffic boards 7.8', 'CREATURE', 5899, 'Wheelbase: 22.6\" / 22.6\'\' / 24.6\"\r\n\r\nWeight: 1.7kg\r\n\r\nConstruction: Lightweight Ash Wood Triple Layer Fiberglass 360pu Bumper Edge\r\n\r\nFlex: 1 (60-100+ kg) / 2 (40 – 80 kg)', 2, 'Orange'),
(29, '637896779845030000.jpg', 'Bottle opener Full set of traffic boards 8.6', 'CREATURE', 6499, 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 2, 'Purple'),
(30, '637896779853730000.jpg', 'Flip LVLV ORANGE 42\" Morandi Green 50º', 'CREATURE', 8490, 'Polyurethane Board Edge - Specially formulated 360° PU bumper makes the board durable and waterproof. Don\'t worry about sawdust falling off the board\r\n\r\nWood Technology - A new core technology that mixes different types of wood. Makes the board very durab', 2, 'White'),
(31, '637896779856230000.jpg', 'Rayne Longboards - WHIP PEACOCK 44\"', 'CREATURE', 7340, 'Carbon Fiber - Carbon fiber is added to make the board stronger and stiffer.\r\n\r\nScratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 48\" Wi', 2, 'Black'),
(32, '637896779865300000.jpg', 'andyachtz - Stratus Spectrum 46\"', 'CREATURE', 9800, 'Length: 48\" Width: 9.64\"\r\n\r\nWheelbase: 29.4\"~31.6\"\r\n\r\nWeight: 2kg\r\n\r\nConstruction: Lightweight Ash Wood Triple Layer Fiberglass 360pu Bumper Edge\r\n\r\nFlex: 1 (60 – 100+ kg) / 2 (40 – 80 kg)', 2, 'Black'),
(33, '637896779868100000.jpg', 'SWITCH LONGBOARD - Otter 46\'\'', 'SANTA CRUZ', 6880, 'Made in Poland - Most of the materials used in the production process come from the beautiful country of Poland.\r\n\r\nDigital Machining - CNC machine precisely cuts the body of the board, precisely cuts the mounting holes and horizontal diagonal corners.\r\n\r', 2, 'Green'),
(34, '637896779870600000.jpg', 'ROCKET Longboards - LINUM 41.7\"', 'SANTA CRUZ', 7880, 'Polyurethane Board Edge - Specially formulated 360° PU bumper makes the board durable and waterproof. Don\'t worry about sawdust falling off the board\r\n\r\nWood Technology - A new core technology that mixes different types of wood. Makes the board very durab', 2, 'White'),
(35, '637907367084030000.jpg', 'Tiger Boards - FORRO 41\"', 'SANTA CRUZ', 7300, 'Carbon Fiber - Carbon fiber is added to make the board stronger and stiffer.\r\n\r\nScratch-resistant design - Using ski manufacturing technology, the bottom of the board is less prone to scratches.\r\n\r\nSuitable for: walking board / freestyle\r\n\r\nLength: 46\" Wi', 2, 'Black'),
(36, '637907367532670000.jpg', 'CLASSIC DOT 9.35in x 31.7in CRUZER 80s', 'SANTA CRUZ', 5600, 'Wheelbase: 27.1\" / 28.2\'\' / 29.2\"\r\n\r\nWeight: 1.8kg\r\n\r\nConstruction: Lightweight Ash Wood Triple Layer Fiberglass 360pu Bumper Edge\r\n\r\nFlex: 1 (60-100+ kg) / 2 (40 – 80 kg)', 2, 'Black'),
(37, '637907367700230000.jpg', 'GROUP DOT 9.51in x 32.26in CRUZER 80s', 'SANTA CRUZ', 5600, 'L: 41.7\" | W: 9.25\" | WB: 24.4\" - 25.6\"\r\n\r\nConcave: 0.43\" / 11mm\r\n\r\nRocker + Kicks: 0.8\" / 20mm\r\n\r\nFLEX 1: 70 - 100kg\r\n\r\nFLEX 2: 50 - 85kg', 2, 'Blue'),
(38, '637907367853370000.jpg', 'Cities', 'CREATURE', 7680, 'Composite material-\r\n\r\nCarbon fiber\r\n\r\nNatural flax fiber\r\n\r\nSurface material-\r\n\r\nEmbossed ABS (Embossed ABS)\r\n\r\nThe main material-\r\n\r\nCanadian Maple (SFI-certified)', 2, 'Blue'),
(39, '637915097444700000.jpg', 'ill-fated woman', 'CREATURE', 6999, 'Innovative combination of materials, hidden in the body structure,\r\n\r\nMaple + natural flax fiber composite material makes the board lighter.\r\n\r\nRocke specially placed the \"carbon fiber\" in the middle of the board to make a keel design to enhance longer se', 2, 'Red'),
(40, '637897049652570000.jpg', 'DET A LA SOUR 8.0', 'SOUR', 2100, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Pink'),
(41, '637901148616030000.jpg', 'DET A LA SOUR 8.25', 'SOUR', 2400, 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'Green'),
(42, '637901149197370000.jpg', 'POLIZEI 8.0', 'SOUR', 2100, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Red'),
(43, '637901304992400000.jpg', 'FILMS – POPSICLE 8.25', 'SOUR', 3299, 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'Pink'),
(44, '637901307076670000.jpg', 'FLAMINGOS 8.25', 'SOUR', 2499, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Red'),
(45, '637901309796270000.jpg', 'ALBERT – MGS 8.125', 'SOUR ', 3280, 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'Red'),
(46, '637902183627270000.jpg', 'KOFFE - MONTANA', 'SOUR', 1999, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Black'),
(47, '637902238801500000.jpg', 'NISSE - MONEY', 'SOUR', 1999, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'Pink'),
(48, '637907368380500000.jpg', 'SPANGS - FREE RANGE', 'SOUR', 2699, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Black'),
(49, '637925492626630000.jpg', 'JOSEF - EURO TEETH', 'SOUR', 1999, 'Z-FLEX TRUCKS 5\"\r\nThe strongest aluminum wheel frame with durable strength and smooth control.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and ride where you nee', 4, 'Purple'),
(50, '637925493988330000.jpg', 'BAD BUOY ZERED 8.1', 'ALLTIMERS', 2200, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Purple'),
(51, '637926316207370000.jpg', 'ROLLIN\' WILL 8.0', 'ALLTIMERS', 2200, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'Yellow'),
(52, '637926316352170000.jpg', 'MORNING FUEL DUSTIN 8.25', 'ALLTIMERS', 2499, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Blue'),
(53, '637926317190500000.jpg', 'WHIP NAME PROPER ALEX 8.25', 'ALLTIMERS', 1999, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'Black'),
(54, '637928097348700000.jpg', 'SPACE TRASH DUSTIN 8.5', 'ALLTIMERS', 2200, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Green'),
(55, '637932294427000000.jpg', 'SPACE TRASH WILL 8.25', 'ALLTIMERS', 1999, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'White'),
(56, '637932295952970000.jpg', 'SPACE TRASH ZERED 8.3', 'ALLTIMERS', 2680, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'White'),
(57, '637932307998870000.jpg', 'SPACE TRASH ALEXIS 8.125', 'ALLTIMERS', 3280, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'White'),
(58, '637932308525570000.jpg', 'INSULATION STATION 8.1', 'ALLTIMERS', 2880, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Black'),
(59, '637932309156870000.jpg', 'SNEAK PEAK GLASS BRICKS 8.25', 'ALLTIMERS', 2880, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'Green'),
(60, '637932334431270000.jpg', 'FLEX BOARD 8.125', 'ALLTIMERS', 1999, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Black'),
(61, '637932336187900000.jpg', 'FLEX BOARD 8.3', 'ALLTIMERS', 2799, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'Blue'),
(62, '637932339723670000.jpg', 'BALLOON DECK 8.25', 'ALLTIMERS', 1999, 'The time-honored Z-FLEX is a brand from the United States.\r\n\r\nFrom research and development to mass production, it has been continuously improved after the early Z-BOY, and so far there is such a fun brand!!\r\n\r\nThis is a great board for beginners who want', 4, 'Purple'),
(63, '637932341140070000.jpg', 'THE ESSENCE CRUISER 8.5', 'ALLTIMERS', 2799, 'ACE TRUCKS\r\nThe upgraded Ace 44 structure is more durable and can complete the action more stably and smoothly.\r\nZ-FLEX BEARING\r\nContinue high-speed ABEC-7 Bearing.\r\nZ-FLEX WHEEL\r\nThe 52MM wheel formula gives you better ride control, so you can grip and r', 4, 'Blue'),
(64, 'mczh-tw2000x2000_small13161.jpg', 'Trucks - V2 180mm 43º GOLD', 'Paris', 2000, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Yellow'),
(65, 'mczh-tw2000x2000_small13162.jpg', 'Trucks - V2 195mm 50º BLACK', 'Paris', 2000, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Black'),
(66, 'mczh-tw2000x2000_small13165.jpg', 'Trucks - V3 180mm 50º Magic Magenta', 'Paris', 2300, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Pink'),
(67, 'mczh-tw2000x2000_small13169.jpg', 'Trucks - V3 180mm 50º', 'Paris', 2300, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Red'),
(68, 'mczh-tw2000x2000_small13175.jpg', 'Trucks - 180mm 50° SAVANT Red/Black', 'Paris', 2300, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Red'),
(69, 'mczh-tw2000x2000_small13176.jpg', 'Trucks - 180mm 50° SAVANT Gunmetal', 'Paris', 2200, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Blue'),
(70, 'mczh-tw2000x2000_small13179.jpg', 'Trucks - Kodiak 180mm BLACK', 'Bear', 6500, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Black'),
(71, 'mczh-tw2000x2000_small28907.jpg', 'Trucks III - RAW/SILVER 184mm 50°', 'Bear', 2000, 'Increased wheel frame strength reduces overall weight, enhances Hanger\'s support, and prevents flexing.\r\n\r\nIn order to satisfy Skater and players, Bushings SET can use various Bushings.\r\n\r\n96A Pivot cups material uses urethane urethane to reduce cracking ', 5, 'White'),
(72, 'mczh-tw2000x2000_small30506.jpg', 'Trucks - 186mm 48°', 'Bear', 2300, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'White'),
(73, 'mczh-tw2000x2000_small51996.jpg', 'rucks - V3 180mm 50º Purple Tide', 'Paris', 2300, 'The new patented T6 heat treatment technology, fine-tuning in the production process, a combination of casting and forging, increases the strength of Hanger!\r\n\r\n50º and 43º marking symbols have been added to the base, so the angle used can be clearly iden', 5, 'Purple'),
(74, 'mczh-tw2000x2000_small51997.jpg', 'Trucks - V3 180mm 50º Tropic Green', 'Paris', 2300, 'The quantity sold is a pair of (2) wheel frames Bushings hardness is 90a', 5, 'Green'),
(75, 'mczh-tw2000x2000_small51998.jpg', 'Trucks - V3 180mm 50º Polished', 'Paris', 2200, 'The new patented T6 heat treatment technology, fine-tuning in the production process, a combination of casting and forging, increases the strength of Hanger!\r\n\r\n50º and 43º marking symbols have been added to the base, so the angle used can be clearly iden', 5, 'Blue'),
(76, 'mczh-tw2000x2000_small53311.jpg', 'Skateboard Wheels - 54mm Elite Nomads 95a', 'OJ', 1500, 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'Black'),
(77, 'mczh-tw2000x2000_small53313.jpg', 'Skateboard Wheels - 53mm Winkowski Mountain Trip Elite Hardline 99a\r\n', 'OJ', 1500, 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'White'),
(78, 'mczh-tw2000x2000_small53442.jpg', 'Skateboard Wheels - 55mm Mini Super Juice Orange Green 78a', 'OJ', 1600, 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'Orange'),
(79, 'mczh-tw2000x2000_small56431.jpg', 'Skateboard Wheels - 53mm FRAMEWORK SPARX 99a', 'Ricta', 900, 'RICTA has a long history and is constantly developing new wheels!\r\n\r\nThe biggest feature of RICTA WHEELS is to focus on high hardness, high density and smooth surface.\r\n\r\nRicta Naturals polyurethane material, maintains the best speed and smooth rolling.', 6, 'Black'),
(80, 'mczh-tw2000x2000_small57778.jpg', 'Tom Knox- The Love Series 53mm V-Cut 99a', 'Ricta', 1500, 'RICTA has a long history and is constantly developing new wheels!\r\n\r\nThe biggest feature of RICTA WHEELS is to focus on high hardness, high density and smooth surface.\r\n\r\nRicta Naturals polyurethane material, maintains the best speed and smooth rolling.', 6, 'White'),
(81, 'mczh-tw2000x2000_small57779.jpg', 'Sammy Montano- The Love Series 53mm OG Wide 99a', 'Ricta', 1500, 'RICTA has a long history and is constantly developing new wheels!\r\n\r\nThe biggest feature of RICTA WHEELS is to focus on high hardness, high density and smooth surface.\r\n\r\nRicta Naturals polyurethane material, maintains the best speed and smooth rolling.', 6, 'White'),
(82, 'mczh-tw2000x2000_small57907.jpg', 'Skateboard Wheels - 55mm Mini Super Juice Black 78a', 'OJ', 1300, 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'Black'),
(83, 'mczh-tw2000x2000_small57912.jpg', 'Skateboard Wheels - 54mm Axel Crusher Ramen Elite Mini Combo 101a', 'OJ', 1500, 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'Pink'),
(84, 'mczh-tw2000x2000_small57916.jpg', 'Skateboard Wheels - 54mm Nora Vasconcellos Surfs Up 2 Elite EZ EDGE 101a', 'OJ', 1500, 'OJ Skateboard Wheels\r\n\r\nSimply the best! Whether you\'re looking to go to the park, ride a bowl or cruising down the street,\r\n\r\nOJ has you covered with a range of team tested hard and soft wheels.', 6, 'Pink'),
(85, 'mczh-tw2000x2000_small68421.jpg', 'Longboards Wheels - Swirl/Teal 60mm 83a', 'Mindless', 1400, 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'Blue'),
(86, 'mczh-tw2000x2000_small68422.jpg', 'Longboards Wheels - Swirl/Bronze 60mm 83a', 'Mindless', 1400, 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'Yellow'),
(87, 'mczh-tw2000x2000_small68423.jpg', 'Longboards Wheels - TEAL VIPER 65mm 82a', 'Mindless', 1600, 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'Blue'),
(88, 'mczh-tw2000x2000_small68424.jpg', 'Longboards Wheels - BLACK VIPER 65mm 82a', 'Mindless', 1600, 'Diameter: 60mm\r\n\r\nFace width: 44mm\r\n\r\nGround plane width: 40mm\r\n\r\nWheel hardness: 83a', 6, 'Black');

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
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `custom`
--
ALTER TABLE `custom`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `lesson`
--
ALTER TABLE `lesson`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1547;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `news`
--
ALTER TABLE `news`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `sid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202200150;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_details`
--
ALTER TABLE `order_details`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `teacher_category`
--
ALTER TABLE `teacher_category`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
