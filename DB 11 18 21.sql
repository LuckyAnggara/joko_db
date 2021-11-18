-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 10:00 PM
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
(1, 'KERTAS A4', 'DUS', '2021-11-09 02:36:44', '2021-11-09 02:36:44', NULL),
(2, 'PULPEN', 'BOX', '2021-11-08 20:57:53', '2021-11-08 21:36:04', NULL);

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
(1, 'INSPEKTORAT WILAYAH I', '2021-10-01 10:31:39', NULL, NULL),
(2, 'INSPEKTORAT WILAYAH II', '2021-10-01 10:31:39', NULL, NULL),
(3, 'INSPEKTORAT WILAYAH III', '2021-10-01 10:31:39', NULL, NULL),
(4, 'INSPEKTORAT WILAYAH IV', '2021-10-01 10:31:39', NULL, NULL),
(5, 'INSPEKTORAT WILAYAH V', '2021-10-01 10:31:39', NULL, NULL),
(6, 'INSPEKTORAT WILAYAH VI', '2021-10-01 10:31:39', NULL, NULL),
(7, 'BAGIAN UMUM', '2021-10-01 10:31:39', NULL, NULL),
(8, 'BAGIAN KEPEGAWAIAN', '2021-10-01 10:31:39', NULL, NULL),
(9, 'BAGIAN PHP', '2021-10-01 10:31:39', NULL, NULL),
(10, 'BAGIAN KEUANGAN', '2021-10-01 10:31:39', NULL, NULL),
(11, 'BAGIAN SIP', '2021-10-01 10:31:39', NULL, NULL);

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
(1, 'I/A', 'JURU MUDA');

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
(1, 'AUDITOR PERTAMA', 'JFT');

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
(34, 1, 5, 0, 7, NULL, '', '2021-11-15 16:56:39', '2021-11-15 16:56:39', NULL),
(36, 1, 0, 4, 7, NULL, '', '2021-11-16 16:06:27', '2021-11-16 16:06:27', NULL);

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
(1, '2021-1', '123123', 1, 'Jakarta', 'asdasd', 2000000, 500000, 'SUDAH', 'SELESAI', 1, '2021-11-02', '2021-11-02', 1, 1, 1, 1, 2, 3, '2021-10-31 08:46:10', '2021-10-31 08:59:54', NULL),
(3, '2021-3', 'Rapat Pembahasan BMN', 1, 'Jakarta', '1 Laporan Kegiatan', 2000000, 1500000, 'SUDAH', 'SELESAI', 1, '2021-11-10', '2021-11-10', 1, 1, 1, 1, 2, 3, '2021-11-06 14:50:17', '2021-11-06 15:01:37', NULL);

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
(1, 1, '7M202071.jpg', 'kegiatan/01vsIM3Au0RLEms5ueFZV1oNnuQXPbaaCMRmzq8u.jpg', 1, '2021-10-31 08:46:11', '2021-10-31 08:46:11'),
(3, 1, 'IMG_4978.JPG', 'kegiatan/BmpsRIJIklrG7ejpNERUoAwIwEz94Hg7gYCQu9XG.jpg', 1, '2021-10-31 08:55:03', '2021-10-31 08:55:03'),
(4, 3, 'tata kelola KKP.pdf', 'kegiatan/8R1dCpPnDwhT1VaRzS0Gh0Elpa6jboV26RRqEGaD.pdf', 1, '2021-11-06 14:50:18', '2021-11-06 14:50:18'),
(5, 3, 'tim efektif.pdf', 'kegiatan/W675H5kpz41ttIynvnjW7Nd0COXUm1UV1E2Od53i.pdf', 1, '2021-11-06 14:50:18', '2021-11-06 14:50:18'),
(6, 3, 'tata kelola KKP.pdf', 'kegiatan/GDjBjiURbvNPSjCKs8xCTo3MsJWkYWAeisMy3uhZ.pdf', 1, '2021-11-06 14:54:22', '2021-11-06 14:54:22'),
(7, 3, 'tim efektif.pdf', 'kegiatan/pymf4nODwWIxDoSRHmV2QGVYRnJWCWrzql0FYXyp.pdf', 1, '2021-11-06 14:54:22', '2021-11-06 14:54:22');

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
(1, 1, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-10-31 08:46:10', '2021-10-31 08:46:10', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'assssss', '2021-10-31 08:52:52', '2021-10-31 08:52:52', NULL),
(4, 1, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'aaaaaaaa', '2021-10-31 08:54:44', '2021-10-31 08:54:44', NULL),
(5, 1, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'ssssssss', '2021-10-31 08:55:11', '2021-10-31 08:55:11', NULL),
(6, 1, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'aaaaaaaaaa', '2021-10-31 08:55:21', '2021-10-31 08:55:21', NULL),
(7, 1, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'aaaaaa', '2021-10-31 08:56:16', '2021-10-31 08:56:16', NULL),
(8, 1, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'sadasdasd', '2021-10-31 08:59:54', '2021-10-31 08:59:54', NULL),
(9, 3, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-06 14:50:17', '2021-11-06 14:50:17', NULL),
(10, 3, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Tolong di periksa', '2021-11-06 14:51:50', '2021-11-06 14:51:50', NULL),
(11, 3, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'Lanjut', '2021-11-06 14:53:21', '2021-11-06 14:53:21', NULL),
(12, 3, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'cek realisasi', '2021-11-06 15:00:23', '2021-11-06 15:00:23', NULL),
(13, 3, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'aasdasdasd', '2021-11-06 15:00:44', '2021-11-06 15:00:44', NULL),
(14, 3, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'ddddd', '2021-11-06 15:01:05', '2021-11-06 15:01:05', NULL),
(15, 3, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'aaaaaaaaa', '2021-11-06 15:01:37', '2021-11-06 15:01:37', NULL);

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
(160, '1569.EAI.001.051.A.524113', 'Penyelenggaraan Kehumasan dan peliputan-Belanja Perjalanan Dinas Dalam Kota', 6600000, 9, 1, 1, NULL, NULL, NULL),
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
(1, '1563.321.051.A.524111', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 387720000, 1, 1, 1, '2021-10-01 11:04:18', '2021-11-15 00:15:37', NULL),
(2, '1563.321.051.A.524112', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 503000000, 2, 1, 1, '2021-10-05 04:48:34', '2021-11-15 00:15:37', NULL),
(3, '1563.321.051.A.524113', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 63370000, 3, 1, 1, '2021-10-05 05:05:25', '2021-11-11 23:47:43', NULL),
(4, '14141.14141', 'Perjalanan Dinas', 1348910000, 1, 1, 1, '2021-10-09 02:21:25', '2021-11-14 04:42:46', NULL),
(5, '1239189381028', 'alksdjlkasjdklasjdlkaj', 100000000, 7, 1, 5, '2021-11-17 20:55:31', '2021-11-17 20:55:31', NULL);

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
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nip`, `golongan_id`, `jabatan_id`, `bidang_id`, `tanggal_lahir`, `tanggal_masuk_itjen`, `foto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABBAS,SH.MH', '19740330 199803 1 001', 1, 1, 1, NULL, NULL, '', NULL, NULL, NULL),
(2, 'ABDUL HAMID, SE.', '19760901 200912 1 002', 1, 1, 1, NULL, NULL, '', NULL, NULL, NULL),
(3, 'ABDUL ROKHMAN, A.Md.', '19801211 200912 1 002', 1, 1, 1, NULL, NULL, '', NULL, NULL, NULL),
(4, 'ADE CICI ROHAYATI, SH.MH', '19740508 199803 2 001', 1, 1, 1, NULL, NULL, '', NULL, NULL, NULL),
(5, 'asdasd', 'asdasd', 1, 1, 4, '2021-11-09', NULL, 'foto_pegawai/avatar.jpg', '2021-11-07 08:37:46', '2021-11-07 08:37:46', NULL);

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
(14, '2', '2021-11-16 00:00:00', 'asa', 'sasaa', 7, '2021-11-15 16:52:52', '2021-11-15 16:52:52', NULL);

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
(17, 14, 1, 5, '2021-11-15 16:52:52', '2021-11-15 16:52:52', NULL);

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
(2, 13, 'Laporan MR 2019.pdf', 'pembelian/lampiran/IuBTupZOXi5slPlBXrjZMjglLx5zZsFeeR19Gxea.pdf', 7, '2021-11-15 16:49:56', '2021-11-15 16:49:56', NULL),
(3, 13, 'Pengisian Survei Layanan Internal di Lingkungan Inspektorat Jenderal Kementerian Hukum dan HAM (2).pdf', 'pembelian/lampiran/toShPas91xX7zEywWbvRcViumEfmAAIjk4c6krXF.pdf', 7, '2021-11-15 16:49:56', '2021-11-15 16:49:56', NULL),
(4, 14, 'Permintaan Dokumen SPIP Itjen.pdf', 'pembelian/lampiran/T3Rr89aRy0a5Dck3LlWSM9SOXoFJoQMVZFdGdeeP.pdf', 7, '2021-11-15 16:52:52', '2021-11-15 16:52:52', NULL),
(5, 15, 'SE Pedoman Pelaksanaan Evaluasi Penerapan MR.pdf', 'pembelian/lampiran/zkFrneEsnSV0QVmgqah0rcKbEXmcyYexOV9MWUm1.pdf', 7, '2021-11-15 16:56:39', '2021-11-15 16:56:39', NULL);

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
  `status` enum('PENGAJUAN','REVISI KEUANGAN','VERIFIKASI KEUANGAN','PELAKSANAAN','VERIFIKASI PPK','SELESAI','REVISI PPK','VERIFIKASI REALISASI','VERIFIED KEUANGAN','VERIFIED PPK','TOLAK PPK') NOT NULL DEFAULT 'PENGAJUAN',
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
(1, '1-021121-1', 1, 1, 4, 'asdasd', 'Jakarta', '2021-11-02 00:00:00', '2021-11-14 00:00:00', 800000, 'SUDAH', 1000000, 'SELESAI', 'asdasd', NULL, 1, 2, 1, 1, 1, '2021-10-31 07:49:20', '2021-10-31 08:50:43', NULL),
(2, '1-081121-1', 2, 1, 4, 'Bandung', 'Jakarta', '2021-11-08 00:00:00', '2021-11-12 00:00:00', 5520000, 'SUDAH', 3200000, 'SELESAI', 'Evaluasi Keuangan', NULL, 3, 4, 1, 1, 1, '2021-11-06 15:06:01', '2021-11-06 15:13:36', NULL),
(3, '1-151121-1', 3, 4, 4, 'asdasdas', 'Jakarta', '2021-11-15 00:00:00', '2021-11-18 00:00:00', 9740000, 'SUDAH', 3640000, 'VERIFIKASI PPK', 'dasdasdasd', NULL, 1, 5, 1, 1, 1, '2021-11-14 04:44:09', '2021-11-18 01:03:03', NULL),
(4, '1-181121-1', 4, 12, 2, 'Bandung', 'Jakarta', '2021-11-18 00:00:00', '2021-11-23 00:00:00', 9464000, 'BELUM', 0, 'PELAKSANAAN', 'TPN WBK WBBM', NULL, 1, 5, 1, 1, 1, '2021-11-18 06:00:07', '2021-11-18 06:19:04', NULL);

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
(1, 2, 'SP', 'SP_tata kelola KKP.pdf', 'perjadin/kEyPxaLA5Zwhfs8Y7zDnVVxZyJYF1iWujYBnn8CY.pdf', 1, '2021-11-06 15:06:03', '2021-11-06 15:06:03', NULL),
(2, 2, 'SP', 'SP_tim efektif.pdf', 'perjadin/xJMpMEddcXAb0RbXUvYCfWugTsyiT706S6WPdYC8.pdf', 1, '2021-11-06 15:06:03', '2021-11-06 15:06:03', NULL),
(3, 3, 'SP', 'SP_laporan penambahan sop layanan unggulan.pdf', 'perjadin/0fJSOiLW7awZ7SyVZotx7F7qzPNaZQAjImGxVk88.pdf', 1, '2021-11-14 04:44:10', '2021-11-14 04:44:10', NULL),
(4, 4, 'SP', 'SP_Laporan Audit BBM TASIK.pdf', 'perjadin/wApfW4AR5kAsFcpW4frGw2HAFim2z6up662nCwju.pdf', 1, '2021-11-18 06:00:08', '2021-11-18 06:00:08', NULL);

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
(1, 1, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-10-31 07:49:20', '2021-10-31 07:49:20', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'yaaaaaaaa', '2021-10-31 08:47:09', '2021-10-31 08:47:09', NULL),
(3, 1, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'sadasd', '2021-10-31 08:47:39', '2021-10-31 08:47:39', NULL),
(4, 1, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'dsadasd', '2021-10-31 08:49:13', '2021-10-31 08:49:13', NULL),
(5, 1, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'asdasd', '2021-10-31 08:49:32', '2021-10-31 08:49:32', NULL),
(6, 1, 'VERIFIED PPK', 2, 3, 'perjadin telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'sssss', '2021-10-31 08:50:21', '2021-10-31 08:50:21', NULL),
(7, 1, 'SELESAI', 4, 1, 'Uang perjadin telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'sdsssss', '2021-10-31 08:50:43', '2021-10-31 08:50:43', NULL),
(8, 2, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-06 15:06:01', '2021-11-06 15:06:01', NULL),
(9, 2, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'aaaaaaa', '2021-11-06 15:06:10', '2021-11-06 15:06:10', NULL),
(10, 2, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'sajdkasd', '2021-11-06 15:08:19', '2021-11-06 15:08:19', NULL),
(11, 2, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'safasfa', '2021-11-06 15:10:04', '2021-11-06 15:10:04', NULL),
(12, 2, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'hhhhhhh', '2021-11-06 15:12:05', '2021-11-06 15:12:05', NULL),
(13, 2, 'VERIFIED PPK', 2, 3, 'perjadin telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'qqqqqqq', '2021-11-06 15:13:11', '2021-11-06 15:13:11', NULL),
(14, 2, 'SELESAI', 4, 1, 'Uang perjadin telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'dddddddd', '2021-11-06 15:13:36', '2021-11-06 15:13:36', NULL),
(15, 3, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-14 04:44:09', '2021-11-14 04:44:09', NULL),
(16, 3, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'aaaaaaaaaaaa', '2021-11-14 04:45:20', '2021-11-14 04:45:20', NULL),
(17, 3, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'ok laksanakan', '2021-11-17 22:35:59', '2021-11-17 22:35:59', NULL),
(18, 3, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'eeee', '2021-11-17 23:23:26', '2021-11-17 23:23:26', NULL),
(19, 3, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'sssssssssss', '2021-11-18 01:03:03', '2021-11-18 01:03:03', NULL),
(20, 4, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL),
(21, 4, 'KIRIM KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'ok', '2021-11-18 06:01:49', '2021-11-18 06:01:49', NULL),
(22, 4, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'ok', '2021-11-18 06:19:04', '2021-11-18 06:19:04', NULL);

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
(1, 1, 1, 1, '2021-10-31 07:49:20', '2021-10-31 07:49:20', NULL),
(2, 2, 1, 4, '2021-11-06 15:06:01', '2021-11-06 15:06:01', NULL),
(3, 2, 1, 3, '2021-11-06 15:06:01', '2021-11-06 15:06:01', NULL),
(4, 3, 1, 3, '2021-11-14 04:44:09', '2021-11-14 04:44:09', NULL),
(5, 4, 1, 6, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL);

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
(1, 1, 1, 4, '2021-11-02 00:00:00', '2021-11-14 00:00:00', 200000, 0, 0, 0, 0, 0, 0, 0, 0, 800000, '2021-10-31 07:49:20', '2021-10-31 07:49:20', NULL),
(2, 2, 2, 2, '2021-11-08 00:00:00', '2021-11-10 00:00:00', 500000, 2, 560000, 0, 0, 250000, 250000, 0, 0, 2620000, '2021-11-06 15:06:01', '2021-11-06 15:06:01', NULL),
(3, 2, 3, 4, '2021-11-08 00:00:00', '2021-11-12 00:00:00', 500000, 3, 300000, 0, 0, 0, 0, 0, 0, 2900000, '2021-11-06 15:06:01', '2021-11-06 15:06:01', NULL),
(4, 3, 4, 4, '2021-11-15 00:00:00', '2021-11-18 00:00:00', 380000, 3, 550000, 1700000, 0, 0, 0, 0, 0, 4870000, '2021-11-14 04:44:09', '2021-11-14 04:44:09', NULL),
(5, 3, 5, 4, '2021-11-15 00:00:00', '2021-11-18 00:00:00', 380000, 3, 550000, 1700000, 0, 0, 0, 0, 0, 4870000, '2021-11-14 04:44:09', '2021-11-14 04:44:09', NULL),
(6, 4, 6, 5, '2021-11-18 00:00:00', '2021-11-23 00:00:00', 380000, 4, 580000, 0, 0, 512000, 0, 0, 0, 4732000, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL),
(7, 4, 7, 5, '2021-11-18 00:00:00', '2021-11-23 00:00:00', 380000, 4, 580000, 0, 0, 512000, 0, 0, 0, 4732000, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perjadin_realisasi`
--

CREATE TABLE `perjadin_realisasi` (
  `id` int(11) NOT NULL,
  `perjadin_id` int(11) NOT NULL,
  `susunan_tim_perjadin_id` int(11) NOT NULL,
  `jumlah_hari` double NOT NULL,
  `uang_harian` double NOT NULL,
  `tanggal_berangkat` date NOT NULL DEFAULT current_timestamp(),
  `tanggal_kembali` date NOT NULL DEFAULT current_timestamp(),
  `jumlah_malam` double NOT NULL,
  `uang_hotel` double NOT NULL,
  `udara` double NOT NULL,
  `laut` double NOT NULL,
  `darat` double NOT NULL,
  `taksi_jakarta` double NOT NULL,
  `taksi_provinsi` double NOT NULL,
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

INSERT INTO `perjadin_realisasi` (`id`, `perjadin_id`, `susunan_tim_perjadin_id`, `jumlah_hari`, `uang_harian`, `tanggal_berangkat`, `tanggal_kembali`, `jumlah_malam`, `uang_hotel`, `udara`, `laut`, `darat`, `taksi_jakarta`, `taksi_provinsi`, `representatif`, `total`, `jenis_hotel`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, 500000, '2021-11-02', '2021-11-14', 0, 0, 0, 0, 0, 0, 0, 0, 1000000, 0, '2021-10-31 08:47:58', '2021-10-31 08:47:58', NULL),
(2, 2, 2, 3, 500000, '2021-11-08', '2021-11-12', 3, 500000, 0, 0, 0, 0, 0, 0, 3000000, 0, '2021-11-06 15:09:55', '2021-11-06 15:09:55', NULL),
(3, 2, 3, 4, 50000, '2021-11-08', '2021-11-12', 0, 0, 0, 0, 0, 0, 0, 0, 200000, 0, '2021-11-06 15:09:55', '2021-11-06 15:09:55', NULL),
(4, 3, 4, 3, 200000, '2021-11-15', '2021-11-18', 2, 560000, 0, 0, 240000, 240000, 0, 0, 2200000, 0, '2021-11-17 23:23:17', '2021-11-17 23:23:17', NULL),
(5, 3, 5, 3, 200000, '2021-11-15', '2021-11-18', 2, 180000, 0, 0, 240000, 240000, 0, 0, 1440000, 1, '2021-11-17 23:23:17', '2021-11-17 23:23:17', NULL);

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
(1, 2, 'tim efektif.pdf', 'perjadin/lampiran/RTFc2FfdqGOD5nkDx5lt2u3YKMgvqAIpRmOcjTkH.pdf', '2021-11-06 15:09:56', '2021-11-06 15:09:56', NULL),
(2, 3, 'tim efektif.pdf', 'perjadin/lampiran/NhnoxtCz4aj0stGeLUJc55wwtZpg2tyIWHv8aoWg.pdf', '2021-11-06 15:09:57', '2021-11-06 15:09:57', NULL),
(3, 5, 'Pengisian Survei Layanan Internal di Lingkungan Inspektorat Jenderal Kementerian Hukum dan HAM (2).pdf', 'perjadin/lampiran/aC1LGwkpkoxwYOHqfHfwloeqsWYyjAlHUbFcQFwE.pdf', '2021-11-17 23:23:17', '2021-11-17 23:23:17', NULL),
(4, 4, 'Pengisian Survei Layanan Internal di Lingkungan Inspektorat Jenderal Kementerian Hukum dan HAM (2).pdf', 'perjadin/lampiran/V7UnxtRUKhZQfb8P87DSveXbfA7mylWWKXX2xQ1h.pdf', '2021-11-17 23:23:17', '2021-11-17 23:23:17', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_susunan_tim`
--

INSERT INTO `perjadin_susunan_tim` (`id`, `perjadin_id`, `perjadin_rab_id`, `perjadin_realisasi_id`, `pegawai_id`, `peran_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 2, 2, '2021-10-31 07:49:20', '2021-10-31 08:47:58', NULL),
(2, 2, 2, 2, 2, 2, '2021-11-06 15:06:01', '2021-11-06 15:09:55', NULL),
(3, 2, 3, 3, 3, 4, '2021-11-06 15:06:01', '2021-11-06 15:09:55', NULL),
(4, 3, 4, 4, 1, 3, '2021-11-14 04:44:09', '2021-11-17 23:23:17', NULL),
(5, 3, 5, 5, 2, 4, '2021-11-14 04:44:09', '2021-11-17 23:23:17', NULL),
(6, 4, 6, NULL, 2, 3, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL),
(7, 4, 7, NULL, 1, 4, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL);

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
(5, 'asaaa', 'SELESAI', NULL, NULL, 1, 1, 1, '2021-11-16 14:51:40', '2021-11-16 16:06:28', NULL);

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
(7, 5, 1, 4, 4, '2021-11-16 14:51:40', '2021-11-16 16:06:09', NULL);

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
(2, 4, '4.astrid.pdf', 'permintaan/lampiran/L5l8B6jooD1BwCTOfvFrghGo8n4QLoefGfrDtJhk.pdf', 1, '2021-11-16 14:50:28', '2021-11-16 14:50:28', NULL),
(3, 5, '4.astrid.pdf', 'permintaan/lampiran/dDaCRVgWZn7shkCamwOpXucf4ElGskznKQt5Boeh.pdf', 1, '2021-11-16 14:51:40', '2021-11-16 14:51:40', NULL);

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
(1, 2, 'PENGAJUAN', 7, 1, 'PERJADIN TELAH DIBUAT, OLEH ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-15 17:50:56', '2021-11-15 17:50:56', NULL),
(2, 2, 'KIRIM UMUM - VERIFIKASI UMUM', 1, 1, 'permintaan persediaan telah dikirim ke umum oleh ABBAS,SH.MH', 'aaaa', '2021-11-16 12:49:03', '2021-11-16 12:49:03', NULL),
(3, 2, 'RETUR DARI UMUM', 7, 1, 'permintaan persediaan telah dikembalikan oleh ADE CICI ROHAYATI, SH.MH', 'dddd', '2021-11-16 13:37:20', '2021-11-16 13:37:20', NULL),
(5, 5, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-16 14:51:40', '2021-11-16 14:51:40', NULL),
(6, 5, 'KIRIM UMUM - VERIFIKASI UMUM', 1, 1, 'permintaan persediaan telah dikirim ke umum oleh ABBAS,SH.MH', 'aa', '2021-11-16 14:52:24', '2021-11-16 14:52:24', NULL),
(7, 5, 'SELESAI', 7, 1, 'Permintaan persediaan telah di proses oleh oleh ADE CICI ROHAYATI, SH.MH', NULL, '2021-11-16 16:06:28', '2021-11-16 16:06:28', NULL);

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
(11, 1, 1, 'asdasd', 2021, 'INTERMEDIETE', 'NASIONAL', 'asdasdasdasd', '2021-11-10 00:00:00', '2021-11-14 00:00:00', NULL, NULL, 1, '2021-11-08 16:40:27', '2021-11-08 16:40:27', NULL),
(13, 1, 1, 'aaaaaaaaaa', 2018, 'EXPERT', 'LOKAL', 'axxxxxxxx', '2021-11-10 00:00:00', '2021-11-15 00:00:00', 'Undangan Maulid (04112021).pdf', 'sertifikat//WK9VqYC7cuDyTqxb63WAi6Slyv73hKilOwEtDIDs.pdf', 1, '2021-11-08 16:42:08', '2021-11-08 16:42:08', NULL);

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
(1, 'ssdad', '2021-11-02 00:00:00', 'asdasd', 'YA', 1, 1, 1, '2021-10-31 07:49:20', '2021-10-31 07:49:20', NULL),
(2, 'ITJ.123123.123123.123.123.', '2021-11-08 00:00:00', 'Evaluasi Keuangan', 'YA', 1, 1, 1, '2021-11-06 15:06:01', '2021-11-06 15:06:01', NULL),
(3, 'asdasd', '2021-11-15 00:00:00', 'asdasd', 'YA', 1, 1, 1, '2021-11-14 04:44:09', '2021-11-14 04:44:09', NULL),
(4, 'itjamm', '2021-11-18 00:00:00', 'asdasd', 'YA', 1, 1, 1, '2021-11-18 06:00:07', '2021-11-18 06:00:07', NULL);

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
(1, '123456', '123456', 1, 1, 'LUCKY', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"user\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_user\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"},{\"action\" : \"manage\", \"subject\" : \"laporan\"},{\"action\" : \"manage\", \"subject\" : \"data_pegawai\"},{\"action\" : \"manage\", \"subject\" : \"mak\"}]', NULL, NULL),
(2, '1235', '123456', 3, 2, 'JOKO', 'PPK', '[{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_ppk\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"}]', NULL, NULL),
(3, '1236', '123456', 2, 3, 'DIO', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"user\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_user\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"},{\"action\" : \"manage\", \"subject\" : \"laporan\"},{\"action\" : \"manage\", \"subject\" : \"data_pegawai\"},{\"action\" : \"manage\", \"subject\" : \"mak\"}]', NULL, NULL),
(4, '12347', '123456', 1, 4, 'EMA', 'BENDAHARA', '[{\"action\" : \"manage\", \"subject\" : \"bendahara\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_bendahara\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"}]', NULL, NULL),
(5, '12348', '123456', 1, 4, 'PRISI', 'ADMIN KEUANGAN', '[{\"action\" : \"manage\", \"subject\" : \"admin_keuangan\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_keuangan\"},{\"action\" : \"manage\", \"subject\" : \"kegiatan\"},{\"action\" : \"manage\", \"subject\" : \"perjadin\"}]', NULL, NULL),
(6, '12341', '123456', 1, 4, 'EDO', 'ADMIN KEPEGAWAIAN', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(7, '12342', '123456', 1, 4, 'EDO', 'ADMIN UMUM', '[{\"action\" : \"manage\", \"subject\" : \"admin_umum\"},{\"action\" : \"manage\", \"subject\" : \"auth\"},{\"action\" : \"manage\", \"subject\" : \"dashboard_umum\"},{\"action\" : \"manage\", \"subject\" : \"permintaan_persediaan\"}]', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kegiatan_lampiran`
--
ALTER TABLE `kegiatan_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kegiatan_log`
--
ALTER TABLE `kegiatan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pembelian_lampiran`
--
ALTER TABLE `pembelian_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peran`
--
ALTER TABLE `peran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin`
--
ALTER TABLE `perjadin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin_hasil`
--
ALTER TABLE `perjadin_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_lampiran`
--
ALTER TABLE `perjadin_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin_log`
--
ALTER TABLE `perjadin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `perjadin_obrik`
--
ALTER TABLE `perjadin_obrik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `perjadin_rab`
--
ALTER TABLE `perjadin_rab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `perjadin_realisasi`
--
ALTER TABLE `perjadin_realisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_lampiran`
--
ALTER TABLE `perjadin_realisasi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin_susunan_tim`
--
ALTER TABLE `perjadin_susunan_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permintaan_persediaan`
--
ALTER TABLE `permintaan_persediaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permintaan_persediaan_detail`
--
ALTER TABLE `permintaan_persediaan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permintaan_persediaan_lampiran`
--
ALTER TABLE `permintaan_persediaan_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permintaan_persediaan_log`
--
ALTER TABLE `permintaan_persediaan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `peta_kompetensi`
--
ALTER TABLE `peta_kompetensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `satker`
--
ALTER TABLE `satker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_perintah`
--
ALTER TABLE `surat_perintah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
