-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2021 at 07:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joko`
--


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
(1, 'INSPEKTORAT WILAYAH I', '2021-10-03 18:31:39', NULL, NULL),
(2, 'INSPEKTORAT WILAYAH II', '2021-10-03 18:31:39', NULL, NULL),
(3, 'INSPEKTORAT WILAYAH III', '2021-10-03 18:31:39', NULL, NULL),
(4, 'INSPEKTORAT WILAYAH IV', '2021-10-03 18:31:39', NULL, NULL),
(5, 'INSPEKTORAT WILAYAH V', '2021-10-03 18:31:39', NULL, NULL),
(6, 'INSPEKTORAT WILAYAH VI', '2021-10-03 18:31:39', NULL, NULL),
(7, 'BAGIAN UMUM', '2021-10-03 18:31:39', NULL, NULL),
(8, 'BAGIAN KEPEGAWAIAN', '2021-10-03 18:31:39', NULL, NULL),
(9, 'BAGIAN PHP', '2021-10-03 18:31:39', NULL, NULL),
(10, 'BAGIAN KEUANGAN', '2021-10-03 18:31:39', NULL, NULL),
(11, 'BAGIAN SIP', '2021-10-03 18:31:39', NULL, NULL);

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
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `dipa` double NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `tahun_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `kode`, `nama`, `dipa`, `bidang_id`, `tahun_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1563.321.051.A.524111', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 240046000, 1, 1, 1, '2021-10-03 19:04:18', '2021-10-07 12:26:47', NULL),
(2, '1563.321.051.A.524112', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 200000000, 2, 1, 1, '2021-10-07 12:48:34', '2021-10-07 12:48:34', NULL),
(3, '1563.321.051.A.524113', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 3000000, 3, 1, 1, '2021-10-07 13:05:25', '2021-10-07 13:05:25', NULL),
(4, '14141.14141', 'Perjalanan Dinas', 100000000, 1, 1, 1, '2021-10-11 10:21:25', '2021-10-11 10:21:25', NULL);

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
  `status` enum('PENGAJUAN','REVISI KEUANGAN','VERIFIKASI KEUANGAN','PELAKSANAAN','VERIFIKASI PPK','SELESAI','REVISI PPK','VERIFIKASI REALISASI','VERIFIED KEUANGAN','VERIFIED PPK') NOT NULL DEFAULT 'PENGAJUAN',
  `maksud` text DEFAULT NULL,
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

INSERT INTO `perjadin` (`id`, `no_perjadin`, `surat_perintah_id`, `mak_id`, `jumlah_hari`, `tujuan`, `keberangkatan`, `tanggal_berangkat`, `tanggal_kembali`, `total_anggaran`, `status_realisasi`, `total_realisasi`, `status`, `maksud`, `ppk_id`, `bendahara_id`, `tahun_id`, `user_id`, `bidang_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1-301021-1', 1, 1, 2, 'Jakarta', 'Jakarta', '2021-10-30 00:00:00', '2021-10-31 00:00:00', 2120000, 'BELUM', 0, 'VERIFIKASI KEUANGAN', 'Audit Tusi', 1, 2, 1, 1, 1, '2021-10-30 10:04:05', '2021-10-30 10:06:19', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjadin_lampiran`
--

