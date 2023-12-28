-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table katalis.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.barang: ~0 rows (approximately)
DELETE FROM `barang`;

-- Dumping structure for table katalis.bidang
CREATE TABLE IF NOT EXISTS `bidang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.bidang: ~11 rows (approximately)
DELETE FROM `bidang`;
INSERT INTO `bidang` (`id`, `nama`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'INSPEKTORAT WILAYAH I', '2021-09-29 23:31:39', NULL, NULL),
	(2, 'INSPEKTORAT WILAYAH II', '2021-09-29 23:31:39', NULL, NULL),
	(3, 'INSPEKTORAT WILAYAH III', '2021-09-29 23:31:39', NULL, NULL),
	(4, 'INSPEKTORAT WILAYAH IV', '2021-09-29 23:31:39', NULL, NULL),
	(5, 'INSPEKTORAT WILAYAH V', '2021-09-29 23:31:39', NULL, NULL),
	(6, 'INSPEKTORAT WILAYAH VI', '2021-09-29 23:31:39', NULL, NULL),
	(7, 'BAGIAN UMUM', '2021-09-29 23:31:39', NULL, NULL),
	(8, 'KELOMPOK KEPEGAWAIAN', '2021-09-29 23:31:39', NULL, NULL),
	(9, 'BAGIAN PROGRAM DAN PELAPORAN', '2021-09-29 23:31:39', NULL, NULL),
	(10, 'KELOMPOK KEUANGAN', '2021-09-29 23:31:39', NULL, NULL),
	(11, 'KELOMPOK HUMAS DAN SIP', '2021-09-29 23:31:39', NULL, NULL);

-- Dumping structure for table katalis.bidang_ilmu
CREATE TABLE IF NOT EXISTS `bidang_ilmu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.bidang_ilmu: ~0 rows (approximately)
DELETE FROM `bidang_ilmu`;
INSERT INTO `bidang_ilmu` (`id`, `nama`) VALUES
	(1, 'Audit');

-- Dumping structure for table katalis.bmn_kendaraan_dinas
CREATE TABLE IF NOT EXISTS `bmn_kendaraan_dinas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jenis` enum('MOBIL','MOTOR') NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nopol` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `tanggal_perolehan` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.bmn_kendaraan_dinas: ~0 rows (approximately)
DELETE FROM `bmn_kendaraan_dinas`;
INSERT INTO `bmn_kendaraan_dinas` (`id`, `jenis`, `nama`, `nopol`, `status`, `user_id`, `tanggal_perolehan`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'MOBIL', 'Mobil Pajero Sport', '123123', 'SEWA', 2, '2022-01-10 08:36:00', '2022-01-09 18:36:00', '2022-01-09 18:36:00', NULL);

-- Dumping structure for table katalis.golongan
CREATE TABLE IF NOT EXISTS `golongan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `golongan` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.golongan: ~17 rows (approximately)
DELETE FROM `golongan`;
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

-- Dumping structure for table katalis.jabatan
CREATE TABLE IF NOT EXISTS `jabatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis_jabatan` varchar(255) NOT NULL DEFAULT 'JFU',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.jabatan: ~45 rows (approximately)
DELETE FROM `jabatan`;
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

-- Dumping structure for table katalis.jenis_kegiatan
CREATE TABLE IF NOT EXISTS `jenis_kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.jenis_kegiatan: ~5 rows (approximately)
DELETE FROM `jenis_kegiatan`;
INSERT INTO `jenis_kegiatan` (`id`, `nama`) VALUES
	(1, 'RAPAT INTERNAL'),
	(2, 'RAPAT EKSTERNAL'),
	(3, 'WORKSHOP'),
	(4, 'KONSINYERING'),
	(5, 'BELANJA');

-- Dumping structure for table katalis.kanwil
CREATE TABLE IF NOT EXISTS `kanwil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(512) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kanwil: ~0 rows (approximately)
DELETE FROM `kanwil`;
INSERT INTO `kanwil` (`id`, `nama`, `alamat`, `nomor_telepon`) VALUES
	(1, 'ACEH', 'JL ACEH', '23123123');

-- Dumping structure for table katalis.kartu_persediaan
CREATE TABLE IF NOT EXISTS `kartu_persediaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `barang_id` int NOT NULL,
  `debit` double NOT NULL,
  `kredit` double NOT NULL,
  `user_id` int DEFAULT NULL,
  `bidang_id` int DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kartu_persediaan: ~0 rows (approximately)
DELETE FROM `kartu_persediaan`;

-- Dumping structure for table katalis.kegiatan
CREATE TABLE IF NOT EXISTS `kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomor_kwitansi` varchar(255) NOT NULL,
  `uraian` text NOT NULL,
  `jenis` varchar(128) NOT NULL DEFAULT 'KEGIATAN',
  `jenis_kegiatan_id` tinyint(1) NOT NULL,
  `lokasi` varchar(512) NOT NULL,
  `output` text NOT NULL,
  `total_anggaran` double NOT NULL,
  `total_realisasi` double NOT NULL DEFAULT '0',
  `status_realisasi` enum('BELUM','SUDAH') NOT NULL DEFAULT 'BELUM',
  `status` enum('RENCANA','VERIFIKASI KEUANGAN','PELAKSANAAN','VERIFIKASI REALISASI','VERIFIKASI PPK','VERIFIED PPK','SELESAI') NOT NULL DEFAULT 'RENCANA',
  `mak_id` int NOT NULL,
  `tanggal_rencana_kegiatan` date NOT NULL,
  `tanggal_realisasi_kegiatan` date DEFAULT NULL,
  `tahun_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `user_id` int NOT NULL,
  `checker_id` int DEFAULT NULL,
  `ppk_id` int DEFAULT NULL,
  `bendahara_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kegiatan: ~2 rows (approximately)
DELETE FROM `kegiatan`;
INSERT INTO `kegiatan` (`id`, `nomor_kwitansi`, `uraian`, `jenis`, `jenis_kegiatan_id`, `lokasi`, `output`, `total_anggaran`, `total_realisasi`, `status_realisasi`, `status`, `mak_id`, `tanggal_rencana_kegiatan`, `tanggal_realisasi_kegiatan`, `tahun_id`, `bidang_id`, `user_id`, `checker_id`, `ppk_id`, `bendahara_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '2023-1', 'asdasdasd', 'KEGIATAN', 1, 'Jakarta', 'asdasdasd', 500000, 0, 'BELUM', 'RENCANA', 162, '2023-12-28', NULL, 1, 11, 8, NULL, NULL, NULL, '2023-12-28 03:39:08', '2023-12-28 03:39:08', NULL),
	(2, '2023-2', 'asdasdasd', 'KEGIATAN', 1, 'Jakarta', 'asdasdasd', 500000, 0, 'BELUM', 'RENCANA', 162, '2023-12-28', NULL, 1, 11, 8, NULL, NULL, NULL, '2023-12-28 03:39:15', '2023-12-28 03:39:15', NULL);

