-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 06:54 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joko`
--
CREATE DATABASE IF NOT EXISTS `joko` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `joko`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `satuan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KERTAS A4', 'DUS', '2021-11-08 05:36:44', '2021-11-08 05:36:44', NULL),
(2, 'PULPEN', 'BOX', '2021-11-07 23:57:53', '2021-11-08 00:36:04', NULL),
(3, 'PENGGARIS', 'BUAH', '2021-11-23 01:08:25', '2021-11-23 01:08:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bidang`
--

CREATE TABLE `bidang` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bidang`
--

INSERT INTO `bidang` (`id`, `nama`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INSPEKTORAT WILAYAH I', '2021-09-30 13:31:39', NULL, NULL),
(2, 'INSPEKTORAT WILAYAH II', '2021-09-30 13:31:39', NULL, NULL),
(3, 'INSPEKTORAT WILAYAH III', '2021-09-30 13:31:39', NULL, NULL),
(4, 'INSPEKTORAT WILAYAH IV', '2021-09-30 13:31:39', NULL, NULL),
(5, 'INSPEKTORAT WILAYAH V', '2021-09-30 13:31:39', NULL, NULL),
(6, 'INSPEKTORAT WILAYAH VI', '2021-09-30 13:31:39', NULL, NULL),
(7, 'BAGIAN UMUM', '2021-09-30 13:31:39', NULL, NULL),
(8, 'BAGIAN KEPEGAWAIAN', '2021-09-30 13:31:39', NULL, NULL),
(9, 'BAGIAN PHP', '2021-09-30 13:31:39', NULL, NULL),
(10, 'BAGIAN KEUANGAN', '2021-09-30 13:31:39', NULL, NULL),
(11, 'BAGIAN SIP', '2021-09-30 13:31:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bidang_ilmu`
--

CREATE TABLE `bidang_ilmu` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bidang_ilmu`
--

INSERT INTO `bidang_ilmu` (`id`, `nama`) VALUES
(1, 'Audit');

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `id` int(11) NOT NULL,
  `golongan` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `golongan`
--

INSERT INTO `golongan` (`id`, `golongan`, `nama`) VALUES
(1, 'IVe', 'Pembina Utama'),
(2, 'IVd', 'Pembina Utama Madya'),
(3, 'IVc', 'Pembina Utama Muda'),
(4, 'IVb', 'Pembina Tingkat I'),
(5, 'IVa', 'Pembina'),
(6, 'IIId', 'Penata Tingkat I'),
(7, 'IIIc', 'Penata'),
(8, 'IIIb', 'Penata Muda Tingkat I'),
(9, 'IIIa', 'Penata Muda'),
(10, 'IId', 'Pengatur Tingkat I'),
(11, 'IIc', 'Pengatur'),
(12, 'IIb', 'Pengatur Muda Tingkat I'),
(13, 'IIa', 'Pengatur Muda'),
(14, 'Id', 'Juru Tingkat I'),
(15, 'Ic', 'Juru'),
(16, 'Ib', 'Juru Muda Tingkat I'),
(17, 'Ia', 'Juru Muda');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_jabatan` varchar(255) NOT NULL DEFAULT 'JFU'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`, `jenis_jabatan`) VALUES
(1, 'INSPEKTUR JENDERAL', 'PIMPINAN TINGGI'),
(2, 'INSPEKTUR WILAYAH', 'PIMPINAN TINGGI'),
(3, 'SEKRETARIS INSPEKTORAT JENDERL', 'PIMPINAN TINGGI'),
(4, 'AUDITOR UTAMA', 'FUNGSIONAL'),
(5, 'KEPALA BAGIAN', 'ADMINISTRATOR'),
(6, 'AUDITOR MADYA', 'FUNGSIONAL'),
(7, 'ANALIS KEPEGAWAIAN AHLI MADYA', 'FUNGSIONAL'),
(8, 'AUDITOR MUDA', 'FUNGSIONAL'),
(9, 'AUDITOR PERTAMA', 'FUNGSIONAL'),
(10, 'AUDITOR PELAKSANA LANJUTAN', 'FUNGSIONAL'),
(11, 'AUDITOR PELAKSANA', 'FUNGSIONAL'),
(12, 'KASUBAG', 'PENGAWAS'),
(13, 'PRANATA KOMPUTER PERTAMA', 'FUNGSIONAL'),
(14, 'PENGELOLA DAN PEMELIHARA PIRANTI', 'PELAKSANA'),
(15, 'PENGELOLA DATA ANGGARAN', 'PELAKSANA'),
(16, 'PENYUSUN BAHAN KERJASAMA', 'PELAKSANA'),
(17, 'ARSIPARIS AHLI MUDA', 'FUNGSIONAL'),
(18, 'ARSIPARIS AHLI PERTAMA', 'FUNGSIONAL'),
(19, 'ANALIS STANDARISASI SARANA KERJA', 'PELAKSANA'),
(20, 'PENGELOLA HASIL KERJA', 'PELAKSANA'),
(21, 'PENGELOLA TEKNOLOGI INFORMASI', 'PELAKSANA'),
(22, 'PENYUSUN LAPORAN KEUANGAN', 'PELAKSANA'),
(23, 'ANALIS KELEMBAGAAN', 'PELAKSANA'),
(24, 'ANALIS HUKUM', 'PELAKSANA'),
(25, 'ANALIS PERENCANAAN, PENGGUNAAN DAN PENGHAPUSAN BMN', 'PELAKSANA'),
(26, 'ANALIS JABATAN', 'PELAKSANA'),
(27, 'PENGEVALUASI KEGIATAN PROGRAM', 'PELAKSANA'),
(28, 'PENYUSUN INFORMASI HUKUM', 'PELAKSANA'),
(29, 'SEKRETARIS PIMPINAN', 'PELAKSANA'),
(30, 'ANALIS LAPORAN HASIL PENGAWASAN', 'PELAKSANA'),
(31, 'ANALIS KEPEGAWAIAN AHLI MUDA', 'FUNGSIONAL'),
(32, 'ANALIS KEPEGAWAIAN AHLI PERTAMA', 'FUNGSIONAL'),
(33, 'KUSTODIAN KEKAYAAN NEGARA', 'PELAKSANA'),
(34, 'BENDAHARA PENGELUARAN PUSAT', 'PELAKSANA'),
(35, 'ANALIS PENGADUAN MASYARAKAT', 'PELAKSANA'),
(36, 'PENGOLAH DATA KELEMBAGAAN', 'PELAKSANA'),
(37, 'PENGOLAH DATA KERJASAMA', 'PELAKSANA'),
(38, 'PENGELOLA PENGADAAN BARANG/JASA PERTAMA', 'PELAKSANA'),
(39, 'PRANATA HUBUNGAN MASYARAKAT PERTAMA', 'FUNGSIONAL'),
(40, 'PENGELOLA TATA NASKAH', 'PELAKSANA'),
(41, 'PENGELOLA KEUANGAN', 'PELAKSANA'),
(42, 'PETUGAS PROTOKOL', 'PELAKSANA'),
(43, 'ANALIS SISTEM PROSEDUR DAN METODE KERJA', 'PELAKSANA'),
(44, 'PENGELOLA TATA NASKAH', 'PELAKSANA'),
(45, 'PENATA KEUANGAN', 'PELAKSANA');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatan`
--

CREATE TABLE `jenis_kegiatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id`, `nama`) VALUES
(1, 'RAPAT INTERNAL'),
(2, 'RAPAT EKSTERNAL'),
(3, 'WORKSHOP'),
(4, 'KONSINYERING'),
(5, 'BELANJA');

-- --------------------------------------------------------

--
-- Table structure for table `kanwil`
--

CREATE TABLE `kanwil` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(512) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kanwil`
--

INSERT INTO `kanwil` (`id`, `nama`, `alamat`, `nomor_telepon`) VALUES
(1, 'ACEH', 'JL ACEH', '23123123');

-- --------------------------------------------------------

--
-- Table structure for table `kartu_persediaan`
--

CREATE TABLE `kartu_persediaan` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `debit` double NOT NULL,
  `kredit` double NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bidang_id` int(11) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kartu_persediaan`
--

INSERT INTO `kartu_persediaan` (`id`, `barang_id`, `debit`, `kredit`, `user_id`, `bidang_id`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5, 0, 7, NULL, 'Pembelian persediaan #KW.xxx', '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(2, 2, 4, 0, 7, NULL, 'Pembelian persediaan #KW.xxx', '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(3, 3, 10, 0, 7, NULL, 'Pembelian persediaan #KW.xxx', '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(4, 1, 0, 3, 7, NULL, 'Permintaan persediaan wilayah/bagian INSPEKTORAT WILAYAH I', '2021-11-23 01:12:19', '2021-11-23 01:12:19', NULL),
(5, 2, 0, 2, 7, NULL, 'Permintaan persediaan wilayah/bagian INSPEKTORAT WILAYAH I', '2021-11-23 01:12:19', '2021-11-23 01:12:19', NULL),
(6, 3, 0, 5, 7, NULL, 'Permintaan persediaan wilayah/bagian INSPEKTORAT WILAYAH I', '2021-11-23 01:12:19', '2021-11-23 01:12:19', NULL),
(7, 2, 20, 0, 7, NULL, 'Pembelian persediaan #433-27/C.4', '2021-11-25 03:54:27', '2021-11-25 03:54:27', NULL),
(8, 1, 0, 2, 7, NULL, 'Permintaan persediaan wilayah/bagian BAGIAN PHP', '2021-11-26 01:16:08', '2021-11-26 01:16:08', NULL),
(9, 2, 0, 22, 7, NULL, 'Permintaan persediaan wilayah/bagian BAGIAN PHP', '2021-11-26 01:16:08', '2021-11-26 01:16:08', NULL),
(10, 1, 100, 0, 7, NULL, 'Pembelian persediaan #KW.xxx', '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL),
(11, 2, 200, 0, 7, NULL, 'Pembelian persediaan #KW.xxx', '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL),
(12, 3, 40, 0, 7, NULL, 'Pembelian persediaan #KW.xxx', '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `nomor_kwitansi` varchar(255) NOT NULL,
  `uraian` text NOT NULL,
  `jenis_kegiatan_id` tinyint(1) NOT NULL,
  `lokasi` varchar(512) NOT NULL,
  `output` text NOT NULL,
  `total_anggaran` double NOT NULL,
  `total_realisasi` double NOT NULL DEFAULT 0,
  `status_realisasi` enum('BELUM','SUDAH') NOT NULL DEFAULT 'BELUM',
  `status` enum('RENCANA','VERIFIKASI KEUANGAN','PELAKSANAAN','VERIFIKASI REALISASI','VERIFIKASI PPK','VERIFIED PPK','SELESAI') NOT NULL DEFAULT 'RENCANA',
  `mak_id` int(11) NOT NULL,
  `tanggal_rencana_kegiatan` date NOT NULL,
  `tanggal_realisasi_kegiatan` date DEFAULT NULL,
  `tahun_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checker_id` int(11) DEFAULT NULL,
  `ppk_id` int(11) DEFAULT NULL,
  `bendahara_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nomor_kwitansi`, `uraian`, `jenis_kegiatan_id`, `lokasi`, `output`, `total_anggaran`, `total_realisasi`, `status_realisasi`, `status`, `mak_id`, `tanggal_rencana_kegiatan`, `tanggal_realisasi_kegiatan`, `tahun_id`, `bidang_id`, `user_id`, `checker_id`, `ppk_id`, `bendahara_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2021-1', 'Workshop Evaluasi Laporan Keuangan Tahun 2021', 3, 'Jakarta', '1 Laporan Kegiatan', 5000000, 4900000, 'SUDAH', 'SELESAI', 6, '2021-11-23', '2021-11-23', 1, 1, 1, 1, 2, 3, '2021-11-23 00:24:35', '2021-11-23 00:42:21', NULL),
