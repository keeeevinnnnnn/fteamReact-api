-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-08-12 07:38:08
-- 伺服器版本： 10.4.24-MariaDB
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
  `mem_bollen` tinyint(1) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `verify` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`sid`, `mem_name`, `mem_nickname`, `mem_level`, `mem_account`, `mem_password`, `mem_email`, `mem_mobile`, `mem_birthday`, `mem_address`, `mem_avatar`, `mem_created_at`, `mem_bollen`, `hash`, `verify`) VALUES
(1496, '會員', '', '平民', '474', '474', '', '', '0000-00-00', '', 'images.png', '2022-06-11 02:22:54', 0, '0', ''),
(1497, '會員', '', '平民', '010', '010', '', '', '0000-00-00', '', 'images.png', '2022-06-11 05:52:01', 0, '0', ''),
(1499, '會員', '', '平民', '45454', '45454', '', '', '0000-00-00', '', 'images.png', '2022-06-11 14:02:43', 0, '0', ''),
(1502, '會員', '', '平民', 'dfdfd', 'dfdfd', '', '', '0000-00-00', '', 'images.png', '2022-06-11 21:23:33', 1, '0', ''),
(1544, 'Gary', 'Gary', '平民', 'gary', '$2a$10$1./ZkK7lJUjivkc1XD/e9OxX8Bb0BDcJd6u7j6yMmIsDihHWNq/uG', 'a403440322@gmail.com', '0912345678', '2022-07-01', '', 'ef1d7cba-27ee-4a78-bd9b-3080f51e2d04.jpg', '2022-07-23 20:58:35', 1, '0', 'on'),
(1560, 'mary', '', '平民', 'mary', '$2a$10$YewpgIrUKaK.vDxZJ3/TS.N8iPUX80Dbzbm5bV2wPVgKvCsFRg.dq', 'mary@gmail.com', '', NULL, '', 'abbc13e2-61fd-47c9-9dd5-49719ac9a0ce.jpg', '2022-08-05 17:24:59', 1, '31388', 'on'),
(1561, 'anny', '', '平民', 'anny', '$2a$10$qhnILIRU5htCxMYKOmZFeu7.KMDg0n1vIsM2PiTO4ZP63LFigqRku', 'anny@gmail.com', '', NULL, '', '2c086d5e-b8d9-4f6f-af4c-2ac20b8503f2.jpg', '2022-08-05 17:33:52', 1, '24450', 'on'),
(1562, 'john', '', '平民', 'john', '$2a$10$FFv4TiGKSCK.AnytYRhs8uGW8TIIUrtOHl0wHC4H/L/C/uHlDYeGq', 'john@gmail.com', '', NULL, '', '7357c4c1-c525-44cd-99ff-9d770405b048.jpg', '2022-08-05 17:37:35', 1, '83065', 'on'),
(1563, 'Dan', '', '平民', 'dan', '$2a$10$WCZmMxBoNHLrNncZD5u9pepf.TsheZ7/JzUtaQj1qiMVca3h3LWLy', 'dan@gmail.com', '', NULL, '', 'cf683608-4b50-4b53-8ab3-6ae8b84d73b1.jpg', '2022-08-05 17:43:29', 1, '33716', 'on'),
(1564, 'lazy', '', '平民', 'lazy', '$2a$10$z4W45yYBjsFtPjwSYAe.Xuj7sa6fWSHdjGwRawBLCkdFWq/tQzIOy', 'lazy@gmail.com', '', NULL, '', '540ba730-d098-4995-bd87-f27e7e2ee54b.jpg', '2022-08-05 17:49:12', 1, '75036', 'on'),
(1582, '漩渦鳴人', '', '平民', 'aaa', '$2a$10$ZvH6KpuzBSoHAWjUY/4c/uJ03Gxf0j87yrw5EH8kEPS40NBOyCgA2', 'aaa@gmail.com', '', NULL, '', '9d4336cf-da44-4d5b-9039-cb755fa13dda.jpg', '2022-08-12 13:14:58', 1, '61737', 'on'),
(1583, '春野櫻', '', '平民', 'bbb', '$2a$10$bb41F2OhRovujrX3Z8CjDeyH99utXbi7tE9qEPk2qjgocUWj1kMIm', 'bbb@gmail.com', '', NULL, '', 'b6885372-d32d-47bc-8be3-dc38e1683222.jpg', '2022-08-12 13:15:37', 1, '21694', 'on'),
(1584, '卡卡西', '', '平民', 'ccc', '$2a$10$bLjNghKvtVERGaJP/NkGiewxcELgwlLiYqRhb7oZzSS4WU6kxXMoS', 'ccc@gmail.com', '', NULL, '', 'be4a9f45-d328-45dd-aa13-988e470428a7.jpg', '2022-08-12 13:16:04', 1, '824', 'on'),
(1585, '大和', '', '平民', 'ddd', '$2a$10$FVYylLanF/8gm53e5XpT6uHFVqGgU9.h9kaNybtCGhuh.SlZx69v6', 'ddd@gmail.com', '', NULL, '', '50cf5c1c-7c91-410b-a0a2-0556cec51825.jpg', '2022-08-12 13:16:27', 1, '44487', 'on'),
(1586, '奈良鹿丸', '', '平民', 'eee', '$2a$10$qmAZe84in7xpFgUdQAoI2.KVJOxrVtr8eYDO9qbKDGD2KWkXwPbCm', 'eee@gmail.com', '', NULL, '', '357e4fa8-4d15-46ad-993d-119d81395a26.jpg', '2022-08-12 13:16:55', 1, '53795', 'on'),
(1587, '山中井野', '', '平民', 'fff', '$2a$10$WcRUDBQSRV0jeOi89/1nLuMw2uMiK9UiWSF8n9X9YEGIshrWuZCVC', 'fff@gmail.com', '', NULL, '', '739b9064-7630-43b8-bc4f-9006856f3a2e.jpg', '2022-08-12 13:17:22', 1, '75542', 'on'),
(1588, '秋道丁次', '', '平民', 'ggg', '$2a$10$AWOvUN6f3Ies4wzV6HUuSODjE101otnvcxR6tPwzYE7JxQ6aoIhxe', 'ggg@gmail.com', '', NULL, '', 'f10ae412-c58d-45de-91a2-06a916c699a3.jpg', '2022-08-12 13:17:47', 1, '11997', 'on'),
(1589, '猿飛阿斯瑪', '', '平民', 'hhh', '$2a$10$Hb6xXR/TEakAJ0cmPvzD.OYs3VsdciAPbIvXvRCdMZ9vQItj6IN4K', 'hhh@gmail.com', '', NULL, '', 'bafd023c-7a02-4427-89fe-a7b79b53b9d8.jpg', '2022-08-12 13:18:09', 1, '90989', 'on'),
(1590, '日向雛田', '', '平民', 'iii', '$2a$10$590X/RvslwMVm7XgCFC6PeeWe.XWaEWybBpa0QG7xSwPbc.hIy3GG', 'iii@gmail.com', '', NULL, '', 'd924d680-449e-4eee-9c42-0fa842a7f865.jpg', '2022-08-12 13:18:53', 1, '82042', 'on'),
(1591, '犬塚牙', '', '平民', 'jjj', '$2a$10$lHpyFRU2ls0DmePk2DFuwOCwPQnQEOqviLIChLQ.0MdYpMUw1oyya', 'jjj@gmail.com', '', NULL, '', '0022088c-48e3-4261-91ff-7ef374eb0296.jpg', '2022-08-12 13:19:22', 1, '99437', 'on'),
(1592, '宇智波鼬', '', '平民', 'kkk', '$2a$10$vV7SCK/sr4yeG89qe.ANKeTPJTOXqkyfnQjBpJkOhzrzxivGUSQU2', 'kkk@gmail.com', '', NULL, '', '5adae7ba-cd47-4964-88f3-530378f9e590.jpg', '2022-08-12 13:20:25', 1, '41870', 'on');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1593;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
