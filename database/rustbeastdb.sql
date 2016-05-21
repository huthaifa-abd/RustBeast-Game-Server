-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2016 at 07:20 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rustbeastdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `rb_achievement`
--

CREATE TABLE IF NOT EXISTS `rb_achievement` (
  `id` bigint(20) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `rb_variable_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_achievement_level`
--

CREATE TABLE IF NOT EXISTS `rb_achievement_level` (
  `id` int(11) NOT NULL,
  `rb_achievement_id` int(11) NOT NULL,
  `target_value` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_category`
--

CREATE TABLE IF NOT EXISTS `rb_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_completed_achievement`
--

CREATE TABLE IF NOT EXISTS `rb_completed_achievement` (
  `id` bigint(20) NOT NULL,
  `rb_achievement_id` int(11) NOT NULL,
  `rb_profile_id` char(16) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_game`
--

CREATE TABLE IF NOT EXISTS `rb_game` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_gift`
--

CREATE TABLE IF NOT EXISTS `rb_gift` (
  `id` int(11) NOT NULL,
  `gift_Type` varchar(100) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `total_value_limit` int(11) NOT NULL,
  `frequent` float NOT NULL,
  `rb_variable_type_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_givien_gift`
--

CREATE TABLE IF NOT EXISTS `rb_givien_gift` (
  `id` bigint(20) NOT NULL,
  `rb_profile_id` char(11) NOT NULL,
  `recepent_rb_profile_id` char(11) NOT NULL,
  `rb_gift_id` int(11) NOT NULL,
  `IsReceived` bit(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_invoice`
--

CREATE TABLE IF NOT EXISTS `rb_invoice` (
  `id` bigint(20) NOT NULL,
  `rb_invoice_type_id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `rb_profile_id` char(16) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_invoices_detail`
--

CREATE TABLE IF NOT EXISTS `rb_invoices_detail` (
  `id` bigint(20) NOT NULL,
  `rb_invoice_id` bigint(20) NOT NULL,
  `rb_item_id` bigint(20) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_invoice_type`
--

CREATE TABLE IF NOT EXISTS `rb_invoice_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_item`
--

CREATE TABLE IF NOT EXISTS `rb_item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `rb_category_id` int(11) NOT NULL,
  `rb_money_type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_log`
--

CREATE TABLE IF NOT EXISTS `rb_log` (
  `id` bigint(20) NOT NULL,
  `rb_profile_id` char(16) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  `is_loged` tinyint(1) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_money_type`
--

CREATE TABLE IF NOT EXISTS `rb_money_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_profile`
--

CREATE TABLE IF NOT EXISTS `rb_profile` (
  `id` char(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `social_media_id` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `country` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_team`
--

CREATE TABLE IF NOT EXISTS `rb_team` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `leader_profile_id` char(16) NOT NULL,
  `created_datetime` datetime NOT NULL,
  `rb_logo_id` int(11) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_team_member`
--

CREATE TABLE IF NOT EXISTS `rb_team_member` (
  `id` bigint(20) NOT NULL,
  `rb_team_id` bigint(20) NOT NULL,
  `rb_profile_id` char(11) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  `IsRequest` tinyint(1) NOT NULL,
  `IsInvite` tinyint(1) NOT NULL,
  `IsApproved` tinyint(1) NOT NULL,
  `ModifyDatetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_transaction`
--

CREATE TABLE IF NOT EXISTS `rb_transaction` (
  `id` bigint(20) NOT NULL,
  `rb_invoce_id` bigint(20) NOT NULL,
  `credit` float NOT NULL,
  `debit` float NOT NULL,
  `rb_money_type_id` int(11) NOT NULL,
  `note` varchar(100) NOT NULL,
  `rb_profile_id` char(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_variable_type`
--

CREATE TABLE IF NOT EXISTS `rb_variable_type` (
  `id` int(11) NOT NULL,
  `variable_type` varchar(100) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_variable_value`
--

CREATE TABLE IF NOT EXISTS `rb_variable_value` (
  `id` bigint(20) NOT NULL,
  `rb_variable_type_id` int(11) NOT NULL,
  `rb_profile_id` char(16) NOT NULL,
  `value` bigint(20) NOT NULL,
  `rb_game_id` int(11) NOT NULL,
  `modify_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
