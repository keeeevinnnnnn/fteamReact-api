-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 08 月 04 日 15:47
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
(5, 1544, '637894478401770000.jpg', 'GTA cartoon version of the whole set of skateboard', 'POLAR', 6800, 1),
(6, 1544, '637894478830100000.jpg', 'Street Scenery Full Skateboard 8.25', 'PALACE', 6600, 6),
(7, 1544, '637894482025330000.jpg', 'Chaopai Dou The whole set of skateboards 7.75', 'PALACE', 6999, 8),
(8, 1544, '637894482992030000.jpg', 'Smoke a cigarette The whole set of skateboards 8.18', 'FUCKING AWESOME', 6999, 15),
(11, 1544, '637894478801800000.jpg', 'Shark jump up the whole set of skateboards 8.25', 'POLAR', 7499, 4);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`sid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `favorite`
--
ALTER TABLE `favorite`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