(2, '2021-2', 'Reviu LK di Ling. Kanwil Banten', 4, 'Banten', '1 Laporan Kegiatan', 25000000, 25000000, 'SUDAH', 'SELESAI', 6, '2021-11-27', '2021-11-27', 1, 1, 1, 3, 2, 4, '2021-11-23 23:46:56', '2021-11-24 19:20:58', NULL),
(4, '2021-4', 'Evaluasi Maturitas SPIP', 2, 'Hotel Bidakara', '1 Laporan Kegiatan', 15000000, 15000000, 'SUDAH', 'SELESAI', 7, '2021-11-25', '2021-11-25', 1, 1, 1, 3, 2, 4, '2021-11-24 19:38:47', '2021-11-24 21:55:14', NULL),
(6, '2021-5', 'Evaluasi Maturitas SPIP', 2, 'Hotel Novotel Bogor', 'Laporan Kegiatan', 150000000, 140000000, 'SUDAH', 'SELESAI', 8, '2021-11-27', '2021-11-30', 1, 1, 1, 2, 3, 4, '2021-11-25 06:41:45', '2021-11-25 06:52:49', NULL),
(8, '2021-6', 'Workshop', 3, 'Jakarta', 'Laporan Kegiatan', 5000000, 0, 'BELUM', 'PELAKSANAAN', 4, '2021-11-29', NULL, 1, 1, 1, NULL, NULL, NULL, '2021-11-25 23:51:07', '2021-11-26 00:04:11', NULL),
(9, '2021-7', 'Workshop', 3, 'Jakarta', 'Laporan Kegiatan', 5000000, 4500000, 'SUDAH', 'SELESAI', 159, '2021-11-29', '2021-11-29', 1, 9, 1, 14, 17, 219, '2021-11-26 00:06:00', '2021-11-26 00:14:59', NULL),
(10, '2021-8', 'Evaluasi Laporan Keuangan', 3, 'Jakarta', '10 Laporan Kegiatan', 3000000, 800000, 'SUDAH', 'VERIFIKASI REALISASI', 159, '2021-11-27', '2021-12-01', 1, 9, 1, 2, 3, 24, '2021-11-26 00:22:31', '2021-11-30 23:38:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_lampiran`
--

CREATE TABLE `kegiatan_lampiran` (
  `id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan_lampiran`
--

INSERT INTO `kegiatan_lampiran` (`id`, `kegiatan_id`, `nama`, `file`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '202111141009071634_surat.xlsx', 'kegiatan/kvzcBqmgw6nbNgrpLIRctqqwA3EyqHPJXeZqHAl0.xlsx', 1, '2021-11-23 00:24:35', '2021-11-23 00:24:35'),
(2, 1, '202111141009071634_surat.xlsx', 'kegiatan/UtCjW2MaR2V9OX5EiuBpc5WMGQu69ZjwRrypL1Bl.xlsx', 1, '2021-11-23 00:24:35', '2021-11-23 00:24:35'),
(3, 1, 'sop 2021 (1).pdf', 'kegiatan/SRYJobpS5Y2cmxNxSKKWlYtiKEsWumLW2K7hgyVS.pdf', 1, '2021-11-23 00:24:35', '2021-11-23 00:24:35'),
(4, 1, 'Surat Permintaan Data Dukung Rencana Kerja Tahunan Reformasi Birokrasi, Penilaian Mandiri Pelaksanaan Reformasi Birokrasi, Wilayah Bebas dari Korupsi-Wilayah Birokrasi Bersih dan Melayani serta Pelaporan Pelaks.pdf', 'kegiatan/7qjFJHFGECaKCLHCrX919nKNiV5NCRp1goIoWqMl.pdf', 1, '2021-11-23 00:31:21', '2021-11-23 00:31:21'),
(5, 1, '5_yBRwarxMQmJGuRIzbuYHYTVLgsyihlLD.pdf', 'kegiatan/otpF9nT5Q5ukSXXZvknpfjFMgClYaRBiNxHwjfNF.pdf', 1, '2021-11-23 00:31:21', '2021-11-23 00:31:21'),
(6, 1, 'Razilu (1).pdf', 'kegiatan/e2kLIzpQU4w0Asoo0KKU7LjYcJx7aFlEhCVj0kOq.pdf', 1, '2021-11-23 00:31:21', '2021-11-23 00:31:21'),
(7, 1, 'RAZILU.pdf', 'kegiatan/jFW4DTRS61OyqvtRyg6Ly9ViZslhEcIXVA7PFcua.pdf', 1, '2021-11-23 00:31:21', '2021-11-23 00:31:21'),
(8, 2, 'Permohonan Narasumber HKI (1).pdf', 'kegiatan/EL8MaBNy3kPETQEhsk7Z2bIGXYLmcejZ8tQah34a.pdf', 1, '2021-11-23 23:46:56', '2021-11-23 23:46:56'),
(9, 2, 'DRAFT KEPMEN SPEED beserta Lampiran rev 4 Nov 2021-edit.docx', 'kegiatan/gRJp14Mhxy1GjQfdCrqypWY2mcIy6VhotZSmhOt1.docx', 1, '2021-11-23 23:46:56', '2021-11-23 23:46:56'),
(10, 2, 'receipt (6).pdf', 'kegiatan/qXk2CAZ6HOgZXmetso8xzEutCAqQpfZ6h0bIfD8V.pdf', 1, '2021-11-23 23:46:56', '2021-11-23 23:46:56'),
(11, 2, 'CamScanner 11-10-2021 18.43.04.pdf', 'kegiatan/Xljoyes26IDJw4RyPjL31zBQ9vHtGoKRBXA4ctfE.pdf', 1, '2021-11-24 00:09:49', '2021-11-24 00:09:49'),
(12, 2, 'ALDY PRAMANA RUSADI.pdf', 'kegiatan/3C2BMiCmIqzYj0aixzJy5e1MKHbjb0PM4ggxrc3E.pdf', 1, '2021-11-24 00:09:49', '2021-11-24 00:09:49'),
(13, 4, 'Balasan Narsum.docx', 'kegiatan/CwlFw3256DfEBoD9M0SVsyDvA43ZEx9zsui65jkt.docx', 1, '2021-11-24 19:38:47', '2021-11-24 19:38:47'),
(14, 4, 'spb.docx', 'kegiatan/oqQnnMQ1WgY7MEEyeSObSSSd2uV2YGEH20LwvTfP.docx', 1, '2021-11-24 20:29:34', '2021-11-24 20:29:34'),
(15, 4, 'Balasan Narsum.docx', 'kegiatan/JJqUECYzWhf5ZoeoaBu3GiotQgaLUREfLj4AMGZN.docx', 1, '2021-11-24 20:29:34', '2021-11-24 20:29:34'),
(18, 6, 'F-1.15.pdf', 'kegiatan/AKPbOFZMlfkAT1FdR5Hj1PwnFbqgn5a1x8S0aapu.pdf', 1, '2021-11-25 06:48:29', '2021-11-25 06:48:29'),
(20, 8, '2021.11.18_REKAPITULASI DATA DUKUNG EVALUASI SPIP.docx', 'kegiatan/auuemmmW0q1Mq1G9p9lYm6xoW501cxr7B2p7rPeN.docx', 1, '2021-11-25 23:51:08', '2021-11-25 23:51:08'),
(21, 8, 'Permenkumham Nomor 5 Tahun 2018 (1).pdf', 'kegiatan/HKkDv3vH88KULbOXzs7KP10pok6PbQGiNg6qswYV.pdf', 1, '2021-11-25 23:51:08', '2021-11-25 23:51:08'),
(22, 9, 'WhatsApp Image 2021-10-28 at 13.15.28.jpeg', 'kegiatan/bG5lvm7Sj7raXv8AvHuH7aUxCjHRz5ngtp2ySuzc.jpg', 1, '2021-11-26 00:06:00', '2021-11-26 00:06:00'),
(23, 9, 'STATUS KENDARAAN ITJEN (1).xlsx', 'kegiatan/8LrUw6LPsTHHMP85BFtgtDWozuk7mllIqvNrkDWv.xlsx', 1, '2021-11-26 00:06:00', '2021-11-26 00:06:00'),
(24, 9, 'STATUS KENDARAAN ITJEN (1).xlsx', 'kegiatan/5Mv5XP64ZATPeQWUlE8VzRXAKDPWJHLG8DNLiMQM.xlsx', 1, '2021-11-26 00:09:42', '2021-11-26 00:09:42'),
(25, 9, 'Paparan Pengadaan pada masa pandemi_kumham_cov.pptx', 'kegiatan/5ZHvj0Y3HbzBn2G93M33nwO9b3ZPl1LrVCr0J7ux.pptx', 1, '2021-11-26 00:09:42', '2021-11-26 00:09:42'),
(26, 9, 'WhatsApp Image 2021-10-28 at 13.15.28.jpeg', 'kegiatan/TY381DEDK8PE8AkQTZXDvd2neTVA70ZA98RXlLyJ.jpg', 1, '2021-11-26 00:09:42', '2021-11-26 00:09:42'),
(27, 10, 'Backdrop panggung.png', 'kegiatan/ykFg3WPH0D8MQnJ5Qni5yx7ahyKPEsZN6hXvoxi6.png', 5, '2021-11-26 00:27:34', '2021-11-26 00:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_log`
--

CREATE TABLE `kegiatan_log` (
  `id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan_log`
--

INSERT INTO `kegiatan_log` (`id`, `kegiatan_id`, `status`, `user_id`, `bidang_id`, `keterangan`, `catatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-23 00:24:35', '2021-11-23 00:24:35', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Tolong Verifikasi', '2021-11-23 00:28:41', '2021-11-23 00:28:41', NULL),
(3, 1, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'ok', '2021-11-23 00:30:42', '2021-11-23 00:30:42', NULL),
(4, 1, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Udah pelaksanaan', '2021-11-23 00:32:31', '2021-11-23 00:32:31', NULL),
(5, 1, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'ok', '2021-11-23 00:34:47', '2021-11-23 00:34:47', NULL),
(6, 1, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'OK di setujui', '2021-11-23 00:41:31', '2021-11-23 00:41:31', NULL),
(7, 1, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'Bayar', '2021-11-23 00:42:21', '2021-11-23 00:42:21', NULL),
(8, 2, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-23 23:46:56', '2021-11-23 23:46:56', NULL),
(9, 2, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Mohon segera diproses', '2021-11-23 23:50:41', '2021-11-23 23:50:41', NULL),
(10, 2, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'Lampiran sudah lengkap', '2021-11-23 23:53:48', '2021-11-23 23:53:48', NULL),
(11, 2, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Realisasi sudah sesuai', '2021-11-24 00:12:40', '2021-11-24 00:12:40', NULL),
(12, 2, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'Bukti lengkap', '2021-11-24 00:52:55', '2021-11-24 00:52:55', NULL),
(13, 2, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'Sudah bisa di bayarkan', '2021-11-24 00:58:59', '2021-11-24 00:58:59', NULL),
(14, 2, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-24 19:20:58', '2021-11-24 19:20:58', NULL),
(16, 4, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-24 19:38:47', '2021-11-24 19:38:47', NULL),
(17, 4, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', NULL, '2021-11-24 20:01:24', '2021-11-24 20:01:24', NULL),
(18, 4, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'ok', '2021-11-24 20:07:09', '2021-11-24 20:07:09', NULL),
(19, 4, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'sudah sesuai', '2021-11-24 20:30:53', '2021-11-24 20:30:53', NULL),
(20, 4, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-24 20:40:01', '2021-11-24 20:40:01', NULL),
(21, 4, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', NULL, '2021-11-24 21:31:55', '2021-11-24 21:31:55', NULL),
(23, 4, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-24 21:55:14', '2021-11-24 21:55:14', NULL),
(24, 6, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-25 06:41:45', '2021-11-25 06:41:45', NULL),
(25, 6, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Proses', '2021-11-25 06:43:39', '2021-11-25 06:43:39', NULL),
(26, 6, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'Ok', '2021-11-25 06:46:26', '2021-11-25 06:46:26', NULL),
(27, 6, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', NULL, '2021-11-25 06:49:36', '2021-11-25 06:49:36', NULL),
(28, 6, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-25 06:50:32', '2021-11-25 06:50:32', NULL),
(29, 6, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', NULL, '2021-11-25 06:51:15', '2021-11-25 06:51:15', NULL),
(30, 6, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-25 06:52:49', '2021-11-25 06:52:49', NULL),
(34, 8, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH Ir. RAZILU, M.Si.', NULL, '2021-11-25 23:51:07', '2021-11-25 23:51:07', NULL),
(35, 8, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh Ir. RAZILU, M.Si.', NULL, '2021-11-25 23:51:41', '2021-11-25 23:51:41', NULL),
(36, 8, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh NIA WULANDARI, S. E', NULL, '2021-11-26 00:04:11', '2021-11-26 00:04:11', NULL),
(37, 9, 'RENCANA', 1, 9, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH AMI AMATUNISSA, S.H., M.H.', NULL, '2021-11-26 00:06:00', '2021-11-26 00:06:00', NULL),
(38, 9, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', NULL, '2021-11-26 00:07:09', '2021-11-26 00:07:09', NULL),
(39, 9, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh NIA WULANDARI, S. E', NULL, '2021-11-26 00:07:30', '2021-11-26 00:07:30', NULL),
(40, 9, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', NULL, '2021-11-26 00:10:46', '2021-11-26 00:10:46', NULL),
(41, 9, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh NIA WULANDARI, S. E', NULL, '2021-11-26 00:11:25', '2021-11-26 00:11:25', NULL),
(42, 9, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh JOKO MARTANTO, S.E, M.SI.', NULL, '2021-11-26 00:13:36', '2021-11-26 00:13:36', NULL),
(43, 9, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh EMMANIA NOVADA SUDARNO, S.E.', NULL, '2021-11-26 00:14:59', '2021-11-26 00:14:59', NULL),
(44, 10, 'RENCANA', 1, 9, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH AMI AMATUNISSA, S.H., M.H.', NULL, '2021-11-26 00:22:31', '2021-11-26 00:22:31', NULL),
(45, 10, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'Proses yaaa', '2021-11-26 00:23:35', '2021-11-26 00:23:35', NULL),
(46, 10, 'RETUR DARI ADMIN KEUANGAN', 5, 1, 'kegiatan di retur oleh ADMIN KEUANGAN untuk di revisi oleh NIA WULANDARI, S. E', 'maker', '2021-11-30 18:10:34', '2021-11-30 18:10:34', NULL),
(47, 10, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'aaaaaaaaaaaa', '2021-11-30 18:11:31', '2021-11-30 18:11:31', NULL),
(48, 10, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh NIA WULANDARI, S. E', 'yaayayay', '2021-11-30 18:13:15', '2021-11-30 18:13:15', NULL),
(49, 10, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'kirim', '2021-11-30 19:45:57', '2021-11-30 19:45:57', NULL),
(50, 10, 'RETUR DARI ADMIN KEUANGAN', 5, 1, 'kegiatan di retur oleh ADMIN KEUANGAN untuk di revisi oleh NIA WULANDARI, S. E', 'Revisi Maknya salah', '2021-11-30 20:02:49', '2021-11-30 20:02:49', NULL),
(51, 10, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'kirim', '2021-11-30 22:44:58', '2021-11-30 22:44:58', NULL),
(52, 10, 'RETUR DARI ADMIN KEUANGAN', 5, 1, 'kegiatan di retur oleh ADMIN KEUANGAN untuk di revisi oleh NIA WULANDARI, S. E', 'Perbaiki', '2021-11-30 23:38:19', '2021-11-30 23:38:19', NULL),
(53, 10, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 9, 'kegiatan telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'ok', '2021-11-30 23:38:37', '2021-11-30 23:38:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_realisasi`
--

CREATE TABLE `kegiatan_realisasi` (
  `id` int(11) NOT NULL,
  `total_realisasi` double NOT NULL DEFAULT 0,
  `checker_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_realisasi_lampiran`
--

CREATE TABLE `kegiatan_realisasi_lampiran` (
  `id` int(11) NOT NULL,
  `realisasi_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mak`
--

CREATE TABLE `mak` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pagu` double NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `tahun_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mak`
--

INSERT INTO `mak` (`id`, `kode`, `nama`, `pagu`, `bidang_id`, `tahun_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1563.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 266229000, 1, 1, 1, NULL, NULL, NULL),
(2, '1563.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 184406000, 1, 1, 1, NULL, NULL, NULL),
(3, '1563.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 527756000, 1, 1, 1, NULL, NULL, NULL),
(4, '1563.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 695640000, 1, 1, 1, NULL, NULL, NULL),
(5, '1563.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 15615000, 1, 1, 1, NULL, NULL, NULL),
(6, '1563.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 50076000, 1, 1, 1, NULL, NULL, NULL),
(7, '1563.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 103575000, 1, 1, 1, NULL, NULL, NULL),
(8, '1563.EAK.001.054.B.524119', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 277682000, 1, 1, 1, NULL, NULL, NULL),
(9, '1563.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 43460000, 1, 1, 1, NULL, NULL, NULL),
(10, '1563.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 39924000, 1, 1, 1, NULL, NULL, NULL),
(11, '1563.EAK.002.051.A.524111', 'Pendampingan Satker-Belanja Perjalanan Dinas Biasa', 402730000, 1, 1, 1, NULL, NULL, NULL),
(12, '1563.TAK.001.051.A.524111', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 650039000, 1, 1, 1, NULL, NULL, NULL),
(13, '1563.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Biasa', 227809000, 1, 1, 1, NULL, NULL, NULL),
(14, '1563.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 146185000, 1, 1, 1, NULL, NULL, NULL),
(15, '1564.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 505794000, 2, 1, 1, NULL, NULL, NULL),
(16, '1564.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 264090000, 2, 1, 1, NULL, NULL, NULL),
(17, '1564.EAK.001.051.B.524113', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Dalam Kota', 5250000, 2, 1, 1, NULL, NULL, NULL),
(18, '1564.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 464290000, 2, 1, 1, NULL, NULL, NULL),
(19, '1564.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 350152000, 2, 1, 1, NULL, NULL, NULL),
(20, '1564.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 25530000, 2, 1, 1, NULL, NULL, NULL),
(21, '1564.EAK.001.052.A.524113', 'Reviu RKA-K/L (Penyusunan dan Revisi)-Belanja Perjalanan Dinas Dalam Kota', 63000000, 2, 1, 1, NULL, NULL, NULL),
(22, '1564.EAK.001.052.B.524113', 'Reviu RKBMN-Belanja Perjalanan Dinas Dalam Kota', 18900000, 2, 1, 1, NULL, NULL, NULL),
(23, '1564.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 57840000, 2, 1, 1, NULL, NULL, NULL),
(24, '1564.EAK.001.052.C.524113', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Dalam Kota', 12600000, 2, 1, 1, NULL, NULL, NULL),
(25, '1564.EAK.001.052.D.524113', 'Reviu Penyerapan Anggaran-Belanja Perjalanan Dinas Dalam Kota', 13455000, 2, 1, 1, NULL, NULL, NULL),
(26, '1564.EAK.001.052.E.524113', 'Reviu LAKIP-Belanja Perjalanan Dinas Dalam Kota', 210000, 2, 1, 1, NULL, NULL, NULL),
(27, '1564.EAK.001.053.A.524113', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Dalam Kota', 5880000, 2, 1, 1, NULL, NULL, NULL),
(28, '1564.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 4200000, 2, 1, 1, NULL, NULL, NULL),
(29, '1564.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 15110000, 2, 1, 1, NULL, NULL, NULL),
(30, '1564.EAK.001.054.B.524113', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Dalam Kota', 6300000, 2, 1, 1, NULL, NULL, NULL),
(31, '1564.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 16010000, 2, 1, 1, NULL, NULL, NULL),
(32, '1564.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 15910000, 2, 1, 1, NULL, NULL, NULL),
(33, '1564.EAK.001.054.E.524111', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Biasa', 11930000, 2, 1, 1, NULL, NULL, NULL),
(34, '1564.EAK.001.054.E.524113', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Dalam Kota', 15135000, 2, 1, 1, NULL, NULL, NULL),
(35, '1564.EAK.001.054.E.524119', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 216592000, 2, 1, 1, NULL, NULL, NULL),
(36, '1564.EAK.002.051.A.524111', 'Pendampingan Satuan Kerja-Belanja Perjalanan Dinas Biasa', 603672000, 2, 1, 1, NULL, NULL, NULL),
(37, '1564.EAK.002.051.A.524113', 'Pendampingan Satuan Kerja-Belanja Perjalanan Dinas Dalam Kota', 30555000, 2, 1, 1, NULL, NULL, NULL),
(38, '1564.TAK.001.051.A.524111', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 657922000, 2, 1, 1, NULL, NULL, NULL),
(39, '1564.TAK.001.051.A.524113', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 20175000, 2, 1, 1, NULL, NULL, NULL),
(40, '1564.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Biasa', 245121000, 2, 1, 1, NULL, NULL, NULL),
(41, '1564.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 10935000, 2, 1, 1, NULL, NULL, NULL),
(42, '1564.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 66792000, 2, 1, 1, NULL, NULL, NULL),
(43, '1564.TAK.001.052.A.524113', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Dalam Kota', 11925000, 2, 1, 1, NULL, NULL, NULL),
(44, '1565.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 249763000, 3, 1, 1, NULL, NULL, NULL),
(45, '1565.EAK.001.051.A.524113', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Dalam Kota', 26040000, 3, 1, 1, NULL, NULL, NULL),
(46, '1565.EAK.001.051.B.524111', 'Audit Kinerja atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 271078000, 3, 1, 1, NULL, NULL, NULL),
(47, '1565.EAK.001.051.B.524113', 'Audit Kinerja atas Tugas dan Fungsi-Belanja Perjalanan Dinas Dalam Kota', 25620000, 3, 1, 1, NULL, NULL, NULL),
(48, '1565.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 344975000, 3, 1, 1, NULL, NULL, NULL),
(49, '1565.EAK.001.051.C.524113', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Dalam Kota', 25200000, 3, 1, 1, NULL, NULL, NULL),
(50, '1565.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 483528000, 3, 1, 1, NULL, NULL, NULL),
(51, '1565.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 147840000, 3, 1, 1, NULL, NULL, NULL),
(52, '1565.EAK.001.052.A.524111', 'Reviu RKA-K/L (Penyusunan dan Revisi)-Belanja Perjalanan Dinas Biasa', 95620000, 3, 1, 1, NULL, NULL, NULL),
(53, '1565.EAK.001.052.B.524111', 'Reviu RKBMN-Belanja Perjalanan Dinas Biasa', 22290000, 3, 1, 1, NULL, NULL, NULL),
(54, '1565.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 67000000, 3, 1, 1, NULL, NULL, NULL),
(55, '1565.EAK.001.053.A.524113', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Dalam Kota', 4200000, 3, 1, 1, NULL, NULL, NULL),
(56, '1565.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 210000, 3, 1, 1, NULL, NULL, NULL),
(57, '1565.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 81054000, 3, 1, 1, NULL, NULL, NULL),
(58, '1565.EAK.001.054.B.524113', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Dalam Kota', 7350000, 3, 1, 1, NULL, NULL, NULL),
(59, '1565.EAK.001.054.C.524111', 'Evaluasi Manajemen Resiko-Belanja Perjalanan Dinas Biasa', 177916000, 3, 1, 1, NULL, NULL, NULL),
(60, '1565.EAK.001.054.C.524113', 'Evaluasi Manajemen Resiko-Belanja Perjalanan Dinas Dalam Kota', 10290000, 3, 1, 1, NULL, NULL, NULL),
(61, '1565.EAK.001.054.C.524119', 'Evaluasi Manajemen Resiko-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 140886000, 3, 1, 1, NULL, NULL, NULL),
(62, '1565.EAK.001.054.D.524113', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Dalam Kota', 4200000, 3, 1, 1, NULL, NULL, NULL),
(63, '1565.EAK.001.054.E.524113', 'Evaluasi PPMPRB-Belanja Perjalanan Dinas Dalam Kota', 210000, 3, 1, 1, NULL, NULL, NULL),
(64, '1565.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 498497000, 3, 1, 1, NULL, NULL, NULL),
(65, '1565.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 63570000, 3, 1, 1, NULL, NULL, NULL),
(66, '1565.TAK.001.051.A.524111', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 646478000, 3, 1, 1, NULL, NULL, NULL),
(67, '1565.TAK.001.051.A.524113', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 31500000, 3, 1, 1, NULL, NULL, NULL),
(68, '1565.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Biasa', 255868000, 3, 1, 1, NULL, NULL, NULL),
(69, '1565.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 39900000, 3, 1, 1, NULL, NULL, NULL),
(70, '1565.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 44532000, 3, 1, 1, NULL, NULL, NULL),
(71, '1565.TAK.001.052.A.524113', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Dalam Kota', 7350000, 3, 1, 1, NULL, NULL, NULL),
(72, '1566.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara dan/atau PNBP-Belanja Perjalanan Dinas Biasa', 446205000, 4, 1, 1, NULL, NULL, NULL),
(73, '1566.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 186643000, 4, 1, 1, NULL, NULL, NULL),
(74, '1566.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 337935000, 4, 1, 1, NULL, NULL, NULL),
(75, '1566.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 633944000, 4, 1, 1, NULL, NULL, NULL),
(76, '1566.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 72150000, 4, 1, 1, NULL, NULL, NULL),
(77, '1566.EAK.001.052.A.524113', 'Reviu RKA-K/L-Belanja Perjalanan Dinas Dalam Kota', 29400000, 4, 1, 1, NULL, NULL, NULL),
(78, '1566.EAK.001.052.B.524111', 'Reviu RKBMN-Belanja Perjalanan Dinas Biasa', 37036000, 4, 1, 1, NULL, NULL, NULL),
(79, '1566.EAK.001.052.B.524113', 'Reviu RKBMN-Belanja Perjalanan Dinas Dalam Kota', 14700000, 4, 1, 1, NULL, NULL, NULL),
(80, '1566.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 44710000, 4, 1, 1, NULL, NULL, NULL),
(81, '1566.EAK.001.052.C.524119', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 337132000, 4, 1, 1, NULL, NULL, NULL),
(82, '1566.EAK.001.052.D.524113', 'Reviu Penyerapan Anggaran-Belanja Perjalanan Dinas Dalam Kota', 9240000, 4, 1, 1, NULL, NULL, NULL),
(83, '1566.EAK.001.052.E.524113', 'Reviu LAKIP-Belanja Perjalanan Dinas Dalam Kota', 210000, 4, 1, 1, NULL, NULL, NULL),
(84, '1566.EAK.001.053.A.524111', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Biasa', 39665000, 4, 1, 1, NULL, NULL, NULL),
(85, '1566.EAK.001.054.A.524111', 'Evaluasi AKIP-Belanja Perjalanan Dinas Biasa', 29066000, 4, 1, 1, NULL, NULL, NULL),
(86, '1566.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 6300000, 4, 1, 1, NULL, NULL, NULL),
(87, '1566.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 55232000, 4, 1, 1, NULL, NULL, NULL),
(88, '1566.EAK.001.054.B.524113', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Dalam Kota', 10500000, 4, 1, 1, NULL, NULL, NULL),
(89, '1566.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 52048000, 4, 1, 1, NULL, NULL, NULL),
(90, '1566.EAK.001.054.C.524113', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Dalam Kota', 5670000, 4, 1, 1, NULL, NULL, NULL),
(91, '1566.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 13426000, 4, 1, 1, NULL, NULL, NULL),
(92, '1566.EAK.001.054.E.524113', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Dalam Kota', 2520000, 4, 1, 1, NULL, NULL, NULL),
(93, '1566.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 345412000, 4, 1, 1, NULL, NULL, NULL),
(94, '1566.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 24360000, 4, 1, 1, NULL, NULL, NULL),
(95, '1566.TAK.001.051.A.524111', 'Evaluasi/ Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 646114000, 4, 1, 1, NULL, NULL, NULL),
(96, '1566.TAK.001.051.A.524113', 'Evaluasi/ Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 11550000, 4, 1, 1, NULL, NULL, NULL),
(97, '1566.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Biasa', 277225000, 4, 1, 1, NULL, NULL, NULL),
(98, '1566.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 10500000, 4, 1, 1, NULL, NULL, NULL),
(99, '1566.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 66966000, 4, 1, 1, NULL, NULL, NULL),
(100, '1566.TAK.001.052.A.524113', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Dalam Kota', 8820000, 4, 1, 1, NULL, NULL, NULL),
(101, '1567.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 497592000, 5, 1, 1, NULL, NULL, NULL),
(102, '1567.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 175102000, 5, 1, 1, NULL, NULL, NULL),
(103, '1567.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 377318000, 5, 1, 1, NULL, NULL, NULL),
(104, '1567.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 390384000, 5, 1, 1, NULL, NULL, NULL),
(105, '1567.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 5040000, 5, 1, 1, NULL, NULL, NULL),
(106, '1567.EAK.001.052.B.524111', 'Reviu RKBMN-Belanja Perjalanan Dinas Biasa', 7920000, 5, 1, 1, NULL, NULL, NULL),
(107, '1567.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 58570000, 5, 1, 1, NULL, NULL, NULL),
(108, '1567.EAK.001.052.E.524119', 'Reviu LAKIP-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 172284000, 5, 1, 1, NULL, NULL, NULL),
(109, '1567.EAK.001.053.A.524111', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Biasa', 61884000, 5, 1, 1, NULL, NULL, NULL),
(110, '1567.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 16830000, 5, 1, 1, NULL, NULL, NULL),
(111, '1567.EAK.001.054.A.524119', 'Evaluasi AKIP-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 251012000, 5, 1, 1, NULL, NULL, NULL),
(112, '1567.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 31452000, 5, 1, 1, NULL, NULL, NULL),
(113, '1567.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 26772000, 5, 1, 1, NULL, NULL, NULL),
(114, '1567.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 24912000, 5, 1, 1, NULL, NULL, NULL),
(115, '1567.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 547592000, 5, 1, 1, NULL, NULL, NULL),
(116, '1567.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 13725000, 5, 1, 1, NULL, NULL, NULL),
(117, '1567.TAK.001.051.A.524111', 'Evaluasi/Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 624844000, 5, 1, 1, NULL, NULL, NULL),
(118, '1567.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Biasa', 142990000, 5, 1, 1, NULL, NULL, NULL),
(119, '1567.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 73572000, 5, 1, 1, NULL, NULL, NULL),
(120, '1567.TAK.001.052.A.524119', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 156480000, 5, 1, 1, NULL, NULL, NULL),
(121, '1568.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara dan/atau PNBP-Belanja Perjalanan Dinas Biasa', 476674000, 6, 1, 1, NULL, NULL, NULL),
(122, '1568.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 234745000, 6, 1, 1, NULL, NULL, NULL),
(123, '1568.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 326344000, 6, 1, 1, NULL, NULL, NULL),
(124, '1568.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 1291012000, 6, 1, 1, NULL, NULL, NULL),
(125, '1568.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 73500000, 6, 1, 1, NULL, NULL, NULL),
(126, '1568.EAK.001.052.A.524113', 'Reviu RKA-K/L-Belanja Perjalanan Dinas Dalam Kota', 63000000, 6, 1, 1, NULL, NULL, NULL),
(127, '1568.EAK.001.052.B.524113', 'Reviu RKBMN-Belanja Perjalanan Dinas Dalam Kota', 15120000, 6, 1, 1, NULL, NULL, NULL),
(128, '1568.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 63500000, 6, 1, 1, NULL, NULL, NULL),
(129, '1568.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 9675000, 6, 1, 1, NULL, NULL, NULL),
(130, '1568.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 28054000, 6, 1, 1, NULL, NULL, NULL),
(131, '1568.EAK.001.054.C.524113', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Dalam Kota', 4200000, 6, 1, 1, NULL, NULL, NULL),
(132, '1568.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 24608000, 6, 1, 1, NULL, NULL, NULL),
(133, '1568.EAK.001.054.E.524113', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Dalam Kota', 5250000, 6, 1, 1, NULL, NULL, NULL),
(134, '1568.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 81511000, 6, 1, 1, NULL, NULL, NULL),
(135, '1568.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 15120000, 6, 1, 1, NULL, NULL, NULL),
(136, '1568.TAK.001.051.A.524111', 'Evaluasi/Penilaian TPI terhdapa Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 607573000, 6, 1, 1, NULL, NULL, NULL),
(137, '1568.TAK.001.051.A.524113', 'Evaluasi/Penilaian TPI terhdapa Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 20280000, 6, 1, 1, NULL, NULL, NULL),
(138, '1568.TAK.001.051.A.524119', 'Evaluasi/Penilaian TPI terhdapa Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 1696262000, 6, 1, 1, NULL, NULL, NULL),
(139, '1568.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Biasa', 1275887000, 6, 1, 1, NULL, NULL, NULL),
(140, '1568.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 28350000, 6, 1, 1, NULL, NULL, NULL),
(141, '1569.EAB.001.051.A.524113', 'Penyusunan KPJM/JAKWAS/PK/PKPT/PKAU-Belanja Perjalanan Dinas Dalam Kota', 1650000, 9, 1, 1, NULL, NULL, NULL),
(142, '1569.EAB.001.052.A.524111', 'Penyusunan RKA-K/L / DIPA /Perubahan Anggaran-Belanja Perjalanan Dinas Biasa', 30340000, 9, 1, 1, NULL, NULL, NULL),
(143, '1569.EAB.002.051.A.524113', 'Pengelolaan pelaksanaan anggaran, pembayaran gaji, tunjangan pegawai dan revisi anggaran-Belanja Perjalanan Dinas Dalam Kota', 2700000, 10, 1, 1, NULL, NULL, NULL),
(144, '1569.EAB.002.051.B.524111', 'Pembukuan, Perhitungan, dan Penyusunan Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 297740000, 10, 1, 1, NULL, NULL, NULL),
(145, '1569.EAB.002.051.C.521211', 'Pengelolaan Pelaksanaan Kegiatan Perjalanan Dinas-Belanja Bahan', 13953000, 10, 1, 1, NULL, NULL, NULL),
(146, '1569.EAB.002.051.C.522151', 'Pengelolaan Pelaksanaan Kegiatan Perjalanan Dinas-Belanja Jasa Profesi', 1800000, 10, 1, 1, NULL, NULL, NULL),
(147, '1569.EAB.002.052.A.524113', 'Informasi Penatausahaan Keuangan dan Perbendaharaan-Belanja Perjalanan Dinas Dalam Kota', 4500000, 10, 1, 1, NULL, NULL, NULL),
(148, '1569.EAC.001.051.A.524111', 'Pengelolaan Rumah Tangga dan BMN-Belanja Perjalanan Dinas Biasa', 44870000, 7, 1, 1, NULL, NULL, NULL),
(149, '1569.EAC.001.051.A.524113', 'Pengelolaan Rumah Tangga dan BMN-Belanja Perjalanan Dinas Dalam Kota', 2400000, 7, 1, 1, NULL, NULL, NULL),
(150, '1569.EAC.001.052.A.524113', 'Pengelolaan Rumah Tangga dan Perlengkapan-Belanja Perjalanan Dinas Dalam Kota', 7200000, 7, 1, 1, NULL, NULL, NULL),
(151, '1569.EAC.002.051.A.524113', 'Pengelolaan Tata Usaha dan Persuratan-Belanja Perjalanan Dinas Dalam Kota', 8460000, 7, 1, 1, NULL, NULL, NULL),
(152, '1569.EAC.002.052.A.524113', 'Pengelolaan Persuratan dan tata naskah dinas-Belanja Perjalanan Dinas Dalam Kota', 8460000, 7, 1, 1, NULL, NULL, NULL),
(153, '1569.EAF.001.051.A.524113', 'Pengelolaan sasaran kinerja pegawai, administrasi umum kepegawaian, dan peningkatan kompetensi-Belanja Perjalanan Dinas Dalam Kota', 6000000, 8, 1, 1, NULL, NULL, NULL),
(154, '1569.EAF.001.052.A.524111', 'Pengelolaan administrasi jabatan struktural/fungsional, perencanaan dan analisa kebutuhan pengembangan pegawai-Belanja Perjalanan Dinas Biasa', 80682000, 8, 1, 1, NULL, NULL, NULL),
(155, '1569.EAF.001.052.A.524113', 'Pengelolaan administrasi jabatan struktural/fungsional, perencanaan dan analisa kebutuhan pengembangan pegawai-Belanja Perjalanan Dinas Dalam Kota', 17850000, 8, 1, 1, NULL, NULL, NULL),
(156, '1569.EAF.001.052.A.524119', 'Pengelolaan administrasi jabatan struktural/fungsional, perencanaan dan analisa kebutuhan pengembangan pegawaiBelanja Perjalanan Dinas Paket Meeting Luar Kota', 221448000, 8, 1, 1, NULL, NULL, NULL),
(157, '1569.EAF.001.053.A.524111', 'Mutasi, Promosi dan Pemberentian pegawai-Belanja Perjalanan Dinas Biasa', 243336000, 8, 1, 1, NULL, NULL, NULL),
(158, '1569.EAF.001.053.A.524113', 'Mutasi, Promosi dan Pemberentian pegawai-Belanja Perjalanan Dinas Dalam Kota', 10320000, 8, 1, 1, NULL, NULL, NULL),
(159, '1569.EAI.001.051.A.524111', 'Penyelenggaraan Kehumasan dan peliputan-Belanja Perjalanan Dinas Biasa', 90480000, 9, 1, 1, NULL, NULL, NULL),
(160, '1569.EAI.001.051.A.524113', 'Penyelenggaraan Kehumasan dan peliputan-Belanja Perjalanan Dinas Dalam Kota', 6600000, 9, 1, 1, NULL, '2021-12-07 01:17:01', NULL),
(161, '1569.EAI.002.051.A.524111', 'Pengelolaan Layanan Pengaduan-Belanja Perjalanan Dinas Biasa', 81958000, 11, 1, 1, NULL, NULL, NULL),
(162, '1569.EAI.002.051.A.524113', 'Pengelolaan Layanan Pengaduan-Belanja Perjalanan Dinas Dalam Kota', 4350000, 11, 1, 1, NULL, NULL, NULL),
(163, '1569.EAI.003.051.A.524113', 'Pengelolaan Tata Usaha Pimpinan dan Protokoler-Belanja Perjalanan Dinas Dalam Kota', 18000000, 7, 1, 1, NULL, NULL, NULL),
(164, '1569.EAI.003.052.A.524111', 'Koordinasi Pengawasan/Pembinaan Pimpinan-Belanja Perjalanan Dinas Biasa', 1094700000, 7, 1, 1, NULL, NULL, NULL),
(165, '1569.EAJ.001.052.A.524111', 'Pengelolaan database hasil pengawasan Inspektorat Jenderal, berbasis teknologi infomasi dan hukuman disiplin-Belanja Perjalanan Dinas Biasa', 239309000, 11, 1, 1, NULL, NULL, NULL),
(166, '1569.EAJ.001.053.A.524113', 'Pengelolaan database hasil pemeriksaan BPK, BPKP dan ORI berbasis teknologi informasi-Belanja Perjalanan Dinas Dalam Kota', 6000000, 11, 1, 1, NULL, NULL, NULL),
(167, '1569.EAK.001.051.A.524111', 'Pelaksanaan Pencegahan, Penindakan, Yustisi dan Kesekretariatan UPP Kemenkumkam-Belanja Perjalanan Dinas Biasa', 273583000, 11, 1, 1, NULL, NULL, NULL),
(168, '1569.EAK.001.051.A.524113', 'Pelaksanaan Pencegahan, Penindakan, Yustisi dan Kesekretariatan UPP Kemenkumkam-Belanja Perjalanan Dinas Dalam Kota', 6000000, 11, 1, 1, NULL, NULL, NULL),
(169, '1569.EAK.001.051.B.524113', 'Audit eksternal ISO 37001:2016 Sistem Manajemen Anti Suap (SMAP) tahun Pertama oleh Lembaga Sertifikasi ISO SMAP-Belanja Perjalanan Dinas Dalam Kota', 2400000, 11, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mak2`
--

CREATE TABLE `mak2` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pagu` double NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `tahun_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mak2`
--

INSERT INTO `mak2` (`id`, `kode`, `nama`, `pagu`, `bidang_id`, `tahun_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1563.321.051.A.524111', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 387720000, 1, 1, 1, '2021-09-30 14:04:18', '2021-11-14 03:15:37', NULL),
(2, '1563.321.051.A.524112', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 503000000, 2, 1, 1, '2021-10-04 07:48:34', '2021-11-14 03:15:37', NULL),
(3, '1563.321.051.A.524113', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 63370000, 3, 1, 1, '2021-10-04 08:05:25', '2021-11-11 02:47:43', NULL),
(4, '14141.14141', 'Perjalanan Dinas', 1348910000, 1, 1, 1, '2021-10-08 05:21:25', '2021-11-13 07:42:46', NULL),
(5, '1239189381028', 'alksdjlkasjdklasjdlkaj', 100000000, 7, 1, 5, '2021-11-16 23:55:31', '2021-11-16 23:55:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(3) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `nip` varchar(40) DEFAULT NULL,
  `golongan_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_masuk_itjen` date DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nip`, `golongan_id`, `jabatan_id`, `bidang_id`, `tanggal_lahir`, `tanggal_masuk_itjen`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ir. RAZILU, M.Si.', '196511281991031002', 1, 1, 9, '1965-11-28', NULL, NULL, NULL, NULL, NULL),
(2, 'BUDI, S.H.', '196211251989031002', 2, 2, 9, '1962-11-25', NULL, NULL, NULL, NULL, NULL),
(3, 'AHMAD RIFAI, S.H.,M.H.', '196212131986031001', 2, 2, 9, '1962-12-13', NULL, NULL, NULL, NULL, NULL),
(4, 'LULUK RATNANINGTYAS, S.H., M.Hum.', '196310011991032001', 2, 2, 9, '1963-10-01', NULL, NULL, NULL, NULL, NULL),
(5, 'Drs. KHAIRUDDIN, M.Si.', '196202011990031001', 2, 2, 9, '1962-02-01', NULL, NULL, NULL, NULL, NULL),
(6, 'Drs. MARASIDIN, Bc.I.P., M.H.', '196404251990011001', 2, 2, 9, '1964-04-25', NULL, NULL, NULL, NULL, NULL),
(7, 'Drs. THOLIB., S.H., M.H', '196308111988111001', 2, 3, 9, '1963-08-11', NULL, NULL, NULL, NULL, NULL),
(8, 'ISMANJONO, S.H.', '196209171983031001', 3, 6, 9, '1962-09-17', NULL, NULL, NULL, NULL, NULL),
(9, 'ICON SIREGAR, S.H.', '196304171983031001', 3, 2, 9, '1963-04-17', NULL, NULL, NULL, NULL, NULL),
(10, 'SETIAWATI, S.H., C.N.,M.H.', '196208231983102001', 3, 6, 9, '1962-08-23', NULL, NULL, NULL, NULL, NULL),
(11, 'RANI OCTARIANI, S.H., M.H.', '197010091998032001', 3, 6, 9, '1970-10-09', NULL, NULL, NULL, NULL, NULL),
(12, 'ERBATA SRI MULIATINI, S.H., M.M.', '197006061998032001', 3, 6, 9, '1970-06-06', NULL, NULL, NULL, NULL, NULL),
(13, 'PURNAWAN HARI, S.H., M.H.', '196111101994031001', 4, 6, 9, '1961-11-10', NULL, NULL, NULL, NULL, NULL),
(14, 'ICHSANUDIN EKO SAPUTRO, S.H., M.Si.', '196710271993031001', 4, 6, 9, '1967-10-27', NULL, NULL, NULL, NULL, NULL),
(15, 'QOLBIN SALIM, S.E., M.H.', '196507201994031001', 4, 6, 9, '1965-07-20', NULL, NULL, NULL, NULL, NULL),
(16, 'ANDRIYANTO W. P, S.H., M.H.', '197012181999031002', 3, 6, 9, '1970-12-18', NULL, NULL, NULL, NULL, NULL),
(17, 'JOKO MARTANTO, S.E, M.SI.', '197203051999031007', 4, 5, 9, '1972-03-05', NULL, NULL, NULL, NULL, NULL),
(18, 'TATIE RAINI, S.Sos', '196206171986112001', 4, 6, 9, '1962-06-17', NULL, NULL, NULL, NULL, NULL),
(19, 'Drs. ENDANG SUPRIYATNO, S.E., M.Si.', '196210031991031001', 4, 6, 9, '1962-10-03', NULL, NULL, NULL, NULL, NULL),
(20, 'AMINULLAH NOOR PAKPAHAN, S.H., M.H.', '196406211993031001', 4, 6, 9, '1964-06-21', NULL, NULL, NULL, NULL, NULL),
(21, 'M RUSLI B, S.H.', '196302271998031001', 4, 6, 9, '1963-02-27', NULL, NULL, NULL, NULL, NULL),
(22, 'TITUT SULISTYANINGSIH, S.E.,M.Si', '197508291999032001', 4, 6, 9, '1975-08-29', NULL, NULL, NULL, NULL, NULL),
(23, 'AGUNG NATANAEL, S.H., M.H.', '197107231997031001', 4, 6, 9, '1971-07-23', NULL, NULL, NULL, NULL, NULL),
(24, 'ERIE WIJAYA, S.H.', '196905061998031001', 4, 6, 9, '1969-05-06', NULL, NULL, NULL, NULL, NULL),
(25, 'AMI AMATUNISSA, S.H., M.H.', '197003271998032001', 4, 6, 9, '1970-03-27', NULL, NULL, NULL, NULL, NULL),
(26, 'SARWADI, S.H., M.H.', '196405151985031016', 4, 5, 9, '1964-05-15', NULL, NULL, NULL, NULL, NULL),
(27, 'MUHAMAD MUFID, S.Ag., M.Si., M.H.', '197603042005011001', 4, 5, 9, '1976-03-04', NULL, NULL, NULL, NULL, NULL),
(28, 'Dr. INDRA JAYA ALI, S.E,.M.Si', '197410112001121001', 4, 6, 9, '1974-10-11', NULL, NULL, NULL, NULL, NULL),
(29, 'EEM NURMANAH, S.Sos., M.Si.', '196906071992032001', 4, 7, 9, '1969-06-07', NULL, NULL, NULL, NULL, NULL),
(30, 'ARI PRAMBUDI, S.H., M.H.', '197002141998031001', 4, 6, 9, '1970-02-14', NULL, NULL, NULL, NULL, NULL),
(31, 'SUPERMAN, S.E.', '197003241999031001', 4, 6, 9, '1970-03-24', NULL, NULL, NULL, NULL, NULL),
(32, 'TIARMA ROSA SINAGA, S.H., M.H., M.Ak.', '197005212005012001', 5, 6, 9, '1970-05-21', NULL, NULL, NULL, NULL, NULL),
(33, 'YON SUMITRO, S.H.', '197201012000031001', 5, 6, 9, '1972-01-01', NULL, NULL, NULL, NULL, NULL),
(34, 'SYAHRIZAL LUBIS, S.H., M.H.', '196908132001121001', 5, 12, 9, '1969-08-13', NULL, NULL, NULL, NULL, NULL),
(35, 'DENNY DARMAWAN, S.E., M.H.', '197301192001121001', 5, 12, 9, '1973-01-19', NULL, NULL, NULL, NULL, NULL),
(36, 'SLAMET IMAN SANTOSO, S.E., M.M.', '197505202001121002', 5, 5, 9, '1975-05-20', NULL, NULL, NULL, NULL, NULL),
(37, 'LELY NURACHMI, S.H., M.H.', '196303261985032001', 5, 6, 9, '1963-03-26', NULL, NULL, NULL, NULL, NULL),
(38, 'NUR SOFIYAH, A.Md.,S.IP., M.M.', '196910131992032001', 4, 6, 9, '1969-10-13', NULL, NULL, NULL, NULL, NULL),
(39, 'ARI FARDIANTO, S.E.', '196504191999031001', 5, 6, 9, '1965-04-19', NULL, NULL, NULL, NULL, NULL),
(40, 'SITI SOFIATUN, S.E., M.Si.', '197812282003122001', 4, 6, 9, '1978-12-28', NULL, NULL, NULL, NULL, NULL),
(41, 'TRI ANDAYANI, S.E., M.M.', '197901092003122001', 4, 6, 9, '1979-01-09', NULL, NULL, NULL, NULL, NULL),
(42, 'MADDALENA SARAGI, S.H., M.Kn., M.M.', '197412092005012001', 4, 6, 9, '1974-12-09', NULL, NULL, NULL, NULL, NULL),
(43, 'DOKTOR GURNING, S.H., M.Si.', '197908302005011001', 5, 6, 9, '1979-08-30', NULL, NULL, NULL, NULL, NULL),
(44, 'BANERIAMA, S.H., M.H.', '197306231994032001', 5, 12, 9, '1973-06-23', NULL, NULL, NULL, NULL, NULL),
(45, 'NANIH KUSNANI, A.Md., S.Sos., M.Ak.', '197212041999032001', 5, 5, 9, '1972-12-04', NULL, NULL, NULL, NULL, NULL),
(46, 'DIAN SAPTAWATI, S.E., M.Si.', '197712102005012002', 5, 12, 9, '1977-12-10', NULL, NULL, NULL, NULL, NULL),
(47, 'HARI PURWANTO, A.Md., S.E., M.Si.', '197201172001121001', 6, 8, 9, '1972-01-17', NULL, NULL, NULL, NULL, NULL),
(48, 'MILANTO SIMANJUNTAK, S.E.', '197505222003121001', 6, 12, 9, '1975-05-22', NULL, NULL, NULL, NULL, NULL),
(49, 'HARRY LESMANA, S.T., M.Si', '198011222003121001', 6, 8, 9, '1980-11-22', NULL, NULL, NULL, NULL, NULL),
(50, 'NURMALASARI, S.H., M.H.', '197909011999032001', 5, 12, 9, '1979-09-01', NULL, NULL, NULL, NULL, NULL),
(51, 'ANTON PARASIAN, S.H., M.Si', '198103312006041001', 6, 8, 9, '1981-03-31', NULL, NULL, NULL, NULL, NULL),
(52, 'WAHYU SETIAWAN, S.Kom.', '197907172001121001', 6, 12, 9, '1979-07-17', NULL, NULL, NULL, NULL, NULL),
(53, 'M.H. KESUMA NEGARA, S.H., M.M.', '197101312003121001', 6, 8, 9, '1971-01-31', NULL, NULL, NULL, NULL, NULL),
(54, 'HERU SAPRUDIN, S.H.', '197102192001121001', 6, 12, 9, '1971-02-19', NULL, NULL, NULL, NULL, NULL),
(55, 'JUNITA ARISTIATI, S.E., M.Si.', '197106012001122001', 6, 8, 9, '1971-06-01', NULL, NULL, NULL, NULL, NULL),
(56, 'AGUS RIANTO, S.E.', '197208172001121002', 6, 8, 9, '1972-08-17', NULL, NULL, NULL, NULL, NULL),
(57, 'NOPALISA EGITULAS VEMBILAN, S.Kom., MMSI', '197911172003122001', 6, 8, 9, '1979-11-17', NULL, NULL, NULL, NULL, NULL),
(58, 'IQBAL ALBERT HUSIN, SH., M.Kn., M.Si', '198002162006041001', 6, 8, 9, '1980-02-16', NULL, NULL, NULL, NULL, NULL),
(59, 'FANDYLA WAHYU SASONGKO, S.H., M.Si.', '198402112006041001', 6, 8, 9, '1984-02-11', NULL, NULL, NULL, NULL, NULL),
(60, 'EDY PRABOWO SAPUTRO, S.Kom, M.Si', '198302162003121002', 6, 8, 9, '1983-02-16', NULL, NULL, NULL, NULL, NULL),
(61, 'RISTIANTI MUJI KARTIKA SARI, SH.,MSi.', '198205202006042001', 6, 8, 9, '1982-05-20', NULL, NULL, NULL, NULL, NULL),
(62, 'NASRUDIN NURDIANSYAH, S.H., M.Si.', '198309142001121002', 6, 8, 9, '1983-09-14', NULL, NULL, NULL, NULL, NULL),
(63, 'DWI ARI WIBOWO, SH., M.M.', '198503152003121003', 6, 8, 9, '1985-03-15', NULL, NULL, NULL, NULL, NULL),
(64, 'ZAIFACHATUR ROZIYAH, S.H., M.Si.', '197912262005012001', 6, 8, 9, '1979-12-26', NULL, NULL, NULL, NULL, NULL),
(65, 'BAMBANG PURWANTHO, S.H.,M.Si', '197908032006041001', 6, 8, 9, '1979-08-03', NULL, NULL, NULL, NULL, NULL),
(66, 'JUANDA MARTUA USULUDDIN NASUTION, S.H.', '198210272006041001', 6, 12, 9, '1982-10-27', NULL, NULL, NULL, NULL, NULL),
(67, 'PUJI RAHARTO, S.IP., M.M.', '196510211986031001', 6, 8, 9, '1965-10-21', NULL, NULL, NULL, NULL, NULL),
(68, 'EKA SETYAWATI, S.H., M.H.', '198002221999032002', 6, 8, 9, '1980-02-22', NULL, NULL, NULL, NULL, NULL),
(69, 'AGUS PRIYO ATMOKO, A.Md., S.E., M.H.', '198108132005011001', 6, 8, 9, '1981-08-13', NULL, NULL, NULL, NULL, NULL),
(70, 'R.ERI IRAWAN SUMANTO, S.H., M.Kn.', '197603212006041001', 6, 8, 9, '1976-03-21', NULL, NULL, NULL, NULL, NULL),
(71, 'TESSA LEO MARLINO, S.H., M.H.', '198107252006042001', 6, 8, 9, '1981-07-25', NULL, NULL, NULL, NULL, NULL),
(72, 'ARDILES RICKY SUSILO, SH., MH', '198108132006041001', 6, 8, 9, '1981-08-13', NULL, NULL, NULL, NULL, NULL),
(73, 'NIKEN AYU KUSUMANINGPURI, S.H.,M.H', '198308162006042001', 6, 8, 9, '1983-08-16', NULL, NULL, NULL, NULL, NULL),
(74, 'VITO ADRIANO WISMAR, S.H.', '198209182008011002', 6, 8, 9, '1982-09-18', NULL, NULL, NULL, NULL, NULL),
(75, 'BUDIMAN S, A.Md.', '196411111991031001', 7, 43, 9, '1964-11-11', NULL, NULL, NULL, NULL, NULL),
(76, 'FENDY PRASETIYO, S.H., M.H.', '198102192002121001', 7, 9, 9, '1981-02-19', NULL, NULL, NULL, NULL, NULL),
(77, 'WIDYA PURNAMASARI, S.H., M.H.', '197102102001122001', 7, 8, 9, '1971-02-10', NULL, NULL, NULL, NULL, NULL),
(78, 'MOCH. KRISTANTO, S.E.', '197612262009121002', 7, 12, 9, '1976-12-26', NULL, NULL, NULL, NULL, NULL),
(79, 'HELMY AHIRUL APRIANDI, S.H.', '197904302009121002', 7, 9, 9, '1979-04-30', NULL, NULL, NULL, NULL, NULL),
(80, 'BRAHMANTYA PUJI KURNIARIADI, S.E., M.H.', '198008162009121003', 7, 12, 9, '1980-08-16', NULL, NULL, NULL, NULL, NULL),
(81, 'EEN SETIA SUHARJITO, S.E., MM', '198310032009121010', 7, 12, 9, '1983-10-03', NULL, NULL, NULL, NULL, NULL),
(82, 'FECHA PAUL PANGARIBUAN, S.H.,M.H.', '198503292009121005', 7, 12, 9, '1985-03-29', NULL, NULL, NULL, NULL, NULL),
(83, 'LUSI HANDAYANI, SE.,M.M.', '198601112009122008', 7, 12, 9, '1986-01-11', NULL, NULL, NULL, NULL, NULL),
(84, 'HARDIKA PRATAMA PUTRA, SH., M.E.', '198606142009121003', 7, 12, 9, '1986-06-14', NULL, NULL, NULL, NULL, NULL),
(85, 'HAFIDZ ZULKARNAIN, S.Kom.,M.M.', '198802082009121005', 7, 9, 9, '1988-02-08', NULL, NULL, NULL, NULL, NULL),
(86, 'JANUARINO ADITYA, S.E.,M.E.', '198301212010121001', 7, 22, 9, '1983-01-21', NULL, NULL, NULL, NULL, NULL),
(87, 'ELMIRA OKTARINA, S.H.', '198510022005012001', 7, 17, 9, '1985-10-02', NULL, NULL, NULL, NULL, NULL),
(88, 'DAVID MARADONA LUMBAN BATU, S.H., M.H', '198605182005011001', 7, 9, 9, '1986-05-18', NULL, NULL, NULL, NULL, NULL),
(89, 'ADE KURNIAWAN, A.Md., S.E., M.M.', '198404242009011007', 7, 9, 9, '1984-04-24', NULL, NULL, NULL, NULL, NULL),
(90, 'MELISA WAHYUNI, S.E.', '198505112009122009', 7, 32, 9, '1985-05-11', NULL, NULL, NULL, NULL, NULL),
(91, 'I MADE WEDHA SATRIA, S.H.', '197806282010121001', 7, 20, 9, '1978-06-28', NULL, NULL, NULL, NULL, NULL),
(92, 'CHANDRA JULIUS FOSTER MANALU, S.E.', '197907152010121001', 7, 9, 9, '1979-07-15', NULL, NULL, NULL, NULL, NULL),
(93, 'WAHYU RAMANDA, S.E.', '198011182010121003', 7, 9, 9, '1980-11-18', NULL, NULL, NULL, NULL, NULL),
(94, 'FEBRILIA RASMAHITA, S.E.,M.H.', '198202152010122001', 7, 12, 9, '1982-02-15', NULL, NULL, NULL, NULL, NULL),
(95, 'ANDI MUHAMMAD TAUFIK, S.H.,M.H.', '198409152010121002', 7, 12, 9, '1984-09-15', NULL, NULL, NULL, NULL, NULL),
(96, 'BOSAR IMMANUEL, S.E.', '198606082010121003', 7, 9, 9, '1986-06-08', NULL, NULL, NULL, NULL, NULL),
(97, 'NENI AYUNI, S.H.,M.H.', '198607222010122010', 7, 9, 9, '1986-07-22', NULL, NULL, NULL, NULL, NULL),
(98, 'AGUNG NUGROHO, S.Sos., M.H.', '197903312001121001', 7, 8, 9, '1979-03-31', NULL, NULL, NULL, NULL, NULL),
(99, 'VERAWATI, S.E.', '197602022001122004', 7, 8, 9, '1976-02-02', NULL, NULL, NULL, NULL, NULL),
(100, 'DEWI AYU NURMALASARI, A.Md.Im., S.H.', '198308212001122001', 7, 8, 9, '1983-08-21', NULL, NULL, NULL, NULL, NULL),
(101, 'PETRUS MOKO HANDOKO, S.E., M.S.M.', '197603202009121002', 7, 8, 9, '1976-03-20', NULL, NULL, NULL, NULL, NULL),
(102, 'ABDUL HAMID, S.E., M.M.', '197609012009121002', 7, 8, 9, '1976-09-01', NULL, NULL, NULL, NULL, NULL),
(103, 'ARMAN SYAH RAZAK, S.E.', '197702012009121002', 6, 8, 9, '1977-02-01', NULL, NULL, NULL, NULL, NULL),
(104, 'MUHAMMAD CATUR SUGIHARTO, S.H.', '198604222006041002', 7, 9, 9, '1986-04-22', NULL, NULL, NULL, NULL, NULL),
(105, 'M. FAHRULLAH, S.H.,M.H.', '198001302006041001', 6, 8, 9, '1980-01-30', NULL, NULL, NULL, NULL, NULL),
(106, 'INDAH DWI WIDYASIH, S.A.P.', '198707132006042001', 7, 12, 9, '1987-07-13', NULL, NULL, NULL, NULL, NULL),
(107, 'PARLINDUNGAN DONNI, S.H.,M.H.', '198809142007031001', 7, 12, 9, '1988-09-14', NULL, NULL, NULL, NULL, NULL),
(108, 'CHRISTIAN IMMANUEL HASUDUNGAN, S.Sos.', '197912212000021001', 7, 8, 9, '1979-12-21', NULL, NULL, NULL, NULL, NULL),
(109, 'HERIYANTO TRI RATMOKO, A.Md', '198201162005011001', 7, 10, 9, '1982-01-16', NULL, NULL, NULL, NULL, NULL),
(110, 'TRI DARMA MANULANG, S.H.,M.H.', '198610292009122003', 7, 12, 9, '1986-10-29', NULL, NULL, NULL, NULL, NULL),
(111, 'SEVRY JONNY GUNAWAN SIHALOHO, S.SOS', '197209272001121001', 7, 39, 9, '1972-09-27', NULL, NULL, NULL, NULL, NULL),
(112, 'DEDI MULYADI', '196706251991031002', 8, 20, 9, '1967-06-25', NULL, NULL, NULL, NULL, NULL),
(113, 'TRI SAYEKTI NINGSIH, SH., M.Si.', '197802232001122001', 8, 12, 9, '1978-02-23', NULL, NULL, NULL, NULL, NULL),
(114, 'LEXTY RACHMAYANI, S.Kom.', '198306282009012005', 8, 18, 9, '1983-06-28', NULL, NULL, NULL, NULL, NULL),
(115, 'AJI PRASETIYO PAMBUDI, S.E.', '197001111988031001', 8, 20, 9, '1970-01-11', NULL, NULL, NULL, NULL, NULL),
(116, 'YUSUP SUBHAN ABAS, S.H., M.H.', '197907152000031001', 8, 22, 9, '1979-07-15', NULL, NULL, NULL, NULL, NULL),
(117, 'ADI PRIYO PRATOMO, S.H., M.H.', '198309122002121002', 8, 9, 9, '1983-09-12', NULL, NULL, NULL, NULL, NULL),
(118, 'RADEN BAGUS WASITO UTOMO, S.H.,M.H.', '198301232007031002', 8, 9, 9, '1983-01-23', NULL, NULL, NULL, NULL, NULL),
(119, 'INDRA SAPUTRA, S.H.', '198511072009121001', 8, 9, 9, '1985-11-07', NULL, NULL, NULL, NULL, NULL),
(120, 'RADEN RORO RIZQI PUJASWATI, S.H.', '198711102009122006', 8, 9, 9, '1987-11-10', NULL, NULL, NULL, NULL, NULL),
(121, 'FIRMAN SEPTA FIRDAUS, S.H.', '198209042006041001', 8, 9, 9, '1982-09-04', NULL, NULL, NULL, NULL, NULL),
(122, 'ASIH RETNO SAYEKTI, A.Md., S.Kom.', '198110272009012002', 8, 9, 9, '1981-10-27', NULL, NULL, NULL, NULL, NULL),
(123, 'RETNA WANDITA, S.H.', '198405022009122008', 8, 9, 9, '1984-05-02', NULL, NULL, NULL, NULL, NULL),
(124, 'RAYMOND TINATING PANGIHUTAN SIAGIAN, S.H', '197709032009121001', 8, 20, 9, '1977-09-03', NULL, NULL, NULL, NULL, NULL),
(125, 'RIA WAHYU TANJUNG SASONGKO, A.Md., S.E.', '198807292009121002', 8, 9, 9, '1988-07-29', NULL, NULL, NULL, NULL, NULL),
(126, 'JIMS GUNAWAN, S.E.', '198409162015031004', 8, 9, 9, '1984-09-16', NULL, NULL, NULL, NULL, NULL),
(127, 'ADE MACHMUD APRIANSYAH, S.H.', '198504202015031003', 8, 9, 9, '1985-04-20', NULL, NULL, NULL, NULL, NULL),
(128, 'HENDRA ANGGARA SAPUTRA, S.E.', '198605202015031003', 8, 9, 9, '1986-05-20', NULL, NULL, NULL, NULL, NULL),
(129, 'BAGUS DWI LAKSONO, S.Kom.', '198609072015031003', 8, 14, 9, '1986-09-07', NULL, NULL, NULL, NULL, NULL),
(130, 'ARI FACHRYADI, S.Kom.', '198611052015031003', 8, 13, 9, '1986-11-05', NULL, NULL, NULL, NULL, NULL),
(131, 'HANDITYO NUGROHO, S.E.', '198802282015031002', 8, 9, 9, '1988-02-28', NULL, NULL, NULL, NULL, NULL),
(132, 'ADI AGUSTINA BR GIRSANG, S.H.', '198808142015032004', 8, 9, 9, '1988-08-14', NULL, NULL, NULL, NULL, NULL),
(133, 'PATRIA RATNA SARI, S.E.', '198811172015032006', 8, 9, 9, '1988-11-17', NULL, NULL, NULL, NULL, NULL),
(134, 'SURYA NARENDRA, S.H.', '198906132015031004', 8, 9, 9, '1989-06-13', NULL, NULL, NULL, NULL, NULL),
(135, 'DEWI SUSIANA MAULIDA, S.E.', '198910032015032009', 8, 9, 9, '1989-10-03', NULL, NULL, NULL, NULL, NULL),
(136, 'TYAS SETYANINGRUM, S.H.', '199003292015032002', 8, 9, 9, '1990-03-29', NULL, NULL, NULL, NULL, NULL),
(137, 'NURUL DWI HASTUTI, S.H.', '199009162015032006', 8, 9, 9, '1990-09-16', NULL, NULL, NULL, NULL, NULL),
(138, 'RINO ADI PUTRO, S.H.', '199106052015031003', 8, 9, 9, '1991-06-05', NULL, NULL, NULL, NULL, NULL),
(139, 'WINDA YUNIKA, S.H.', '199106242015032004', 8, 15, 9, '1991-06-24', NULL, NULL, NULL, NULL, NULL),
(140, 'EFI HANDAYANI, S.H.', '199202102015032001', 8, 9, 9, '1992-02-10', NULL, NULL, NULL, NULL, NULL),
(141, 'ELYCHIA ROLY PUTRI, S.E.', '199206112015032001', 8, 9, 9, '1992-06-11', NULL, NULL, NULL, NULL, NULL),
(142, 'NINDRA WAHYU HAPSARI, S.H.', '199206172015032007', 8, 9, 9, '1992-06-17', NULL, NULL, NULL, NULL, NULL),
(143, 'DHONY ALFIANTO, S.H.', '199210162015031001', 8, 9, 9, '1992-10-16', NULL, NULL, NULL, NULL, NULL),
(144, 'FAISAL AFIFI, S.H.', '199305232015031001', 8, 9, 9, '1993-05-23', NULL, NULL, NULL, NULL, NULL),
(145, 'HENNI NOOR UTAMI, S.H.', '199008262015052001', 8, 9, 9, '1990-08-26', NULL, NULL, NULL, NULL, NULL),
(146, 'DWI SUMARWANTO, A.Md.,S.H.,M.H.', '198008312009011008', 8, 9, 9, '1980-08-31', NULL, NULL, NULL, NULL, NULL),
(147, 'SIMON HALOMOAN, A.Md., S.Kom.', '198503302010121002', 8, 16, 9, '1985-03-30', NULL, NULL, NULL, NULL, NULL),
(148, 'AMAN AGUNG KURNIAWAN', '198011112005011001', 8, 12, 9, '1980-11-11', NULL, NULL, NULL, NULL, NULL),
(149, 'WAHYUDI, S.H.', '197712252006041001', 8, 18, 9, '1977-12-25', NULL, NULL, NULL, NULL, NULL),
(150, 'ABDUL ROKHMAN, A.Md., S.H.', '198012112009121002', 8, 9, 9, '1980-12-11', NULL, NULL, NULL, NULL, NULL),
(151, 'ANTON KURNIAWAN, A.Md., S.H.', '198304152009121001', 8, 9, 9, '1983-04-15', NULL, NULL, NULL, NULL, NULL),
(152, 'TIARA JASMINE NABILLA, A.Md., S.E.', '198605182010122006', 8, 19, 9, '1986-05-18', NULL, NULL, NULL, NULL, NULL),
(153, 'RINI YUNIASIH, A.Md.', '198106012009012006', 8, 10, 9, '1981-06-01', NULL, NULL, NULL, NULL, NULL),
(154, 'KURNIAWAN, A.Md., S.H', '198407172009011010', 8, 9, 9, '1984-07-17', NULL, NULL, NULL, NULL, NULL),
(155, 'ARIEF RAHMAN, S.H', '198711052007031001', 8, 20, 9, '1987-11-05', NULL, NULL, NULL, NULL, NULL),
(156, 'EUIS YULIANTI, A.Md., S.H.', '198207292009012005', 8, 18, 9, '1982-07-29', NULL, NULL, NULL, NULL, NULL),
(157, 'KIKI, S.AB.', '198509292017122001', 9, 9, 9, '1985-09-29', NULL, NULL, NULL, NULL, NULL),
(158, 'AYU YOANA SARI, S.Kom.', '198806252017122001', 9, 21, 9, '1988-06-25', NULL, NULL, NULL, NULL, NULL),
(159, 'RINTAKA JAYADI BRATA, S.Kom.', '198902082017121001', 9, 22, 9, '1989-02-08', NULL, NULL, NULL, NULL, NULL),
(160, 'FITRIYAH KUSUMA WARDANI, S.H.', '198905082017122001', 9, 23, 9, '1989-05-08', NULL, NULL, NULL, NULL, NULL),
(161, 'MUHAMMAD MUNDZIR WIJDANI, S.T.', '199003182017121001', 9, 16, 9, '1990-03-18', NULL, NULL, NULL, NULL, NULL),
(162, 'SATRIO WHINASIS PURBOAJI, S.H.', '199006192017121001', 9, 24, 9, '1990-06-19', NULL, NULL, NULL, NULL, NULL),
(163, 'MARATUN ISNAENI, S.I.A.', '199007102017122001', 9, 9, 9, '1990-07-10', NULL, NULL, NULL, NULL, NULL),
(164, 'ERWIN, S.E.', '199106152017121001', 9, 22, 9, '1991-06-15', NULL, NULL, NULL, NULL, NULL),
(165, 'ERAP NAINGGOLAN, S.Sos.', '199107062017121001', 9, 9, 9, '1991-07-06', NULL, NULL, NULL, NULL, NULL),
(166, 'NURLITA CAESARIANY RAHARDJO, S.Kom.', '199110242017122001', 9, 9, 9, '1991-10-24', NULL, NULL, NULL, NULL, NULL),
(167, 'SANDRA NUR FITRI, S.Akun.', '199205072017122001', 9, 9, 9, '1992-05-07', NULL, NULL, NULL, NULL, NULL),
(168, 'YUDHI HERVINO, S.T.', '199207082017121001', 9, 21, 9, '1992-07-08', NULL, NULL, NULL, NULL, NULL),
(169, 'GALUH PURNOMO, S.Sos.', '199304262017121001', 9, 9, 9, '1993-04-26', NULL, NULL, NULL, NULL, NULL),
(170, 'ZEIN IHYA ULUMUDDIN, S.AP.', '199305032017121001', 9, 9, 9, '1993-05-03', NULL, NULL, NULL, NULL, NULL),
(171, 'SUCIATI KRISTIASARI, S.AB.', '199307302017122001', 9, 9, 9, '1993-07-30', NULL, NULL, NULL, NULL, NULL),
(172, 'ANDI TRIAS ARYANTO, S.M.', '199308112017121001', 9, 25, 9, '1993-08-11', NULL, NULL, NULL, NULL, NULL),
(173, 'SEPRINALDO, S.Kom.', '199309122017121001', 9, 26, 9, '1993-09-12', NULL, NULL, NULL, NULL, NULL),
(174, 'PRISI KHAIRANI ARIEF, S.H.', '199402032017122001', 9, 27, 9, '1994-02-03', NULL, NULL, NULL, NULL, NULL),
(175, 'AGIL FAHLEFI, S.A.P.', '199407242017121001', 9, 9, 9, '1994-07-24', NULL, NULL, NULL, NULL, NULL),
(176, 'INDAH WIDYASARI, S.Sos.', '199409062017122001', 9, 9, 9, '1994-09-06', NULL, NULL, NULL, NULL, NULL),
(177, 'FALENTINA PARAMITA SARI, S.I.P.', '199409192017122001', 9, 9, 9, '1994-09-19', NULL, NULL, NULL, NULL, NULL),
(178, 'LATIEFAH KUSUMAWATI, S.Kom.', '199504232017122001', 9, 9, 9, '1995-04-23', NULL, NULL, NULL, NULL, NULL),
(179, 'MUHAMMAD FADLIKA DONIE PARON, S.H.', '199512082017121001', 9, 28, 9, '1995-12-08', NULL, NULL, NULL, NULL, NULL),
(180, 'NINDYA AYU NIRMALA, S.H.', '199512282017122001', 9, 26, 9, '1995-12-28', NULL, NULL, NULL, NULL, NULL),
(181, 'FAHMI YUSUF, S.I.A', '199220212017121001', 9, 29, 9, '0000-00-00', NULL, NULL, NULL, NULL, NULL),
(182, 'TABITA, S.Kom.', '198701062018012001', 9, 9, 9, '1987-01-06', NULL, NULL, NULL, NULL, NULL),
(183, 'AGUNG PAMBUDI KURNIAWAN', '198209032001121001', 9, 22, 9, '1982-09-03', NULL, NULL, NULL, NULL, NULL),
(184, 'DEDI NOVIANTO, S.E.', '198511102019011001', 9, 9, 9, '1985-11-10', NULL, NULL, NULL, NULL, NULL),
(185, 'ANGGIT SRI RAHAYU, S.E.', '198701262019012001', 9, 30, 9, '1987-01-26', NULL, NULL, NULL, NULL, NULL),
(186, 'MUH FATCHUL ULUM, S.E.', '198710212019011001', 9, 9, 9, '1987-10-21', NULL, NULL, NULL, NULL, NULL),
(187, 'ERWIEN PRABOWO, S.H.', '198711272019011001', 9, 9, 9, '1987-11-27', NULL, NULL, NULL, NULL, NULL),
(188, 'NOVAZ ACHWALUDDIN, S.E.', '198711282019011001', 9, 30, 9, '1987-11-28', NULL, NULL, NULL, NULL, NULL),
(189, 'RIFAN WAHYU PERMANA, S.Sos.', '198805222019011001', 9, 30, 9, '1988-05-22', NULL, NULL, NULL, NULL, NULL),
(190, 'SHERLY MERCELLA SEPTIYANA, S.H.', '198809242019012001', 9, 32, 9, '1988-09-24', NULL, NULL, NULL, NULL, NULL),
(191, 'ROBI ROLIS SAPUTRA , S.E.', '198911142019011001', 9, 33, 9, '1989-11-14', NULL, NULL, NULL, NULL, NULL),
(192, 'RATNA NINGSIH, SE', '199006102019012001', 9, 30, 9, '1990-06-10', NULL, NULL, NULL, NULL, NULL),
(193, 'RICA WIDIA PARDOSI, S.E.', '199105242019012001', 9, 9, 9, '1991-05-24', NULL, NULL, NULL, NULL, NULL),
(194, 'DEWI ENDAR YATUN, S.E.', '199109162019012001', 9, 30, 9, '1991-09-16', NULL, NULL, NULL, NULL, NULL),
(195, 'RIDHA FARIDHA DJOYO, S.E.', '199111152019012001', 9, 30, 9, '1991-11-15', NULL, NULL, NULL, NULL, NULL),
(196, 'LUCKY ANGGARA, S.E.', '199207152019011001', 9, 30, 9, '1992-07-15', NULL, NULL, NULL, NULL, NULL),
(197, 'MICHELLIA AGATHA WAURAN, S.E.', '199303212019012001', 9, 9, 9, '1993-03-21', NULL, NULL, NULL, NULL, NULL),
(198, 'METARIA TRI SANDI EDA , S.Akun.', '199305092019012001', 9, 9, 9, '1993-05-09', NULL, NULL, NULL, NULL, NULL),
(199, 'ARTIKA JULIANTI, S.E.', '199307172019012001', 9, 30, 9, '1993-07-17', NULL, NULL, NULL, NULL, NULL),
(200, 'RURI HANDIYANI PRATIWI, S.E.', '199309062019012001', 9, 9, 9, '1993-09-06', NULL, NULL, NULL, NULL, NULL),
(201, 'RIFALDY MAHARDIKA PUTRA, S.E.', '199309282019011001', 9, 30, 9, '1993-09-28', NULL, NULL, NULL, NULL, NULL),
(202, 'ARNANDA ARVI UNTARI, S.E.', '199401022019012001', 9, 9, 9, '1994-01-02', NULL, NULL, NULL, NULL, NULL),
(203, 'CINDY CLAUDIA SARI, S.E.', '199401052019012001', 9, 9, 9, '1994-01-05', NULL, NULL, NULL, NULL, NULL),
(204, 'NURUL QOMARIYAH, S.E', '199402202019012001', 9, 9, 9, '1994-02-20', NULL, NULL, NULL, NULL, NULL),
(205, 'APRILIYA WULANDARI, S.H', '199404062019012001', 9, 32, 9, '1994-04-06', NULL, NULL, NULL, NULL, NULL),
(206, 'RAJA ASRUBI EKA PUTRA, S.E', '199404072019011001', 9, 9, 9, '1994-04-07', NULL, NULL, NULL, NULL, NULL),
(207, 'DITA PRIANDINI, S.E', '199406162019012001', 9, 9, 9, '1994-06-16', NULL, NULL, NULL, NULL, NULL),
(208, 'FERA ARINDRA TRI ANESTYA, S.E.', '199406182019012002', 9, 9, 9, '1994-06-18', NULL, NULL, NULL, NULL, NULL),
(209, 'SILVINA SARI, S.E.', '199501042019012001', 9, 9, 9, '1995-01-04', NULL, NULL, NULL, NULL, NULL),
(210, 'DEWI KURNIATI AIRLANGGA, S.E.', '199504012019012002', 9, 9, 9, '1995-04-01', NULL, NULL, NULL, NULL, NULL),
(211, 'INDRY EKA WARDHANI, S.E.', '199505152019012002', 9, 30, 9, '1995-05-15', NULL, NULL, NULL, NULL, NULL),
(212, 'GESANG WIDIATMOKO, S.E.', '199505292019011001', 9, 9, 9, '1995-05-29', NULL, NULL, NULL, NULL, NULL),
(213, 'IIS SITI AISYAH, S.E.', '199506092019012001', 9, 30, 9, '1995-06-09', NULL, NULL, NULL, NULL, NULL),
(214, 'NIA WULANDARI, S. E', '199509292019012001', 9, 30, 9, '1995-09-29', NULL, NULL, NULL, NULL, NULL),
(215, 'MARIA CATHALINA CORINA SUSANTO , S.IAN', '199512202019012001', 9, 32, 9, '1995-12-20', NULL, NULL, NULL, NULL, NULL),
(216, 'ADE RIZKE PUTRI WIBOWO, S.H.', '199601082019012001', 9, 9, 9, '1996-01-08', NULL, NULL, NULL, NULL, NULL),
(217, 'MULYANI FITRI, S.Ak.', '199608212019012001', 9, 9, 9, '1996-08-21', NULL, NULL, NULL, NULL, NULL),
(218, 'ACHMAD SYUKRI HIDAYAT, A.Md', '198505012010121002', 9, 22, 9, '1985-05-01', NULL, NULL, NULL, NULL, NULL),
(219, 'EMMANIA NOVADA SUDARNO, S.E.', '199011202015032004', 9, 34, 9, '1990-11-20', NULL, NULL, NULL, NULL, NULL),
(220, 'GESS LUTFI, A.Md.', '198211102009012004', 9, 10, 9, '1982-11-10', NULL, NULL, NULL, NULL, NULL),
(221, 'FIQIH UTAMA, A.Md.P.', '199503252018081001', 9, 29, 9, '1995-03-25', NULL, NULL, NULL, NULL, NULL),
(222, 'DESI NATALIA, A.Md', '197912252010122002', 9, 20, 9, '1979-12-25', NULL, NULL, NULL, NULL, NULL),
(223, 'PUJI HAYATI, A.Md.', '198301302010122002', 9, 35, 9, '1983-01-30', NULL, NULL, NULL, NULL, NULL),
(224, 'BOBBY NOVIANTO', '199311132012121001', 9, 36, 9, '1993-11-13', NULL, NULL, NULL, NULL, NULL),
(225, 'Yoga Dwi Putra Permana, A.Md.P., S.P., S', '199407192012121002', 9, 37, 9, '1994-07-19', NULL, NULL, NULL, NULL, NULL),
(226, 'Raden Suryo Satrio Sularso, A.md., Im', '199705092019011001', 9, 37, 9, '1997-05-09', NULL, NULL, NULL, NULL, NULL),
(227, 'Setio Utomo Priono, A.Md., Im', '199605122019011001', 9, 37, 9, '1996-05-12', NULL, NULL, NULL, NULL, NULL),
(228, 'MONICA RONAULI SARASWATY SINAGA, S.E.', '199603172020122001', 9, 9, 9, '1996-03-17', NULL, NULL, NULL, NULL, NULL),
(229, 'FRANSISKA SRI A. TARIGAN, S.E', '199211132020122001', 9, 9, 9, '1992-11-13', NULL, NULL, NULL, NULL, NULL),
(230, 'ALFREDO S. MELIALA, S.AP', '199112212020121001', 9, 9, 9, '1991-12-21', NULL, NULL, NULL, NULL, NULL),
(231, 'Y.ADITYA ANGGARA P., SH', '199209152020121002', 9, 9, 9, '1992-09-15', NULL, NULL, NULL, NULL, NULL),
(232, 'HENNI MARIA MARPAUNG, S.PSI.', '199207242020122001', 9, 9, 9, '1992-07-24', NULL, NULL, NULL, NULL, NULL),
(233, 'ALEX TUMPAL HUTAJULU, S.E.', '199309222020121001', 9, 9, 9, '1993-09-22', NULL, NULL, NULL, NULL, NULL),
(234, 'YORA ROLIN BANGUN, S.H.', '199208242020121001', 9, 9, 9, '1992-08-24', NULL, NULL, NULL, NULL, NULL),
(235, 'IWAN PUTRA SIREGAR, S.H.', '199602222020121001', 9, 9, 9, '1996-02-22', NULL, NULL, NULL, NULL, NULL),
(236, 'PRASETYA PUTRA PERDANA HAREFA, S.PSI', '199410142020121001', 9, 9, 9, '1994-10-14', NULL, NULL, NULL, NULL, NULL),
(237, 'DEBORA CHYNTIA EKA PUTRI, S. PSI', '199603222020122001', 9, 9, 9, '1996-03-22', NULL, NULL, NULL, NULL, NULL),
(238, 'RENI MELYNDA HUTAPEA, S. PSI', '199405062020122001', 9, 9, 9, '1994-05-06', NULL, NULL, NULL, NULL, NULL),
(239, 'HARRY DICKSON SIMBOLON, S.E.', '199403152020121001', 9, 9, 9, '1994-03-15', NULL, NULL, NULL, NULL, NULL),
(240, 'MUHAMAD SUHANDWIFA, S. PSI', '199403012020121001', 9, 9, 9, '1994-03-01', NULL, NULL, NULL, NULL, NULL),
(241, 'GAUFANI MAJID MASRIFA, S.AK.', '199601032020121001', 9, 9, 9, '1996-01-03', NULL, NULL, NULL, NULL, NULL),
(242, 'VANIA REGHINA IRSYA, S. AK.', '199801252020122001', 9, 9, 9, '1998-01-25', NULL, NULL, NULL, NULL, NULL),
(243, 'AHMADI ANJAS, S.I.P.', '199611142020121001', 9, 9, 9, '1996-11-14', NULL, NULL, NULL, NULL, NULL),
(244, 'INDAH PERTIWI, S.PSI', '199103142020122001', 9, 9, 9, '1991-03-14', NULL, NULL, NULL, NULL, NULL),
(245, 'RIZKY HERVIANI, S.H.', '199207102020122001', 9, 9, 9, '1992-07-10', NULL, NULL, NULL, NULL, NULL),
(246, 'MHD.CHAIRIL AMBYA, SH', '199505212020121001', 9, 9, 9, '1995-05-21', NULL, NULL, NULL, NULL, NULL),
(247, 'RIZA NUGRAHENI, S.AK.', '199506262020122001', 9, 9, 9, '1995-06-26', NULL, NULL, NULL, NULL, NULL),
(248, 'ELMA NUR HIKMAH, S.E.', '199005032020122002', 9, 9, 9, '1990-05-03', NULL, NULL, NULL, NULL, NULL),
(249, 'TUTUT ASMOROWATI, S.E.', '199305102020122002', 9, 9, 9, '1993-05-10', NULL, NULL, NULL, NULL, NULL),
(250, 'RANA AULIA, S.E.', '199612292020122001', 9, 9, 9, '1996-12-29', NULL, NULL, NULL, NULL, NULL),
(251, 'BERLIANI AZIZAH, S.A.P.', '199212042020122001', 9, 9, 9, '1992-12-04', NULL, NULL, NULL, NULL, NULL),
(252, 'NIRWANA ELLEN NORA, S.IP', '199504292020122001', 9, 9, 9, '1995-04-29', NULL, NULL, NULL, NULL, NULL),
(253, 'NIMAS ZAKY NABILA, S.E.', '199805262020122002', 9, 9, 9, '1998-05-26', NULL, NULL, NULL, NULL, NULL),
(254, 'AZIZAH FARAHDIBA WAIROOY, S.E.', '199709222020122003', 9, 9, 9, '1997-09-22', NULL, NULL, NULL, NULL, NULL),
(255, 'DESY ARISTA PRAPITASARI, S.H.', '199408242020122001', 9, 9, 9, '1994-08-24', NULL, NULL, NULL, NULL, NULL),
(256, 'ANITA CAMELIANA, S.PSI', '198711192020122001', 9, 9, 9, '1987-11-19', NULL, NULL, NULL, NULL, NULL),
(257, 'DEVINA IKA PRATIWI, S.PSI', '199312112020122001', 9, 9, 9, '1993-12-11', NULL, NULL, NULL, NULL, NULL),
(258, 'MUTIARA ENDAH CAHYANI, S.E', '199309262020122001', 9, 9, 9, '1993-09-26', NULL, NULL, NULL, NULL, NULL),
(259, 'BARA DYNATA, SH.', '199103082020121001', 9, 9, 9, '1991-03-08', NULL, NULL, NULL, NULL, NULL),
(260, 'DIAN LATI UTAMI, S.PSI', '199305172020122001', 9, 9, 9, '1993-05-17', NULL, NULL, NULL, NULL, NULL),
(261, 'AZIZ PILAR SYEFIAJI, S.A.P.', '199309192020121001', 9, 9, 9, '1993-09-19', NULL, NULL, NULL, NULL, NULL),
(262, 'SAADIA SANTI, S.E.', '199404062020122001', 9, 9, 9, '1994-04-06', NULL, NULL, NULL, NULL, NULL),
(263, 'EVI PRASTUTI, S.AK.', '198703112020122002', 9, 9, 9, '1987-03-11', NULL, NULL, NULL, NULL, NULL),
(264, 'ANASTI DWI MARTANTYA KINASIH, S.AK', '199703082020122001', 9, 9, 9, '1997-03-08', NULL, NULL, NULL, NULL, NULL),
(265, 'RATIH MANGGARSARI, S. PSI', '199507012020122002', 9, 9, 9, '1995-07-01', NULL, NULL, NULL, NULL, NULL),
(266, 'SITI AFIFAH, S.E.', '199409202020122002', 9, 9, 9, '1994-09-20', NULL, NULL, NULL, NULL, NULL),
(267, 'WAHYU IRIANI, S.A.P.', '199107112020122001', 9, 9, 9, '1991-07-11', NULL, NULL, NULL, NULL, NULL),
(268, 'ABDI, S.ST.ARS', '198904172020121001', 9, 18, 9, '1989-04-17', NULL, NULL, NULL, NULL, NULL),
(269, 'REYNALDI EFFENDI PUTRA, S.E.', '199601212020121001', 9, 45, 9, '1996-01-21', NULL, NULL, NULL, NULL, NULL),
(270, 'ERVIANA RAHAYU, S.E.', '199710142020122001', 9, 45, 9, '1997-10-14', NULL, NULL, NULL, NULL, NULL),
(271, 'IVAN SATRIA NURRAHMAN, S.E', '199406172020121001', 9, 45, 9, '1994-06-17', NULL, NULL, NULL, NULL, NULL),
(272, 'DANIA AKHMAD, S.E.', '198906242020121001', 9, 38, 9, '1989-06-24', NULL, NULL, NULL, NULL, NULL),
(273, 'CENDIKIA HAZWIR, S.E.', '199604222020121001', 9, 38, 9, '1996-04-22', NULL, NULL, NULL, NULL, NULL),
(274, 'DAVIN NAUFAL JOVIANDO, S.E.', '199607132020121001', 9, 38, 9, '1996-07-13', NULL, NULL, NULL, NULL, NULL),
(275, 'INAS MAISA, S.I.KOM', '199508112020122001', 9, 39, 9, '1995-08-11', NULL, NULL, NULL, NULL, NULL),
(276, 'TOMMY ROY SIRAIT, S.KOM.', '199412152020121001', 9, 13, 9, '1994-12-15', NULL, NULL, NULL, NULL, NULL),
(277, 'AUGUST DIO AL FATH, A.Md', '199208082019011001', 11, 44, 9, '1992-08-08', NULL, NULL, NULL, NULL, NULL),
(278, 'KURNIA PUTRI NATALIA LUMBANTORUAN, A.Md', '199512242019012001', 11, 41, 9, '1995-12-24', NULL, NULL, NULL, NULL, NULL),
(279, 'NISA AMELINA, A.Md', '199608062019012001', 11, 41, 9, '1996-08-06', NULL, NULL, NULL, NULL, NULL),
(280, 'NAIMATUZZAHROH, A.Md.Ak.', '199901012021012001', 11, 11, 9, '1999-01-01', NULL, NULL, NULL, NULL, NULL),
(281, 'Fitri Ayu Wulandari, A.Md', '199204182017122003', 13, 42, 9, '1992-04-18', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `no_invoice` varchar(255) NOT NULL,
  `tanggal_invoice` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `nama_supplier` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `no_invoice`, `tanggal_invoice`, `keterangan`, `nama_supplier`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'KW.xxx', '2021-11-23 00:00:00', 'asdasdasdasd', 'PT. Boby Berkah', 7, '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(2, '433-27/C.4', '2021-11-25 00:00:00', 'Pembelian Pulpen Boxy', 'PT. Maju Mundur', 7, '2021-11-25 03:54:27', '2021-11-25 03:54:27', NULL),
(3, 'KW.xxx', '2021-11-26 00:00:00', 'asdasdasd', 'PT JAYA ABADI', 7, '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(11) NOT NULL,
  `pembelian_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id`, `pembelian_id`, `barang_id`, `jumlah`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 5, '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(2, 1, 2, 4, '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(3, 1, 3, 10, '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(4, 2, 2, 20, '2021-11-25 03:54:27', '2021-11-25 03:54:27', NULL),
(5, 3, 1, 100, '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL),
(6, 3, 2, 200, '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL),
(7, 3, 3, 40, '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_lampiran`
--

CREATE TABLE `pembelian_lampiran` (
  `id` int(11) NOT NULL,
  `pembelian_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_lampiran`
--

INSERT INTO `pembelian_lampiran` (`id`, `pembelian_id`, `nama`, `file`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'RAZILU.pdf', 'pembelian/lampiran/FQcXKmrCQE0HQGIb4K5ZlS8gRTpBBP2mEfE7jwxS.pdf', 7, '2021-11-23 01:09:12', '2021-11-23 01:09:12', NULL),
(2, 2, '20211112231919762.pdf', 'pembelian/lampiran/4MmFmuH3hv0tPL3hxks8HHjzEuQNYBwoUN7ray44.pdf', 7, '2021-11-25 03:54:28', '2021-11-25 03:54:28', NULL),
(3, 3, 'kuitansi_6.docx', 'pembelian/lampiran/9uxdnqUP2YUAtnXT698l3P8p3BfoDveiZxHnKkVw.bin', 7, '2021-11-26 01:17:33', '2021-11-26 01:17:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peran`
--

CREATE TABLE `peran` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peran`
--

INSERT INTO `peran` (`id`, `nama`) VALUES
(1, 'PENGENDALI UTAMA'),
(2, 'PENGENDALI TEKNIS'),
(3, 'KETUA TIM'),
(4, 'ANGGOTA');

-- --------------------------------------------------------

--
-- Table structure for table `perjadin`
--

CREATE TABLE `perjadin` (
  `id` int(11) NOT NULL,
  `no_perjadin` varchar(522) NOT NULL,
  `surat_perintah_id` int(11) NOT NULL,
  `mak_id` int(11) NOT NULL,
  `jumlah_hari` double NOT NULL DEFAULT 0,
  `tujuan` varchar(255) DEFAULT NULL,
  `keberangkatan` varchar(255) DEFAULT NULL,
  `tanggal_berangkat` datetime NOT NULL DEFAULT current_timestamp(),
  `tanggal_kembali` datetime NOT NULL DEFAULT current_timestamp(),
  `total_anggaran` double NOT NULL DEFAULT 0,
  `status_realisasi` enum('SUDAH','BELUM') NOT NULL DEFAULT 'BELUM',
  `total_realisasi` double NOT NULL DEFAULT 0,
  `status` enum('RENCANA','VERIFIKASI KEUANGAN','PELAKSANAAN','VERIFIKASI PPK','SELESAI','VERIFIKASI REALISASI','VERIFIED KEUANGAN','VERIFIED PPK','TOLAK PPK') NOT NULL DEFAULT 'RENCANA',
  `maksud` text DEFAULT NULL,
  `output` varchar(512) DEFAULT NULL,
  `ppk_id` int(11) NOT NULL,
  `bendahara_id` int(11) NOT NULL,
  `tahun_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin`
--

INSERT INTO `perjadin` (`id`, `no_perjadin`, `surat_perintah_id`, `mak_id`, `jumlah_hari`, `tujuan`, `keberangkatan`, `tanggal_berangkat`, `tanggal_kembali`, `total_anggaran`, `status_realisasi`, `total_realisasi`, `status`, `maksud`, `output`, `ppk_id`, `bendahara_id`, `tahun_id`, `user_id`, `bidang_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1-231121-1', 1, 4, 4, 'Bandung', 'Jakarta', '2021-11-23 00:00:00', '2021-11-26 00:00:00', 10352000, 'SUDAH', 7622000, 'SELESAI', 'Evaluasi WBK WBBM', '1 Laporan Kegiatan', 4, 3, 1, 1, 1, '2021-11-23 00:48:41', '2021-11-23 01:05:02', NULL),
(2, '1-251121-1', 2, 1, 5, 'Bandung', 'Jakarta', '2021-11-29 00:00:00', '2021-12-03 00:00:00', 17877000, 'SUDAH', 18500000, 'SELESAI', 'Reviu LK pada Kanwil Jawa Barat', 'CHR', 2, 4, 1, 1, 1, '2021-11-25 07:07:01', '2021-11-25 23:19:45', NULL),
(3, '9-261121-1', 3, 159, 4, 'Lampung', 'Jakarta', '2021-12-01 00:00:00', '2021-12-04 00:00:00', 7620000, 'SUDAH', 5150000, 'SELESAI', 'Evaluasi WBK WBBM', '1 Laporan Kegiatan', 17, 219, 1, 1, 9, '2021-11-26 00:38:19', '2021-11-26 00:53:25', NULL),
(4, '1-011221-1', 4, 2, 5, 'Manado', 'Jakarta', '2021-12-01 00:00:00', '2021-12-05 00:00:00', 29356000, 'BELUM', 0, 'RENCANA', 'Audit Tusi Kanwil', '1 Laporan', 7, 219, 1, 1, 1, '2021-11-30 23:07:27', '2021-11-30 23:54:57', NULL),
(5, '1-011221-2', 12, 2, 3, 'Bandung', 'Jakarta', '2021-12-01 00:00:00', '2021-12-03 00:00:00', 7250000, 'SUDAH', 0, 'RENCANA', 'akshdahsdjhakjsdhjk', 'asldkhalsdhjkahsdjkl', 4, 5, 1, 3, 1, '2021-12-01 01:08:59', '2021-12-01 08:31:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_hasil`
--

CREATE TABLE `perjadin_hasil` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_lampiran`
--

CREATE TABLE `perjadin_lampiran` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `jenis` enum('SP','RAB','LAINNYA') NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_lampiran`
--

INSERT INTO `perjadin_lampiran` (`id`, `perjadin_id`, `jenis`, `nama`, `file`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'SP', 'SP_laporan penambahan sop layanan unggulan.pdf', 'perjadin/UNd0uKy3OXmuoxhVIH6xJ6fzUfBCNQV8lGBjPauq.pdf', 1, '2021-11-23 00:48:42', '2021-11-23 00:48:42', NULL),
(2, 1, 'RAB', '1_RAB_RAB.xlsx', 'perjadin/5gFnd4w5ruAbnyo8Yer9kUbpcgR10fPfct5EmO8r.xlsx', 1, '2021-11-23 00:48:42', '2021-11-23 00:48:42', NULL),
(3, 1, 'LAINNYA', '1_LAINNYA_sop 2021 (1).pdf', 'perjadin/NCHGGU1TjoH7RjR3f5OwnwxZfWqU0R4dqI0EcVXj.pdf', 1, '2021-11-23 00:48:42', '2021-11-23 00:48:42', NULL),
(4, 2, 'SP', 'SP_202110071058561551_surat.pdf', 'perjadin/KKP0ciqMUhVjWl7kQxFinQ3zMre8qxtQC3w9Vugy.pdf', 1, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(5, 2, 'RAB', '2_RAB_20211108203724762.pdf', 'perjadin/cMxvd69YT1ClpdbmgDuHH44r2xxruJQLp89cFEl7.pdf', 1, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(6, 2, 'LAINNYA', '2_LAINNYA_152236_20211111103804_.pdf', 'perjadin/rBRJSJ6YH2V4W0Os8D2xmXXDHgH1djSlX7AgG5U6.pdf', 1, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(7, 3, 'SP', 'SP_spb.docx', 'perjadin/TfQslqkmg8fgnCFSc4azJJ7e2VdPd2APqUMbZtYN.docx', 1, '2021-11-26 00:38:20', '2021-11-26 00:38:20', NULL),
(8, 3, 'RAB', '3_RAB_Backdrop panggung.png', 'perjadin/hyWS3GkC1DvIxdoeGyxHsZu7UG88G8QtqKTA7QM9.png', 1, '2021-11-26 00:38:20', '2021-11-26 00:38:20', NULL),
(9, 3, 'LAINNYA', '3_LAINNYA_STATUS KENDARAAN ITJEN (1).xlsx', 'perjadin/c7ZbKKWWkbpxq52cDdpPbWnCJbMefqie3K9aFugM.xlsx', 1, '2021-11-26 00:38:20', '2021-11-26 00:38:20', NULL),
(10, 3, 'RAB', '3_RAB_STATUS KENDARAAN ITJEN 2021.xlsx', 'perjadin/QkiKVS1Si5Y9lwFYwsdx69i4IyM3NC8Niw7wZADK.xlsx', 5, '2021-11-26 00:43:04', '2021-11-26 00:43:04', NULL),
(11, 3, 'RAB', '3_RAB_STATUS KENDARAAN ITJEN 2021.xlsx', 'perjadin/9gziz3wf9TeSY7K0XRuSOJUJDojy1Nm06AktrURk.xlsx', 5, '2021-11-26 00:43:07', '2021-11-26 00:43:07', NULL),
(12, 3, 'RAB', '3_RAB_STATUS KENDARAAN ITJEN (1).xlsx', 'perjadin/LACd1b2HrwobCHPHNQQQFi1gRwNlcJX046TZEAvn.xlsx', 5, '2021-11-26 00:43:07', '2021-11-26 00:43:07', NULL),
(13, 3, 'SP', 'SP_5. IKU ITJEN TA.2021 (1).pdf', 'perjadin/6e53TrZ8K6STtmqxOUgvF7MHvug2gkX740YWvOgC.pdf', 5, '2021-11-26 00:43:19', '2021-11-26 00:43:19', NULL),
(14, 4, 'SP', 'SP_Sprint Driver Koordinasi Pengawasan.doc', 'perjadin/f3nCYyIwRWSNh9wGZXVaKCQcLxCoD9BRT86kfzl8.doc', 1, '2021-11-30 23:07:28', '2021-11-30 23:07:28', NULL),
(15, 4, 'RAB', '4_RAB_DPR dan RB Perjadin Bogor SPIP.xlsx', 'perjadin/sLp2WKHAoAV6q62vBc59Ug1z4PlEAvgepogJLJlo.xlsx', 1, '2021-11-30 23:07:28', '2021-11-30 23:07:28', NULL),
(16, 5, 'SP', 'SP_sptjm_1.docx', 'perjadin/B995TyyT6WXuZOboJefPXNmudY8BB7Jpny2v6Jff.docx', 3, '2021-12-01 01:08:59', '2021-12-01 01:08:59', NULL),
(17, 5, 'RAB', '5_RAB_SURAT UNIT.pdf', 'perjadin/7W2trrxVTNlsKQgQUVNkTCRQigxwfZdTN7HLcP9A.pdf', 3, '2021-12-01 01:08:59', '2021-12-01 01:08:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_log`
--

CREATE TABLE `perjadin_log` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_log`
--

INSERT INTO `perjadin_log` (`id`, `perjadin_id`, `status`, `user_id`, `bidang_id`, `keterangan`, `catatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-23 00:48:41', '2021-11-23 00:48:41', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'xxxxxxx', '2021-11-23 00:53:01', '2021-11-23 00:53:01', NULL),
(3, 1, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'ssssssssss', '2021-11-23 00:54:29', '2021-11-23 00:54:29', NULL),
(4, 1, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'ok', '2021-11-23 01:01:36', '2021-11-23 01:01:36', NULL),
(5, 1, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'xxxxxx', '2021-11-23 01:04:07', '2021-11-23 01:04:07', NULL),
(6, 1, 'VERIFIED PPK', 2, 3, 'perjadin telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'ok', '2021-11-23 01:04:44', '2021-11-23 01:04:44', NULL),
(7, 1, 'SELESAI', 4, 1, 'Uang perjadin telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'xxxxxx', '2021-11-23 01:05:02', '2021-11-23 01:05:02', NULL),
(8, 2, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(9, 2, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', NULL, '2021-11-25 07:08:46', '2021-11-25 07:08:46', NULL),
(10, 2, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-25 07:09:35', '2021-11-25 07:09:35', NULL),
(11, 2, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', NULL, '2021-11-25 23:18:41', '2021-11-25 23:18:41', NULL),
(12, 2, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-25 23:19:09', '2021-11-25 23:19:09', NULL),
(13, 2, 'RETUR DARI PPK', 2, 3, 'perjadin di retur oleh ppk untuk di revisi oleh ABDUL HAMID, SE.', NULL, '2021-11-25 23:19:45', '2021-11-25 23:19:45', NULL),
(14, 3, 'PENGAJUAN', 1, 9, 'PERJADIN TELAH DIBUAT, OLEH AMI AMATUNISSA, S.H., M.H.', NULL, '2021-11-26 00:38:19', '2021-11-26 00:38:19', NULL),
(15, 3, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 9, 'perjadin telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'Proses', '2021-11-26 00:42:02', '2021-11-26 00:42:02', NULL),
(16, 3, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh NIA WULANDARI, S. E', 'OK Jalan', '2021-11-26 00:43:46', '2021-11-26 00:43:46', NULL),
(17, 3, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 9, 'perjadin telah di kirim ke keuangan oleh AMI AMATUNISSA, S.H., M.H.', 'Ok', '2021-11-26 00:50:09', '2021-11-26 00:50:09', NULL),
(18, 3, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh NIA WULANDARI, S. E', 'OK', '2021-11-26 00:52:32', '2021-11-26 00:52:32', NULL),
(19, 3, 'VERIFIED PPK', 2, 3, 'perjadin telah di verifikasi oleh oleh JOKO MARTANTO, S.E, M.SI.', 'OK', '2021-11-26 00:52:48', '2021-11-26 00:52:48', NULL),
(20, 3, 'SELESAI', 4, 1, 'Uang perjadin telah dibayarkan oleh oleh EMMANIA NOVADA SUDARNO, S.E.', 'ddddddddd', '2021-11-26 00:53:25', '2021-11-26 00:53:25', NULL),
(21, 4, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(22, 4, 'KIRIM KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', NULL, '2021-11-30 23:08:44', '2021-11-30 23:08:44', NULL),
(23, 4, 'RETUR DARI ADMIN KEUANGAN', 5, 1, 'perjadin di retur oleh ADMIN KEUANGAN untuk di revisi oleh NIA WULANDARI, S. E', 'rEVISI', '2021-11-30 23:54:57', '2021-11-30 23:54:57', NULL),
(24, 5, 'PENGAJUAN', 3, 1, 'PERJADIN TELAH DIBUAT, OLEH DEWI AYU NURMALASARI, A.Md.Im., S.H.', NULL, '2021-12-01 01:08:59', '2021-12-01 01:08:59', NULL),
(25, 5, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'proses', '2021-12-01 08:27:53', '2021-12-01 08:27:53', NULL),
(26, 5, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh NIA WULANDARI, S. E', 'ok', '2021-12-01 08:29:02', '2021-12-01 08:29:02', NULL),
(27, 5, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 3, 1, 'perjadin telah di kirim ke keuangan oleh DEWI AYU NURMALASARI, A.Md.Im., S.H.', 'ok', '2021-12-01 08:31:18', '2021-12-01 08:31:18', NULL),
(28, 5, 'RETUR DARI ADMIN KEUANGAN', 5, 1, 'perjadin di retur oleh ADMIN KEUANGAN untuk di revisi oleh NIA WULANDARI, S. E', 'asdas', '2021-12-01 08:31:37', '2021-12-01 08:31:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_obrik`
--

CREATE TABLE `perjadin_obrik` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `satker_id` int(11) NOT NULL,
  `urusan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_obrik`
--

INSERT INTO `perjadin_obrik` (`id`, `perjadin_id`, `satker_id`, `urusan_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 10, '2021-11-23 00:48:41', '2021-11-23 00:48:41', NULL),
(2, 2, 1, 2, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(3, 3, 1, 1, '2021-11-26 00:38:19', '2021-11-26 00:38:19', NULL),
(4, 4, 1, 1, '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(11, 5, 1, 2, '2021-12-01 05:45:05', '2021-12-01 05:45:05', NULL),
(12, 5, 1, 1, '2021-12-01 05:45:05', '2021-12-01 05:45:05', NULL),
(13, 5, 1, 4, '2021-12-01 05:45:05', '2021-12-01 05:45:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_rab`
--

CREATE TABLE `perjadin_rab` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `susunan_tim_perjadin_id` int(11) NOT NULL,
  `jumlah_hari` double NOT NULL,
  `tanggal_berangkat` datetime DEFAULT current_timestamp(),
  `tanggal_kembali` datetime DEFAULT current_timestamp(),
  `uang_harian` double NOT NULL,
  `jumlah_malam` double NOT NULL,
  `uang_hotel` double NOT NULL,
  `udara` double NOT NULL,
  `laut` double NOT NULL,
  `darat` double NOT NULL,
  `taksi_jakarta` double NOT NULL,
  `taksi_provinsi` double NOT NULL,
  `representatif` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_rab`
--

INSERT INTO `perjadin_rab` (`id`, `perjadin_id`, `susunan_tim_perjadin_id`, `jumlah_hari`, `tanggal_berangkat`, `tanggal_kembali`, `uang_harian`, `jumlah_malam`, `uang_hotel`, `udara`, `laut`, `darat`, `taksi_jakarta`, `taksi_provinsi`, `representatif`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 4, '2021-11-23 00:00:00', '2021-11-26 00:00:00', 500000, 4, 380000, 1400000, 0, 0, 256000, 0, 0, 5176000, '2021-11-23 00:48:41', '2021-11-23 00:48:41', NULL),
(2, 1, 2, 4, '2021-11-23 00:00:00', '2021-11-26 00:00:00', 500000, 4, 380000, 1400000, 0, 0, 256000, 0, 0, 5176000, '2021-11-23 00:48:41', '2021-11-23 00:48:41', NULL),
(3, 2, 3, 5, '2021-11-29 00:00:00', '2021-12-03 00:00:00', 500000, 4, 600000, 0, 0, 800000, 265000, 0, 0, 5965000, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(4, 2, 4, 5, '2021-11-29 00:00:00', '2021-12-03 00:00:00', 500000, 4, 600000, 0, 0, 800000, 256000, 0, 0, 5956000, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(5, 2, 5, 5, '2021-11-29 00:00:00', '2021-12-03 00:00:00', 500000, 4, 600000, 0, 0, 800000, 256000, 0, 0, 5956000, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(6, 3, 6, 4, '2021-12-01 00:00:00', '2021-12-04 00:00:00', 500000, 3, 500000, 0, 0, 200000, 200000, 0, 0, 3900000, '2021-11-26 00:38:19', '2021-11-26 00:38:19', NULL),
(7, 3, 7, 4, '2021-12-01 00:00:00', '2021-12-04 00:00:00', 500000, 3, 500000, 0, 0, 200000, 20000, 0, 0, 3720000, '2021-11-26 00:38:19', '2021-11-26 00:38:19', NULL),
(8, 4, 8, 5, '2021-12-01 00:00:00', '2021-12-05 00:00:00', 430000, 4, 1700000, 2780000, 0, 0, 512000, 0, 150000, 12392000, '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(9, 4, 9, 5, '2021-12-01 00:00:00', '2021-12-05 00:00:00', 430000, 4, 1000000, 2780000, 0, 0, 512000, 0, 0, 9442000, '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(10, 4, 10, 5, '2021-12-01 00:00:00', '2021-12-05 00:00:00', 430000, 4, 520000, 2780000, 0, 0, 512000, 0, 0, 7522000, '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(11, 5, 11, 3, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 2, 500000, 0, 0, 0, 0, 0, 0, 1900000, '2021-12-01 01:08:59', '2021-12-01 01:08:59', NULL),
(12, 5, 12, 3, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 2, 500000, 0, 0, 0, 0, 0, 0, 1900000, '2021-12-01 01:08:59', '2021-12-01 01:08:59', NULL),
(13, 5, 13, 3, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 2, 500000, 0, 0, 0, 0, 0, 0, 1900000, '2021-12-01 08:24:11', '2021-12-01 08:24:11', NULL),
(14, 5, 14, 5, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 2, 500000, 0, 0, 0, 0, 0, 0, 2500000, '2021-12-01 08:24:11', '2021-12-01 08:24:11', NULL),
(15, 5, 15, 3, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 2, 500000, 0, 0, 0, 0, 0, 0, 1900000, '2021-12-01 08:24:55', '2021-12-01 08:24:55', NULL),
(16, 5, 16, 5, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 2, 500000, 0, 0, 0, 0, 0, 0, 2500000, '2021-12-01 08:24:55', '2021-12-01 08:24:55', NULL),
(17, 5, 17, 4, '2021-12-01 00:00:00', '2021-12-03 00:00:00', 300000, 5, 250000, 400000, 0, 0, 0, 0, 0, 2850000, '2021-12-01 08:24:55', '2021-12-01 08:24:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_realisasi`
--

CREATE TABLE `perjadin_realisasi` (
  `id` int(11) NOT NULL,
  `no_sppd` varchar(255) DEFAULT NULL,
  `perjadin_id` int(11) NOT NULL,
  `susunan_tim_perjadin_id` int(11) NOT NULL,
  `total_harian` double NOT NULL DEFAULT 0,
  `total_hotel` double NOT NULL DEFAULT 0,
  `total_transport` double NOT NULL DEFAULT 0,
  `tanggal_berangkat` date NOT NULL DEFAULT current_timestamp(),
  `tanggal_kembali` date NOT NULL DEFAULT current_timestamp(),
  `taksi_jakarta` double NOT NULL,
  `taksi_provinsi` double NOT NULL,
  `jakarta_riil` tinyint(1) NOT NULL DEFAULT 0,
  `provinsi_riil` tinyint(1) NOT NULL DEFAULT 0,
  `representatif` double NOT NULL,
  `total` double NOT NULL,
  `jenis_hotel` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_realisasi`
--

INSERT INTO `perjadin_realisasi` (`id`, `no_sppd`, `perjadin_id`, `susunan_tim_perjadin_id`, `total_harian`, `total_hotel`, `total_transport`, `tanggal_berangkat`, `tanggal_kembali`, `taksi_jakarta`, `taksi_provinsi`, `jakarta_riil`, `provinsi_riil`, `representatif`, `total`, `jenis_hotel`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 1, 1, 450000, 1520000, 1400000, '2021-11-23', '2021-11-26', 256000, 0, 1, 0, 0, 3626000, 0, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(2, NULL, 1, 2, 1140000, 1200000, 1400000, '2021-11-23', '2021-11-26', 256000, 0, 1, 0, 0, 3996000, 0, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(3, NULL, 2, 3, 2500000, 2400000, 500000, '2021-11-29', '2021-12-03', 2000000, 0, 0, 0, 0, 7400000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(4, NULL, 2, 4, 2500000, 2400000, 400000, '2021-11-29', '2021-12-03', 200000, 0, 0, 0, 0, 5500000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(5, NULL, 2, 5, 2500000, 2400000, 500000, '2021-11-29', '2021-12-03', 200000, 0, 0, 0, 0, 5600000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(6, NULL, 3, 6, 900000, 300000, 200000, '2021-12-01', '2021-12-04', 250000, 0, 0, 0, 0, 1650000, 0, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(7, NULL, 3, 7, 2500000, 500000, 250000, '2021-12-01', '2021-12-04', 250000, 0, 0, 0, 0, 3500000, 0, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(8, NULL, 5, 15, 0, 0, 0, '2021-12-01', '2021-12-03', 0, 0, 0, 0, 0, 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(9, NULL, 5, 16, 0, 0, 0, '2021-12-01', '2021-12-03', 0, 0, 0, 0, 0, 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(10, NULL, 5, 17, 0, 0, 0, '2021-12-01', '2021-12-03', 0, 0, 0, 0, 0, 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_realisasi_lampiran`
--

CREATE TABLE `perjadin_realisasi_lampiran` (
  `id` int(11) NOT NULL,
  `perjadin_realisasi_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_realisasi_lampiran`
--

INSERT INTO `perjadin_realisasi_lampiran` (`id`, `perjadin_realisasi_id`, `nama`, `file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Rek.PT.ALFA 1.pdf', 'perjadin/lampiran/st2Ec9gkax62DjPs8M9pFtHZjP6KqYv8Tv6zNtDH.pdf', '2021-11-23 01:01:17', '2021-11-23 01:01:17', NULL),
(2, 1, 'EFAKTUR PT ALFA INSPEKTORAT 1-10.pdf', 'perjadin/lampiran/483Bw7yscXXzF0995YsvtRWiQFgR8VwZeDAvgEpR.pdf', '2021-11-23 01:01:17', '2021-11-23 01:01:17', NULL),
(3, 4, 'F-1.15.pdf', 'perjadin/lampiran/ImZD6i7t0QL0a6SH7aXMJUCoK5XHAmElUBNBtzB5.pdf', '2021-11-25 23:18:32', '2021-11-25 23:18:32', NULL),
(4, 5, '151311_20211104174125_.pdf', 'perjadin/lampiran/VvWz8mdlt2Swnug2q9ZDuiECQnIXksl6b3SVbGT1.pdf', '2021-11-25 23:18:32', '2021-11-25 23:18:32', NULL),
(5, 3, '1278 10351109_5.pdf', 'perjadin/lampiran/tgoM9rwgH6XOzIRNSlfuukbmJqvWiUGMTvi9oLRQ.pdf', '2021-11-25 23:18:32', '2021-11-25 23:18:32', NULL),
(6, 7, 'Backdrop panggung.png', 'perjadin/lampiran/8sK7vQ5jS5RAh9LINz9HTJwFUIZNyh9lfvbanRlZ.png', '2021-11-26 00:47:49', '2021-11-26 00:47:49', NULL),
(7, 6, 'WhatsApp Image 2021-10-28 at 13.15.28.jpeg', 'perjadin/lampiran/EiZvmFIrCqF0w4bLvPMt7KzBQcMxOYaIbqV0TsIZ.jpg', '2021-11-26 00:47:49', '2021-11-26 00:47:49', NULL),
(8, 6, 'WhatsApp Image 2021-10-21 at 22.56.39.jpeg', 'perjadin/lampiran/2b3M0QRQJ8JcsMYYXzowxL1IUzBEAFDrlvY6iGCj.jpg', '2021-11-26 00:47:49', '2021-11-26 00:47:49', NULL),
(9, 6, 'Backdrop panggung.png', 'perjadin/lampiran/8kHF0QILeFVPSuW5k8rfW7xBt8ssn6QOZvrakaCP.png', '2021-11-26 00:47:49', '2021-11-26 00:47:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_realisasi_transport`
--

CREATE TABLE `perjadin_realisasi_transport` (
  `id` int(11) NOT NULL,
  `perjadin_realisasi_id` int(11) NOT NULL,
  `jenis_transport` enum('UDARA','DARAT','LAUT') NOT NULL DEFAULT 'UDARA',
  `total` double NOT NULL,
  `riil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_realisasi_transport`
--

INSERT INTO `perjadin_realisasi_transport` (`id`, `perjadin_realisasi_id`, `jenis_transport`, `total`, `riil`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'UDARA', 1400000, 0, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(2, 2, 'UDARA', 1400000, 0, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(3, 3, 'DARAT', 500000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(4, 4, 'DARAT', 400000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(5, 5, 'DARAT', 500000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(6, 6, 'DARAT', 200000, 0, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(7, 7, 'DARAT', 250000, 0, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(8, 8, 'DARAT', 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(9, 9, 'DARAT', 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(10, 10, 'DARAT', 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_realisasi_uang_harian`
--

CREATE TABLE `perjadin_realisasi_uang_harian` (
  `id` int(11) NOT NULL,
  `perjadin_realisasi_id` int(11) NOT NULL,
  `jumlah_hari` double NOT NULL,
  `uang_harian` double NOT NULL,
  `total` double NOT NULL,
  `riil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_realisasi_uang_harian`
--

INSERT INTO `perjadin_realisasi_uang_harian` (`id`, `perjadin_realisasi_id`, `jumlah_hari`, `uang_harian`, `total`, `riil`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 150000, 450000, 1, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(2, 1, 0, 0, 0, 1, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(3, 2, 3, 380000, 1140000, 1, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(4, 3, 5, 500000, 2500000, 1, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(5, 4, 5, 500000, 2500000, 1, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(6, 5, 5, 500000, 2500000, 1, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(7, 6, 2, 300000, 600000, 1, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(8, 6, 2, 150000, 300000, 1, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(9, 7, 5, 500000, 2500000, 1, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(10, 8, 0, 0, 0, 1, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(11, 9, 0, 0, 0, 1, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(12, 10, 0, 0, 0, 1, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_realisasi_uang_hotel`
--

CREATE TABLE `perjadin_realisasi_uang_hotel` (
  `id` int(11) NOT NULL,
  `perjadin_realisasi_id` int(11) NOT NULL,
  `jenis_hotel` int(1) NOT NULL DEFAULT 0,
  `nama_hotel` varchar(255) DEFAULT NULL,
  `jumlah_malam` double NOT NULL,
  `uang_hotel` double NOT NULL,
  `total` double NOT NULL,
  `riil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_realisasi_uang_hotel`
--

INSERT INTO `perjadin_realisasi_uang_hotel` (`id`, `perjadin_realisasi_id`, `jenis_hotel`, `nama_hotel`, `jumlah_malam`, `uang_hotel`, `total`, `riil`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'Aston', 4, 380000, 1520000, 0, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(2, 2, 0, 'Aston 2', 3, 400000, 1200000, 0, '2021-11-23 01:01:16', '2021-11-23 01:01:16', NULL),
(3, 3, 0, 'Hotel Aston', 4, 600000, 2400000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(4, 4, 0, 'Hotel Aston', 4, 600000, 2400000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(5, 5, 0, 'Hotel Aston', 4, 600000, 2400000, 0, '2021-11-25 23:18:31', '2021-11-25 23:18:31', NULL),
(6, 6, 0, 'Aston', 3, 50000, 150000, 0, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(7, 6, 1, NULL, 1, 150000, 150000, 1, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(8, 7, 0, 'Melati', 2, 250000, 500000, 0, '2021-11-26 00:47:47', '2021-11-26 00:47:47', NULL),
(9, 8, 0, NULL, 0, 0, 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(10, 9, 0, NULL, 0, 0, 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL),
(11, 10, 0, NULL, 0, 0, 0, 0, '2021-12-01 08:30:42', '2021-12-01 08:30:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_susunan_tim`
--

CREATE TABLE `perjadin_susunan_tim` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `perjadin_rab_id` int(11) DEFAULT NULL,
  `perjadin_realisasi_id` int(11) DEFAULT NULL,
  `pegawai_id` int(11) NOT NULL,
  `peran_id` int(11) NOT NULL,
  `status_realisasi` enum('BELUM','SUDAH') NOT NULL DEFAULT 'BELUM',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_susunan_tim`
--

INSERT INTO `perjadin_susunan_tim` (`id`, `perjadin_id`, `perjadin_rab_id`, `perjadin_realisasi_id`, `pegawai_id`, `peran_id`, `status_realisasi`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 2, 'SUDAH', '2021-11-23 00:48:41', '2021-11-23 01:01:16', NULL),
(2, 1, 2, 2, 3, 4, 'SUDAH', '2021-11-23 00:48:41', '2021-11-23 01:01:16', NULL),
(3, 2, 3, 3, 1, 2, 'SUDAH', '2021-11-25 07:07:01', '2021-11-25 23:18:31', NULL),
(4, 2, 4, 4, 2, 3, 'SUDAH', '2021-11-25 07:07:01', '2021-11-25 23:18:31', NULL),
(5, 2, 5, 5, 3, 4, 'SUDAH', '2021-11-25 07:07:01', '2021-11-25 23:18:31', NULL),
(6, 3, 6, 6, 95, 3, 'SUDAH', '2021-11-26 00:38:19', '2021-11-26 00:47:47', NULL),
(7, 3, 7, 7, 159, 4, 'SUDAH', '2021-11-26 00:38:19', '2021-11-26 00:47:47', NULL),
(8, 4, 8, NULL, 7, 1, 'BELUM', '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(9, 4, 9, NULL, 17, 2, 'BELUM', '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(10, 4, 10, NULL, 181, 4, 'BELUM', '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(15, 5, 15, 8, 8, 4, 'SUDAH', '2021-12-01 08:24:55', '2021-12-01 08:30:42', NULL),
(16, 5, 16, 9, 4, 3, 'SUDAH', '2021-12-01 08:24:55', '2021-12-01 08:30:42', NULL),
(17, 5, 17, 10, 196, 3, 'SUDAH', '2021-12-01 08:24:55', '2021-12-01 08:30:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_persediaan`
--

CREATE TABLE `permintaan_persediaan` (
  `id` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `status` enum('PENGAJUAN','VERIFIKASI UMUM','REVISI UMUM','SELESAI','DITOLAK') NOT NULL DEFAULT 'PENGAJUAN',
  `file` varchar(512) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tahun_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permintaan_persediaan`
--

INSERT INTO `permintaan_persediaan` (`id`, `keterangan`, `status`, `file`, `nama`, `tahun_id`, `user_id`, `bidang_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'asdjklajsdlkasd', 'SELESAI', NULL, NULL, 1, 1, 1, '2021-11-23 01:10:04', '2021-11-23 01:12:19', NULL),
(2, 'asdasdasd', 'SELESAI', NULL, NULL, 1, 1, 9, '2021-11-26 01:15:04', '2021-11-26 01:16:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_persediaan_detail`
--

CREATE TABLE `permintaan_persediaan_detail` (
  `id` int(11) NOT NULL,
  `permintaan_persediaan_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah_permintaan` double NOT NULL,
  `jumlah_disetujui` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permintaan_persediaan_detail`
--

INSERT INTO `permintaan_persediaan_detail` (`id`, `permintaan_persediaan_id`, `barang_id`, `jumlah_permintaan`, `jumlah_disetujui`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 5, 3, '2021-11-23 01:10:04', '2021-11-23 01:12:19', NULL),
(2, 1, 2, 6, 2, '2021-11-23 01:10:04', '2021-11-23 01:12:19', NULL),
(3, 1, 3, 15, 5, '2021-11-23 01:10:04', '2021-11-23 01:12:19', NULL),
(4, 2, 1, 1, 2, '2021-11-26 01:15:04', '2021-11-26 01:16:08', NULL),
(5, 2, 2, 20, 22, '2021-11-26 01:15:04', '2021-11-26 01:16:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_persediaan_lampiran`
--

CREATE TABLE `permintaan_persediaan_lampiran` (
  `id` int(11) NOT NULL,
  `permintaan_persediaan_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permintaan_persediaan_lampiran`
--

INSERT INTO `permintaan_persediaan_lampiran` (`id`, `permintaan_persediaan_id`, `nama`, `file`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'laporan penambahan sop layanan unggulan.pdf', 'permintaan/lampiran/GpILA1yUJg1lZEMQMIHO3AAlZHbhPKAQ0hNlgM6g.pdf', 1, '2021-11-23 01:10:05', '2021-11-23 01:10:05', NULL),
(2, 2, 'LAPORAN KAS DHARMA WANITA ITJEN.pptx', 'permintaan/lampiran/KNF7aZh05W8HeKICcyI6xMUOpfPTwIkTY5O8Uknd.pptx', 1, '2021-11-26 01:15:04', '2021-11-26 01:15:04', NULL),
(3, 2, 'kuitansi_6.docx', 'permintaan/lampiran/bqefSPc37CebvNcPjCtCR85sV9cXx4fLrz0Gc5TV.bin', 1, '2021-11-26 01:15:04', '2021-11-26 01:15:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_persediaan_log`
--

CREATE TABLE `permintaan_persediaan_log` (
  `id` int(11) NOT NULL,
  `permintaan_persediaan_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permintaan_persediaan_log`
--

INSERT INTO `permintaan_persediaan_log` (`id`, `permintaan_persediaan_id`, `status`, `user_id`, `bidang_id`, `keterangan`, `catatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-23 01:10:04', '2021-11-23 01:10:04', NULL),
(2, 1, 'KIRIM UMUM - VERIFIKASI UMUM', 1, 1, 'permintaan persediaan telah dikirim ke umum oleh ABBAS,SH.MH', 'asdasdasdasd', '2021-11-23 01:11:48', '2021-11-23 01:11:48', NULL),
(3, 1, 'SELESAI', 7, 1, 'Permintaan persediaan telah di proses oleh oleh ADE CICI ROHAYATI, SH.MH', 'ok', '2021-11-23 01:12:19', '2021-11-23 01:12:19', NULL),
(4, 2, 'PENGAJUAN', 1, 9, 'PERJADIN TELAH DIBUAT, OLEH AMI AMATUNISSA, S.H., M.H.', NULL, '2021-11-26 01:15:04', '2021-11-26 01:15:04', NULL),
(5, 2, 'KIRIM UMUM - VERIFIKASI UMUM', 1, 9, 'permintaan persediaan telah dikirim ke umum oleh AMI AMATUNISSA, S.H., M.H.', 'Minta di Proses', '2021-11-26 01:15:13', '2021-11-26 01:15:13', NULL),
(6, 2, 'SELESAI', 7, 1, 'Permintaan persediaan telah di proses oleh oleh RINTAKA JAYADI BRATA, S.Kom.', NULL, '2021-11-26 01:16:08', '2021-11-26 01:16:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peta_kompetensi`
--

CREATE TABLE `peta_kompetensi` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `bidang_ilmu_id` int(11) NOT NULL,
  `nama_pelatihan` varchar(512) NOT NULL,
  `tahun_pelaksanaan` int(11) NOT NULL,
  `level` enum('BEGINNER','INTERMEDIETE','ADVANCE','EXPERT') NOT NULL,
  `skala` enum('INTERNASIONAL','NASIONAL','LOKAL') NOT NULL,
  `penyelenggara` varchar(512) NOT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_akhir` datetime DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `file` varchar(512) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peta_kompetensi`
--

INSERT INTO `peta_kompetensi` (`id`, `pegawai_id`, `bidang_ilmu_id`, `nama_pelatihan`, `tahun_pelaksanaan`, `level`, `skala`, `penyelenggara`, `tanggal_mulai`, `tanggal_akhir`, `nama_file`, `file`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'Audit Tematik', 2021, 'BEGINNER', 'LOKAL', 'BPKP', '2021-11-23 00:00:00', '2021-11-30 00:00:00', 'Usulan SK Rumah Dinas Es1.pdf', 'sertifikat//Oe8GNLcVMzBPVGl29fs8lTVjjI5VmHdUXtSS1xnA.pdf', 1, '2021-11-23 01:06:05', '2021-11-23 01:06:05', NULL),
(2, 277, 1, 'LATSAR CPNS', 2021, 'BEGINNER', 'LOKAL', 'BPSDM', '2021-11-01 00:00:00', '2021-11-30 00:00:00', 'Backdrop panggung.png', 'sertifikat//sNmVyadFARP8dsCL9jXQuuYmVccNmL709v5QYUTP.png', 1, '2021-11-26 01:19:46', '2021-11-26 01:19:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `revisi_anggaran`
--

CREATE TABLE `revisi_anggaran` (
  `id` int(11) NOT NULL,
  `tahun_id` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `nama_file` text DEFAULT NULL,
  `status` enum('BUKA','TUTUP','VERIFIKASI','SELESAI') NOT NULL DEFAULT 'BUKA',
  `tanggal_mulai` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `revisi_anggaran`
--

INSERT INTO `revisi_anggaran` (`id`, `tahun_id`, `keterangan`, `file`, `nama_file`, `status`, `tanggal_mulai`, `tanggal_akhir`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 'BUKA', 'revisi_anggaran/master/VCE4cqSFLtZC40u1uPEQYCgQUSOrNFMqSd1xMTYM.jpg', 'REVISI_ANGGARAN_Academic Transcript 2.jpg', 'SELESAI', '2021-12-07', '2021-12-24', 5, '2021-12-06 19:43:32', '2021-12-07 01:17:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `revisi_anggaran_detail`
--

CREATE TABLE `revisi_anggaran_detail` (
  `id` int(11) NOT NULL,
  `revisi_anggaran_id` int(5) NOT NULL,
  `bidang_id` int(5) NOT NULL,
  `pagu_awal` double NOT NULL DEFAULT 0,
  `pagu_akhir` double NOT NULL DEFAULT 0,
  `pagu_realokasi` double NOT NULL DEFAULT 0,
  `status` enum('PROSES','VERIFIKASI','VERIFIED','REVISI','SELESAI') NOT NULL DEFAULT 'PROSES',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `revisi_anggaran_detail`
--

INSERT INTO `revisi_anggaran_detail` (`id`, `revisi_anggaran_id`, `bidang_id`, `pagu_awal`, `pagu_akhir`, `pagu_realokasi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 2, 1, 3631126000, 3631126000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(13, 2, 2, 3735275000, 3735275000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(14, 2, 3, 3772965000, 3772965000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(15, 2, 4, 3754679000, 3754679000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(16, 2, 5, 3656275000, 3656275000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(17, 2, 6, 6340665000, 6340665000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(18, 2, 7, 1184090000, 1184090000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(19, 2, 8, 579636000, 579636000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(20, 2, 9, 129070000, 127420000, 1650000, 'VERIFIED', '2021-12-06 19:43:32', '2021-12-06 23:45:49', NULL),
(21, 2, 10, 320693000, 320693000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL),
(22, 2, 11, 613600000, 613600000, 0, 'PROSES', '2021-12-06 19:43:32', '2021-12-06 19:43:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `revisi_anggaran_detail_mak`
--

CREATE TABLE `revisi_anggaran_detail_mak` (
  `id` int(11) NOT NULL,
  `revisi_anggaran_detail_id` int(5) NOT NULL,
  `mak_id` int(5) NOT NULL,
  `pagu_awal` double NOT NULL,
  `pagu_akhir` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `revisi_anggaran_detail_mak`
--

INSERT INTO `revisi_anggaran_detail_mak` (`id`, `revisi_anggaran_detail_id`, `mak_id`, `pagu_awal`, `pagu_akhir`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 20, 141, 1650000, 1650000, '2021-12-06 22:29:53', '2021-12-06 22:29:53', NULL),
(18, 20, 142, 30340000, 30340000, '2021-12-06 22:29:53', '2021-12-06 22:29:53', NULL),
(19, 20, 159, 90480000, 90480000, '2021-12-06 22:29:53', '2021-12-06 22:29:53', NULL),
(20, 20, 160, 6600000, 0, '2021-12-06 22:29:53', '2021-12-06 22:29:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `satker`
--

CREATE TABLE `satker` (
  `id` int(11) NOT NULL,
  `kanwil_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(512) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satker`
--

INSERT INTO `satker` (`id`, `kanwil_id`, `nama`, `alamat`, `nomor_telepon`) VALUES
(1, 1, 'RUTAN LOHKNGA', 'ACEH', '123123');

-- --------------------------------------------------------

--
-- Table structure for table `sheet1`
--

CREATE TABLE `sheet1` (
  `No` int(2) DEFAULT NULL,
  `GOLONGAN` varchar(4) DEFAULT NULL,
  `NAMA` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sheet1`
--

INSERT INTO `sheet1` (`No`, `GOLONGAN`, `NAMA`) VALUES
(1, 'IVe', 'Pembina Utama'),
(2, 'IVd', 'Pembina Utama Madya'),
(3, 'IVc', 'Pembina Utama Muda'),
(4, 'IVb', 'Pembina Tingkat I'),
(5, 'IVa', 'Pembina'),
(6, 'IIId', 'Penata Tingkat I'),
(7, 'IIIc', 'Penata'),
(8, 'IIIb', 'Penata Muda Tingkat I'),
(9, 'IIIa', 'Penata Muda'),
(10, 'IId', 'Pengatur Tingkat I'),
(11, 'IIc', 'Pengatur'),
(12, 'IIb', 'Pengatur Muda Tingkat I'),
(13, 'IIa', 'Pengatur Muda'),
(14, 'Id', 'Juru Tingkat I'),
(15, 'Ic', 'Juru'),
(16, 'Ib', 'Juru Muda Tingkat I'),
(17, 'Ia', 'Juru Muda');

-- --------------------------------------------------------

--
-- Table structure for table `surat_perintah`
--

CREATE TABLE `surat_perintah` (
  `id` int(11) NOT NULL,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `tanggal_surat` datetime DEFAULT NULL,
  `perihal` varchar(512) DEFAULT NULL,
  `perjadin` enum('YA','TIDAK') NOT NULL,
  `tahun_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_perintah`
--

INSERT INTO `surat_perintah` (`id`, `nomor_surat`, `tanggal_surat`, `perihal`, `perjadin`, `tahun_id`, `user_id`, `bidang_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ITJ.1.SDASDASDAS', '2021-11-23 00:00:00', 'kjALSKDJLAKSJD', 'YA', 1, 1, 1, '2021-11-23 00:48:41', '2021-11-23 00:48:41', NULL),
(2, 'ITJ.q2eqwewe', '2021-11-26 00:00:00', 'Reviu LK pada Kanwil Jawa Barat', 'YA', 1, 1, 1, '2021-11-25 07:07:01', '2021-11-25 07:07:01', NULL),
(3, 'ITJ.xxx', '2021-11-26 00:00:00', 'Evaluasi WBK WBBM Lampung', 'YA', 1, 1, 9, '2021-11-26 00:38:19', '2021-11-26 00:38:19', NULL),
(4, 'ITJ.1.KP.01.01', '2021-11-30 00:00:00', '-', 'YA', 1, 1, 1, '2021-11-30 23:07:27', '2021-11-30 23:07:27', NULL),
(5, 'itj.1.04.04-75', '2021-11-30 00:00:00', '-', 'YA', 1, 1, 9, '2021-12-01 00:45:32', '2021-12-01 00:45:32', NULL),
(6, 'itj.1.04.04-75', '2021-11-30 00:00:00', '-', 'YA', 1, 1, 9, '2021-12-01 00:45:41', '2021-12-01 00:45:41', NULL),
(7, 'itj.1.04.04-75', '2021-11-30 00:00:00', '-', 'YA', 1, 1, 9, '2021-12-01 00:45:47', '2021-12-01 00:45:47', NULL),
(8, 'itj.1.04.04-75', '2021-11-30 00:00:00', '-', 'YA', 1, 1, 9, '2021-12-01 00:45:57', '2021-12-01 00:45:57', NULL),
(9, 'ITJ.1.KP.04.04-251', '2021-11-29 00:00:00', '-', 'YA', 1, 1, 9, '2021-12-01 00:50:48', '2021-12-01 00:50:48', NULL),
(10, 'ITJ.1.KP.04.04-251', '2021-11-29 00:00:00', '-', 'YA', 1, 1, 9, '2021-12-01 00:50:54', '2021-12-01 00:50:54', NULL),
(11, '123123', '2021-12-01 00:00:00', 'asdasdas', 'YA', 1, 3, 1, '2021-12-01 01:08:15', '2021-12-01 01:08:15', NULL),
(12, 'Lucky Ganteng', '2021-12-01 00:00:00', 'saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'YA', 1, 3, 1, '2021-12-01 01:08:59', '2021-12-01 05:45:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tahun`
--

CREATE TABLE `tahun` (
  `id` int(11) NOT NULL,
  `nama` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tahun`
--

INSERT INTO `tahun` (`id`, `nama`) VALUES
(1, 2021),
(2, 2022),
(3, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `urusan`
--

CREATE TABLE `urusan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `urusan`
--

INSERT INTO `urusan` (`id`, `nama`) VALUES
(1, 'PEMERIKSAAN RUTIN'),
(2, 'REVIEW KEUANGAN'),
(3, 'EVALUASI LAKIP'),
(4, 'PENGAWASAN LUAR NEGERI'),
(5, 'AUDIT SERTIJAB'),
(6, 'AUDIT TEMATIK'),
(7, 'AUDIT PERMINTAAN INSTANSI LAIN'),
(8, 'KHUSUS (PENGADUAN MASYARAKAT)'),
(9, 'PEMANTAUAN'),
(10, 'DUKUNGAN MANAJEMEN LAINNYA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','PPK','USER','VERIFIKATOR','BENDAHARA','ADMIN KEUANGAN','ADMIN KEPEGAWAIAN','ADMIN KEUANGAN','ADMIN UMUM') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ability` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `bidang_id`, `pegawai_id`, `nama`, `role`, `ability`, `created_at`, `updated_at`) VALUES
(1, '123456', '123456', 9, 25, 'LUCKY', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"user\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_user\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"},{\"action\" : \"manage\", \"subject\" : \"laporan\"},{\"action\" : \"manage\", \"subject\" : \"data_pegawai\"},{\"action\" : \"manage\", \"subject\" : \"mak\"},{\"action\" : \"manage\", \"subject\" : \"revisi_anggaran\"}]', NULL, NULL),
(2, '1235', '123456', 3, 17, 'JOKO', 'PPK', '[{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_ppk\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"}]', NULL, NULL),
(3, '1236', '123456', 1, 100, 'DIO', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"user\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_user\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"},{\"action\" : \"manage\", \"subject\" : \"laporan\"},{\"action\" : \"manage\", \"subject\" : \"data_pegawai\"},{\"action\" : \"manage\", \"subject\" : \"mak\"}]', NULL, NULL),
(4, '12347', '123456', 1, 219, 'EMA', 'BENDAHARA', '[{\"action\" : \"manage\", \"subject\" : \"bendahara\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_bendahara\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"}]', NULL, NULL),
(5, '12348', '123456', 1, 214, 'PRISI', 'ADMIN KEUANGAN', '[{\"action\" : \"manage\", \"subject\" : \"admin_keuangan\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_keuangan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"},{\"action\" : \"manage\", \"subject\" : \"revisi_anggaran\"}]', NULL, NULL),
(6, '12341', '123456', 1, 173, 'EDO', 'ADMIN KEPEGAWAIAN', '[{\"action\" : \"manage\", \"subject\" : \"admin_kepegawaian\"},{\"action\" : \"manage\", \"subject\" : \"data_pegawai\"}]', NULL, NULL),
(7, '12342', '123456', 1, 159, 'EDO', 'ADMIN UMUM', '[{\"action\" : \"manage\", \"subject\" : \"admin_umum\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_umum\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"}]', NULL, NULL),
(8, '199003182017121001', '123456', 11, 161, 'M Munzir', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"user\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_user\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"},{\"action\" : \"manage\", \"subject\" : \"laporan\"},{\"action\" : \"manage\", \"subject\" : \"data_pegawai\"},{\"action\" : \"manage\", \"subject\" : \"mak\"}]', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidang_ilmu`
--
ALTER TABLE `bidang_ilmu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kanwil`
--
ALTER TABLE `kanwil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu_persediaan`
--
ALTER TABLE `kartu_persediaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan_lampiran`
--
ALTER TABLE `kegiatan_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan_log`
--
ALTER TABLE `kegiatan_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan_realisasi`
--
ALTER TABLE `kegiatan_realisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan_realisasi_lampiran`
--
ALTER TABLE `kegiatan_realisasi_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mak`
--
ALTER TABLE `mak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mak2`
--
ALTER TABLE `mak2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_lampiran`
--
ALTER TABLE `pembelian_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peran`
--
ALTER TABLE `peran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin`
--
ALTER TABLE `perjadin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_hasil`
--
ALTER TABLE `perjadin_hasil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_lampiran`
--
ALTER TABLE `perjadin_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_log`
--
ALTER TABLE `perjadin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_obrik`
--
ALTER TABLE `perjadin_obrik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_rab`
--
ALTER TABLE `perjadin_rab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_realisasi`
--
ALTER TABLE `perjadin_realisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_realisasi_lampiran`
--
ALTER TABLE `perjadin_realisasi_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_realisasi_transport`
--
ALTER TABLE `perjadin_realisasi_transport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_realisasi_uang_harian`
--
ALTER TABLE `perjadin_realisasi_uang_harian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_realisasi_uang_hotel`
--
ALTER TABLE `perjadin_realisasi_uang_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjadin_susunan_tim`
--
ALTER TABLE `perjadin_susunan_tim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_persediaan`
--
ALTER TABLE `permintaan_persediaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_persediaan_detail`
--
ALTER TABLE `permintaan_persediaan_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_persediaan_lampiran`
--
ALTER TABLE `permintaan_persediaan_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permintaan_persediaan_log`
--
ALTER TABLE `permintaan_persediaan_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peta_kompetensi`
--
ALTER TABLE `peta_kompetensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisi_anggaran`
--
ALTER TABLE `revisi_anggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisi_anggaran_detail`
--
ALTER TABLE `revisi_anggaran_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisi_id` (`revisi_anggaran_id`);

--
-- Indexes for table `revisi_anggaran_detail_mak`
--
ALTER TABLE `revisi_anggaran_detail_mak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisi_detail_id` (`revisi_anggaran_detail_id`);

--
-- Indexes for table `satker`
--
ALTER TABLE `satker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_perintah`
--
ALTER TABLE `surat_perintah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tahun`
--
ALTER TABLE `tahun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `urusan`
--
ALTER TABLE `urusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bidang`
--
ALTER TABLE `bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bidang_ilmu`
--
ALTER TABLE `bidang_ilmu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `golongan`
--
ALTER TABLE `golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kanwil`
--
ALTER TABLE `kanwil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kartu_persediaan`
--
ALTER TABLE `kartu_persediaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kegiatan_lampiran`
--
ALTER TABLE `kegiatan_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `kegiatan_log`
--
ALTER TABLE `kegiatan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `kegiatan_realisasi`
--
ALTER TABLE `kegiatan_realisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan_realisasi_lampiran`
--
ALTER TABLE `kegiatan_realisasi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mak`
--
ALTER TABLE `mak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `mak2`
--
ALTER TABLE `mak2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pembelian_lampiran`
--
ALTER TABLE `pembelian_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peran`
--
ALTER TABLE `peran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin`
--
ALTER TABLE `perjadin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `perjadin_hasil`
--
ALTER TABLE `perjadin_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_lampiran`
--
ALTER TABLE `perjadin_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `perjadin_log`
--
ALTER TABLE `perjadin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `perjadin_obrik`
--
ALTER TABLE `perjadin_obrik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `perjadin_rab`
--
ALTER TABLE `perjadin_rab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `perjadin_realisasi`
--
ALTER TABLE `perjadin_realisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_lampiran`
--
ALTER TABLE `perjadin_realisasi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_transport`
--
ALTER TABLE `perjadin_realisasi_transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_uang_harian`
--
ALTER TABLE `perjadin_realisasi_uang_harian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_uang_hotel`
--
ALTER TABLE `perjadin_realisasi_uang_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `perjadin_susunan_tim`
--
ALTER TABLE `perjadin_susunan_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `permintaan_persediaan`
--
ALTER TABLE `permintaan_persediaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permintaan_persediaan_detail`
--
ALTER TABLE `permintaan_persediaan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permintaan_persediaan_lampiran`
--
ALTER TABLE `permintaan_persediaan_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permintaan_persediaan_log`
--
ALTER TABLE `permintaan_persediaan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peta_kompetensi`
--
ALTER TABLE `peta_kompetensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `revisi_anggaran`
--
ALTER TABLE `revisi_anggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `revisi_anggaran_detail`
--
ALTER TABLE `revisi_anggaran_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `revisi_anggaran_detail_mak`
--
ALTER TABLE `revisi_anggaran_detail_mak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `satker`
--
ALTER TABLE `satker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_perintah`
--
ALTER TABLE `surat_perintah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tahun`
--
ALTER TABLE `tahun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `urusan`
--
ALTER TABLE `urusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `revisi_anggaran_detail`
--
ALTER TABLE `revisi_anggaran_detail`
  ADD CONSTRAINT `revisi_id` FOREIGN KEY (`revisi_anggaran_id`) REFERENCES `revisi_anggaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `revisi_anggaran_detail_mak`
--
ALTER TABLE `revisi_anggaran_detail_mak`
  ADD CONSTRAINT `revisi_detail_id` FOREIGN KEY (`revisi_anggaran_detail_id`) REFERENCES `revisi_anggaran_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
