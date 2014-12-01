-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 30, 2010 at 08:43 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `parentchild`
--

CREATE TABLE IF NOT EXISTS `parentchild` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Parent_ID` bigint(20) NOT NULL,
  `Name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parentchild`
--

INSERT INTO `parentchild` (`ID`, `Parent_ID`, `Name`) VALUES
(1, 0, 'a'),
(2, 0, 'b'),
(3, 1, 'c'),
(4, 1, 'd'),
(5, 3, 'e'),
(6, 3, 'f'),
(7, 5, 'i'),
(8, 5, 'j'),
(9, 6, 'k'),
(10, 6, 'l'),
(11, 7, 'm'),
(12, 7, 'n'),
(13, 8, 'o'),
(14, 8, 'p'),
(15, 11, 'q'),
(16, 11, 'r'),
(17, 12, 's'),
(18, 12, 't'),
(19, 4, 'g'),
(20, 4, 'h'),
(21, 19, 'u'),
(22, 19, 'v'),
(23, 22, 'w'),
(24, 22, 'x'),
(25, 2, 'y'),
(26, 2, 'z'),
(27, 25, 'y1'),
(28, 25, 'y2'),
(29, 26, 'z1'),
(30, 26, 'z2');

CREATE TABLE `menu` (
  `id` int(11) NOT NULL auto_increment,
  `label` varchar(50) NOT NULL default '',
  `link` varchar(100) NOT NULL default '#',
  `parent` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label`, `link`, `parent`) VALUES
(1, 'Home', '#home', 0),
(2, 'Code', '#code', 0),
(3, 'Contact', '#contact', 0),
(4, 'PHP', '#php', 2),
(5, 'CSS', '#css', 2),
(6, 'Scripts', '#scripts', 4),
(7, 'Help', '#help', 4),
(8, 'Archive', '#archive', 6),
(9, 'Snippet', '#snippet', 8);

CREATE TABLE IF NOT EXISTS `employees` (
  `EMPLOYEE_ID` INT(11) NOT NULL,
  `FIRST_NAME` VARCHAR(15) DEFAULT NULL,
  `LAST_NAME` VARCHAR(25) DEFAULT NULL,
  `EMAIL` VARCHAR(75) DEFAULT NULL,
  `PHONE_NUMBER` VARCHAR(13) DEFAULT NULL,
  `HIRE_DATE` datetime DEFAULT NULL,
  `JOB_ID` VARCHAR(15) DEFAULT NULL,
  `SALARY` INT(11) DEFAULT NULL,
  `COMMISSION_ID` INT(11) DEFAULT NULL,
  `MANAGER_ID` INT(11) DEFAULT NULL,
  `DEPARTMENT_ID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `COMMISSION_ID` (`COMMISSION_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  KEY `MANAGER_ID` (`MANAGER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
--
-- Dumping data for table `employees`
--
 
INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_ID`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
(100, 'Steven', 'King', 'sKing@testing.com', '213-231-2313', '1987-06-17 00:00:00', 'AD_PRESS', 24000, NULL, 0, 90),
(101, 'Neena', 'Kochar', 'nKochar@testing.com', '123-1231-212', '1989-09-21 00:00:00', 'AD_VP', 17000, NULL, 100, 90),
(102, 'Nex', 'De Haan', 'lDeHaan@testing.com', '113-2122-2121', '1990-01-13 00:00:00', 'AD_VP', 17000, NULL, 100, 90),
(103, 'Alexander', 'Hunold', 'aHunold@testing.com', '211-4515-1515', '1991-05-21 00:00:00', 'IT_PROG', 9000, NULL, 102, 60),
(104, 'Bruce', 'Ernst', 'bErnst@testing.com', '515-541-151', '1999-07-02 00:00:00', 'IT_PROG', 6000, NULL, 103, 60),
(107, 'Diana', 'Lorents', 'dLorents@testing.com', '515-515-5156', '1999-11-16 00:00:00', 'IT_PROG', 4200, NULL, 103, 60),
(124, 'Kevin', 'Mourgos', 'kMourgos@testing.com', '559-887-333', '1995-10-17 00:00:00', 'IT_PROG', 5800, NULL, 100, 50),
(141, 'Trenne', 'Rajs', 'tRajs@testing.com', '212-548-989', '1997-01-29 00:00:00', 'ST_MAN', 3500, NULL, 124, 50),
(142, 'Curtis', 'Davies', 'cDavies@testing.com', '333-999-777', '1998-03-15 00:00:00', 'ST_CLERK', 3100, NULL, 124, 50),
(143, 'Randal', 'Matos', 'rMatos@testing.com', '4444-5654-54', '1998-09-07 00:00:00', 'ST_CLERK', 2600, NULL, 124, 50),
(144, 'Peter', 'Vargas', 'pVargas@testing.com', '6565-5641-87', '2000-01-10 00:00:00', 'ST_CLERK', 2500, NULL, 124, 50),
(149, 'Ellen', 'Zlotkey', 'eZlotkey@testing.com', '656-4847-45', '1996-11-05 00:00:00', 'ST_CLERK', 10500, NULL, 100, 50),
(174, 'Jonathan', 'Abel', 'jAbel@testing.com', '5988-4556-564', '1999-05-24 00:00:00', 'SA_MAN', 11000, 0, 100, 80),
(176, 'Kimberly', 'Taylor', 'kTaylor@testing.com', '687-695-8754', '1987-09-17 00:00:00', 'SA_REP', 8600, 0, 149, 80),
(178, 'Jinnefer', 'Grant', 'jGrant@testing.com', '552-6541-897', '1996-02-17 00:00:00', 'SA_REP', 7000, 0, 149, 80),
(200, 'Michael', 'Whalen', 'mWhalen@testing.com', '2121-5465-541', '1997-08-17 00:00:00', 'SA_REP', 4400, 0, 149, NULL),
(201, 'Pat', 'Hartstein', 'pHartstein@testing.com', '14564-541-45', '1994-07-07 00:00:00', 'AD_ASST', 13000, NULL, 101, 10),
(205, 'Shelley', 'Fay', 'sFay@testing.com', '515-215-1156', '1994-07-07 00:00:00', 'MK_MAN', 6000, NULL, 100, 20),
(206, 'William', 'Higgins', 'wHiggins@testing.com', '566-112-5156', '1995-09-26 00:00:00', 'AC_MGR', 12000, NULL, 201, 20),
(207, 'Hatch', 'Glets', 'hGlets@testing.com', '556-5465-515', '1989-03-07 00:00:00', 'AC_ACCOUNT', 8300, NULL, 101, 110);