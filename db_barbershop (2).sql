-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2026 pada 16.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barbershop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(11) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `harga`) VALUES
(1, 'Potong Rambut', 25000.00),
(2, 'Cukur Jenggot', 15000.00),
(3, 'Creambath', 35000.00),
(4, 'Coloring', 75000.00),
(5, 'curly', 10000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('Admin','Pegawai') NOT NULL DEFAULT 'Pegawai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Admin Utama', 'admin', 'admin123', 'Admin'),
(2, 'Budi', 'budi', 'budi123', 'Pegawai'),
(4, 'Key', 'key', 'key123', 'Pegawai'),
(5, 'Lala', 'lala', 'lala123', 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `no_hp`, `alamat`) VALUES
(2, 'Doni', '081298765432', 'Kolaka Utara'),
(3, 'Doni', '081298765432', 'Kolaka Utara'),
(4, 'ramaa', '081298765432', 'Kolaka Utara'),
(5, 'Zuraa', '097291618121', ''),
(6, 'Ken', '098976864536', ''),
(10, 'siti', '098909765678', ''),
(11, 'Permadi Kusuma', '085213219871', 'Balandai'),
(12, 'Joko', '097291618123', 'Jl. Rambutan'),
(13, 'Vio', '089768965432', 'Jl. Anggrek'),
(14, 'Juan', '0987653789018', 'Jl. Manggis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `id_pelanggan` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `total` decimal(12,2) DEFAULT 0.00,
  `status` enum('Menunggu','Sedang Dikerjakan','Selesai') DEFAULT 'Menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `id_pelanggan`, `id_pegawai`, `total`, `status`) VALUES
(1, '2026-07-05 23:15:02', 4, 1, 25000.00, 'Menunggu'),
(2, '2026-07-05 23:15:17', 2, 2, 25000.00, 'Selesai'),
(3, '2026-07-05 23:15:32', 3, 2, 15000.00, 'Selesai'),
(4, '2026-07-07 17:43:49', 2, 4, 75000.00, 'Selesai'),
(5, '2026-07-07 17:43:56', 2, 1, 25000.00, 'Menunggu'),
(6, '2026-07-07 17:53:29', 2, 4, 25000.00, 'Selesai'),
(7, '2026-07-07 17:53:46', 6, 2, 25000.00, 'Selesai'),
(8, '2026-07-07 17:54:01', 5, 4, 25000.00, 'Selesai'),
(9, '2026-07-07 22:38:52', 2, 1, 15000.00, 'Menunggu'),
(10, '2026-07-07 22:39:31', 4, 4, 25000.00, 'Selesai'),
(11, '2026-07-08 13:46:03', 5, 1, 15000.00, 'Menunggu'),
(12, '2026-07-08 13:52:42', 4, 4, 10000.00, 'Selesai'),
(13, '2026-07-08 13:53:10', 6, 4, 25000.00, 'Selesai'),
(14, '2026-07-08 15:11:30', 10, 4, 45000.00, 'Selesai'),
(15, '2026-07-08 15:12:02', 3, 4, 50000.00, 'Selesai'),
(16, '2026-07-09 10:35:32', 11, 2, 25000.00, 'Selesai'),
(17, '2026-07-09 10:36:06', 11, 4, 25000.00, 'Selesai'),
(18, '2026-07-13 21:51:33', 13, 4, 25000.00, 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_detail`, `id_transaksi`, `id_layanan`, `harga`) VALUES
(1, 1, 1, 25000.00),
(2, 2, 1, 25000.00),
(3, 3, 2, 15000.00),
(4, 4, 4, 75000.00),
(5, 5, 1, 25000.00),
(6, 6, 1, 25000.00),
(7, 7, 1, 25000.00),
(8, 8, 1, 25000.00),
(9, 9, 2, 15000.00),
(10, 10, 1, 25000.00),
(11, 11, 2, 15000.00),
(12, 12, 5, 10000.00),
(13, 13, 5, 10000.00),
(14, 13, 2, 15000.00),
(15, 14, 5, 10000.00),
(16, 14, 3, 35000.00),
(17, 15, 2, 15000.00),
(18, 15, 3, 35000.00),
(19, 16, 1, 25000.00),
(20, 17, 1, 25000.00),
(21, 18, 1, 25000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_layanan` (`id_layanan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_detail_ibfk_2` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id_layanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
