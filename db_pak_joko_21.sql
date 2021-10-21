-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2021 at 10:42 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

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
(1, 'INSPEKTORAT WILAYAH I', '2021-10-05 05:31:39', NULL, NULL),
(2, 'INSPEKTORAT WILAYAH II', '2021-10-05 05:31:39', NULL, NULL),
(3, 'INSPEKTORAT WILAYAH III', '2021-10-05 05:31:39', NULL, NULL),
(4, 'INSPEKTORAT WILAYAH IV', '2021-10-05 05:31:39', NULL, NULL),
(5, 'INSPEKTORAT WILAYAH V', '2021-10-05 05:31:39', NULL, NULL),
(6, 'INSPEKTORAT WILAYAH VI', '2021-10-05 05:31:39', NULL, NULL),
(7, 'BAGIAN UMUM', '2021-10-05 05:31:39', NULL, NULL),
(8, 'BAGIAN KEPEGAWAIAN', '2021-10-05 05:31:39', NULL, NULL),
(9, 'BAGIAN PROGRAM HUBUNGAN MASYARAKAT DAN PELAPORAN', '2021-10-05 05:31:39', NULL, NULL),
(10, 'BAGIAN KEUANGAN', '2021-10-05 05:31:39', NULL, NULL),
(11, 'BAGIAN SISTEM INFORMASI PENGAWASAN', '2021-10-05 05:31:39', NULL, NULL),
(12, 'BENDAHARA INSPEKTORAT JENDERAL', '2021-10-05 05:31:39', NULL, NULL),
(13, 'SUB BAGIAN RT DAN PERLENGKAPAN', '2021-10-05 05:31:39', NULL, NULL),
(14, 'SUB BAGIAN KEUANGAN', '2021-10-05 05:31:39', NULL, NULL),
(15, 'SUB BAGIAN TU INSPEKTORAT JENDERAL', '2021-10-05 05:31:39', NULL, NULL),
(16, 'SUB BAGIAN TU PIMPINAN', '2021-10-05 05:31:39', NULL, NULL),
(17, 'KHUSUS', '2021-10-05 05:31:39', NULL, NULL),
(18, 'ADMIN', '2021-10-05 05:31:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hasil_lampiran`
--

CREATE TABLE `hasil_lampiran` (
  `id` int(11) NOT NULL,
  `surat_perintah_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, '1563.321.051.A.524111', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 240046000, 1, 1, 1, '2021-10-05 06:04:18', '2021-10-08 23:26:47', NULL),
(2, '1563.321.051.A.524112', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 200000000, 2, 1, 1, '2021-10-08 23:48:34', '2021-10-08 23:48:34', NULL),
(3, '1563.321.051.A.524113', 'Evaluasi Usulan Satker WBK/WBBM-Belanja Perjalanan Dinas Biasa', 3000000, 3, 1, 1, '2021-10-09 00:05:25', '2021-10-09 00:05:25', NULL),
(4, '14141.14141', 'Perjalanan Dinas', 100000000, 1, 1, 1, '2021-10-12 21:21:25', '2021-10-12 21:21:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `obrik`
--

CREATE TABLE `obrik` (
  `id` int(11) NOT NULL,
  `surat_perintah_id` int(11) NOT NULL,
  `satker_id` int(11) NOT NULL,
  `urusan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(3) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `nip` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nip`) VALUES
(1, 'ABBAS,SH.MH', '19740330 199803 1 001'),
(2, 'ABDUL HAMID, SE.', '19760901 200912 1 002'),
(3, 'ABDUL ROKHMAN, A.Md.', '19801211 200912 1 002'),
(4, 'ADE CICI ROHAYATI, SH.MH', '19740508 199803 2 001'),
(5, 'ADE KURNIAWAN, A.Md. SE.', '19840424 200901 1 007'),
(6, 'ADI PRIYO PRATOMO, SH', '198309122001121002'),
(7, 'Agil Fahlefi, S.A.P', '199407242017121001'),
(8, 'AGUNG NATANAEL,SH.MH', '19710723 199703 1 001'),
(9, 'AGUNG NUGROHO, S. Sos', '19790331 200112 1 001'),
(10, 'AGUNG PAMBUDI KURNIAWAN', '19820903 200112 1 001'),
(11, 'AGUS PRIYO ATMOKO, A.Md. SE.', '19810813 200501 1 001'),
(12, 'AGUS RIANTO, SE', '19720817 200112 1 002'),
(13, 'AHMAD SUGANDA, A.Md. SH', '19750517 199903 1 001'),
(14, 'AJI PRASETYO PAMBUDI', '19700111 198803 1 001'),
(15, 'ALEXANDER PALTI, SH.MH', '19731121 199803 1 001'),
(16, 'AMAN AGUNG KURNIAWAN', '19801111 200501 1 001'),
(17, 'AMI AMATUNISSA, SH.MH', '19700327 199803 2 001'),
(18, 'AMINULLAH NOOR PAKPAHAN, SH.MH', '19640621 199303 1 001'),
(19, 'ANDAR SUMIYATI, SH', '19590915 198003 2 001'),
(20, 'ANDI MUHAMMAD TAUFIK, SH', '19840915 201012 1 002'),
(21, 'ANDI TRIAS ARYANTO, SM.', '19930811 201712 1 001'),
(22, 'ANDRIYAN, SE.', '19770108 200912 1 002'),
(23, 'ANDRIYANTO WAHYU PRASETIO, SH.MH', '19701218 199903 1 002'),
(24, 'ANGGIT SRI RAHAYU, SE', '19870126 201901 2 001'),
(25, 'ANTON KURNIAWAN, A.Md', '19830415 200912 1 001'),
(26, 'ANTON PARASIAN, SH', '19810331 200604 1 001'),
(27, 'ARDILES RICKY SUSILO, SH', '19810813 200604 1 001'),
(28, 'ARI FACHRYADI,S.Kom', '19861105 201503 1 003'),
(29, 'ARI FARDIANTO, SE', '19650419 199903 1 001'),
(30, 'ARI PRAMBUDI, SH., MH', '19700214 199803 1 001'),
(31, 'ARIEF BUDIMAN SJAFRI, SH', '19810926 200912 1 005'),
(32, 'ARIEF RAHMAN', '19871105 200703 1 001'),
(33, 'ARIF SULAEMAN, S.Kom.', '19900430 201503 1 002'),
(34, 'ARMAN SYAH RAZAK, SE.', '19770201 200912 1 002'),
(35, 'ASIH RETNO SAYEKTI, A.Md. S. Kom', '19811027 200901 2 002'),
(36, 'AULADY YULLAD', '-'),
(37, 'BAGUS DWI LAKSONO, S.Kom', '19860907 201503 1 003'),
(38, 'BAMBANG MARGONO, Drs, MH', '19510712 197203 1 001'),
(39, 'BAMBANG PURWANTHO, SH', '19790803 200604 1 001'),
(40, 'BAMBANG SETYABUDI, SH. MH.', '19691128 199703 1 001'),
(41, 'BANERIAMA, SH', '19730623 199403 2 001'),
(42, 'BARKAH WATI WIJAYA', '19620301 198203 2 001'),
(43, 'BOSAR IMMANUEL, S.E.', '19860608 201012 1 003'),
(44, 'BRAHMANTYA PUJI K, S.E.', '19800816 200912 1 003'),
(45, 'BUDI, SH', '19621125 198903 1 002'),
(46, 'BUDIMAN S, A.Md', '19641111 199103 1 001'),
(47, 'CAVEN JONATHAN, A.Md.Im', '198208022001121001'),
(48, 'Caven Jonathan, A.Md.Im., MPA.', '19820802 20112 1 001'),
(49, 'CECENG ACHMAD WIDJAJA', '19580907 197703 1 001'),
(50, 'CHANDRA JULIUS FOSTER MANALU, SE', '19790715 201012 1 001'),
(51, 'CHRISTIAN IMANUEL HASUDUNGAN, S.SOS', '19791221 200002 1 001'),
(52, 'CHYNTIA DEVI, SE', '19850716 201503 2 002'),
(53, 'DAVID MARADONA LUMBAN BATU', '19860518 200501 1 001'),
(54, 'DEDY MULYADI', '19670625 199103 1 002'),
(55, 'DENNY DARMAWAN, SE', '19730119 200112 1 001'),
(56, 'DESI NATALIA, A. Md.', '19791225 201012 2 002'),
(57, 'DEWI AYU NURMALASARI, SH', '19830821 200112 2 001'),
(58, 'DEWI KURNIATI AIRLANGGA, S.E.', '19950401 201901 2 002'),
(59, 'DEWI SUSIANA MAULIDA,SE', '198910032015032009'),
(60, 'DEWI WAHYUNINGSIH, SE.', '19900520 201503 2 003'),
(61, 'DEWI WAHYUNINGSIH,SE', '19900520 201503 2 003'),
(62, 'DHONY ALFIANTO, SH.', '19921016 201503 1 001'),
(63, 'DIAN SAPTAWATI, SE', '19771210 200501 2 002'),
(64, 'DINDA DIAN MEGA KARTIKA, SH.', '19841021 200912 2 005'),
(65, 'DOKTOR GURNING, SH', '19790830 200501 1 001'),
(66, 'Drs. ENDANG SUPRIYATNO SE, M.Si', '19621003 199103 1 001'),
(67, 'Drs. KHAIRUDDIN, M.Si.', '19620201 199003 1 001'),
(68, 'DRS. KHAIRUDIN, M.Si', '19620201 199003 1 001'),
(69, 'Drs. RUSNI', '19571103 197903 1 001'),
(70, 'Drs. RUSNI KARDI, M.Ak', '19571103 197903 1 001'),
(71, 'DRS.SULISTIARSO, MM.M.Si.', '19590521 198303 1 002'),
(72, 'DWI ARI WIBOWO, SH', '19850315 200312 1 003'),
(73, 'DWI SUMARWANTO, SH', '19800831 2009011008'),
(74, 'EDY PRABOWO SAPUTRO, S.Kom', '19830216 200312 1 002'),
(75, 'EEN SETIA SUHARJITO, SE., MM.', '19831003 200912 1 010'),
(76, 'EFI HANDAYANI, SH', '19920210 201503 2 001'),
(77, 'EKA SETYAWATI. SH. MH.', '19800222 199903 2 002'),
(78, 'ELMIRA OKTARINA', '198510022005012001'),
(79, 'ELYCHIA ROLY PUTRI,SE', '19920611 201503 2 001'),
(80, 'EMMANIA NOVADA SUDARNO,A.Md', '19901120 201503 2 004'),
(81, 'ERBATA SRI MULIATINI, SH', '19700606 199803 2 001'),
(82, 'ERIE WIJAYA, SH', '19690506 199803 1 001'),
(83, 'EUIS YULIANTI, A.Md', '19820729 200901 2 005'),
(84, 'Falentina Paramita Sari', '19940919 201712 2 001'),
(85, 'FANDYLA WAHYU SASONGKO, SH', '19840211 200604 1 001'),
(86, 'Febrilia', '19820215 201012 2 001'),
(87, 'FEBRILIA RASMAHITA', '19820215 201012 2 001'),
(88, 'FECHA PAUL PANGARIBUAN, SH', '19850329 200912 1 005'),
(89, 'FENDY PRASETIYO, SH', '19810219 200212 1 001'),
(90, 'FERA ARINDRA TRI ANESTYA, S.E.', '199406182019012002'),
(91, 'FIRMAN SEPTA FIRDAUS, SH', '19820904 200604 1 001'),
(92, 'FITRIYAH KUSUMA WARDANI, S.H.', '198905082017122001'),
(93, 'Galuh Purnomo', '19930426 201712 1 001'),
(94, 'GESS LUTFI, A.Md', '19821110 200901 2 004'),
(95, 'Hafidz Zulkarnain, S.Kom', '19880208 200912 1 005'),
(96, 'Handityo Nugroho, S.E.', '19880228 201503 1 002'),
(97, 'Hardika Pratama Putra, SH', '19860614 200912 1 003'),
(98, 'HARI PURWANTO, A.Md.SE, M.Si.', '19720117 200112 1 001'),
(99, 'HARRY AZHARI, SH', '19671104 199803 1 001'),
(100, 'HARRY LESMANA, ST. M. Si', '19801122 200312 1 001'),
(101, 'HELMY AHIRUL A', '19790430 200912 1 002'),
(102, 'HENNI NOOR UTAMI', '19900826 201505 2 001'),
(103, 'HERIYANTO TRI RATMOKO, A.MD', '19820116 2005011 001'),
(104, 'Hernika Andriani, SH.', '19731102 199303 2 001'),
(105, 'HERU SAPRUDIN, SH', '197102192001121001'),
(106, 'I MADE RUHAN ADRADHONA, SH., MH', '19870521 201012 1 006'),
(107, 'I MADE SUJA', '19610622 198203 1 001'),
(108, 'I MADE WEDHA SATRIA, SE.', '19780628 201012 1 001'),
(109, 'ICHSANUDIN EKO SAPUTRO, SH., M.Si.', '19671027 199303 1 001'),
(110, 'IIS SITI AISYAH, S.E.', '19950609 201901 2 001'),
(111, 'INDAH DWI WIDYASIH', '19870713 200604 2 001'),
(112, 'INDRA SAPUTRA, SH.', '19851107 200912 1 001'),
(113, 'INDRA SATYA', '-'),
(114, 'INDRAJAYA ALI, SE. M.Si', '19741011 200112 1 001'),
(115, 'INDRAWATI', '19580201 197903 2 002'),
(116, 'INDRY EKA WARDHANI, SE', '19950515 201901 2 002'),
(117, 'IQBAL ALBERT HUSIN, SH, M. Kn.', '19800216 200604 1 001'),
(118, 'ISMANJONO, SH', '19620917 198303 1 001'),
(119, 'JACKSON SIMAMORA, SH', '19770824 199803 1 001'),
(120, 'JANUARINO ADITYA', '198301212010121001'),
(121, 'JIMS GUNAWAN, SE', '19840916 201503 1 004'),
(122, 'JOKO MARTANTO, S.E. M.Si.', '19720305 199903 1 007'),
(123, 'JUANDA MARTUA U. NASUTION, SH', '19821027 200604 1 001'),
(124, 'JUNITA ARISTIATI, SE. M. Si.', '19710601 200112 2 001'),
(125, 'KURNIA PUTRI NATALIA L', '199512242019012001'),
(126, 'KURNIAWAN, A.Md', '19840717 200901 1 010'),
(127, 'KUSWANDARI, S.Pd', '19610221 198402 2 001'),
(128, 'LAMBOK TIOMA SIHOMBING, SE.MH', '19620719 198901 2 001'),
(129, 'LELY NURACHMI, SH', '19630326 198503 2 001'),
(130, 'LEXTY RACHMAYANI, A.Md. S. Kom.', '19830628 200901 2 005'),
(131, 'LULUK RATNANINGTYAS, SH., M.HUM', '196310011991032001'),
(132, 'LUSI HANDAYANI, SE', '19860111 200912 2 008'),
(133, 'M AFIPUDIN HANSURI, SH', '19560209 198203 1 001'),
(134, 'M. FAHRULLAH, SH', '19800130 200604 1 001'),
(135, 'M. HUSNI THAMRIN, SH. MH.', '19521010 198103 1 002'),
(136, 'M. RUSLI B, SH', '19630227 199803 1 001'),
(137, 'M.H. KESUMA NEGARA, SH., MM', '19710131 200312 1 001'),
(138, 'MADDALENA SARAGI, SH., MKn. MM.', '19741209 200501 2 001'),
(139, 'MAR`ATUN ISNAENI, S.I.A.', '19900710 201712 2 001'),
(140, 'Medi', '196006041981031001'),
(141, 'MILANTO SIMANJUNTAK, SE', '19750522 200312 1 001'),
(142, 'MISERI, SH, MM', '19630409 198203 1 001'),
(143, 'MOCH. KRISTANTO, SE', '19761226 200912 1 002'),
(144, 'Muhamad Mufid, S.Ag, M.Si, MH', '19760304 200501 1 001'),
(145, 'MUHAMMAD CATUR SUGIHARTO', '19860422 200604 1 002'),
(146, 'MUHAMMAD FADLIKA DONIE PARON, S.H.', '19951208 201712 1 001'),
(147, 'MUHAMMAD MUFID, SAg, Msi, MH', '197603042005011001'),
(148, 'NANIH KUSNANI, A.Md., S.Sos., M.Ak.', '19721204 199903 2 002'),
(149, 'NASRUDIN NURDIANSYAH, SH. M.Si.', '19830914 200112 1 002'),
(150, 'NENI AYUNI, SH', '19860722 201012 2 010'),
(151, 'Nia Wulandari, S.E.', '199509292019012001'),
(152, 'NIKEN AYU KUSUMANINGPURI, SH', '19830816 200604 2 001'),
(153, 'NINDRA WAHYU HAPSARI, SH.', '19920617 201503 2 007'),
(154, 'Nindya Ayu Nirmala', '199512282017122001'),
(155, 'NISA AMELINA', '19960806 201901 2 001'),
(156, 'NOPALISA EGITULAS VEMBILAN, S.Kom.MM', '19791117 200312 2 001'),
(157, 'NUR SOFIYAH, A.Md. S.IP., MM', '19691013 199203 2 001'),
(158, 'NURDIN, SH', '19610105 198203 1 001'),
(159, 'NURMALASARI, SH., MH.', '19790901 199903 2 001'),
(160, 'NURUL DWI HASTUTI,SH', '19900916 201503 2 006'),
(161, 'NURUL MAHARANI PIRANTI, A.Md.', '19850218 200901 2 004'),
(162, 'OMARDI SAPUTRA, SH.', '19690310 200112 1 001'),
(163, 'Parlindungan Donni, SH', '19880914 200703 1 001'),
(164, 'Patria Ratna Sari', '19881117 201503 2 006'),
(165, 'PETRUS MOKO HANDOKO, SE. MSM', '19760320 200912 1 002'),
(166, 'PRISI KHAIRANI ARIEF, SH', '199402032017122001'),
(167, 'PUJI HAYATI, A. Md.', '19830130 201012 2 002'),
(168, 'PUJI RAHARTO, S. IP., MM.', '19651021 198603 1 001'),
(169, 'PURNAWAN HARI,SH., MH.', '19611110 199403 1 001'),
(170, 'QOLBIN SALIM , SE., MH.', '19650720 199403 1 001'),
(171, 'R. HANDARU TJIPTO, SH.MH', '19580404 197803 1 001'),
(172, 'R.ERI IRAWAN SUMANTO. SH. M.Kn.', '19760321 200604 1 001'),
(173, 'RADEN BAGUS WARSITO UTOMO, SH', '19830123 2007031 002'),
(174, 'RADEN RORO RIZQI PUJASWATI, SH.', '19871110 200912 2 006'),
(175, 'RANI OCTARIANI, SH., MH.', '19701009 199803 2 001'),
(176, 'RAYMOND TINATING PANGIHUTAN SIAGIAN, SH.', '19770903 200912 1 001'),
(177, 'REDI FIRDAUS BUNYAMIN, A.Md', '19860924 200912 1 005'),
(178, 'RETNA WANDITA, SH.', '19840502 200912 2 008'),
(179, 'REZA ADITIYAS ANANDA, SH', '19850411 200604 1 001'),
(180, 'RIA WAHYU TANJUNG SASONGKO, A.Md', '19880729 200912 1 002'),
(181, 'RICA WIDIA PARDOSI', '19910524 201901 2 001'),
(182, 'RICA WIDIA PARDOSI, S.E.', '19910524 201901 2 001'),
(183, 'RIDHA FARIDHA DJOYO, S.E.', '19911115 201901 2 001'),
(184, 'RIFALDY MAHARDIKA P., S.E.', '19930928 201901 1 001'),
(185, 'RINI WIGAWATI', '19590606 198103 2 001'),
(186, 'RINI YUNIASIH, A.Md', '19810601 200901 2 006'),
(187, 'Rintaka Jayadi Brata', '198902082017121001'),
(188, 'RISTIANTI MUJI KARTIKASARI, SH', '19820520 200604 2 001'),
(189, 'Rr. Rizqi Pujaswati', '198711102009122006'),
(190, 'RURI HANDIYANI PRATIWI, S.E.', '199309062019012001'),
(191, 'RUSDIYANTININGSIH, SH', '19631006 198603 2 001'),
(192, 'RUSLAN ABDUL GANI, SE', '19580202 198003 1 001'),
(193, 'S. SUKIMIN SUGINO', '19590605 198103 1 001'),
(194, 'SARWADI, S.H.', '19640515 198503 1 001'),
(195, 'SARWADI, SH', '19640515 198503 1 001'),
(196, 'SATRIO MAHENDRAJATI, SH., MH', '19750419 199403 1 001'),
(197, 'SATRIO WHINASIS PURBOAJI, S.H.', '199006192017121001'),
(198, 'SITI HONIYAH, SH', '19580503 198702 2 001'),
(199, 'SITI SOFIATUN, SE. M. Si', '19781228 200312 2 001'),
(200, 'Slamet Iman Santoso, SE, MM', '19750520 200112 1 002'),
(201, 'Slamet Iman Santoso, SE.MM', '19750520 200112 1 002'),
(202, 'Sri Ngulati, SH., MH', '19561116 198203 2 001'),
(203, 'SRI RIANINGSIH', '19620826 198203 2 001'),
(204, 'SRI SUMARMI', '19560707 197703 2 001'),
(205, 'SRI SUSILOWATI', '19600218 198203 2 001'),
(206, 'SRIYANI WIARTI', '19620130 198203 2 001'),
(207, 'SULARSO', '19580620 198503 1 001'),
(208, 'SUMINI, SH', '19581023 198003 2 001'),
(209, 'SUNARTI', '19621126 198302 2 001'),
(210, 'SUNARTO', '19590804 197903 1 001'),
(211, 'SUPARMAN, SH', '19580922 198103 1 001'),
(212, 'SUPERMAN, SE', '19700324 199903 1 001'),
(213, 'SUPRIYANTO, SH', '19611123 198803 1 001'),
(214, 'SURYA NARENDRA,SH', '198906132015031004'),
(215, 'SUTARKO, SH', '19610917 199103 1 001'),
(216, 'SUTRISNO, A.Md. S.Sos.', '19580707 198203 1 001'),
(217, 'SUTRISNO, SH', '19650726 198703 1 001'),
(218, 'SYAHRIZAL LUBIS, SH', '19690813 200112 1 001'),
(219, 'SYAHRUL AZHAR', '196308201983031001'),
(220, 'SYAMSUDIN HARAHAP, SH', '19580531 198503 1 001'),
(221, 'TATI RAINI, S.SOS', '19620617 198011 2 001'),
(222, 'TESSA LEO MARLINO, SH.', '19810725 200604 2 001'),
(223, 'TIARA JASMIN NABILA', '19860518 201012 2 006'),
(224, 'TIARMA ROSA SINAGA, S.H., M.H.', '19700521 200501 2 001'),
(225, 'TITUT SULISTIYANINGSIH, SE.M.Si', '19750829 199903 2 001'),
(226, 'TOMPATAR HASIANTO, SE', '19730630 200312 1 001'),
(227, 'TRI ANDAYANI, SE., MM', '19790109 200312 2 001'),
(228, 'TRI DARMA MANULANG, SH.', '19861029 200912 2 003'),
(229, 'TRI SAYEKTI NINGSIH, SH.', '19780223 200112 2 001'),
(230, 'UNTUNG SUNARDI', '19591025 198203 1 001'),
(231, 'VERAWATI, SE', '19760202 200112 2 001'),
(232, 'VITO ADRIANO WISMAR, SH', '19820918 200801 1 002'),
(233, 'WAHYU SETIAWAN, S. Kom', '19790717 200112 001'),
(234, 'WAHYU IRAWANA PERMADI', NULL),
(235, 'WAHYU RAMANDA, SE', '19801118 201012 1 003'),
(236, 'WAHYUDI', '19771225 200604 1 001'),
(237, 'WIDYA PURNAMASARI, SH, MH.', '19710210 200112 2 001'),
(238, 'WINDA YUNIKA', '19910624 201503 2 004'),
(239, 'YAYAH MARIANI, SH.MH', '19640311 199403 2 001'),
(240, 'YERI ADI SULISTIAWAN, SH', '19850121 200312 1 001'),
(241, 'YON SUMITRO, SH', '19720101 200003 1 001'),
(242, 'YUDHI HERVINO, ST', '19920708 201712 1 001'),
(243, 'YUSUP SUBHAN ABAS', '19790715 2000031001'),
(244, 'ZAIFACHATUR ROZIYAH, SH', '19791226 200501 2 001');

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
-- Table structure for table `rab_perjadin`
--

CREATE TABLE `rab_perjadin` (
  `id` int(11) NOT NULL,
  `surat_perintah_id` int(11) NOT NULL,
  `susunan_tim_perjadin_id` int(11) NOT NULL,
  `jumlah_hari` double NOT NULL,
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
(58, '2021-1', 'Kegiatan asdjlaksjd lakjsdlkasjd laksjdlaks dlaksjd alksdj alskdj', 200000000, 'SELESAI', 1, '2021-10-15', 2, 12, 1, 1, 1, '2021-10-08 12:29:16', '2021-10-10 00:55:46', '2021-10-09 12:54:57', '2021-10-09 12:55:46', NULL),
(59, '2021-2', 'Beli Bakso', 1000000, 'SELESAI', 3, '2021-10-09', 6, 18, 1, 3, 3, '2021-10-09 00:09:53', '2021-10-10 00:47:17', '2021-10-10 07:50:09', '2021-10-10 07:50:09', NULL),
(60, '2021-3', 'Rapat Evaluasi WBK WBBM', 1000000, 'SELESAI', 1, '2021-10-13', 3, 6, 1, 1, 1, '2021-10-12 20:14:21', '2021-10-12 20:17:05', '2021-10-12 20:15:46', '2021-10-12 20:17:05', NULL),
(61, '2021-4', 'beli baju', 2000000, 'SELESAI', 1, '2021-10-13', 2, 105, 1, 1, 1, '2021-10-12 21:12:56', '2021-10-12 21:15:32', '2021-10-12 21:14:26', '2021-10-12 21:15:32', NULL);

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
(52, 58, 'hehehe (1).pdf', 'realisasi/e6L8RJNX1zEWpixComawb1457ERNhEW6OK39nLQw.pdf', '2021-10-08 12:29:16', '2021-10-08 12:29:16'),
(53, 58, 'hehehe.pdf', 'realisasi/7HJPkoIkQNBC3WIFrYSRhPSRC7clILHchaWvx0eC.pdf', '2021-10-08 12:29:16', '2021-10-08 12:29:16'),
(54, 58, 'LAPORAN CABANG KADUNGORA (3).pdf', 'realisasi/LF0vmgCfc5QnIDWVuQnr3mHFk12QMBjbtFvLXnFl.pdf', '2021-10-08 12:29:16', '2021-10-08 12:29:16'),
(55, 58, 'LAPORAN CABANG KADUNGORA (2).pdf', 'realisasi/j8zxV7Gl99C6a6p9QlUMsZOMfadCeH58sprHxPkz.pdf', '2021-10-08 12:29:16', '2021-10-08 12:29:16'),
(56, 59, 'hehehe (1).pdf', 'realisasi/87mJIRGZFuo66ID6S5P3jyexabI1LyCDMWA2G6il.pdf', '2021-10-09 00:09:53', '2021-10-09 00:09:53'),
(57, 59, 'hehehe.pdf', 'realisasi/uSzfRCwj4ktzfOcMG4ssPk9eMFzyOq2sp5T3li0Z.pdf', '2021-10-09 00:09:53', '2021-10-09 00:09:53'),
(58, 59, 'LAPORAN CABANG KADUNGORA (3).pdf', 'realisasi/uWVghwnJwfpYk6eEqhwZhah0GklBhLu6x07L1kbd.pdf', '2021-10-09 00:09:53', '2021-10-09 00:09:53'),
(59, 60, 'Jadwal Gemar Oktober.pdf', 'realisasi/jd07YooHTY8aPITzW9BObjxS74dVhpwVKlHgBwxq.pdf', '2021-10-12 20:14:21', '2021-10-12 20:14:21'),
(60, 60, 'Lomba esport.pdf', 'realisasi/U6zlC4oZ2TFNCWUGs0Te071mGHtQAq8pDs541wgJ.pdf', '2021-10-12 20:14:21', '2021-10-12 20:14:21'),
(61, 60, 'Jadwal Gemar Oktober.pdf', 'realisasi/XEAUGwprgynrx9TMbm6dn710CSicazqOb5ob15X3.pdf', '2021-10-12 20:14:21', '2021-10-12 20:14:21'),
(62, 60, 'Lomba esport.pdf', 'realisasi/ROweoclQ1mQk1lpPHni6x8uZ5RCUWeeFwHiYO2GV.pdf', '2021-10-12 20:14:21', '2021-10-12 20:14:21'),
(63, 60, 'Ktp.pdf', 'realisasi/bxhU526ABUehTPhg1yLJXuYkUzCMI9OxtshjCFIa.pdf', '2021-10-12 20:14:21', '2021-10-12 20:14:21'),
(64, 60, 'Kalender Layanan bulan Oktober 2021 Eselon I.pdf', 'realisasi/CmyboKcSdGir22ug8b7doraZFUX9qq6ki5V2VkFs.pdf', '2021-10-12 20:14:21', '2021-10-12 20:14:21'),
(65, 61, 'Jadwal Gemar Oktober.pdf', 'realisasi/TgNVDfrR7bIU1hNYDVmwjFrz4i4ABihLbUSONvan.pdf', '2021-10-12 21:12:57', '2021-10-12 21:12:57'),
(66, 61, 'Lomba esport.pdf', 'realisasi/UFJG8be9oJZnILT04qp2P1S0dDj5tV0I4djj7KVB.pdf', '2021-10-12 21:12:57', '2021-10-12 21:12:57');

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
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `susunan_tim_perjadin`
--

CREATE TABLE `susunan_tim_perjadin` (
  `id` int(11) NOT NULL,
  `surat_perintah_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `peran_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `role` enum('ADMIN','PPK','USER','VERIFIKATOR','BENDAHARA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ability` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `bidang_id`, `pegawai_id`, `nama`, `role`, `ability`, `created_at`, `updated_at`) VALUES
(1, 'lucky', '123456', 1, 166, 'LUCKY', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(2, 'joko', '123456', 3, 167, 'JOKO', 'PPK', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(3, 'dio', '123456', 3, 166, 'DIO', 'USER', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL),
(4, 'ema', '123456', 1, 168, 'EMA', 'BENDAHARA', '[{\"action\" : \"manage\", \"subject\" : \"all\"}]', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang`
--
ALTER TABLE `bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasil_lampiran`
--
ALTER TABLE `hasil_lampiran`
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
-- Indexes for table `obrik`
--
ALTER TABLE `obrik`
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
-- Indexes for table `rab_perjadin`
--
ALTER TABLE `rab_perjadin`
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
-- Indexes for table `susunan_tim_perjadin`
--
ALTER TABLE `susunan_tim_perjadin`
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
-- AUTO_INCREMENT for table `hasil_lampiran`
--
ALTER TABLE `hasil_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `obrik`
--
ALTER TABLE `obrik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peran`
--
ALTER TABLE `peran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rab_perjadin`
--
ALTER TABLE `rab_perjadin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `susunan_tim_perjadin`
--
ALTER TABLE `susunan_tim_perjadin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
