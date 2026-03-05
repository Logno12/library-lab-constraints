-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2026 at 04:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(150) NOT NULL,
  `ISBN` varchar(50) NOT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `Availability` enum('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE'
) ;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `Title`, `ISBN`, `Price`, `Availability`) VALUES
(101, 'Database System', 'ISBN001', 500.00, 'AVAILABLE'),
(102, 'Java Programming', 'ISBN002', 600.00, 'AVAILABLE'),
(103, 'Data Structures', 'ISBN003', 550.00, 'AVAILABLE'),
(104, 'Operating System', 'ISBN004', 650.00, 'AVAILABLE'),
(105, 'Computer Networks', 'ISBN005', 700.00, 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `LoanID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`LoanID`, `MemberID`, `BookID`) VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104),
(5, 5, 105),
(6, 1, 103),
(7, NULL, 101);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT 'N/A'
) ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `FullName`, `Email`, `Age`, `Phone`) VALUES
(1, 'Rahim Uddin', 'rahim@gmail.com', 22, 'N/A'),
(2, 'Karim Ahmed', 'karim@gmail.com', 25, 'N/A'),
(3, 'Sadia Islam', 'sadia@gmail.com', 21, 'N/A'),
(4, 'Nusrat Jahan', 'nusrat@gmail.com', 23, 'N/A'),
(5, 'Tanvir Hasan', 'tanvir@gmail.com', 24, 'N/A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `fk_member` (`MemberID`),
  ADD KEY `fk_book` (`BookID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  ADD CONSTRAINT `fk_member` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
