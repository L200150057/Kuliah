-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 15 Des 2017 pada 13.26
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kosan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kos`
--

CREATE TABLE `data_kos` (
  `id_kos` int(11) NOT NULL,
  `nama_kos` varchar(45) NOT NULL,
  `alamat_kos` varchar(255) NOT NULL,
  `fasilitas` varchar(25) NOT NULL,
  `wc` varchar(5) NOT NULL,
  `1bln` int(11) NOT NULL,
  `6bln` int(11) NOT NULL,
  `1thn` int(11) NOT NULL,
  `foto` text,
  `id_user` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trans` int(11) NOT NULL,
  `id_pemilik` varchar(15) NOT NULL,
  `id_kos` int(11) DEFAULT NULL,
  `id_penyewa` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(15) NOT NULL,
  `password` varchar(12) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_kos`
--
ALTER TABLE `data_kos`
  ADD PRIMARY KEY (`id_kos`),
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trans`),
  ADD UNIQUE KEY `id_kos` (`id_kos`),
  ADD KEY `id_pemilikFK` (`id_pemilik`),
  ADD KEY `id_penyewaFK` (`id_penyewa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_kos`
--
ALTER TABLE `data_kos`
  MODIFY `id_kos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_kos`
--
ALTER TABLE `data_kos`
  ADD CONSTRAINT `id_userFK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `id_pemilikFK` FOREIGN KEY (`id_pemilik`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_penyewaFK` FOREIGN KEY (`id_penyewa`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
