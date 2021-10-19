-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2021 at 01:08 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--

--

-- --------------------------------------------------------

--

--

CREATE TABLE `invoice` (
  `invoiceID` int(10) NOT NULL,
  `invoiceDate` date NOT NULL,
  `ItemID` int(5) NOT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `CustomerID` int(10) NOT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `Quantity` int(5) NOT NULL,
  `Total` int(50) NOT NULL,
  `Remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--

--

CREATE TABLE `sales` (
  `SaleID` int(5) DEFAULT NULL,
  `CustomerID` int(5) DEFAULT NULL,
  `CustomerName` varchar(20) DEFAULT NULL,
  `ItemID` int(5) DEFAULT NULL,
  `ItemName` varchar(20) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `PurchaseDate` date NOT NULL,
  `Total` int(10) DEFAULT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `PaymentModeDetail` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--
-- --------------------------------------------------------



CREATE TABLE `Purchases` (
  `ItemID` int(20) NOT NULL,
  `Item` varchar(20) DEFAULT NULL,
  `Quantity` int(50) DEFAULT NULL,
  `Amount` int(50) DEFAULT NULL,
  `Date` date NOT NULL,
  `AccountNumber` int(50) DEFAULT NULL,
  `Paybill` int(50) DEFAULT NULL,
  `Detailedinfo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--
-- --------------------------------------------------------

--

--

CREATE TABLE `customer` (
  `CustomerID` int(10) NOT NULL,
  `CustomerName` varchar(20) DEFAULT NULL,
  `FatherName` varchar(20) DEFAULT NULL,
  `PhoneNumber` int(10) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--

--

CREATE TABLE `workerregistration` (
  `workerID` int(10) NOT NULL,
  `WorkerName` varchar(20) DEFAULT NULL,
  `ContactNo` varchar(11) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--

INSERT INTO `workerregistration` (`workerID`, `workerName`, `ContactNo`, `Remarks`) VALUES
(100, 'Angel Jude Suarez', '0706953086', 'Hardworking');

-- --------------------------------------------------------

--

--

CREATE TABLE `registration` (
  `username` varchar(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `security_ques` varchar(30) DEFAULT NULL,
  `answer` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--


-- --------------------------------------------------------

--

--

CREATE TABLE `Item` (
  `ItemID` int(5) NOT NULL,
  `ItemName` varchar(10) DEFAULT NULL,
  `Price` int(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

INSERT INTO `Item` (`ItemID`, `ItemName`, `Price`, `Status`) VALUES
(1, 'Maize', 5000, '20 bags'),
(2, 'Beans', 2500, '10 bags');

-- --------------------------------------------------------

--

--

CREATE TABLE `services` (
  `ServiceName` varchar(20) DEFAULT NULL,
  `ServiceDate` date NOT NULL,
  `WorkerID` int(10) DEFAULT NULL,
  `ServiceCharges` int(10) DEFAULT NULL,
  `ServiceID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--

INSERT INTO `services` (`ServiceName`, `ServiceDate`, `WorkerID`, `ServiceCharges`, `ServiceID`) VALUES
('General', '2021-03-01', 11111, 500, 16);

-- --------------------------------------------------------

--

--

CREATE TABLE `users` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

--

INSERT INTO `users` (`user_name`, `password`) VALUES
('ak', '12345'),
('akash', '123456'),
('aksh', 'akash'),
('anu', 'anu123'),
('avit', 'akash');

--

--

--

--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `CustomerID` (`CustomerID`);

--

--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SaleID`);

--

--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--

--
ALTER TABLE `workerregistration`
  ADD PRIMARY KEY (`workerID`);

--

--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`username`);

--

--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`ItemID`);

--

--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceID`);

ALTER TABLE `Purchases`
  ADD PRIMARY KEY (`ItemID`);
--

--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_name`);

--

--

--

--
ALTER TABLE `services`
  MODIFY `ServiceID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;


ALTER TABLE `Purchases`
  MODIFY `ItemID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--

--
--
ALTER TABLE `invoice`
  MODIFY `InvoiceID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

  --
ALTER TABLE `customer`
  MODIFY `CustomerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
ALTER TABLE `workerregistration`
  MODIFY `WorkerID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;


ALTER TABLE `sales`
  MODIFY `SaleID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;
  --
ALTER TABLE `Item`
  MODIFY `ItemID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;


--

--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `Item` (`ItemID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
