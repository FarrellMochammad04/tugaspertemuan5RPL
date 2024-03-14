-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Mar 2024 pada 10.27
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nomor1rpl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `account-number` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `borrower`
--

CREATE TABLE `borrower` (
  `customer-id` varchar(12) NOT NULL,
  `loan-number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `branch`
--

CREATE TABLE `branch` (
  `branch-name` varchar(200) NOT NULL,
  `branch-city` varchar(200) NOT NULL,
  `assets` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `checking-account`
--

CREATE TABLE `checking-account` (
  `account-number` int(11) NOT NULL,
  `overdraft-amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cust-banker`
--

CREATE TABLE `cust-banker` (
  `cust-bunker-id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `employee-id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customer-id` varchar(12) NOT NULL,
  `customer-name` varchar(50) NOT NULL,
  `customer-street` text NOT NULL,
  `customer-city` varchar(100) NOT NULL,
  `cust-bunker-id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dependent`
--

CREATE TABLE `dependent` (
  `dependent-id` int(12) NOT NULL,
  `employee-id` varchar(12) NOT NULL,
  `dependent-name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `depositor`
--

CREATE TABLE `depositor` (
  `customer-id` varchar(12) NOT NULL,
  `account-number` int(11) NOT NULL,
  `access-date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `employee-id` varchar(12) NOT NULL,
  `employee-name` varchar(50) NOT NULL,
  `telephone-number` varchar(13) NOT NULL,
  `employee-length` int(11) NOT NULL,
  `start-date` date NOT NULL,
  `manager-id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `loan`
--

CREATE TABLE `loan` (
  `loan-number` int(11) NOT NULL,
  `customer-id` varchar(12) NOT NULL,
  `amount` int(11) NOT NULL,
  `branch-name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment-number` int(11) NOT NULL,
  `loan-number` int(11) NOT NULL,
  `payment-amount` int(11) NOT NULL,
  `payment-date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting-account`
--

CREATE TABLE `setting-account` (
  `account-number` int(11) NOT NULL,
  `interest-rate` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account-number`);

--
-- Indeks untuk tabel `borrower`
--
ALTER TABLE `borrower`
  ADD KEY `customer-id` (`customer-id`),
  ADD KEY `loa` (`loan-number`);

--
-- Indeks untuk tabel `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch-name`);

--
-- Indeks untuk tabel `checking-account`
--
ALTER TABLE `checking-account`
  ADD KEY `account-number` (`account-number`);

--
-- Indeks untuk tabel `cust-banker`
--
ALTER TABLE `cust-banker`
  ADD PRIMARY KEY (`cust-bunker-id`),
  ADD KEY `employee-id` (`employee-id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer-id`),
  ADD KEY `cust-bunker-id` (`cust-bunker-id`);

--
-- Indeks untuk tabel `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`dependent-id`),
  ADD KEY `employee-id` (`employee-id`);

--
-- Indeks untuk tabel `depositor`
--
ALTER TABLE `depositor`
  ADD KEY `customer-id` (`customer-id`),
  ADD KEY `account-number` (`account-number`);

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee-id`);

--
-- Indeks untuk tabel `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan-number`),
  ADD KEY `customer-id` (`customer-id`),
  ADD KEY `branch-name` (`branch-name`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment-number`,`loan-number`),
  ADD KEY `payment-number` (`payment-number`),
  ADD KEY `loan-number` (`loan-number`);

--
-- Indeks untuk tabel `setting-account`
--
ALTER TABLE `setting-account`
  ADD KEY `account-number` (`account-number`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dependent`
--
ALTER TABLE `dependent`
  MODIFY `dependent-id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `borrower`
--
ALTER TABLE `borrower`
  ADD CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`customer-id`) REFERENCES `customer` (`customer-id`),
  ADD CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`loan-number`) REFERENCES `loan` (`loan-number`);

--
-- Ketidakleluasaan untuk tabel `checking-account`
--
ALTER TABLE `checking-account`
  ADD CONSTRAINT `checking-account_ibfk_1` FOREIGN KEY (`account-number`) REFERENCES `account` (`account-number`);

--
-- Ketidakleluasaan untuk tabel `cust-banker`
--
ALTER TABLE `cust-banker`
  ADD CONSTRAINT `cust-banker_ibfk_1` FOREIGN KEY (`employee-id`) REFERENCES `employee` (`employee-id`);

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`cust-bunker-id`) REFERENCES `cust-banker` (`cust-bunker-id`);

--
-- Ketidakleluasaan untuk tabel `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`employee-id`) REFERENCES `employee` (`employee-id`);

--
-- Ketidakleluasaan untuk tabel `depositor`
--
ALTER TABLE `depositor`
  ADD CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`customer-id`) REFERENCES `customer` (`customer-id`),
  ADD CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account-number`) REFERENCES `account` (`account-number`);

--
-- Ketidakleluasaan untuk tabel `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`branch-name`) REFERENCES `branch` (`branch-name`);

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`loan-number`) REFERENCES `loan` (`loan-number`);

--
-- Ketidakleluasaan untuk tabel `setting-account`
--
ALTER TABLE `setting-account`
  ADD CONSTRAINT `setting-account_ibfk_1` FOREIGN KEY (`account-number`) REFERENCES `account` (`account-number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
