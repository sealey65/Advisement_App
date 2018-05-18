-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2018 at 02:18 AM
-- Server version: 5.7.21
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advise_me`
--
CREATE DATABASE IF NOT EXISTS `advise_me` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `advise_me`;

-- --------------------------------------------------------

--
-- Table structure for table `advised_course`
--

DROP TABLE IF EXISTS `advised_course`;
CREATE TABLE IF NOT EXISTS `advised_course` (
  `advised_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(10) NOT NULL,
  `advisement_id` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`advised_course_id`),
  KEY `course_code` (`course_code`),
  KEY `advisement_id` (`advisement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advised_course`
--

INSERT INTO `advised_course` (`advised_course_id`, `course_code`, `advisement_id`, `approved`, `type`) VALUES
(1, 'ITEC 120', 3, 0, 'Compulsory'),
(2, 'ITEC 240', 3, 0, 'Compulsory'),
(3, 'ITEC 240', 3, 0, 'Compulsory'),
(4, 'ITEC 229', 4, 0, 'Compulsory'),
(5, 'ITEC 260', 4, 0, 'Compulsory'),
(6, 'ITEC 133', 7, 0, 'Compulsory'),
(7, 'ITEC 240', 7, 0, 'Compulsory'),
(8, 'ITEC 120', 7, 0, 'Compulsory'),
(9, 'ITEC 122', 8, 0, 'Compulsory'),
(10, 'ITEC 260', 8, 0, 'Compulsory'),
(11, 'ITEC 244', 8, 0, 'Compulsory'),
(12, 'BUSI 120', 8, 0, 'Compulsory');

-- --------------------------------------------------------

--
-- Table structure for table `advisement`
--

DROP TABLE IF EXISTS `advisement`;
CREATE TABLE IF NOT EXISTS `advisement` (
  `advisement_id` int(11) NOT NULL AUTO_INCREMENT,
  `student` varchar(50) NOT NULL,
  `advisor` varchar(50) NOT NULL,
  `semester_id` varchar(10) NOT NULL,
  PRIMARY KEY (`advisement_id`),
  KEY `stu_id` (`student`),
  KEY `adv_id` (`advisor`),
  KEY `sem_adv_fk` (`semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advisement`
--

INSERT INTO `advisement` (`advisement_id`, `student`, `advisor`, `semester_id`) VALUES
(1, '00052358', 'AD_Nagee', '201630'),
(2, '00052358', 'AD_Nagee', '201710'),
(3, '00052358', 'AD_Nagee', '201720'),
(4, '00052358', 'AD_Nagee', '201730'),
(5, '00055873', 'AD_Nagee', '201710'),
(6, '00055873', 'AD_Nagee', '201720'),
(7, '00055873', 'AD_Nagee', '201730'),
(8, '00055873', 'AD_Nagee', '201810');

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
CREATE TABLE IF NOT EXISTS `advisor` (
  `user_id` varchar(50) NOT NULL,
  `adv_fname` varchar(50) NOT NULL,
  `adv_lname` varchar(50) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `campus_id` varchar(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `dept_id` (`dept_id`),
  KEY `campus_id` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`user_id`, `adv_fname`, `adv_lname`, `dept_id`, `campus_id`) VALUES
('AD_NAGEE', 'Alicia', 'Dennis-Nagee', 1, 'SSC');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `campus_id` varchar(6) NOT NULL,
  `campus_name` varchar(255) NOT NULL,
  `campus_address` varchar(255) NOT NULL,
  PRIMARY KEY (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`campus_id`, `campus_name`, `campus_address`) VALUES
('BHB', 'City Campus', 'Bretton Hall Building,\r\n9-11 Melville Lane, Port of Spain'),
('CHAGC', 'Chaguanas Campus', 'Pierre Road Connector Chaguanas'),
('ELC', 'Academy of Nursing and Allied Health, El Dorado', 'Corner College and St. Cecelia Roads, El Dorado'),
('NLC', 'Ken Gordon School of Journalism and Communication Studies', '6 Alcazar Street, St. Clair, Port of Spain'),
('SGC', 'Sangre Grande Campus', 'Corner, Co-operative Street and Eastern Main Road, Sangre Grande'),
('SSC', 'South Campus', '40-44 Sutton Street, San Fernando'),
('TLC', 'Tobago Campus', 'Glen Road #1 Wilson Road\r\nScarborough, Tobago');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_code` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `credit_hours` int(11) NOT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_code`, `course_name`, `credit_hours`) VALUES
('ARTS 120', 'Survey of Art History', 1),
('BUSI 120', 'Business Orientation', 1),
('BUSI 203', 'Leadership and Ethics', 3),
('CLTR 120', 'Introduction to the Culture of Trinidad and Tobago', 1),
('COMM 118', 'Communication in the Workplace', 3),
('ECON 110', 'Introduction to General Economics', 3),
('ENGL 200', 'Comparitive Literature', 3),
('ENTP 210', 'Fundamentals of Entrepreneurship', 3),
('ENVH 102', 'World Issues in Public Health', 1),
('ENVS 121', 'Environmental Issues and Sustainability', 1),
('GRDE 129', 'Introduction to Graphic Design', 3),
('HIST 210', 'History of Trinidad and Tobago', 3),
('ITEC 115', 'Information Technology Project Management', 3),
('ITEC 120', 'Introduction to Computer Hardware', 3),
('ITEC 122', 'Introduction to Operating Systems', 3),
('ITEC 124', 'Operating Systems Platforms', 3),
('ITEC 133', 'Programming I', 3),
('ITEC 140', 'Commercial and Industrial Information Systems', 3),
('ITEC 225', 'Systems Analysis', 3),
('ITEC 228', 'Systems Design', 3),
('ITEC 229', 'Human Computer Interface Design', 3),
('ITEC 235', 'Object Oriented Programming I', 3),
('ITEC 236', 'Object Oriented Programming II', 3),
('ITEC 240', 'Web Page Design', 3),
('ITEC 243', 'Introduction to XML Programming', 3),
('ITEC 244', 'Internet Technology', 3),
('ITEC 245', 'Introduction to Scripting Languages', 3),
('ITEC 250', 'Computer Networks, Architecture and Protocol', 3),
('ITEC 251', 'Network Management I', 3),
('ITEC 260', 'Information Security Standards and Control', 3),
('ITEC 269', 'Electronic Commerce', 3),
('ITEC 270', 'Database Design 1', 3),
('ITEC 285', 'Client Server Technology', 3),
('ITEC 291', 'Time-Based Media Programming', 3),
('ITEC 292', 'Data Structures', 3),
('ITEC 322', 'Advanced Operatin Systems Platforms', 3),
('ITEC 342', 'Three-Tier DBMS Application', 3),
('ITEC 343', 'Advanced XML Programming', 3),
('ITEC 345', 'Web Client-Side Programming and Libraries', 3),
('ITEC 351', 'Advanced Routing Protocol Concepts', 3),
('ITEC 352', 'LAN Switching and VLANs', 3),
('ITEC 360', 'Security Management', 3),
('ITEC 363', 'Networking Security', 3),
('ITEC 371', 'Database Design II', 3),
('ITEC 372', 'Database Programming with SQL', 3),
('ITEC 374', 'Database Administration I', 3),
('ITEC 375', 'Microcomputer Applications in Business', 3),
('ITEC 376', 'Building Internet Ready Applications I', 3),
('ITEC 443', 'Local and Remote Data Integration', 3),
('ITEC 444', 'Student Internship', 3),
('ITEC 445', 'Scripting for Systems Administration', 3),
('ITEC 451', 'Networking Management II', 3),
('ITEC 452', 'WAN Technologies', 3),
('ITEC 453', 'Introduction to Mobile Technologies', 3),
('ITEC 455', 'Student Practicum', 3),
('ITEC 456', 'Wireless Networking', 3),
('ITEC 457', 'Data Centre Construction', 3),
('ITEC 472', 'Database Programming with PL/SQL', 3),
('ITEC 474', 'Database Administration II', 3),
('ITEC 476', 'Building Internet Ready Applications II', 3),
('ITEC 478', 'SQL Server Administration', 3),
('ITEC 499', 'Senior Project', 3),
('LIBS 130', 'Fundamental Research Skills', 3),
('MATH 093', 'Intermediate Algebra', 3),
('MATH 116', 'Contempory College Math', 3),
('MATH 117', 'College Algebra', 3),
('MATH 118', 'Pre Calculus', 3),
('MATH 143', 'Discrete Math', 3),
('MUSC 120', 'Survey of the History of Music', 1),
('PSYC 103', 'Understanding Human Behaviour', 3),
('RELI 205', 'Comparative Religion', 3),
('SCIE 121', 'Foundations of Natural Science', 3),
('SCIE 201', 'Contemporary Issues in Science', 1),
('SOCI 102', 'Introduction to the Study of Society', 3),
('STAT 120', 'Fundamentals of Statistics', 3),
('WRIT 117', 'Fundamentals of Writing', 3);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'Information Science and Technology'),
(2, 'Social and Behavioral Sciences'),
(3, 'Language, Literature and Caribbean Studies'),
(4, 'Mathematics'),
(5, 'Fine and Performing Arts'),
(6, 'Criminal Justice an'),
(7, 'Management and Entrepreneurship'),
(8, 'Nursing'),
(9, 'Health Science Technologies'),
(10, 'Natural and Life Sciences'),
(11, 'Environmental Studies'),
(12, 'Journalism and Media'),
(13, 'Communication Studies');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_date` datetime NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `advisement_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `advisement_id` (`advisement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_date`, `user_id`, `content`, `advisement_id`) VALUES
(1, '2017-01-25 08:15:06', '00052358', 'Hi Miss, is there a prereq for ITEC 240?', 3),
(2, '2017-01-25 14:15:06', 'AD_Nagee', 'No there isn\'t.', 3),
(3, '2017-06-08 08:15:06', '00052358', 'Hi Miss, is there a prereq for ITEC 270?', 4),
(4, '2017-06-09 08:15:06', 'AD_Nagee', 'Yes, its ITEC 133.', 4),
(5, '2017-09-05 08:15:06', '00055873', 'Hi Miss, is there a prereq for ITEC 229?', 8),
(6, '2017-09-07 14:15:06', 'AD_Nagee', 'No there isn\'t.', 8),
(7, '2017-06-08 08:15:06', '00055873', 'Hi Miss, can I do ITEC 270?', 7),
(8, '2017-06-09 08:15:06', 'AD_Nagee', 'No, not yet. You have yet to do the prereq?', 7);

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite`
--

DROP TABLE IF EXISTS `prerequisite`;
CREATE TABLE IF NOT EXISTS `prerequisite` (
  `prereq_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(10) NOT NULL,
  `prereq_code` varchar(10) NOT NULL,
  `pass_grade` char(2) NOT NULL,
  PRIMARY KEY (`prereq_id`),
  KEY `course_code` (`course_code`),
  KEY `prereq_code` (`prereq_code`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prerequisite`
--

INSERT INTO `prerequisite` (`prereq_id`, `course_code`, `prereq_code`, `pass_grade`) VALUES
(1, 'COMM 118', 'WRIT 117', 'D'),
(2, 'SOCI 102', 'WRIT 117', 'D'),
(3, 'STAT 120', 'MATH 116', 'D'),
(4, 'MATH 143', 'MATH 118', 'D'),
(5, 'MATH 117', 'MATH 093', 'D'),
(6, 'ITEC 122', 'ITEC 120', 'C'),
(7, 'ITEC 124', 'ITEC 122', 'D'),
(8, 'ITEC 133', 'MATH 093', 'C'),
(9, 'ITEC 225', 'ITEC 133', 'D'),
(10, 'ITEC 228', 'ITEC 225', 'D'),
(11, 'ITEC 235', 'ITEC 133', 'D'),
(12, 'ITEC 236', 'ITEC 235', 'D'),
(13, 'ITEC 243', 'ITEC 133', 'D'),
(14, 'ITEC 244', 'ITEC 240', 'D'),
(15, 'ITEC 244', 'ITEC 270', 'D'),
(16, 'ITEC 245', 'ITEC 133', 'D'),
(17, 'ITEC 250', 'ITEC 122', 'C'),
(18, 'ITEC 251', 'ITEC 250', 'D'),
(19, 'ITEC 260', 'ITEC 250', 'D'),
(20, 'ITEC 270', 'ITEC 133', 'C'),
(21, 'ITEC 285', 'ITEC 250', 'D'),
(22, 'ITEC 285', 'ITEC 133', 'D'),
(23, 'ITEC 292', 'ITEC 235', 'D'),
(24, 'ITEC 457', 'ITEC 363', 'D'),
(25, 'ITEC 457', 'ITEC 456', 'D'),
(26, 'ITEC 457', 'ITEC 451', 'D'),
(27, 'ITEC 457', 'ITEC 452', 'D'),
(28, 'ITEC 456', 'ITEC 251', 'D'),
(29, 'ITEC 453', 'ITEC 251', 'D'),
(30, 'ITEC 452', 'ITEC 351', 'D'),
(31, 'ITEC 452', 'ITEC 352', 'D'),
(32, 'ITEC 451', 'ITEC 351', 'D'),
(33, 'ITEC 451', 'ITEC 352', 'D'),
(34, 'ITEC 363', 'ITEC 351', 'D'),
(35, 'ITEC 360', 'ITEC 260', 'D'),
(36, 'ITEC 352', 'ITEC 351', 'D'),
(37, 'ITEC 351', 'ITEC 251', 'D'),
(38, 'ITEC 371', 'ITEC 270', 'D'),
(39, 'ITEC 372', 'ITEC 270', 'D'),
(40, 'ITEC 374', 'ITEC 270', 'D'),
(41, 'ITEC 375', 'ITEC 270', 'D'),
(42, 'ITEC 376', 'ITEC 270', 'D'),
(43, 'ITEC 376', 'ITEC 240', 'D'),
(44, 'ITEC 476', 'ITEC 376', 'D'),
(45, 'ITEC 472', 'ITEC 372', 'D'),
(46, 'ITEC 474', 'ITEC 374', 'D'),
(47, 'ITEC 478', 'ITEC 372', 'D'),
(48, 'ITEC 251', 'ITEC 250', 'D'),
(49, 'ITEC 291', 'ITEC 244', 'D'),
(50, 'ITEC 291', 'GRDE 129', 'D'),
(51, 'ITEC 342', 'ITEC 244', 'D'),
(52, 'ITEC 343', 'ITEC 243', 'D'),
(53, 'ITEC 443', 'ITEC 236', 'D'),
(54, 'ITEC 443', 'ITEC 243', 'D'),
(55, 'ITEC 345', 'ITEC 243', 'D'),
(56, 'ITEC 445', 'ITEC 245', 'D'),
(57, 'ITEC 445', 'ITEC 345', 'D'),
(58, 'ITEC 269', 'ITEC 244', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(255) NOT NULL,
  `program_level` varchar(255) NOT NULL,
  `year_issued` year(4) NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`program_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`program_id`, `program_name`, `program_level`, `year_issued`, `dept_id`) VALUES
(1, 'Information Systems Development (ISD)', 'Associate', 2014, 1),
(2, 'Operating Systems Management (OSM)', 'Associate', 2014, 1),
(3, 'Internet Technology (INT)', 'Associate', 2014, 1),
(4, 'Internet Technology (INT)', 'Associate', 2018, 1),
(5, 'Information Technology (GENERAL)', 'Associate', 2014, 1),
(6, 'Library and Information Studies', 'Associate', 2014, 1),
(7, 'Records Management', 'Certificate', 2014, 1),
(8, 'Records Management for the Public Sector', 'Certificate', 2014, 1),
(9, 'Cisco Certified Network Associate (CCNA)', 'Certificate', 2018, 1),
(10, 'Computer Information Systems (CIS)', 'Bachelor', 2014, 1),
(11, 'Information Technology (GENERAL)', 'Bachelor', 2014, 1),
(12, 'Networking', 'Bachelor', 2014, 1),
(13, 'Internet Technology (INT)', 'Bachelor', 2014, 1),
(14, 'Internet Technology (INT)', 'Bachelor', 2018, 1),
(15, 'Information and Library Science', 'Bachelor', 2014, 1),
(16, 'Information Systems Development (ISD)', 'Associate', 2016, 1),
(17, 'Operating Systems Management (OSM)', 'Associate', 2016, 1),
(18, 'Internet Technology (INT)', 'Associate', 2016, 1),
(19, 'Information Technology (GENERAL)', 'Associate', 2016, 1),
(20, 'Computer Information Systems (CIS)', 'Bachelor', 2016, 1),
(21, 'Information Technology (GENERAL)', 'Bachelor', 2016, 1),
(22, 'Networking', 'Bachelor', 2016, 1),
(23, 'Internet Technology (INT)', 'Bachelor', 2016, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_outline`
--

DROP TABLE IF EXISTS `program_outline`;
CREATE TABLE IF NOT EXISTS `program_outline` (
  `outline_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `recommended_semester_full` int(11) NOT NULL,
  `recommended_semester_part` int(11) NOT NULL,
  PRIMARY KEY (`outline_id`),
  KEY `program_id` (`program_id`),
  KEY `course_code` (`course_code`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program_outline`
--

INSERT INTO `program_outline` (`outline_id`, `program_id`, `course_code`, `recommended_semester_full`, `recommended_semester_part`) VALUES
(1, 1, 'LIBS 130', 1, 1),
(2, 1, 'WRIT 117', 1, 1),
(3, 1, 'MATH 117', 1, 1),
(4, 1, 'COMM 118', 2, 2),
(5, 2, 'LIBS 130', 1, 1),
(6, 2, 'WRIT 117', 1, 1),
(7, 2, 'MATH 117', 1, 1),
(8, 2, 'COMM 118', 2, 2),
(9, 3, 'LIBS 130', 1, 1),
(10, 3, 'WRIT 117', 1, 1),
(11, 3, 'MATH 117', 1, 1),
(12, 3, 'COMM 118', 2, 2),
(17, 5, 'LIBS 130', 1, 1),
(18, 5, 'WRIT 117', 1, 1),
(19, 5, 'MATH 117', 1, 1),
(20, 5, 'COMM 118', 2, 2),
(21, 10, 'LIBS 130', 1, 1),
(22, 10, 'WRIT 117', 1, 1),
(23, 10, 'MATH 117', 1, 1),
(24, 10, 'COMM 118', 2, 2),
(25, 11, 'LIBS 130', 1, 1),
(26, 11, 'WRIT 117', 1, 1),
(27, 11, 'MATH 117', 1, 1),
(28, 11, 'COMM 118', 2, 2),
(29, 12, 'LIBS 130', 1, 1),
(30, 12, 'WRIT 117', 1, 1),
(31, 12, 'MATH 117', 1, 1),
(32, 12, 'COMM 118', 2, 2),
(33, 13, 'LIBS 130', 1, 1),
(34, 13, 'WRIT 117', 1, 1),
(35, 13, 'MATH 117', 1, 1),
(36, 13, 'COMM 118', 2, 2),
(37, 16, 'LIBS 130', 1, 1),
(38, 16, 'WRIT 117', 1, 1),
(39, 16, 'MATH 117', 1, 1),
(40, 16, 'COMM 118', 2, 2),
(41, 17, 'LIBS 130', 1, 1),
(42, 17, 'WRIT 117', 1, 1),
(43, 17, 'MATH 117', 1, 1),
(44, 17, 'COMM 118', 2, 2),
(45, 18, 'LIBS 130', 1, 1),
(46, 18, 'WRIT 117', 1, 1),
(47, 18, 'MATH 117', 1, 1),
(48, 18, 'COMM 118', 2, 2),
(49, 19, 'LIBS 130', 1, 1),
(50, 19, 'WRIT 117', 1, 1),
(51, 19, 'MATH 117', 1, 1),
(52, 19, 'COMM 118', 2, 2),
(53, 20, 'LIBS 130', 1, 1),
(54, 20, 'WRIT 117', 1, 1),
(55, 20, 'MATH 117', 1, 1),
(56, 20, 'COMM 118', 2, 2),
(57, 21, 'LIBS 130', 1, 1),
(58, 21, 'WRIT 117', 1, 1),
(59, 21, 'MATH 117', 1, 1),
(60, 21, 'COMM 118', 2, 2),
(61, 22, 'LIBS 130', 1, 1),
(62, 22, 'WRIT 117', 1, 1),
(63, 22, 'MATH 117', 1, 1),
(64, 22, 'COMM 118', 2, 2),
(65, 23, 'LIBS 130', 1, 1),
(66, 23, 'WRIT 117', 1, 1),
(67, 23, 'MATH 117', 1, 1),
(68, 23, 'COMM 118', 2, 2),
(69, 1, 'ITEC 120', 1, 1),
(70, 1, 'ITEC 133', 1, 1),
(71, 1, 'ITEC 250', 3, 3),
(72, 1, 'ITEC 240', 1, 1),
(73, 1, 'ITEC 260', 2, 2),
(74, 1, 'ITEC 229', 1, 1),
(75, 1, 'ITEC 270', 3, 3),
(76, 1, 'ITEC 122', 2, 2),
(77, 2, 'ITEC 120', 1, 1),
(78, 2, 'ITEC 133', 1, 1),
(79, 2, 'ITEC 250', 3, 3),
(80, 2, 'ITEC 240', 1, 1),
(81, 2, 'ITEC 260', 2, 2),
(82, 2, 'ITEC 229', 1, 1),
(83, 2, 'ITEC 270', 3, 3),
(84, 2, 'ITEC 122', 2, 2),
(85, 3, 'ITEC 120', 1, 1),
(86, 3, 'ITEC 133', 1, 1),
(87, 3, 'ITEC 250', 3, 3),
(88, 3, 'ITEC 240', 1, 1),
(89, 3, 'ITEC 260', 2, 2),
(90, 3, 'ITEC 229', 1, 1),
(91, 3, 'ITEC 270', 3, 3),
(92, 3, 'ITEC 122', 2, 2),
(93, 5, 'ITEC 120', 1, 1),
(94, 5, 'ITEC 133', 1, 1),
(95, 5, 'ITEC 250', 3, 3),
(96, 5, 'ITEC 240', 1, 1),
(97, 5, 'ITEC 260', 2, 2),
(98, 5, 'ITEC 229', 1, 1),
(99, 5, 'ITEC 270', 3, 3),
(100, 5, 'ITEC 122', 2, 2),
(101, 10, 'ITEC 120', 1, 1),
(102, 10, 'ITEC 133', 1, 1),
(103, 10, 'ITEC 250', 3, 3),
(104, 10, 'ITEC 240', 1, 1),
(105, 10, 'ITEC 260', 2, 2),
(106, 10, 'ITEC 229', 1, 1),
(107, 10, 'ITEC 270', 3, 3),
(108, 10, 'ITEC 122', 2, 2),
(109, 11, 'ITEC 120', 1, 1),
(110, 11, 'ITEC 133', 1, 1),
(111, 11, 'ITEC 250', 3, 3),
(112, 11, 'ITEC 240', 1, 1),
(113, 11, 'ITEC 260', 2, 2),
(114, 11, 'ITEC 229', 1, 1),
(115, 11, 'ITEC 270', 3, 3),
(116, 11, 'ITEC 122', 2, 2),
(117, 12, 'ITEC 120', 1, 1),
(118, 12, 'ITEC 133', 1, 1),
(119, 12, 'ITEC 250', 3, 3),
(120, 12, 'ITEC 240', 1, 1),
(121, 12, 'ITEC 260', 2, 2),
(122, 12, 'ITEC 229', 1, 1),
(123, 12, 'ITEC 270', 3, 3),
(124, 12, 'ITEC 122', 2, 2),
(125, 13, 'ITEC 120', 1, 1),
(126, 13, 'ITEC 133', 1, 1),
(127, 13, 'ITEC 250', 3, 3),
(128, 13, 'ITEC 240', 1, 1),
(129, 13, 'ITEC 260', 2, 2),
(130, 13, 'ITEC 229', 1, 1),
(131, 13, 'ITEC 270', 3, 3),
(132, 13, 'ITEC 122', 2, 2),
(133, 16, 'ITEC 120', 1, 1),
(134, 16, 'ITEC 133', 1, 1),
(135, 16, 'ITEC 250', 3, 3),
(136, 16, 'ITEC 240', 1, 1),
(137, 16, 'ITEC 260', 2, 2),
(138, 16, 'ITEC 229', 1, 1),
(139, 16, 'ITEC 270', 3, 3),
(140, 16, 'ITEC 122', 2, 2),
(141, 17, 'ITEC 120', 1, 1),
(142, 17, 'ITEC 133', 1, 1),
(143, 17, 'ITEC 250', 3, 3),
(144, 17, 'ITEC 240', 1, 1),
(145, 17, 'ITEC 260', 2, 2),
(146, 17, 'ITEC 229', 1, 1),
(147, 17, 'ITEC 270', 3, 3),
(148, 17, 'ITEC 122', 2, 2),
(149, 18, 'ITEC 120', 1, 1),
(150, 18, 'ITEC 133', 1, 1),
(151, 18, 'ITEC 250', 3, 3),
(152, 18, 'ITEC 240', 1, 1),
(153, 18, 'ITEC 260', 2, 2),
(154, 18, 'ITEC 229', 1, 1),
(155, 18, 'ITEC 270', 3, 3),
(156, 18, 'ITEC 122', 2, 2),
(157, 19, 'ITEC 120', 1, 1),
(158, 19, 'ITEC 133', 1, 1),
(159, 19, 'ITEC 250', 3, 3),
(160, 19, 'ITEC 240', 1, 1),
(161, 19, 'ITEC 260', 2, 2),
(162, 19, 'ITEC 229', 1, 1),
(163, 19, 'ITEC 270', 3, 3),
(164, 19, 'ITEC 122', 2, 2),
(165, 20, 'ITEC 120', 1, 1),
(166, 20, 'ITEC 133', 1, 1),
(167, 20, 'ITEC 250', 3, 3),
(168, 20, 'ITEC 240', 1, 1),
(169, 20, 'ITEC 260', 2, 2),
(170, 20, 'ITEC 229', 1, 1),
(171, 20, 'ITEC 270', 3, 3),
(172, 20, 'ITEC 122', 2, 2),
(173, 21, 'ITEC 120', 1, 1),
(174, 21, 'ITEC 133', 1, 1),
(175, 21, 'ITEC 250', 3, 3),
(176, 21, 'ITEC 240', 1, 1),
(177, 21, 'ITEC 260', 2, 2),
(178, 21, 'ITEC 229', 1, 1),
(179, 21, 'ITEC 270', 3, 3),
(180, 21, 'ITEC 122', 2, 2),
(181, 22, 'ITEC 120', 1, 1),
(182, 22, 'ITEC 133', 1, 1),
(183, 22, 'ITEC 250', 3, 3),
(184, 22, 'ITEC 240', 1, 1),
(185, 22, 'ITEC 260', 2, 2),
(186, 22, 'ITEC 229', 1, 1),
(187, 22, 'ITEC 270', 3, 3),
(188, 22, 'ITEC 122', 2, 2),
(189, 23, 'ITEC 120', 1, 1),
(190, 23, 'ITEC 133', 1, 1),
(191, 23, 'ITEC 250', 3, 3),
(192, 23, 'ITEC 240', 1, 1),
(193, 23, 'ITEC 260', 2, 2),
(194, 23, 'ITEC 229', 1, 1),
(195, 23, 'ITEC 270', 3, 3),
(196, 23, 'ITEC 122', 2, 2),
(197, 1, 'ITEC 235', 2, 2),
(198, 1, 'ITEC 236', 3, 3),
(199, 1, 'ITEC 140', 1, 1),
(200, 1, 'ITEC 225', 3, 3),
(201, 1, 'ITEC 228', 4, 4),
(202, 1, 'ITEC 292', 3, 3),
(203, 1, 'BUSI 120', 1, 1),
(204, 1, 'MATH 118', 2, 2),
(205, 20, 'ITEC 124', 2, 2),
(206, 20, 'ITEC 371', 4, 4),
(207, 20, 'ITEC 372', 4, 4),
(208, 20, 'ITEC 374', 4, 4),
(209, 20, 'ITEC 375', 4, 4),
(210, 20, 'ITEC 376', 5, 5),
(211, 20, 'ITEC 476', 6, 6),
(212, 20, 'ITEC 472', 5, 5),
(213, 20, 'ITEC 474', 5, 5),
(214, 20, 'ITEC 478', 5, 5),
(215, 2, 'ITEC 235', 2, 2),
(216, 2, 'ITEC 236', 3, 3),
(217, 2, 'ITEC 124', 3, 3),
(218, 2, 'ITEC 251', 4, 4),
(219, 2, 'ITEC 285', 4, 4),
(220, 2, 'ITEC 244', 2, 2),
(221, 2, 'BUSI 120', 2, 2),
(222, 2, 'MATH 118', 2, 2),
(223, 12, 'ITEC 351', 5, 5),
(224, 12, 'ITEC 322', 4, 4),
(225, 12, 'ITEC 352', 6, 6),
(226, 12, 'ITEC 360', 3, 3),
(227, 12, 'ITEC 363', 6, 6),
(228, 12, 'ITEC 451', 7, 7),
(229, 12, 'ITEC 452', 7, 7),
(230, 12, 'ITEC 453', 5, 5),
(231, 12, 'ITEC 457', 7, 7),
(232, 3, 'ITEC 245', 3, 3),
(233, 3, 'ITEC 244', 3, 3),
(234, 3, 'ITEC 243', 3, 3),
(235, 3, 'ITEC 285', 4, 4),
(236, 3, 'ITEC 235', 3, 3),
(237, 3, 'ITEC 124', 3, 3),
(238, 3, 'BUSI 120', 1, 1),
(239, 3, 'GRDE 129', 1, 1),
(240, 13, 'ITEC 251', 4, 4),
(241, 13, 'ITEC 291', 4, 4),
(242, 13, 'ITEC 342', 4, 4),
(243, 13, 'ITEC 343', 4, 4),
(244, 13, 'ITEC 236', 3, 3),
(245, 13, 'ITEC 443', 4, 4),
(246, 13, 'ITEC 345', 4, 4),
(247, 13, 'ITEC 445', 5, 5),
(248, 13, 'ITEC 456', 5, 5),
(249, 20, 'ITEC 235', 2, 2),
(250, 20, 'ITEC 236', 3, 3),
(251, 20, 'ITEC 140', 1, 1),
(252, 20, 'ITEC 225', 3, 3),
(253, 20, 'ITEC 228', 4, 4),
(254, 20, 'ITEC 292', 3, 3),
(255, 20, 'BUSI 120', 1, 1),
(256, 20, 'MATH 118', 2, 2),
(257, 12, 'ITEC 235', 2, 2),
(258, 12, 'ITEC 236', 3, 3),
(259, 12, 'ITEC 124', 3, 3),
(260, 12, 'ITEC 251', 4, 4),
(261, 12, 'ITEC 285', 4, 4),
(262, 12, 'ITEC 244', 2, 2),
(263, 12, 'BUSI 120', 2, 2),
(264, 12, 'MATH 118', 2, 2),
(265, 13, 'ITEC 245', 3, 3),
(266, 13, 'ITEC 244', 3, 3),
(267, 13, 'ITEC 243', 3, 3),
(268, 13, 'ITEC 285', 4, 4),
(269, 13, 'ITEC 235', 2, 2),
(270, 13, 'ITEC 124', 3, 3),
(271, 13, 'BUSI 120', 1, 1),
(272, 13, 'GRDE 129', 1, 1),
(273, 5, 'ITEC 115', 2, 2),
(274, 5, 'ITEC 124', 3, 3),
(275, 5, 'ITEC 225', 2, 2),
(276, 5, 'ITEC 244', 2, 2),
(277, 5, 'ITEC 235', 2, 2),
(278, 5, 'BUSI 120', 1, 1),
(279, 5, 'MATH 118', 2, 2),
(280, 5, 'GRDE 129', 1, 1),
(281, 11, 'ITEC 115', 2, 2),
(282, 11, 'ITEC 124', 3, 3),
(283, 11, 'ITEC 225', 2, 2),
(284, 11, 'ITEC 244', 2, 2),
(285, 11, 'ITEC 235', 2, 2),
(286, 11, 'BUSI 120', 1, 1),
(287, 11, 'MATH 118', 2, 2),
(288, 11, 'GRDE 129', 1, 1),
(289, 11, 'MATH 143', 3, 3),
(290, 16, 'ITEC 235', 2, 2),
(291, 16, 'ITEC 236', 3, 3),
(292, 16, 'ITEC 140', 1, 1),
(293, 16, 'ITEC 225', 3, 3),
(294, 16, 'ITEC 228', 4, 4),
(295, 16, 'ITEC 292', 3, 3),
(296, 16, 'BUSI 120', 1, 1),
(297, 16, 'MATH 118', 2, 2),
(298, 17, 'ITEC 235', 2, 2),
(299, 17, 'ITEC 236', 3, 3),
(300, 17, 'ITEC 124', 3, 3),
(301, 17, 'ITEC 251', 4, 4),
(302, 17, 'ITEC 285', 4, 4),
(303, 17, 'ITEC 244', 2, 2),
(304, 17, 'BUSI 120', 2, 2),
(305, 17, 'MATH 118', 2, 2),
(306, 18, 'ITEC 245', 3, 3),
(307, 18, 'ITEC 244', 3, 3),
(308, 18, 'ITEC 243', 3, 3),
(309, 18, 'ITEC 285', 4, 4),
(310, 18, 'ITEC 235', 2, 2),
(311, 18, 'ITEC 124', 3, 3),
(312, 18, 'BUSI 120', 1, 1),
(313, 18, 'GRDE 129', 1, 1),
(314, 19, 'ITEC 115', 2, 2),
(315, 19, 'ITEC 124', 3, 3),
(316, 19, 'ITEC 225', 2, 2),
(317, 19, 'ITEC 244', 2, 2),
(318, 19, 'ITEC 235', 2, 2),
(319, 19, 'BUSI 120', 1, 1),
(320, 19, 'MATH 118', 2, 2),
(321, 19, 'GRDE 129', 1, 1),
(322, 22, 'ITEC 235', 2, 2),
(323, 22, 'ITEC 236', 3, 3),
(324, 22, 'ITEC 124', 3, 3),
(325, 22, 'ITEC 251', 4, 4),
(326, 22, 'ITEC 285', 4, 4),
(327, 22, 'ITEC 244', 2, 2),
(328, 22, 'BUSI 120', 2, 2),
(329, 22, 'MATH 118', 2, 2),
(330, 22, 'ITEC 351', 5, 5),
(331, 22, 'ITEC 322', 4, 4),
(332, 22, 'ITEC 352', 6, 6),
(333, 22, 'ITEC 360', 3, 3),
(334, 22, 'ITEC 363', 6, 6),
(335, 22, 'ITEC 451', 7, 7),
(336, 22, 'ITEC 452', 7, 7),
(337, 22, 'ITEC 453', 5, 5),
(338, 22, 'ITEC 457', 7, 7),
(339, 10, 'ITEC 235', 2, 2),
(340, 10, 'ITEC 236', 3, 3),
(341, 10, 'ITEC 140', 1, 1),
(342, 10, 'ITEC 225', 3, 3),
(343, 10, 'ITEC 228', 4, 4),
(344, 10, 'ITEC 292', 3, 3),
(345, 10, 'BUSI 120', 1, 1),
(346, 10, 'MATH 118', 2, 2),
(347, 10, 'ITEC 124', 2, 2),
(348, 10, 'ITEC 371', 4, 4),
(349, 10, 'ITEC 372', 4, 4),
(350, 10, 'ITEC 374', 4, 4),
(351, 10, 'ITEC 375', 4, 4),
(352, 10, 'ITEC 376', 5, 5),
(353, 10, 'ITEC 476', 6, 6),
(354, 10, 'ITEC 472', 5, 5),
(355, 10, 'ITEC 474', 5, 5),
(356, 10, 'ITEC 478', 5, 5),
(357, 23, 'ITEC 245', 3, 3),
(358, 23, 'ITEC 244', 3, 3),
(359, 23, 'ITEC 243', 3, 3),
(360, 23, 'ITEC 285', 4, 4),
(361, 23, 'ITEC 235', 2, 2),
(362, 23, 'ITEC 124', 3, 3),
(363, 23, 'BUSI 120', 1, 1),
(364, 23, 'GRDE 129', 1, 1),
(365, 23, 'ITEC 251', 4, 4),
(366, 23, 'ITEC 291', 4, 4),
(367, 23, 'ITEC 342', 4, 4),
(368, 23, 'ITEC 343', 4, 4),
(369, 23, 'ITEC 236', 3, 3),
(370, 23, 'ITEC 443', 4, 4),
(371, 23, 'ITEC 345', 4, 4),
(372, 23, 'ITEC 445', 5, 5),
(373, 23, 'ITEC 269', 5, 5),
(377, 21, 'ITEC 115', 2, 2),
(378, 21, 'ITEC 124', 3, 3),
(379, 21, 'ITEC 225', 2, 2),
(380, 21, 'ITEC 244', 2, 2),
(381, 21, 'ITEC 235', 2, 2),
(382, 21, 'BUSI 120', 1, 1),
(383, 21, 'MATH 118', 2, 2),
(384, 21, 'GRDE 129', 1, 1),
(385, 21, 'MATH 143', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `remember_me`
--

DROP TABLE IF EXISTS `remember_me`;
CREATE TABLE IF NOT EXISTS `remember_me` (
  `token_hash` varchar(255) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`token_hash`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `role_desc`) VALUES
(1, 'Admin', 'System Administratior'),
(2, 'Student', 'Student of the College'),
(3, 'Advisor', 'Studet Advisor of the College');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE IF NOT EXISTS `semester` (
  `semester_id` varchar(10) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `date_begin`, `date_end`, `is_open`) VALUES
('201510', '2014-09-02', '2014-12-15', 0),
('201520', '2015-01-19', '2015-05-03', 0),
('201530', '2015-06-01', '2015-07-26', 0),
('201610', '2015-09-01', '2015-12-07', 0),
('201620', '2016-01-18', '2016-05-01', 0),
('201630', '2016-05-31', '2016-07-04', 0),
('201710', '2016-08-29', '2016-12-11', 0),
('201720', '2017-01-23', '2017-05-07', 0),
('201730', '2017-06-05', '2017-07-09', 0),
('201810', '2017-09-04', '2017-12-17', 1),
('201820', '2018-01-29', '2018-05-13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `user_id` varchar(50) NOT NULL,
  `stu_fname` varchar(50) NOT NULL,
  `stu_lname` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `program_id` int(11) NOT NULL,
  `campus_id` varchar(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `program_id` (`program_id`),
  KEY `campus_id` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`user_id`, `stu_fname`, `stu_lname`, `status`, `program_id`, `campus_id`) VALUES
('00052358', 'Nicholas', 'Singh', 'Part Time', 13, 'SGC'),
('00055873', 'Earl', 'Tilluk', 'Full Time', 23, 'SSC');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(50) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `password_hash`, `role_name`) VALUES
('00052358', '00052358@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Student'),
('00055873', '00055873@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Student'),
('AD_Nagee', 'AD_Nagee@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Advisor'),
('stacy_williams', 'stacy.williams@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advised_course`
--
ALTER TABLE `advised_course`
  ADD CONSTRAINT `advised_course_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advised_course_ibfk_2` FOREIGN KEY (`advisement_id`) REFERENCES `advisement` (`advisement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advisement`
--
ALTER TABLE `advisement`
  ADD CONSTRAINT `advisement_ibfk_1` FOREIGN KEY (`student`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advisement_ibfk_2` FOREIGN KEY (`advisor`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sem_adv_fk` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advuser_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`advisement_id`) REFERENCES `advisement` (`advisement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prerequisite`
--
ALTER TABLE `prerequisite`
  ADD CONSTRAINT `prerequisite_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prerequisite_ibfk_2` FOREIGN KEY (`prereq_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program_outline`
--
ALTER TABLE `program_outline`
  ADD CONSTRAINT `program_outline_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `program_outline_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `remember_me`
--
ALTER TABLE `remember_me`
  ADD CONSTRAINT `remember_me_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_name`) REFERENCES `role` (`role_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