INSERT INTO `perjadin_lampiran` (`id`, `perjadin_id`, `jenis`, `nama`, `file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 'SP', '1_SP_ST.pdf', 'perjadin/dwR7uo2GFmzbnV2rCJUsbYhLAif1J7G0GEV2SQIo.pdf', '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(4, 1, 'SP', '1_SP_SURAT PENGANTAR ST.pdf', 'perjadin/VISh3ByRL8qUrUt6BVuq6tlnU0UsZRyErwsvv7fJ.pdf', '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL);

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
(1, 1, 'PENGAJUAN', 1, 1, 'PERJADIN TELAH DIBUAT, OLEH LUCKY', NULL, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(2, 1, 'KIRIM KEUANGAN - VERIFIKASI KEUANGAN', 1, 1, 'perjadin telah di kirim ke keuangan oleh ABBAS,SH.MH', 'Cek and Ricek Ceu', '2021-10-30 10:06:19', '2021-10-30 10:06:19', NULL);

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
(1, 1, 1, 1, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(2, 1, 1, 6, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(3, 1, 1, 2, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(4, 1, 1, 4, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL);

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
(1, 1, 1, 2, '2021-10-30 00:00:00', '2021-10-31 00:00:00', 150000, 1, 550000, 0, 0, 0, 210000, 0, 0, 1060000, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(2, 1, 2, 2, '2021-10-30 00:00:00', '2021-10-31 00:00:00', 150000, 1, 550000, 0, 0, 0, 210000, 0, 0, 1060000, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 1, NULL, 3, 3, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL),
(2, 1, 2, NULL, 4, 4, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `realisasi`
--

CREATE TABLE `realisasi` (
  `id` int(11) NOT NULL,
  `nomor_kwitansi` varchar(255) NOT NULL,
  `uraian` text NOT NULL,
  `nominal` double NOT NULL,
  `status` enum('VERIFIKASI','PEMBAYARAN','DITOLAK','SELESAI') NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `tanggal_spb` date NOT NULL,
  `maker_id` int(11) NOT NULL,
  `checker_id` int(11) NOT NULL,
  `tahun_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `realisasi`
--

INSERT INTO `realisasi` (`id`, `nomor_kwitansi`, `uraian`, `nominal`, `status`, `kegiatan_id`, `tanggal_spb`, `maker_id`, `checker_id`, `tahun_id`, `bidang_id`, `user_id`, `created_at`, `updated_at`, `verified_at`, `paid_at`, `deleted_at`) VALUES
(58, '2021-1', 'Kegiatan asdjlaksjd lakjsdlkasjd laksjdlaks dlaksjd alksdj alskdj', 200000000, 'SELESAI', 1, '2021-10-15', 2, 12, 1, 1, 1, '2021-10-07 01:29:16', '2021-10-08 13:55:46', '2021-10-08 01:54:57', '2021-10-08 01:55:46', NULL),
(59, '2021-2', 'Beli Bakso', 1000000, 'SELESAI', 3, '2021-10-09', 6, 18, 1, 3, 3, '2021-10-07 13:09:53', '2021-10-08 13:47:17', '2021-10-08 20:50:09', '2021-10-08 20:50:09', NULL),
(60, '2021-3', 'Rapat Evaluasi WBK WBBM', 1000000, 'SELESAI', 1, '2021-10-13', 3, 6, 1, 1, 1, '2021-10-11 09:14:21', '2021-10-11 09:17:05', '2021-10-11 09:15:46', '2021-10-11 09:17:05', NULL),
(61, '2021-4', 'beli baju', 2000000, 'SELESAI', 1, '2021-10-13', 2, 105, 1, 1, 1, '2021-10-11 10:12:56', '2021-10-11 10:15:32', '2021-10-11 10:14:26', '2021-10-11 10:15:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `realisasi_lampiran`
--

CREATE TABLE `realisasi_lampiran` (
  `id` int(11) NOT NULL,
  `realisasi_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `realisasi_lampiran`
--

INSERT INTO `realisasi_lampiran` (`id`, `realisasi_id`, `nama`, `file`, `created_at`, `updated_at`) VALUES
(52, 58, 'hehehe (1).pdf', 'realisasi/e6L8RJNX1zEWpixComawb1457ERNhEW6OK39nLQw.pdf', '2021-10-07 01:29:16', '2021-10-07 01:29:16'),
(53, 58, 'hehehe.pdf', 'realisasi/7HJPkoIkQNBC3WIFrYSRhPSRC7clILHchaWvx0eC.pdf', '2021-10-07 01:29:16', '2021-10-07 01:29:16'),
(54, 58, 'LAPORAN CABANG KADUNGORA (3).pdf', 'realisasi/LF0vmgCfc5QnIDWVuQnr3mHFk12QMBjbtFvLXnFl.pdf', '2021-10-07 01:29:16', '2021-10-07 01:29:16'),
(55, 58, 'LAPORAN CABANG KADUNGORA (2).pdf', 'realisasi/j8zxV7Gl99C6a6p9QlUMsZOMfadCeH58sprHxPkz.pdf', '2021-10-07 01:29:16', '2021-10-07 01:29:16'),
(56, 59, 'hehehe (1).pdf', 'realisasi/87mJIRGZFuo66ID6S5P3jyexabI1LyCDMWA2G6il.pdf', '2021-10-07 13:09:53', '2021-10-07 13:09:53'),
(57, 59, 'hehehe.pdf', 'realisasi/uSzfRCwj4ktzfOcMG4ssPk9eMFzyOq2sp5T3li0Z.pdf', '2021-10-07 13:09:53', '2021-10-07 13:09:53'),
(58, 59, 'LAPORAN CABANG KADUNGORA (3).pdf', 'realisasi/uWVghwnJwfpYk6eEqhwZhah0GklBhLu6x07L1kbd.pdf', '2021-10-07 13:09:53', '2021-10-07 13:09:53'),
(59, 60, 'Jadwal Gemar Oktober.pdf', 'realisasi/jd07YooHTY8aPITzW9BObjxS74dVhpwVKlHgBwxq.pdf', '2021-10-11 09:14:21', '2021-10-11 09:14:21'),
(60, 60, 'Lomba esport.pdf', 'realisasi/U6zlC4oZ2TFNCWUGs0Te071mGHtQAq8pDs541wgJ.pdf', '2021-10-11 09:14:21', '2021-10-11 09:14:21'),
(61, 60, 'Jadwal Gemar Oktober.pdf', 'realisasi/XEAUGwprgynrx9TMbm6dn710CSicazqOb5ob15X3.pdf', '2021-10-11 09:14:21', '2021-10-11 09:14:21'),
(62, 60, 'Lomba esport.pdf', 'realisasi/ROweoclQ1mQk1lpPHni6x8uZ5RCUWeeFwHiYO2GV.pdf', '2021-10-11 09:14:21', '2021-10-11 09:14:21'),
(63, 60, 'Ktp.pdf', 'realisasi/bxhU526ABUehTPhg1yLJXuYkUzCMI9OxtshjCFIa.pdf', '2021-10-11 09:14:21', '2021-10-11 09:14:21'),
(64, 60, 'Kalender Layanan bulan Oktober 2021 Eselon I.pdf', 'realisasi/CmyboKcSdGir22ug8b7doraZFUX9qq6ki5V2VkFs.pdf', '2021-10-11 09:14:21', '2021-10-11 09:14:21'),
(65, 61, 'Jadwal Gemar Oktober.pdf', 'realisasi/TgNVDfrR7bIU1hNYDVmwjFrz4i4ABihLbUSONvan.pdf', '2021-10-11 10:12:57', '2021-10-11 10:12:57'),
(66, 61, 'Lomba esport.pdf', 'realisasi/UFJG8be9oJZnILT04qp2P1S0dDj5tV0I4djj7KVB.pdf', '2021-10-11 10:12:57', '2021-10-11 10:12:57');

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
(1, 'ITJ.11.1.1.1.1', '2021-10-30 00:00:00', 'Melaksanakan Audit Tusi Pada Inspektorat Jenderal', 'YA', 1, 1, 1, '2021-10-30 10:04:05', '2021-10-30 10:04:05', NULL);

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
(3, 'dio', '123456', 3, 3, 'DIO', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
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
-- Indexes for table `realisasi`
--
ALTER TABLE `realisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realisasi_lampiran`
--
ALTER TABLE `realisasi_lampiran`
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
-- AUTO_INCREMENT for table `kanwil`
--
ALTER TABLE `kanwil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin_log`
--
ALTER TABLE `perjadin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perjadin_obrik`
--
ALTER TABLE `perjadin_obrik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `perjadin_rab`
--
ALTER TABLE `perjadin_rab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perjadin_realisasi`
--
ALTER TABLE `perjadin_realisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_realisasi_lampiran`
--
ALTER TABLE `perjadin_realisasi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perjadin_susunan_tim`
--
ALTER TABLE `perjadin_susunan_tim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `realisasi`
--
ALTER TABLE `realisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `realisasi_lampiran`
--
ALTER TABLE `realisasi_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