-- Dumping structure for table katalis.kegiatan_lampiran
CREATE TABLE IF NOT EXISTS `kegiatan_lampiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kegiatan_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kegiatan_lampiran: ~0 rows (approximately)
DELETE FROM `kegiatan_lampiran`;

-- Dumping structure for table katalis.kegiatan_log
CREATE TABLE IF NOT EXISTS `kegiatan_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kegiatan_id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `keterangan` text NOT NULL,
  `catatan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kegiatan_log: ~0 rows (approximately)
DELETE FROM `kegiatan_log`;

-- Dumping structure for table katalis.kegiatan_realisasi
CREATE TABLE IF NOT EXISTS `kegiatan_realisasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_realisasi` double NOT NULL DEFAULT '0',
  `checker_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kegiatan_realisasi: ~0 rows (approximately)
DELETE FROM `kegiatan_realisasi`;

-- Dumping structure for table katalis.kegiatan_realisasi_lampiran
CREATE TABLE IF NOT EXISTS `kegiatan_realisasi_lampiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `realisasi_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.kegiatan_realisasi_lampiran: ~0 rows (approximately)
DELETE FROM `kegiatan_realisasi_lampiran`;

-- Dumping structure for table katalis.mak
CREATE TABLE IF NOT EXISTS `mak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pagu` double NOT NULL,
  `bidang_id` int NOT NULL,
  `tahun` year NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.mak: ~169 rows (approximately)
