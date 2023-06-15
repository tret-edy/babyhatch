-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2023 at 02:46 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `babyhatch`
--

-- --------------------------------------------------------

--
-- Table structure for table `babyhatch`
--

CREATE TABLE `babyhatch` (
  `babyhatch_auto_id` int(11) NOT NULL,
  `bhID` varchar(200) NOT NULL,
  `bhName` varchar(200) NOT NULL,
  `bhState` varchar(200) NOT NULL,
  `bhAdress` varchar(200) NOT NULL,
  `bhHotline` varchar(200) NOT NULL,
  `mapLatitude` varchar(200) NOT NULL,
  `mapLongitude` varchar(200) NOT NULL,
  `user_id_auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `babyhatch`
--

INSERT INTO `babyhatch` (`babyhatch_auto_id`, `bhID`, `bhName`, `bhState`, `bhAdress`, `bhHotline`, `mapLatitude`, `mapLongitude`, `user_id_auto`) VALUES
(1, '00000', 'Kedah Baby Hatch', 'Kedah', 'Sungai Petani', '0145124522', '5.6541141', '100.5192692', 0),
(2, '11111', 'Johor Baby Hatch', 'Johor', 'Johor Bahru, Johor', '09998334522xc', '1.4953756', '103.7710573', 0),
(3, '22222', 'Selangor Baby Hatch', 'Selangor', 'Rawang', '09988222', '3.0904853', '101.6550649', 0),
(7, '63f4dfe76a891', 'Tokyo Baby Hatch', 'Tokyo', 'No 12-3, Okonomiya Street, Tokyo, Japan', '01112333834', '100.10234', '50.20234', 0);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `fq_auto_id` int(11) NOT NULL,
  `fqID` varchar(200) NOT NULL,
  `fqQuestion` varchar(200) NOT NULL,
  `fqAnswer` varchar(200) NOT NULL,
  `fqCategory` varchar(200) NOT NULL,
  `user_id_auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`fq_auto_id`, `fqID`, `fqQuestion`, `fqAnswer`, `fqCategory`, `user_id_auto`) VALUES
(1, '000', 'Question 1', 'answer 1nnb', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `infographic`
--

CREATE TABLE `infographic` (
  `ig_auto_id` int(11) NOT NULL,
  `igID` varchar(200) NOT NULL,
  `igName` varchar(200) NOT NULL,
  `igImage` varchar(200) NOT NULL,
  `igDesc` varchar(500) NOT NULL,
  `igCategory` varchar(200) NOT NULL,
  `user_id_auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `infographic`
--

INSERT INTO `infographic` (`ig_auto_id`, `igID`, `igName`, `igImage`, `igDesc`, `igCategory`, `user_id_auto`) VALUES
(2, '111', 'Why Adopt an Older Child?', 'https://orphancare.org.my/wp-content/uploads/2021/10/adopt-an-older-child-1536x1024.jpg', 'In publishing and xgraphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.', '1111', 0),
(7, '63f4df2c31a0b', 'test2', '', 'testttt', '63f4df2c31a0e', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id_auto` int(11) NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `user_nama` varchar(200) NOT NULL,
  `user_phone` varchar(200) DEFAULT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_active` varchar(200) NOT NULL,
  `user_type` varchar(100) NOT NULL DEFAULT '0',
  `user_verification` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id_auto`, `user_id`, `username`, `user_nama`, `user_phone`, `user_password`, `user_email`, `user_active`, `user_type`, `user_verification`) VALUES
(19, '632c99613893c', 'admin', '', '+60108854935', 'admin', 'jkpsb@gmail.com', '1', '1', '143857'),
(21, '63be5f71a5db9', 'testing', 'test', NULL, '1111111111', 'test@gmail.com', '1', '0', '588485'),
(22, '63be5feced83e', 'testing1', 'test1', NULL, '1111111111', 'test1@gmail.com', '1', '0', '566780'),
(23, '63be6038bb337', 'wewe', 'we', NULL, '1111111111', 'we@gmail.com', '1', '0', '640934'),
(24, '63c57084a4c5c', 'xxxx', 'xxx', NULL, 'xxxx', 'xxxx', '1', '0', '494590'),
(25, '63dc16040737f', 'joe', 'Joe Black', NULL, 'joe123', 'angel@gmail.com', '1', '0', '772227');

-- --------------------------------------------------------

--
-- Table structure for table `userbabyhatch`
--

CREATE TABLE `userbabyhatch` (
  `user_id_auto` int(11) NOT NULL,
  `babyhatch_auto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userfaq`
--

CREATE TABLE `userfaq` (
  `user_id_auto` int(11) NOT NULL,
  `fq_auto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userinfographic`
--

CREATE TABLE `userinfographic` (
  `user_id_auto` int(11) NOT NULL,
  `ig_auto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `babyhatch`
--
ALTER TABLE `babyhatch`
  ADD PRIMARY KEY (`babyhatch_auto_id`),
  ADD KEY `user_id_auto` (`user_id_auto`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`fq_auto_id`),
  ADD KEY `user_id_auto` (`user_id_auto`);

--
-- Indexes for table `infographic`
--
ALTER TABLE `infographic`
  ADD PRIMARY KEY (`ig_auto_id`),
  ADD KEY `user_id_auto` (`user_id_auto`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id_auto`);

--
-- Indexes for table `userbabyhatch`
--
ALTER TABLE `userbabyhatch`
  ADD KEY `user_id_auto` (`user_id_auto`,`babyhatch_auto_id`);

--
-- Indexes for table `userfaq`
--
ALTER TABLE `userfaq`
  ADD KEY `user_id_auto` (`user_id_auto`,`fq_auto_id`);

--
-- Indexes for table `userinfographic`
--
ALTER TABLE `userinfographic`
  ADD KEY `user_id_auto` (`user_id_auto`,`ig_auto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `babyhatch`
--
ALTER TABLE `babyhatch`
  MODIFY `babyhatch_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `fq_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `infographic`
--
ALTER TABLE `infographic`
  MODIFY `ig_auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
