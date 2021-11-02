-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2021 at 06:41 AM
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
(1, 'INSPEKTORAT WILAYAH I', '2021-10-03 04:31:39', NULL, NULL),
(2, 'INSPEKTORAT WILAYAH II', '2021-10-03 04:31:39', NULL, NULL),
(3, 'INSPEKTORAT WILAYAH III', '2021-10-03 04:31:39', NULL, NULL),
(4, 'INSPEKTORAT WILAYAH IV', '2021-10-03 04:31:39', NULL, NULL),
(5, 'INSPEKTORAT WILAYAH V', '2021-10-03 04:31:39', NULL, NULL),
(6, 'INSPEKTORAT WILAYAH VI', '2021-10-03 04:31:39', NULL, NULL),
(7, 'BAGIAN UMUM', '2021-10-03 04:31:39', NULL, NULL),
(8, 'BAGIAN KEPEGAWAIAN', '2021-10-03 04:31:39', NULL, NULL),
(9, 'BAGIAN PHP', '2021-10-03 04:31:39', NULL, NULL),
(10, 'BAGIAN KEUANGAN', '2021-10-03 04:31:39', NULL, NULL),
(11, 'BAGIAN SIP', '2021-10-03 04:31:39', NULL, NULL);

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
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`) VALUES
(1, 'AUDITOR PERTAMA');

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
(1, '2021-1', '123123', 1, 'Jakarta', 'asdasd', 2000000, 500000, 'SUDAH', 'SELESAI', 1, '2021-11-02', '2021-11-02', 1, 1, 1, 1, 2, 3, '2021-11-02 02:46:10', '2021-11-02 02:59:54', NULL),
(2, '2021-2', 'asdasd', 5, 'asdasda', 'asdasdasd', 10000000, 0, 'BELUM', 'RENCANA', 1, '2021-11-02', NULL, 1, 1, 1, NULL, NULL, NULL, '2021-11-02 02:53:53', '2021-11-02 02:53:53', NULL);

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
(1, 1, '7M202071.jpg', 'kegiatan/01vsIM3Au0RLEms5ueFZV1oNnuQXPbaaCMRmzq8u.jpg', 1, '2021-11-02 02:46:11', '2021-11-02 02:46:11'),
(2, 2, 'Permintaan Dokumen SPIP Itjen.pdf', 'kegiatan/I7VdcFwIS6cwU4dzmtEgdrxtpWGG0YH5gtKfzEuK.pdf', 1, '2021-11-02 02:53:53', '2021-11-02 02:53:53'),
(3, 1, 'IMG_4978.JPG', 'kegiatan/BmpsRIJIklrG7ejpNERUoAwIwEz94Hg7gYCQu9XG.jpg', 1, '2021-11-02 02:55:03', '2021-11-02 02:55:03');

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
(1, 1, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-02 02:46:10', '2021-11-02 02:46:10', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'assssss', '2021-11-02 02:52:52', '2021-11-02 02:52:52', NULL),
(3, 2, 'RENCANA', 1, 1, 'RENCANA KEGIATAN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-02 02:53:53', '2021-11-02 02:53:53', NULL),
(4, 1, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'aaaaaaaa', '2021-11-02 02:54:44', '2021-11-02 02:54:44', NULL),
(5, 1, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'kegiatan telah di kirim ke keuangan oleh ABBAS,SH.MH', 'ssssssss', '2021-11-02 02:55:11', '2021-11-02 02:55:11', NULL),
(6, 1, 'VERIFIED KEUANGAN', 5, 1, 'kegiatan telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'aaaaaaaaaa', '2021-11-02 02:55:21', '2021-11-02 02:55:21', NULL),
(7, 1, 'VERIFIED PPK', 2, 3, 'kegiatan telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'aaaaaa', '2021-11-02 02:56:16', '2021-11-02 02:56:16', NULL),
(8, 1, 'SELESAI', 4, 1, 'Uang kegiatan telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'sadasdasd', '2021-11-02 02:59:54', '2021-11-02 02:59:54', NULL);

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
(1, '1563.321.051.A.524111', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 240046000, 1, 1, 1, '2021-10-03 05:04:18', '2021-10-06 22:26:47', NULL),
(2, '1563.321.051.A.524112', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 200000000, 2, 1, 1, '2021-10-06 22:48:34', '2021-10-06 22:48:34', NULL),
(3, '1563.321.051.A.524113', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 3000000, 3, 1, 1, '2021-10-06 23:05:25', '2021-10-06 23:05:25', NULL),
(4, '14141.14141', 'Perjalanan Dinas', 100000000, 1, 1, 1, '2021-10-10 20:21:25', '2021-10-10 20:21:25', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nip`, `golongan_id`, `jabatan_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ABBAS,SH.MH', '19740330 199803 1 001', 1, 1, NULL, NULL, NULL),
(2, 'ABDUL HAMID, SE.', '19760901 200912 1 002', 1, 1, NULL, NULL, NULL),
(3, 'ABDUL ROKHMAN, A.Md.', '19801211 200912 1 002', 1, 1, NULL, NULL, NULL),
(4, 'ADE CICI ROHAYATI, SH.MH', '19740508 199803 2 001', 1, 1, NULL, NULL, NULL);

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
(1, '1-021121-1', 1, 1, 4, 'asdasd', 'Jakarta', '2021-11-02 00:00:00', '2021-11-14 00:00:00', 800000, 'SUDAH', 1000000, 'SELESAI', 'asdasd', NULL, 1, 2, 1, 1, 1, '2021-11-02 01:49:20', '2021-11-02 02:50:43', NULL);

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
(1, 1, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH ABBAS,SH.MH', NULL, '2021-11-02 01:49:20', '2021-11-02 01:49:20', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'yaaaaaaaa', '2021-11-02 02:47:09', '2021-11-02 02:47:09', NULL),
(3, 1, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'sadasd', '2021-11-02 02:47:39', '2021-11-02 02:47:39', NULL),
(4, 1, 'KIRIM KEUANGAN - VERIFIKASI REALISASI', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'dsadasd', '2021-11-02 02:49:13', '2021-11-02 02:49:13', NULL),
(5, 1, 'VERIFIED KEUANGAN', 5, 1, 'perjadin telah di verifikasi oleh ADE CICI ROHAYATI, SH.MH', 'asdasd', '2021-11-02 02:49:32', '2021-11-02 02:49:32', NULL),
(6, 1, 'VERIFIED PPK', 2, 3, 'perjadin telah di verifikasi oleh oleh ABDUL HAMID, SE.', 'sssss', '2021-11-02 02:50:21', '2021-11-02 02:50:21', NULL),
(7, 1, 'SELESAI', 4, 1, 'Uang perjadin telah dibayarkan oleh oleh ADE CICI ROHAYATI, SH.MH', 'sdsssss', '2021-11-02 02:50:43', '2021-11-02 02:50:43', NULL);

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
(1, 1, 1, 1, '2021-11-02 01:49:20', '2021-11-02 01:49:20', NULL);

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
(1, 1, 1, 4, '2021-11-02 00:00:00', '2021-11-14 00:00:00', 200000, 0, 0, 0, 0, 0, 0, 0, 0, 800000, '2021-11-02 01:49:20', '2021-11-02 01:49:20', NULL);

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
(1, 1, 1, 2, 500000, '2021-11-02', '2021-11-14', 0, 0, 0, 0, 0, 0, 0, 0, 1000000, 0, '2021-11-02 02:47:58', '2021-11-02 02:47:58', NULL);

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
(1, 1, 1, 1, 2, 2, '2021-11-02 01:49:20', '2021-11-02 02:47:58', NULL);

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
(1, 'ssdad', '2021-11-02 00:00:00', 'asdasd', 'YA', 1, 1, 1, '2021-11-02 01:49:20', '2021-11-02 01:49:20', NULL);

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
  `role` enum('ADMIN','PPK','USER','VERIFIKATOR','BENDAHARA','VERIFIKATOR KEUANGAN') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ability` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `bidang_id`, `pegawai_id`, `nama`, `role`, `ability`, `created_at`, `updated_at`) VALUES