DELETE FROM `mak`;
INSERT INTO `mak` (`id`, `kode`, `nama`, `pagu`, `bidang_id`, `tahun`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '1563.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 266229000, 1, '2023', 1, NULL, NULL, NULL),
	(2, '1563.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 184406000, 1, '2023', 1, NULL, NULL, NULL),
	(3, '1563.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 527756000, 1, '2023', 1, NULL, NULL, NULL),
	(4, '1563.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 695640000, 1, '2023', 1, NULL, NULL, NULL),
	(5, '1563.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 15615000, 1, '2023', 1, NULL, NULL, NULL),
	(6, '1563.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 50076000, 1, '2023', 1, NULL, NULL, NULL),
	(7, '1563.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 103575000, 1, '2023', 1, NULL, NULL, NULL),
	(8, '1563.EAK.001.054.B.524119', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 277682000, 1, '2023', 1, NULL, NULL, NULL),
	(9, '1563.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 43460000, 1, '2023', 1, NULL, NULL, NULL),
	(10, '1563.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 39924000, 1, '2023', 1, NULL, NULL, NULL),
	(11, '1563.EAK.002.051.A.524111', 'Pendampingan Satker-Belanja Perjalanan Dinas Biasa', 402730000, 1, '2023', 1, NULL, NULL, NULL),
	(12, '1563.TAK.001.051.A.524111', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 650039000, 1, '2023', 1, NULL, NULL, NULL),
	(13, '1563.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Biasa', 227809000, 1, '2023', 1, NULL, NULL, NULL),
	(14, '1563.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 146185000, 1, '2023', 1, NULL, NULL, NULL),
	(15, '1564.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 505794000, 2, '2023', 1, NULL, NULL, NULL),
	(16, '1564.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 264090000, 2, '2023', 1, NULL, NULL, NULL),
	(17, '1564.EAK.001.051.B.524113', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Dalam Kota', 5250000, 2, '2023', 1, NULL, NULL, NULL),
	(18, '1564.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 464290000, 2, '2023', 1, NULL, NULL, NULL),
	(19, '1564.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 350152000, 2, '2023', 1, NULL, NULL, NULL),
	(20, '1564.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 25530000, 2, '2023', 1, NULL, NULL, NULL),
	(21, '1564.EAK.001.052.A.524113', 'Reviu RKA-K/L (Penyusunan dan Revisi)-Belanja Perjalanan Dinas Dalam Kota', 63000000, 2, '2023', 1, NULL, NULL, NULL),
	(22, '1564.EAK.001.052.B.524113', 'Reviu RKBMN-Belanja Perjalanan Dinas Dalam Kota', 18900000, 2, '2023', 1, NULL, NULL, NULL),
	(23, '1564.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 57840000, 2, '2023', 1, NULL, NULL, NULL),
	(24, '1564.EAK.001.052.C.524113', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Dalam Kota', 12600000, 2, '2023', 1, NULL, NULL, NULL),
	(25, '1564.EAK.001.052.D.524113', 'Reviu Penyerapan Anggaran-Belanja Perjalanan Dinas Dalam Kota', 13455000, 2, '2023', 1, NULL, NULL, NULL),
	(26, '1564.EAK.001.052.E.524113', 'Reviu LAKIP-Belanja Perjalanan Dinas Dalam Kota', 210000, 2, '2023', 1, NULL, NULL, NULL),
	(27, '1564.EAK.001.053.A.524113', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Dalam Kota', 5880000, 2, '2023', 1, NULL, NULL, NULL),
	(28, '1564.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 4200000, 2, '2023', 1, NULL, NULL, NULL),
	(29, '1564.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 15110000, 2, '2023', 1, NULL, NULL, NULL),
	(30, '1564.EAK.001.054.B.524113', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Dalam Kota', 6300000, 2, '2023', 1, NULL, NULL, NULL),
	(31, '1564.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 16010000, 2, '2023', 1, NULL, NULL, NULL),
	(32, '1564.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 15910000, 2, '2023', 1, NULL, NULL, NULL),
	(33, '1564.EAK.001.054.E.524111', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Biasa', 11930000, 2, '2023', 1, NULL, NULL, NULL),
	(34, '1564.EAK.001.054.E.524113', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Dalam Kota', 15135000, 2, '2023', 1, NULL, NULL, NULL),
	(35, '1564.EAK.001.054.E.524119', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 216592000, 2, '2023', 1, NULL, NULL, NULL),
	(36, '1564.EAK.002.051.A.524111', 'Pendampingan Satuan Kerja-Belanja Perjalanan Dinas Biasa', 603672000, 2, '2023', 1, NULL, NULL, NULL),
	(37, '1564.EAK.002.051.A.524113', 'Pendampingan Satuan Kerja-Belanja Perjalanan Dinas Dalam Kota', 30555000, 2, '2023', 1, NULL, NULL, NULL),
	(38, '1564.TAK.001.051.A.524111', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 657922000, 2, '2023', 1, NULL, NULL, NULL),
	(39, '1564.TAK.001.051.A.524113', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 20175000, 2, '2023', 1, NULL, NULL, NULL),
	(40, '1564.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Biasa', 245121000, 2, '2023', 1, NULL, NULL, NULL),
	(41, '1564.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 10935000, 2, '2023', 1, NULL, NULL, NULL),
	(42, '1564.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 66792000, 2, '2023', 1, NULL, NULL, NULL),
	(43, '1564.TAK.001.052.A.524113', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Dalam Kota', 11925000, 2, '2023', 1, NULL, NULL, NULL),
	(44, '1565.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 249763000, 3, '2023', 1, NULL, NULL, NULL),
	(45, '1565.EAK.001.051.A.524113', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Dalam Kota', 26040000, 3, '2023', 1, NULL, NULL, NULL),
	(46, '1565.EAK.001.051.B.524111', 'Audit Kinerja atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 271078000, 3, '2023', 1, NULL, NULL, NULL),
	(47, '1565.EAK.001.051.B.524113', 'Audit Kinerja atas Tugas dan Fungsi-Belanja Perjalanan Dinas Dalam Kota', 25620000, 3, '2023', 1, NULL, NULL, NULL),
	(48, '1565.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 344975000, 3, '2023', 1, NULL, NULL, NULL),
	(49, '1565.EAK.001.051.C.524113', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Dalam Kota', 25200000, 3, '2023', 1, NULL, NULL, NULL),
	(50, '1565.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 483528000, 3, '2023', 1, NULL, NULL, NULL),
	(51, '1565.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 147840000, 3, '2023', 1, NULL, NULL, NULL),
	(52, '1565.EAK.001.052.A.524111', 'Reviu RKA-K/L (Penyusunan dan Revisi)-Belanja Perjalanan Dinas Biasa', 95620000, 3, '2023', 1, NULL, NULL, NULL),
	(53, '1565.EAK.001.052.B.524111', 'Reviu RKBMN-Belanja Perjalanan Dinas Biasa', 22290000, 3, '2023', 1, NULL, NULL, NULL),
	(54, '1565.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 67000000, 3, '2023', 1, NULL, NULL, NULL),
	(55, '1565.EAK.001.053.A.524113', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Dalam Kota', 4200000, 3, '2023', 1, NULL, NULL, NULL),
	(56, '1565.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 210000, 3, '2023', 1, NULL, NULL, NULL),
	(57, '1565.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 81054000, 3, '2023', 1, NULL, NULL, NULL),
	(58, '1565.EAK.001.054.B.524113', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Dalam Kota', 7350000, 3, '2023', 1, NULL, NULL, NULL),
	(59, '1565.EAK.001.054.C.524111', 'Evaluasi Manajemen Resiko-Belanja Perjalanan Dinas Biasa', 177916000, 3, '2023', 1, NULL, NULL, NULL),
	(60, '1565.EAK.001.054.C.524113', 'Evaluasi Manajemen Resiko-Belanja Perjalanan Dinas Dalam Kota', 10290000, 3, '2023', 1, NULL, NULL, NULL),
	(61, '1565.EAK.001.054.C.524119', 'Evaluasi Manajemen Resiko-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 140886000, 3, '2023', 1, NULL, NULL, NULL),
	(62, '1565.EAK.001.054.D.524113', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Dalam Kota', 4200000, 3, '2023', 1, NULL, NULL, NULL),
	(63, '1565.EAK.001.054.E.524113', 'Evaluasi PPMPRB-Belanja Perjalanan Dinas Dalam Kota', 210000, 3, '2023', 1, NULL, NULL, NULL),
	(64, '1565.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 498497000, 3, '2023', 1, NULL, NULL, NULL),
	(65, '1565.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 63570000, 3, '2023', 1, NULL, NULL, NULL),
	(66, '1565.TAK.001.051.A.524111', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 646478000, 3, '2023', 1, NULL, NULL, NULL),
	(67, '1565.TAK.001.051.A.524113', 'Evaluasi / Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 31500000, 3, '2023', 1, NULL, NULL, NULL),
	(68, '1565.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Biasa', 255868000, 3, '2023', 1, NULL, NULL, NULL),
	(69, '1565.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 39900000, 3, '2023', 1, NULL, NULL, NULL),
	(70, '1565.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 44532000, 3, '2023', 1, NULL, NULL, NULL),
	(71, '1565.TAK.001.052.A.524113', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Dalam Kota', 7350000, 3, '2023', 1, NULL, NULL, NULL),
	(72, '1566.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara dan/atau PNBP-Belanja Perjalanan Dinas Biasa', 446205000, 4, '2023', 1, NULL, NULL, NULL),
	(73, '1566.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 186643000, 4, '2023', 1, NULL, NULL, NULL),
	(74, '1566.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 337935000, 4, '2023', 1, NULL, NULL, NULL),
	(75, '1566.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 633944000, 4, '2023', 1, NULL, NULL, NULL),
	(76, '1566.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 72150000, 4, '2023', 1, NULL, NULL, NULL),
	(77, '1566.EAK.001.052.A.524113', 'Reviu RKA-K/L-Belanja Perjalanan Dinas Dalam Kota', 29400000, 4, '2023', 1, NULL, NULL, NULL),
	(78, '1566.EAK.001.052.B.524111', 'Reviu RKBMN-Belanja Perjalanan Dinas Biasa', 37036000, 4, '2023', 1, NULL, NULL, NULL),
	(79, '1566.EAK.001.052.B.524113', 'Reviu RKBMN-Belanja Perjalanan Dinas Dalam Kota', 14700000, 4, '2023', 1, NULL, NULL, NULL),
	(80, '1566.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 44710000, 4, '2023', 1, NULL, NULL, NULL),
	(81, '1566.EAK.001.052.C.524119', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 337132000, 4, '2023', 1, NULL, NULL, NULL),
	(82, '1566.EAK.001.052.D.524113', 'Reviu Penyerapan Anggaran-Belanja Perjalanan Dinas Dalam Kota', 9240000, 4, '2023', 1, NULL, NULL, NULL),
	(83, '1566.EAK.001.052.E.524113', 'Reviu LAKIP-Belanja Perjalanan Dinas Dalam Kota', 210000, 4, '2023', 1, NULL, NULL, NULL),
	(84, '1566.EAK.001.053.A.524111', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Biasa', 39665000, 4, '2023', 1, NULL, NULL, NULL),
	(85, '1566.EAK.001.054.A.524111', 'Evaluasi AKIP-Belanja Perjalanan Dinas Biasa', 29066000, 4, '2023', 1, NULL, NULL, NULL),
	(86, '1566.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 6300000, 4, '2023', 1, NULL, NULL, NULL),
	(87, '1566.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 55232000, 4, '2023', 1, NULL, NULL, NULL),
	(88, '1566.EAK.001.054.B.524113', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Dalam Kota', 10500000, 4, '2023', 1, NULL, NULL, NULL),
	(89, '1566.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 52048000, 4, '2023', 1, NULL, NULL, NULL),
	(90, '1566.EAK.001.054.C.524113', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Dalam Kota', 5670000, 4, '2023', 1, NULL, NULL, NULL),
	(91, '1566.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 13426000, 4, '2023', 1, NULL, NULL, NULL),
	(92, '1566.EAK.001.054.E.524113', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Dalam Kota', 2520000, 4, '2023', 1, NULL, NULL, NULL),
	(93, '1566.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 345412000, 4, '2023', 1, NULL, NULL, NULL),
	(94, '1566.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 24360000, 4, '2023', 1, NULL, NULL, NULL),
	(95, '1566.TAK.001.051.A.524111', 'Evaluasi/ Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 646114000, 4, '2023', 1, NULL, NULL, NULL),
	(96, '1566.TAK.001.051.A.524113', 'Evaluasi/ Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 11550000, 4, '2023', 1, NULL, NULL, NULL),
	(97, '1566.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Biasa', 277225000, 4, '2023', 1, NULL, NULL, NULL),
	(98, '1566.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 10500000, 4, '2023', 1, NULL, NULL, NULL),
	(99, '1566.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 66966000, 4, '2023', 1, NULL, NULL, NULL),
	(100, '1566.TAK.001.052.A.524113', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Dalam Kota', 8820000, 4, '2023', 1, NULL, NULL, NULL),
	(101, '1567.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara/PNBP-Belanja Perjalanan Dinas Biasa', 497592000, 5, '2023', 1, NULL, NULL, NULL),
	(102, '1567.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 175102000, 5, '2023', 1, NULL, NULL, NULL),
	(103, '1567.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 377318000, 5, '2023', 1, NULL, NULL, NULL),
	(104, '1567.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 390384000, 5, '2023', 1, NULL, NULL, NULL),
	(105, '1567.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 5040000, 5, '2023', 1, NULL, NULL, NULL),
	(106, '1567.EAK.001.052.B.524111', 'Reviu RKBMN-Belanja Perjalanan Dinas Biasa', 7920000, 5, '2023', 1, NULL, NULL, NULL),
	(107, '1567.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 58570000, 5, '2023', 1, NULL, NULL, NULL),
	(108, '1567.EAK.001.052.E.524119', 'Reviu LAKIP-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 172284000, 5, '2023', 1, NULL, NULL, NULL),
	(109, '1567.EAK.001.053.A.524111', 'Pemantauan Tindaklanjut Rekomendasi Internal dan Eksternal-Belanja Perjalanan Dinas Biasa', 61884000, 5, '2023', 1, NULL, NULL, NULL),
	(110, '1567.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 16830000, 5, '2023', 1, NULL, NULL, NULL),
	(111, '1567.EAK.001.054.A.524119', 'Evaluasi AKIP-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 251012000, 5, '2023', 1, NULL, NULL, NULL),
	(112, '1567.EAK.001.054.B.524111', 'Evaluasi Maturitas SPIP-Belanja Perjalanan Dinas Biasa', 31452000, 5, '2023', 1, NULL, NULL, NULL),
	(113, '1567.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 26772000, 5, '2023', 1, NULL, NULL, NULL),
	(114, '1567.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 24912000, 5, '2023', 1, NULL, NULL, NULL),
	(115, '1567.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 547592000, 5, '2023', 1, NULL, NULL, NULL),
	(116, '1567.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 13725000, 5, '2023', 1, NULL, NULL, NULL),
	(117, '1567.TAK.001.051.A.524111', 'Evaluasi/Penilaian TPI terhadap Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 624844000, 5, '2023', 1, NULL, NULL, NULL),
	(118, '1567.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Biasa', 142990000, 5, '2023', 1, NULL, NULL, NULL),
	(119, '1567.TAK.001.052.A.524111', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Biasa', 73572000, 5, '2023', 1, NULL, NULL, NULL),
	(120, '1567.TAK.001.052.A.524119', 'Evaluasi Tunas Integritas-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 156480000, 5, '2023', 1, NULL, NULL, NULL),
	(121, '1568.EAK.001.051.A.524111', 'Audit Kinerja Atas Pengelolaan Keuangan Negara dan/atau PNBP-Belanja Perjalanan Dinas Biasa', 476674000, 6, '2023', 1, NULL, NULL, NULL),
	(122, '1568.EAK.001.051.B.524111', 'Audit Kinerja Atas Tugas dan Fungsi-Belanja Perjalanan Dinas Biasa', 234745000, 6, '2023', 1, NULL, NULL, NULL),
	(123, '1568.EAK.001.051.C.524111', 'Audit Pengelolaan Barang/Jasa-Belanja Perjalanan Dinas Biasa', 326344000, 6, '2023', 1, NULL, NULL, NULL),
	(124, '1568.EAK.001.051.D.524111', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Biasa', 1291012000, 6, '2023', 1, NULL, NULL, NULL),
	(125, '1568.EAK.001.051.D.524113', 'Audit Tujuan Tertentu-Belanja Perjalanan Dinas Dalam Kota', 73500000, 6, '2023', 1, NULL, NULL, NULL),
	(126, '1568.EAK.001.052.A.524113', 'Reviu RKA-K/L-Belanja Perjalanan Dinas Dalam Kota', 63000000, 6, '2023', 1, NULL, NULL, NULL),
	(127, '1568.EAK.001.052.B.524113', 'Reviu RKBMN-Belanja Perjalanan Dinas Dalam Kota', 15120000, 6, '2023', 1, NULL, NULL, NULL),
	(128, '1568.EAK.001.052.C.524111', 'Reviu Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 63500000, 6, '2023', 1, NULL, NULL, NULL),
	(129, '1568.EAK.001.054.A.524113', 'Evaluasi AKIP-Belanja Perjalanan Dinas Dalam Kota', 9675000, 6, '2023', 1, NULL, NULL, NULL),
	(130, '1568.EAK.001.054.C.524111', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Biasa', 28054000, 6, '2023', 1, NULL, NULL, NULL),
	(131, '1568.EAK.001.054.C.524113', 'Evaluasi Manajemen Risiko-Belanja Perjalanan Dinas Dalam Kota', 4200000, 6, '2023', 1, NULL, NULL, NULL),
	(132, '1568.EAK.001.054.D.524111', 'Evaluasi Pelayanan Publik-Belanja Perjalanan Dinas Biasa', 24608000, 6, '2023', 1, NULL, NULL, NULL),
	(133, '1568.EAK.001.054.E.524113', 'Evaluasi PMPRB-Belanja Perjalanan Dinas Dalam Kota', 5250000, 6, '2023', 1, NULL, NULL, NULL),
	(134, '1568.EAK.002.051.A.524111', 'Pendampingan-Belanja Perjalanan Dinas Biasa', 81511000, 6, '2023', 1, NULL, NULL, NULL),
	(135, '1568.EAK.002.051.A.524113', 'Pendampingan-Belanja Perjalanan Dinas Dalam Kota', 15120000, 6, '2023', 1, NULL, NULL, NULL),
	(136, '1568.TAK.001.051.A.524111', 'Evaluasi/Penilaian TPI terhdapa Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 607573000, 6, '2023', 1, NULL, NULL, NULL),
	(137, '1568.TAK.001.051.A.524113', 'Evaluasi/Penilaian TPI terhdapa Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 20280000, 6, '2023', 1, NULL, NULL, NULL),
	(138, '1568.TAK.001.051.A.524119', 'Evaluasi/Penilaian TPI terhdapa Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Paket Meeting Luar Kota', 1696262000, 6, '2023', 1, NULL, NULL, NULL),
	(139, '1568.TAK.001.051.B.524111', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Biasa', 1275887000, 6, '2023', 1, NULL, NULL, NULL),
	(140, '1568.TAK.001.051.B.524113', 'Monitoring dan Penguatan Satuan Kerja Berpredikat Menuju WBK/WBBM-Belanja Perjalanan Dinas Dalam Kota', 28350000, 6, '2023', 1, NULL, NULL, NULL),
	(141, '1569.EAB.001.051.A.524113', 'Penyusunan KPJM/JAKWAS/PK/PKPT/PKAU-Belanja Perjalanan Dinas Dalam Kota', 1650000, 9, '2023', 1, NULL, NULL, NULL),
	(142, '1569.EAB.001.052.A.524111', 'Penyusunan RKA-K/L / DIPA /Perubahan Anggaran-Belanja Perjalanan Dinas Biasa', 30340000, 9, '2023', 1, NULL, NULL, NULL),
	(143, '1569.EAB.002.051.A.524113', 'Pengelolaan pelaksanaan anggaran, pembayaran gaji, tunjangan pegawai dan revisi anggaran-Belanja Perjalanan Dinas Dalam Kota', 2700000, 10, '2023', 1, NULL, NULL, NULL),
	(144, '1569.EAB.002.051.B.524111', 'Pembukuan, Perhitungan, dan Penyusunan Laporan Keuangan-Belanja Perjalanan Dinas Biasa', 297740000, 10, '2023', 1, NULL, NULL, NULL),
	(145, '1569.EAB.002.051.C.521211', 'Pengelolaan Pelaksanaan Kegiatan Perjalanan Dinas-Belanja Bahan', 13953000, 10, '2023', 1, NULL, NULL, NULL),
	(146, '1569.EAB.002.051.C.522151', 'Pengelolaan Pelaksanaan Kegiatan Perjalanan Dinas-Belanja Jasa Profesi', 1800000, 10, '2023', 1, NULL, NULL, NULL),
	(147, '1569.EAB.002.052.A.524113', 'Informasi Penatausahaan Keuangan dan Perbendaharaan-Belanja Perjalanan Dinas Dalam Kota', 4500000, 10, '2023', 1, NULL, NULL, NULL),
	(148, '1569.EAC.001.051.A.524111', 'Pengelolaan Rumah Tangga dan BMN-Belanja Perjalanan Dinas Biasa', 44870000, 7, '2023', 1, NULL, NULL, NULL),
	(149, '1569.EAC.001.051.A.524113', 'Pengelolaan Rumah Tangga dan BMN-Belanja Perjalanan Dinas Dalam Kota', 2400000, 7, '2023', 1, NULL, NULL, NULL),
	(150, '1569.EAC.001.052.A.524113', 'Pengelolaan Rumah Tangga dan Perlengkapan-Belanja Perjalanan Dinas Dalam Kota', 7200000, 7, '2023', 1, NULL, NULL, NULL),
	(151, '1569.EAC.002.051.A.524113', 'Pengelolaan Tata Usaha dan Persuratan-Belanja Perjalanan Dinas Dalam Kota', 8460000, 7, '2023', 1, NULL, NULL, NULL),
	(152, '1569.EAC.002.052.A.524113', 'Pengelolaan Persuratan dan tata naskah dinas-Belanja Perjalanan Dinas Dalam Kota', 8460000, 7, '2023', 1, NULL, NULL, NULL),
	(153, '1569.EAF.001.051.A.524113', 'Pengelolaan sasaran kinerja pegawai, administrasi umum kepegawaian, dan peningkatan kompetensi-Belanja Perjalanan Dinas Dalam Kota', 6000000, 8, '2023', 1, NULL, NULL, NULL),
	(154, '1569.EAF.001.052.A.524111', 'Pengelolaan administrasi jabatan struktural/fungsional, perencanaan dan analisa kebutuhan pengembangan pegawai-Belanja Perjalanan Dinas Biasa', 80682000, 8, '2023', 1, NULL, NULL, NULL),
	(155, '1569.EAF.001.052.A.524113', 'Pengelolaan administrasi jabatan struktural/fungsional, perencanaan dan analisa kebutuhan pengembangan pegawai-Belanja Perjalanan Dinas Dalam Kota', 17850000, 8, '2023', 1, NULL, NULL, NULL),
	(156, '1569.EAF.001.052.A.524119', 'Pengelolaan administrasi jabatan struktural/fungsional, perencanaan dan analisa kebutuhan pengembangan pegawaiBelanja Perjalanan Dinas Paket Meeting Luar Kota', 221448000, 8, '2023', 1, NULL, NULL, NULL),
	(157, '1569.EAF.001.053.A.524111', 'Mutasi, Promosi dan Pemberentian pegawai-Belanja Perjalanan Dinas Biasa', 243336000, 8, '2023', 1, NULL, NULL, NULL),
	(158, '1569.EAF.001.053.A.524113', 'Mutasi, Promosi dan Pemberentian pegawai-Belanja Perjalanan Dinas Dalam Kota', 10320000, 8, '2023', 1, NULL, NULL, NULL),
	(159, '1569.EAI.001.051.A.524111', 'Penyelenggaraan Kehumasan dan peliputan-Belanja Perjalanan Dinas Biasa', 90480000, 9, '2023', 1, NULL, NULL, NULL),
	(160, '1569.EAI.001.051.A.524113', 'Penyelenggaraan Kehumasan dan peliputan-Belanja Perjalanan Dinas Dalam Kota', 6600000, 9, '2023', 1, NULL, '2021-12-06 11:17:01', NULL),
	(161, '1569.EAI.002.051.A.524111', 'Pengelolaan Layanan Pengaduan-Belanja Perjalanan Dinas Biasa', 81958000, 11, '2023', 1, NULL, NULL, NULL),
	(162, '1569.EAI.002.051.A.524113', 'Pengelolaan Layanan Pengaduan-Belanja Perjalanan Dinas Dalam Kota', 4350000, 11, '2023', 1, NULL, NULL, NULL),
	(163, '1569.EAI.003.051.A.524113', 'Pengelolaan Tata Usaha Pimpinan dan Protokoler-Belanja Perjalanan Dinas Dalam Kota', 18000000, 7, '2023', 1, NULL, NULL, NULL),
	(164, '1569.EAI.003.052.A.524111', 'Koordinasi Pengawasan/Pembinaan Pimpinan-Belanja Perjalanan Dinas Biasa', 1094700000, 7, '2023', 1, NULL, NULL, NULL),
	(165, '1569.EAJ.001.052.A.524111', 'Pengelolaan database hasil pengawasan Inspektorat Jenderal, berbasis teknologi infomasi dan hukuman disiplin-Belanja Perjalanan Dinas Biasa', 239309000, 11, '2023', 1, NULL, NULL, NULL),
	(166, '1569.EAJ.001.053.A.524113', 'Pengelolaan database hasil pemeriksaan BPK, BPKP dan ORI berbasis teknologi informasi-Belanja Perjalanan Dinas Dalam Kota', 6000000, 11, '2023', 1, NULL, NULL, NULL),
	(167, '1569.EAK.001.051.A.524111', 'Pelaksanaan Pencegahan, Penindakan, Yustisi dan Kesekretariatan UPP Kemenkumkam-Belanja Perjalanan Dinas Biasa', 273583000, 11, '2023', 1, NULL, NULL, NULL),
	(168, '1569.EAK.001.051.A.524113', 'Pelaksanaan Pencegahan, Penindakan, Yustisi dan Kesekretariatan UPP Kemenkumkam-Belanja Perjalanan Dinas Dalam Kota', 6000000, 11, '2023', 1, NULL, NULL, NULL),
	(169, '1569.EAK.001.051.B.524113', 'Audit eksternal ISO 37001:2016 Sistem Manajemen Anti Suap (SMAP) tahun Pertama oleh Lembaga Sertifikasi ISO SMAP-Belanja Perjalanan Dinas Dalam Kota', 2400000, 11, '2023', 1, NULL, NULL, NULL);

-- Dumping structure for table katalis.mak2
CREATE TABLE IF NOT EXISTS `mak2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pagu` double NOT NULL,
  `bidang_id` int NOT NULL,
  `tahun_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.mak2: ~5 rows (approximately)
DELETE FROM `mak2`;
INSERT INTO `mak2` (`id`, `kode`, `nama`, `pagu`, `bidang_id`, `tahun_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '1563.321.051.A.524111', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 387720000, 1, 1, 1, '2021-09-30 00:04:18', '2021-11-13 13:15:37', NULL),
	(2, '1563.321.051.A.524112', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 503000000, 2, 1, 1, '2021-10-03 17:48:34', '2021-11-13 13:15:37', NULL),
	(3, '1563.321.051.A.524113', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 63370000, 3, 1, 1, '2021-10-03 18:05:25', '2021-11-10 12:47:43', NULL),
	(4, '14141.14141', 'Perjalanan Dinas', 1348910000, 1, 1, 1, '2021-10-07 15:21:25', '2021-11-12 17:42:46', NULL),
	(5, '1239189381028', 'alksdjlkasjdklasjdlkaj', 100000000, 7, 1, 5, '2021-11-16 09:55:31', '2021-11-16 09:55:31', NULL);

-- Dumping structure for table katalis.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table katalis.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Dumping structure for table katalis.pegawai
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) DEFAULT NULL,
  `nip` varchar(40) DEFAULT NULL,
  `golongan_id` int NOT NULL,
  `jabatan_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_masuk_itjen` date DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table katalis.pegawai: ~281 rows (approximately)
DELETE FROM `pegawai`;
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

-- Dumping structure for table katalis.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(255) NOT NULL,
  `tanggal_invoice` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `nama_supplier` varchar(512) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.pembelian: ~0 rows (approximately)
DELETE FROM `pembelian`;

-- Dumping structure for table katalis.pembelian_detail
CREATE TABLE IF NOT EXISTS `pembelian_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pembelian_id` int NOT NULL,
  `barang_id` int NOT NULL,
  `jumlah` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.pembelian_detail: ~0 rows (approximately)
DELETE FROM `pembelian_detail`;

-- Dumping structure for table katalis.pembelian_lampiran
CREATE TABLE IF NOT EXISTS `pembelian_lampiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pembelian_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.pembelian_lampiran: ~0 rows (approximately)
DELETE FROM `pembelian_lampiran`;

-- Dumping structure for table katalis.peran
CREATE TABLE IF NOT EXISTS `peran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.peran: ~4 rows (approximately)
DELETE FROM `peran`;
INSERT INTO `peran` (`id`, `nama`) VALUES
	(1, 'PENGENDALI UTAMA'),
	(2, 'PENGENDALI TEKNIS'),
	(3, 'KETUA TIM'),
	(4, 'ANGGOTA');

-- Dumping structure for table katalis.perjadin
CREATE TABLE IF NOT EXISTS `perjadin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jenis` varchar(128) NOT NULL DEFAULT 'PERJADIN',
  `no_perjadin` varchar(522) NOT NULL,
  `surat_perintah_id` int NOT NULL,
  `mak_id` int NOT NULL,
  `jumlah_hari` double NOT NULL DEFAULT '0',
  `tujuan` varchar(255) DEFAULT NULL,
  `keberangkatan` varchar(255) DEFAULT NULL,
  `tanggal_berangkat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_kembali` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_anggaran` double NOT NULL DEFAULT '0',
  `status_realisasi` enum('SUDAH','BELUM') NOT NULL DEFAULT 'BELUM',
  `total_realisasi` double NOT NULL DEFAULT '0',
  `status` enum('RENCANA','VERIFIKASI KEUANGAN','PELAKSANAAN','VERIFIKASI PPK','SELESAI','VERIFIKASI REALISASI','VERIFIED KEUANGAN','VERIFIED PPK','TOLAK PPK') NOT NULL DEFAULT 'RENCANA',
  `maksud` text,
  `output` varchar(512) DEFAULT NULL,
  `ppk_id` int NOT NULL,
  `bendahara_id` int NOT NULL,
  `tahun_id` int NOT NULL,
  `user_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin: ~0 rows (approximately)
DELETE FROM `perjadin`;

-- Dumping structure for table katalis.perjadin_hasil
CREATE TABLE IF NOT EXISTS `perjadin_hasil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_id` int NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_hasil: ~0 rows (approximately)
DELETE FROM `perjadin_hasil`;

-- Dumping structure for table katalis.perjadin_lampiran
CREATE TABLE IF NOT EXISTS `perjadin_lampiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_id` int NOT NULL,
  `jenis` enum('SP','RAB','LAINNYA') NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_lampiran: ~0 rows (approximately)
DELETE FROM `perjadin_lampiran`;

-- Dumping structure for table katalis.perjadin_log
CREATE TABLE IF NOT EXISTS `perjadin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `keterangan` text NOT NULL,
  `catatan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_log: ~0 rows (approximately)
DELETE FROM `perjadin_log`;

-- Dumping structure for table katalis.perjadin_obrik
CREATE TABLE IF NOT EXISTS `perjadin_obrik` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_id` int NOT NULL,
  `satker_id` int NOT NULL,
  `urusan_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_obrik: ~0 rows (approximately)
DELETE FROM `perjadin_obrik`;

-- Dumping structure for table katalis.perjadin_rab
CREATE TABLE IF NOT EXISTS `perjadin_rab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_id` int NOT NULL,
  `susunan_tim_perjadin_id` int NOT NULL,
  `jumlah_hari` double NOT NULL,
  `tanggal_berangkat` datetime DEFAULT CURRENT_TIMESTAMP,
  `tanggal_kembali` datetime DEFAULT CURRENT_TIMESTAMP,
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_rab: ~0 rows (approximately)
DELETE FROM `perjadin_rab`;

-- Dumping structure for table katalis.perjadin_realisasi
CREATE TABLE IF NOT EXISTS `perjadin_realisasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_sppd` varchar(255) DEFAULT NULL,
  `perjadin_id` int NOT NULL,
  `susunan_tim_perjadin_id` int NOT NULL,
  `total_harian` double NOT NULL DEFAULT '0',
  `total_hotel` double NOT NULL DEFAULT '0',
  `total_transport` double NOT NULL DEFAULT '0',
  `tanggal_berangkat` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `taksi_jakarta` double NOT NULL,
  `taksi_provinsi` double NOT NULL,
  `jakarta_riil` tinyint(1) NOT NULL DEFAULT '0',
  `provinsi_riil` tinyint(1) NOT NULL DEFAULT '0',
  `representatif` double NOT NULL,
  `total` double NOT NULL,
  `jenis_hotel` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_realisasi: ~0 rows (approximately)
DELETE FROM `perjadin_realisasi`;

-- Dumping structure for table katalis.perjadin_realisasi_lampiran
CREATE TABLE IF NOT EXISTS `perjadin_realisasi_lampiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_realisasi_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_realisasi_lampiran: ~0 rows (approximately)
DELETE FROM `perjadin_realisasi_lampiran`;

-- Dumping structure for table katalis.perjadin_realisasi_transport
CREATE TABLE IF NOT EXISTS `perjadin_realisasi_transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_realisasi_id` int NOT NULL,
  `jenis_transport` enum('UDARA','DARAT','LAUT') NOT NULL DEFAULT 'UDARA',
  `total` double NOT NULL,
  `riil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_realisasi_transport: ~0 rows (approximately)
DELETE FROM `perjadin_realisasi_transport`;

-- Dumping structure for table katalis.perjadin_realisasi_uang_harian
CREATE TABLE IF NOT EXISTS `perjadin_realisasi_uang_harian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_realisasi_id` int NOT NULL,
  `jumlah_hari` double NOT NULL,
  `uang_harian` double NOT NULL,
  `total` double NOT NULL,
  `riil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_realisasi_uang_harian: ~0 rows (approximately)
DELETE FROM `perjadin_realisasi_uang_harian`;

-- Dumping structure for table katalis.perjadin_realisasi_uang_hotel
CREATE TABLE IF NOT EXISTS `perjadin_realisasi_uang_hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_realisasi_id` int NOT NULL,
  `jenis_hotel` int NOT NULL DEFAULT '0',
  `nama_hotel` varchar(255) DEFAULT NULL,
  `jumlah_malam` double NOT NULL,
  `uang_hotel` double NOT NULL,
  `total` double NOT NULL,
  `riil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_realisasi_uang_hotel: ~0 rows (approximately)
DELETE FROM `perjadin_realisasi_uang_hotel`;

-- Dumping structure for table katalis.perjadin_susunan_tim
CREATE TABLE IF NOT EXISTS `perjadin_susunan_tim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `perjadin_id` int NOT NULL,
  `perjadin_rab_id` int DEFAULT NULL,
  `perjadin_realisasi_id` int DEFAULT NULL,
  `pegawai_id` int NOT NULL,
  `peran_id` int NOT NULL,
  `status_realisasi` enum('BELUM','SUDAH') NOT NULL DEFAULT 'BELUM',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.perjadin_susunan_tim: ~0 rows (approximately)
DELETE FROM `perjadin_susunan_tim`;

-- Dumping structure for table katalis.permintaan_persediaan
CREATE TABLE IF NOT EXISTS `permintaan_persediaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keterangan` text,
  `status` enum('PENGAJUAN','VERIFIKASI UMUM','REVISI UMUM','SELESAI','DITOLAK') NOT NULL DEFAULT 'PENGAJUAN',
  `file` varchar(512) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tahun_id` int NOT NULL,
  `user_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.permintaan_persediaan: ~0 rows (approximately)
DELETE FROM `permintaan_persediaan`;

-- Dumping structure for table katalis.permintaan_persediaan_detail
CREATE TABLE IF NOT EXISTS `permintaan_persediaan_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permintaan_persediaan_id` int NOT NULL,
  `barang_id` int NOT NULL,
  `jumlah_permintaan` double NOT NULL,
  `jumlah_disetujui` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.permintaan_persediaan_detail: ~0 rows (approximately)
DELETE FROM `permintaan_persediaan_detail`;

-- Dumping structure for table katalis.permintaan_persediaan_lampiran
CREATE TABLE IF NOT EXISTS `permintaan_persediaan_lampiran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permintaan_persediaan_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(512) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.permintaan_persediaan_lampiran: ~0 rows (approximately)
DELETE FROM `permintaan_persediaan_lampiran`;

-- Dumping structure for table katalis.permintaan_persediaan_log
CREATE TABLE IF NOT EXISTS `permintaan_persediaan_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permintaan_persediaan_id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `keterangan` text NOT NULL,
  `catatan` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.permintaan_persediaan_log: ~0 rows (approximately)
DELETE FROM `permintaan_persediaan_log`;

-- Dumping structure for table katalis.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table katalis.personal_access_tokens: ~8 rows (approximately)
DELETE FROM `personal_access_tokens`;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 8, 'auth_token', 'e4b53b23ad61e3b365813b32e7220dc84a30c3df5c0c5aebfe34cb6721eeb8ed', '["*"]', NULL, '2023-12-27 07:54:45', '2023-12-27 07:54:45'),
	(2, 'App\\Models\\User', 8, 'auth_token', '34397b7c65fd8b4258528cd5f339aada6c4f7cec8e1aa4c5de6d57dadeabe6c7', '["*"]', NULL, '2023-12-27 07:55:03', '2023-12-27 07:55:03'),
	(3, 'App\\Models\\User', 8, 'auth_token', '24ab266db5ae467b11682e7566f4afb9dd80688b76a09994ed9df89c02047e80', '["*"]', NULL, '2023-12-27 07:55:43', '2023-12-27 07:55:43'),
	(4, 'App\\Models\\User', 8, 'auth_token', '5f24b25a036652ce82063dc66b9f3d00859fc7078138028545ecc5a9060fdb4d', '["*"]', NULL, '2023-12-27 07:56:52', '2023-12-27 07:56:52'),
	(5, 'App\\Models\\User', 8, 'auth_token', '2cd2dc3daa6a682838bc54da0506e340d0df35dc910e481fd05009fefa3dbbf7', '["*"]', NULL, '2023-12-27 07:58:01', '2023-12-27 07:58:01'),
	(6, 'App\\Models\\User', 8, 'auth_token', '347c330f9bdb3c3f93cef4a98d895a72170fa8914ce9581511fb6c65b2f6c8c0', '["*"]', NULL, '2023-12-27 07:58:18', '2023-12-27 07:58:18'),
	(7, 'App\\Models\\User', 8, 'auth_token', '450d896a3b36112b34be7752b33f8928a39c4e92239dcd048756cd9cc5d4a1aa', '["*"]', NULL, '2023-12-27 08:36:07', '2023-12-27 08:36:07'),
	(8, 'App\\Models\\User', 8, 'auth_token', '0249704ae23895585f75b34aa932a0b804d4f738852e5f70451fdc6d191791b3', '["*"]', '2023-12-28 04:15:35', '2023-12-27 08:37:30', '2023-12-28 04:15:35'),
	(9, 'App\\Models\\User', 8, 'auth_token', 'b703f5dd6b24793393a463ec3d0f88d2faae4fbbd033f7a5a41f13c94496ae92', '["*"]', '2023-12-28 05:02:08', '2023-12-28 04:16:21', '2023-12-28 05:02:08');

-- Dumping structure for table katalis.peta_kompetensi
CREATE TABLE IF NOT EXISTS `peta_kompetensi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pegawai_id` int NOT NULL,
  `bidang_ilmu_id` int NOT NULL,
  `nama_pelatihan` varchar(512) NOT NULL,
  `tahun_pelaksanaan` int NOT NULL,
  `level` enum('BEGINNER','INTERMEDIETE','ADVANCE','EXPERT') NOT NULL,
  `skala` enum('INTERNASIONAL','NASIONAL','LOKAL') NOT NULL,
  `penyelenggara` varchar(512) NOT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_akhir` datetime DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `file` varchar(512) DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.peta_kompetensi: ~0 rows (approximately)
DELETE FROM `peta_kompetensi`;

-- Dumping structure for table katalis.revisi_anggaran
CREATE TABLE IF NOT EXISTS `revisi_anggaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tahun_id` int NOT NULL,
  `keterangan` text NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `nama_file` text,
  `status` enum('BUKA','TUTUP','VERIFIKASI','SELESAI') NOT NULL DEFAULT 'BUKA',
  `tanggal_mulai` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.revisi_anggaran: ~0 rows (approximately)
DELETE FROM `revisi_anggaran`;

-- Dumping structure for table katalis.revisi_anggaran_detail
CREATE TABLE IF NOT EXISTS `revisi_anggaran_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `revisi_anggaran_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `pagu_awal` double NOT NULL DEFAULT '0',
  `pagu_akhir` double NOT NULL DEFAULT '0',
  `pagu_realokasi` double NOT NULL DEFAULT '0',
  `status` enum('PROSES','VERIFIKASI','VERIFIED','REVISI','SELESAI') NOT NULL DEFAULT 'PROSES',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisi_id` (`revisi_anggaran_id`),
  CONSTRAINT `revisi_id` FOREIGN KEY (`revisi_anggaran_id`) REFERENCES `revisi_anggaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.revisi_anggaran_detail: ~0 rows (approximately)
DELETE FROM `revisi_anggaran_detail`;

-- Dumping structure for table katalis.revisi_anggaran_detail_mak
CREATE TABLE IF NOT EXISTS `revisi_anggaran_detail_mak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `revisi_anggaran_detail_id` int NOT NULL,
  `mak_id` int NOT NULL,
  `pagu_awal` double NOT NULL,
  `pagu_akhir` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisi_detail_id` (`revisi_anggaran_detail_id`),
  CONSTRAINT `revisi_detail_id` FOREIGN KEY (`revisi_anggaran_detail_id`) REFERENCES `revisi_anggaran_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.revisi_anggaran_detail_mak: ~0 rows (approximately)
DELETE FROM `revisi_anggaran_detail_mak`;

-- Dumping structure for table katalis.satker
CREATE TABLE IF NOT EXISTS `satker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kanwil_id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(512) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.satker: ~0 rows (approximately)
DELETE FROM `satker`;
INSERT INTO `satker` (`id`, `kanwil_id`, `nama`, `alamat`, `nomor_telepon`) VALUES
	(1, 1, 'RUTAN LOHKNGA', 'ACEH', '123123');

-- Dumping structure for table katalis.sheet1
CREATE TABLE IF NOT EXISTS `sheet1` (
  `No` int DEFAULT NULL,
  `GOLONGAN` varchar(4) DEFAULT NULL,
  `NAMA` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table katalis.sheet1: ~17 rows (approximately)
DELETE FROM `sheet1`;
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

-- Dumping structure for table katalis.surat_perintah
CREATE TABLE IF NOT EXISTS `surat_perintah` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) DEFAULT NULL,
  `tanggal_surat` datetime DEFAULT NULL,
  `perihal` varchar(512) DEFAULT NULL,
  `perjadin` enum('YA','TIDAK') NOT NULL,
  `tahun_id` int NOT NULL,
  `user_id` int NOT NULL,
  `bidang_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.surat_perintah: ~0 rows (approximately)
DELETE FROM `surat_perintah`;

-- Dumping structure for table katalis.tahun
CREATE TABLE IF NOT EXISTS `tahun` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.tahun: ~3 rows (approximately)
DELETE FROM `tahun`;
INSERT INTO `tahun` (`id`, `nama`) VALUES
	(1, 2023),
	(2, 2024),
	(3, 2025);

-- Dumping structure for table katalis.urusan
CREATE TABLE IF NOT EXISTS `urusan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table katalis.urusan: ~10 rows (approximately)
DELETE FROM `urusan`;
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

-- Dumping structure for table katalis.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang_id` int NOT NULL,
  `pegawai_id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','PPK','USER','VERIFIKATOR','BENDAHARA','ADMIN KEUANGAN','ADMIN KEPEGAWAIAN','ADMIN KEUANGAN','ADMIN UMUM') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table katalis.users: ~8 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `bidang_id`, `pegawai_id`, `nama`, `role`, `ability`, `created_at`, `updated_at`) VALUES
	(1, '1231', '123456', 9, 25, 'LUCKY', 'USER', '[{"action" : "manage", "subject" : "user"},{"action" : "manage", "subject" : "auth"},{"action" : "manage", "subject" : "dashboard_user"},{"action" : "manage", "subject" : "permintaan_persediaan"},{"action" : "manage", "subject" : "kegiatan"},{"action" : "manage", "subject" : "perjadin"},{"action" : "manage", "subject" : "laporan"},{"action" : "manage", "subject" : "data_pegawai"},{"action" : "manage", "subject" : "mak"},{"action" : "manage", "subject" : "revisi_anggaran"}]', NULL, NULL),
	(2, '1235', '123456', 3, 17, 'JOKO', 'PPK', '[{"action" : "manage", "subject" : "auth"},{"action" : "manage", "subject" : "dashboard_ppk"},{"action" : "manage", "subject" : "kegiatan"},{"action" : "manage", "subject" : "perjadin"}]', NULL, NULL),
	(3, '1236', '123456', 1, 100, 'DIO', 'USER', '[{"action" : "manage", "subject" : "user"},{"action" : "manage", "subject" : "auth"},{"action" : "manage", "subject" : "dashboard_user"},{"action" : "manage", "subject" : "permintaan_persediaan"},{"action" : "manage", "subject" : "kegiatan"},{"action" : "manage", "subject" : "perjadin"},{"action" : "manage", "subject" : "laporan"},{"action" : "manage", "subject" : "data_pegawai"},{"action" : "manage", "subject" : "mak"}]', NULL, NULL),
	(4, '12347', '123456', 1, 219, 'EMA', 'BENDAHARA', '[{"action" : "manage", "subject" : "bendahara"},{"action" : "manage", "subject" : "auth"},{"action" : "manage", "subject" : "dashboard_bendahara"},{"action" : "manage", "subject" : "kegiatan"},{"action" : "manage", "subject" : "perjadin"}]', NULL, NULL),
	(5, '12348', '123456', 1, 214, 'PRISI', 'ADMIN KEUANGAN', '[{"action" : "manage", "subject" : "admin_keuangan"},{"action" : "manage", "subject" : "auth"},{"action" : "manage", "subject" : "dashboard_keuangan"},{"action" : "manage", "subject" : "kegiatan"},{"action" : "manage", "subject" : "perjadin"},{"action" : "manage", "subject" : "revisi_anggaran"}]', NULL, NULL),
	(6, '12341', '123456', 1, 173, 'EDO', 'ADMIN KEPEGAWAIAN', '[{"action" : "manage", "subject" : "admin_kepegawaian"},{"action" : "manage", "subject" : "data_pegawai"}]', NULL, NULL),
	(7, '12342', '123456', 1, 159, 'EDO', 'ADMIN UMUM', '[{"action" : "manage", "subject" : "admin_umum"},{"action" : "manage", "subject" : "auth"},{"action" : "manage", "subject" : "dashboard_umum"},{"action" : "manage", "subject" : "permintaan_persediaan"}]', NULL, NULL),
	(8, '1', '$2y$10$DcgssTPSkNJAmhWQp9qFWesmtUuuxrCS2lRbeYJ/3hAK8LrSMNugm', 11, 161, 'M Munzir', 'USER', '[{ "action": "manage", "subject": "user" },{ "action": "manage", "subject": "auth" },{ "action": "manage", "subject": "dashboard_user" },{ "action": "manage", "subject": "kegiatan" },{ "action": "manage", "subject": "perjadin" },{ "action": "manage", "subject": "laporan" },{ "action": "manage", "subject": "mak" }]', NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
