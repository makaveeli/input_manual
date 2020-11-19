-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2020 at 04:04 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expo`
--

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `id_provinsi` int(9) NOT NULL,
  `kordinat_lu` varchar(255) NOT NULL,
  `kordinat_ls` varchar(100) NOT NULL,
  `id_kota` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id_kecamatan`, `nama_kecamatan`, `id_provinsi`, `kordinat_lu`, `kordinat_ls`, `id_kota`) VALUES
(5, 'Kecamatan Cengkareng', 16, '5.567296', '95.368088', 15),
(6, 'Kecamatan Grogol Petamburan', 16, '-0.929425', '100.424577', 15),
(7, 'Kecamatan Taman Sari', 16, '-2.9640094', '104.7512215', 15),
(8, 'Kecamatan Tambora', 16, '-1.613018', '103.519492', 15),
(9, 'Kecamatan Kebon Jeruk', 16, '-5.3636158', '105.2425647', 15),
(10, 'Kecamatan Kali Deres', 16, '-6.893002', '107.61683', 15),
(11, 'Kecamatan Palmerah', 16, '-7.4071383', '109.2523009', 15),
(12, 'Kecamatan Kembangan', 16, '-7.268236', '112.784245', 15),
(13, 'Kecamatan Cempaka Putiih', 16, '-7.1293394', '112.7240825', 16),
(14, 'Kecamatan Gambir', 16, '-8.798181', '115.172205', 16);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `jumlah_kecamatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `id_provinsi`, `jumlah_kecamatan`) VALUES
(1, 'Banda Aceh', 4, 9),
(2, 'Langsa', 4, 5),
(3, 'Lhokseumawe', 4, 4),
(4, 'Meulaboh', 4, 12),
(5, 'Sabang', 4, 2),
(6, 'Subulussalam', 4, 5),
(7, 'Denpasar', 20, 4),
(8, 'Pangkalpinang', 7, 12),
(9, 'Cilegon', 14, 8),
(10, 'Serang', 14, 6),
(11, 'Tangerang Selatan', 14, 7),
(12, 'Tangerang', 14, 13),
(13, 'Bengkulu', 10, 9),
(14, 'Gorontalo', 28, 9),
(15, 'Jakarta Barat', 16, 8),
(16, 'Jakarta Pusat', 16, 8),
(17, 'Jakarta Selatan', 16, 10),
(18, 'Jakarta Timur', 16, 10),
(19, 'Jkarta Utara', 16, 6),
(20, 'Sungai Penuh', 9, 1),
(21, 'Jambi', 9, 11);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(4, 'ACEH'),
(5, 'SUMATERA UTARA'),
(6, 'SUMATERA BARAT'),
(7, 'RIAU'),
(8, 'KEPULAUAN RIAU'),
(9, 'JAMBI'),
(10, 'BENGKULU'),
(11, 'SUMATERA SELATAN'),
(12, 'KEPULAUAN BANGKA BELITUNG'),
(13, 'LAMPUNG'),
(14, 'BANTEN'),
(15, 'JAWA BARAT'),
(16, 'DKI JAKARTA'),
(17, 'JAWA TENGAH'),
(18, 'YOGYAKARTA'),
(19, 'JAWA TIMUR'),
(20, 'BALI'),
(21, 'NTB'),
(22, 'NTT'),
(23, 'KALIMANTAN BARAT'),
(24, 'KALIMANTAN SELATAN'),
(25, 'KALIMANTAN TENGAH'),
(26, 'KALIMANTAN TIMUR'),
(27, 'KALIMANTAN UTARA'),
(28, 'GORONTALO'),
(29, 'SULAWESI BARAT'),
(30, 'SULAWESI SELATAN'),
(31, 'SULAWESI TENGAH'),
(32, 'SULAWESI TENGGARA'),
(33, 'SULAWESI UTARA'),
(34, 'MALUKU'),
(35, 'MALUKU UTARA'),
(36, 'PAPUA BARAT'),
(37, 'PAPUA');

-- --------------------------------------------------------

--
-- Table structure for table `reason`
--

CREATE TABLE `reason` (
  `id` int(11) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `desa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`),
  ADD KEY `provinsi_pk` (`id_provinsi`),
  ADD KEY `kota_pk` (`id_kota`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`),
  ADD KEY `kota_cs` (`id_provinsi`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_provinsi`);

--
-- Indexes for table `reason`
--
ALTER TABLE `reason`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id_provinsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `reason`
--
ALTER TABLE `reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