(1, 'lucky', '123456', 1, 1, 'LUCKY', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(2, 'joko', '123456', 3, 2, 'JOKO', 'PPK', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(3, 'dio', '123456', 2, 3, 'DIO', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(4, 'ema', '123456', 1, 4, 'EMA', 'BENDAHARA', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(5, 'prisi', '123456', 1, 4, 'PRISI', 'VERIFIKATOR KEUANGAN', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
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
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
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
-- AUTO_INCREMENT for table `bidang`
--
ALTER TABLE `bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan_lampiran`
--
ALTER TABLE `kegiatan_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kegiatan_log`
--
ALTER TABLE `kegiatan_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peran`
--
ALTER TABLE `peran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin`
--
ALTER TABLE `perjadin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perjadin_hasil`
--
ALTER TABLE `perjadin_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_lampiran`
--
ALTER TABLE `perjadin_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_log`
--
ALTER TABLE `perjadin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `perjadin_obrik`
--
ALTER TABLE `perjadin_obrik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perjadin_rab`
--
ALTER TABLE `perjadin_rab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perjadin_realisasi`
--
ALTER TABLE `perjadin_realisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_lampiran`
--
ALTER TABLE `perjadin_realisasi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_susunan_tim`
--
ALTER TABLE `perjadin_susunan_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `satker`
--
ALTER TABLE `satker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_perintah`
--
ALTER TABLE `surat_perintah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
