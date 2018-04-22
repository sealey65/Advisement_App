-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2018 at 05:26 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Advise_Me`
--

-- --------------------------------------------------------

--
-- Table structure for table `advised_course`
--

CREATE TABLE IF NOT EXISTS `advised_course` (
  `adv_course_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `advisement_id` int(11) NOT NULL,
  `advised_status` varchar(20) NOT NULL,
  `advised_type` varchar(50) NOT NULL,
  `grade` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `advisement`
--

CREATE TABLE IF NOT EXISTS `advisement` (
  `advisement_id` int(11) NOT NULL,
  `stu_id` varchar(50) NOT NULL,
  `adv_id` varchar(50) NOT NULL,
  `semester_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE IF NOT EXISTS `advisor` (
  `user_id` varchar(50) NOT NULL,
  `adv_fname` varchar(50) NOT NULL,
  `adv_lname` varchar(50) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `campus_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE IF NOT EXISTS `campus` (
  `campus_id` varchar(6) NOT NULL,
  `campus_name` varchar(255) NOT NULL,
  `campus_address` varchar(255) NOT NULL
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

CREATE TABLE IF NOT EXISTS `course` (
  `course_code` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `credit_hours` int(11) NOT NULL
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
('ITEC 120', 'Introduction to Computer Hardware', 3),
('ITEC 122', 'Introduction to Operating Systems', 3),
('ITEC 124', 'Operating Systems Platforms', 3),
('ITEC 133', 'Programming I', 3),
('ITEC 140', 'Commercial and Industrial Information Systems', 3),
('ITEC 215', 'Information Technology Project Management', 3),
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

CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL
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

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL,
  `post_date` date NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `advisement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite`
--

CREATE TABLE IF NOT EXISTS `prerequisite` (
  `prereq_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `prereq_code` varchar(10) NOT NULL,
  `pass_grade` char(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prerequisite`
--

INSERT INTO `prerequisite` (`prereq_id`, `course_code`, `prereq_code`, `pass_grade`) VALUES
(1, 'LIBS 130', 'WRIT 117', 'D'),
(2, 'SOCI 102', 'WRIT 117', 'D'),
(3, 'STAT 120', 'MATH 116', 'D'),
(4, 'ITEC 133', 'MATH 093', 'D'),
(5, 'ITEC 270', 'ITEC 133', 'C'),
(6, 'ITEC 122', 'ITEC 120', 'C'),
(7, 'ITEC 235', 'ITEC 133', 'C'),
(8, 'ITEC 236', 'ITEC 235', 'C'),
(9, 'ITEC 225', 'ITEC 133', 'C'),
(10, 'ITEC 228', 'ITEC 225', 'D'),
(11, 'ITEC 292', 'ITEC 235', 'C'),
(12, 'ITEC 124', 'ITEC 122', 'D'),
(13, 'ITEC 251', 'ITEC 250', 'D'),
(14, 'ITEC 285', 'ITEC 250', 'D'),
(15, 'ITEC 285', 'ITEC 133', 'D'),
(16, 'ITEC 244', 'ITEC 133', 'D'),
(17, 'ITEC 245', 'ITEC 133', 'D'),
(18, 'ITEC 243', 'ITEC 133', 'D'),
(19, 'ITEC 457', 'ITEC 351', 'D'),
(20, 'ITEC 457', 'ITEC 352', 'D'),
(21, 'ITEC 351', 'ITEC 251', 'D'),
(22, 'ITEC 352', 'ITEC 351', 'D'),
(23, 'ITEC 456', 'ITEC 251', 'D'),
(24, 'ITEC 453', 'ITEC 251', 'D'),
(25, 'ITEC 452', 'ITEC 351', 'D'),
(26, 'ITEC 452', 'ITEC 352', 'D'),
(27, 'ITEC 451', 'ITEC 351', 'D'),
(28, 'ITEC 451', 'ITEC 352', 'D'),
(29, 'ITEC 363', 'ITEC 351', 'D'),
(30, 'ITEC 360', 'ITEC 260', 'D'),
(31, 'ITEC 322', 'ITEC 124', 'D'),
(32, 'ITEC 371', 'ITEC 270', 'D'),
(33, 'ITEC 372', 'ITEC 270', 'D'),
(34, 'ITEC 374', 'ITEC 133', 'D'),
(35, 'ITEC 375', 'ITEC 270', 'D'),
(36, 'ITEC 476', 'ITEC 376', 'D'),
(37, 'ITEC 476', 'ITEC 472', 'D'),
(38, 'ITEC 472', 'ITEC 372', 'D'),
(39, 'ITEC 474', 'ITEC 374', 'D'),
(40, 'ITEC 478', 'ITEC 372', 'D'),
(41, 'ITEC 291', 'ITEC 244', 'D'),
(42, 'ITEC 291', 'GRDE 129', 'D'),
(43, 'ITEC 342', 'ITEC 244', 'D'),
(44, 'ITEC 343', 'ITEC 244', 'D'),
(45, 'ITEC 443', 'ITEC 236', 'D'),
(46, 'ITEC 443', 'ITEC 243', 'D'),
(47, 'ITEC 345', 'ITEC 244', 'D'),
(48, 'ITEC 345', 'ITEC 245', 'D'),
(49, 'ITEC 445', 'ITEC 245', 'D'),
(50, 'ITEC 445', 'ITEC 345', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `program_id` int(11) NOT NULL,
  `program_name` varchar(255) NOT NULL,
  `program_level` varchar(255) NOT NULL,
  `year_issued` year(4) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
(15, 'Information and Library Science', 'Bachelor', 2014, 1);

-- --------------------------------------------------------

--
-- Table structure for table `program_outline`
--

CREATE TABLE IF NOT EXISTS `program_outline` (
  `outline_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `recommended_semester_full` int(11) NOT NULL,
  `recommended_semester_part` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `remember_me`
--

CREATE TABLE IF NOT EXISTS `remember_me` (
  `token_hash` varchar(255) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_desc` varchar(255) NOT NULL
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

CREATE TABLE IF NOT EXISTS `semester` (
  `semester_id` varchar(10) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `user_id` varchar(50) NOT NULL,
  `stu_fname` varchar(50) NOT NULL,
  `stu_lname` varchar(50) NOT NULL,
  `stu_status` varchar(50) NOT NULL,
  `program_id` int(11) NOT NULL,
  `campus_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` varchar(50) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advised_course`
--
ALTER TABLE `advised_course`
  ADD PRIMARY KEY (`adv_course_id`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `advisement_id` (`advisement_id`);

--
-- Indexes for table `advisement`
--
ALTER TABLE `advisement`
  ADD PRIMARY KEY (`advisement_id`),
  ADD KEY `stu_id` (`stu_id`),
  ADD KEY `adv_id` (`adv_id`);

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `campus_id` (`campus_id`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`campus_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `advisement_id` (`advisement_id`);

--
-- Indexes for table `prerequisite`
--
ALTER TABLE `prerequisite`
  ADD PRIMARY KEY (`prereq_id`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `prereq_code` (`prereq_code`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`program_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `program_outline`
--
ALTER TABLE `program_outline`
  ADD PRIMARY KEY (`outline_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `course_code` (`course_code`);

--
-- Indexes for table `remember_me`
--
ALTER TABLE `remember_me`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semester_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `campus_id` (`campus_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_name` (`role_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advised_course`
--
ALTER TABLE `advised_course`
  MODIFY `adv_course_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `advisement`
--
ALTER TABLE `advisement`
  MODIFY `advisement_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prerequisite`
--
ALTER TABLE `prerequisite`
  MODIFY `prereq_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `program_outline`
--
ALTER TABLE `program_outline`
  MODIFY `outline_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
  ADD CONSTRAINT `advisement_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advisement_ibfk_2` FOREIGN KEY (`adv_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `remember_me_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_name`) REFERENCES `role` (`role_name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
