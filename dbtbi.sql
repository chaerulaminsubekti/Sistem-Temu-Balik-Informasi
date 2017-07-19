-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2017 pada 07.55
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `dbtbi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbberita`
--

CREATE TABLE IF NOT EXISTS `tbberita` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Judul` varchar(100) NOT NULL,
  `Berita` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1324 ;

--
-- Dumping data untuk tabel `tbberita`
--

INSERT INTO `tbberita` (`Id`, `Judul`, `Berita`) VALUES
(1176, 'Dian Restiani &#8211; Pertemuan 8 &#8211; Konsep Thesaurus dalam Information Retrival dan Mengenal M', '<h1 style="text-align: center;"><strong>Konsep Thesaurus dalam Information Retrival dan Mengenal Macam Thesaurus Beserta Algoritma</strong></h1>\n<ul>\n<li>\n<h3><u><strong>Pengertian Thesaurus</strong>.</u></h3>\n</li>\n</ul>\n<p>Berasal dari bahasa Yunani yai'),
(1271, 'Niâ€™am Habibiy Sahid: Thesaurus dalam Temu Balik Informasi', '<p><strong>Pengertian Thesaurus</strong></p>\n<p>Tesaurus merupakan referensi yang menyediakan data untuk mencari kesamaan/ sinonim dan perbedaan/antonim kata. Pada proses <em>Information Retrieval </em>(IR)/temu kembali informasi, tesaurus merupakan salah'),
(1244, 'Joko Prayogi: Konsep Thesaurus dalam Temu Balik informasi Beserta Macam-Macam Thesaurus dan Algoritm', '<p><strong>1. Thesaurus</strong></p>\n<p align="justify"><strong>Thesaurus </strong>berasal dari bahasa Yunani dan Latin yang berarti â€œsebuah himpunan yang berhargaâ€ atau lebih spesifik lagi &#8220;sebuah kekayaan&#8221; (treasury). Selama berabad-abad'),
(1266, 'DWI NGAFIFUDIN &#8211; PENGERTIAN, KONSEP, MACAM-MACAM DAN ALGORITMA TESAURUS', '<p style="text-align: justify;"><strong>Pengertian</strong></p>\n<p style="text-align: justify;">Â Â Â Â Â Â Â  Tesaurus adalah sarana untuk menggambarkan subyek dengan cara dokumen-independen. Ini juga merupakan bentuk yang berguna dari representasi penge'),
(1278, 'KONSEP THESAURUS DALAM INFORMATION RETRIEVAL DAN MENGENAL MACAM-MACAM THESAURUS BESERTA ALGORITMA', '<p><b>Pengertian Thesaurus</b></p>\n<ol>\n<li>Berasal dari bahasa Yunani yaitu â€œ Thesauros yang artinya kekayaan, harta ataupun gudang tempat menyimpan harta benda atau kekayaanâ€. (Sri Rohyanti Z.: 2002: 1)</li>\n<li>Menurut Hornby dikutip Sri Rohyanti Z'),
(1316, 'Faisal Ajang Sidik : Thesaurus', '<h3 style="text-align: center;"><strong>Thesaurus Pada Temu Balik Informasi</strong></h3>\n<p>&nbsp;</p>\n<h4>Pengertian Thesaurus</h4>\n<p>Berasal dari bahasa Yunani yaitu â€œ Thesauros yang artinya kekayaan, harta ataupun gudang tempat menyimpan harta bend'),
(1305, 'Desi Rahmawati &#8211; Thesaurus', '<p style="text-align: center;"><strong>TUGAS</strong></p>\n<p style="text-align: center;"><strong>Temu Balik Informasi</strong></p>\n<p style="text-align: center;"><strong>Thesaurus</strong></p>\n<p style="text-align: center;"><strong>Â </strong></p>\n<table '),
(1287, 'Nur Rahmat Dwi Riyanto &#8211; Tesaurus', '<h1 style="text-align: center;"><strong>Tesaurus</strong></h1>\n<p style="text-align: justify;">Kata tesaurus berasal dari kata thesauros, bahasa Yunani, yang bermakna â€˜khazanahâ€™.Lambat laun, kata tersebut mengalami perkembangan makna, yakni â€˜buku ya'),
(1321, 'ANJAS EKO P â€“ KONSEP THESOURUS DALAM INFORMATION DAN RETRIVAL SERTA MACAM-MACAM THESOURUS DAN ALGO', '<h3 style="text-align: center;"><strong>Tugas 6 TBI</strong></h3>\n<p>&nbsp;</p>\n<p><strong>Nama Kelompok :</strong></p>\n<p>Yogi Arif Gunawan S (14.11.0148)<br />\nM. Bintang Ariviano (14.11.0151)<br />\nKabul Agus P (14.11.0152)<br />\nLendy Wilyan P (14.11.'),
(1323, 'KEVIN &#8211; TUGAS 6 TBI &#8211; THESAURUS PADA TBI', '<p style="text-align: center;"><strong>&#8220;THESAURUS PADA TBI&#8221;</strong></p>\n<p><strong>KELOMPOK :</strong></p>\n<ol>\n<li>KEVIN SETIAWAN Â  Â Â  (14.11.0221)</li>\n<li>AHMAD ZAINURÂ  Â  Â Â  Â  (14.11.0254)</li>\n<li>BAHRUL AMIQÂ  Â  Â  Â  Â  Â  (14.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbcache`
--

CREATE TABLE IF NOT EXISTS `tbcache` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Query` varchar(100) NOT NULL,
  `DocId` int(11) NOT NULL,
  `Value` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `tbcache`
--

INSERT INTO `tbcache` (`Id`, `Query`, `DocId`, `Value`) VALUES
(1, 'thesaurus', 1176, 0.330903),
(2, 'thesaurus', 1323, 0.075105),
(3, 'thesaurus', 1176, 0.330903),
(4, 'thesaurus', 1323, 0.075105);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbindex`
--

CREATE TABLE IF NOT EXISTS `tbindex` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Term` varchar(30) NOT NULL,
  `DocId` int(11) NOT NULL,
  `Count` int(11) NOT NULL,
  `Bobot` float NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=250 ;

--
-- Dumping data untuk tabel `tbindex`
--

INSERT INTO `tbindex` (`Id`, `Term`, `DocId`, `Count`, `Bobot`) VALUES
(1, '<h1', 1176, 1, 1.60944),
(2, 'style', 1176, 1, 0.356675),
(3, 'text', 1176, 1, 0.356675),
(4, 'align', 1176, 1, 0.223144),
(5, 'center', 1176, 1, 0.510826),
(6, '><strong>konsep', 1176, 1, 2.30259),
(7, 'thesaurus', 1176, 2, 3.21888),
(8, 'dalam', 1176, 1, 2.30259),
(9, 'information', 1176, 1, 2.30259),
(10, 'retrival', 1176, 1, 2.30259),
(11, 'mengenal', 1176, 1, 2.30259),
(12, 'macam', 1176, 1, 2.30259),
(13, 'beserta', 1176, 1, 2.30259),
(14, 'algoritma<', 1176, 1, 2.30259),
(15, 'strong><', 1176, 1, 0.105361),
(16, 'h1>\n<ul>\n<li>\n<h3><u><strong>p', 1176, 1, 2.30259),
(17, 'thesaurus<', 1176, 1, 0.693147),
(18, 'strong>', 1176, 1, 2.30259),
(19, '<', 1176, 1, 0.356675),
(20, 'u><', 1176, 1, 2.30259),
(21, 'h3>\n<', 1176, 1, 2.30259),
(22, 'li>\n<', 1176, 1, 2.30259),
(23, 'ul>\n<p>berasal', 1176, 1, 2.30259),
(24, 'bahasa', 1176, 1, 0.693147),
(25, 'yunani', 1176, 1, 0.693147),
(26, 'yai', 1176, 1, 2.30259),
(27, '<p><strong>1', 1244, 1, 2.30259),
(28, 'thesaurus<', 1244, 1, 0.693147),
(29, 'strong><', 1244, 1, 0.105361),
(30, 'p>\n<p', 1244, 1, 1.20397),
(31, 'align', 1244, 1, 0.223144),
(32, 'justify', 1244, 1, 1.20397),
(33, '><strong>thesaurus', 1244, 1, 1.60944),
(34, '<', 1244, 1, 0.356675),
(35, 'strong>berasal', 1244, 1, 2.30259),
(36, 'bahasa', 1244, 1, 0.693147),
(37, 'yunani', 1244, 1, 0.693147),
(38, 'latin', 1244, 1, 2.30259),
(39, 'berarti', 1244, 1, 2.30259),
(40, 'â€œsebuah', 1244, 1, 2.30259),
(41, 'himpunan', 1244, 1, 2.30259),
(42, 'berhargaâ€', 1244, 1, 2.30259),
(43, 'lebih', 1244, 1, 2.30259),
(44, 'spesifik', 1244, 1, 2.30259),
(45, 'lagi', 1244, 1, 2.30259),
(46, '&#8220', 1244, 1, 2.30259),
(47, 'sebuah', 1244, 1, 2.30259),
(48, 'kayaan&#8221', 1244, 1, 2.30259),
(49, 'treasury', 1244, 1, 2.30259),
(50, 'selama', 1244, 1, 2.30259),
(51, 'berabad', 1244, 1, 2.30259),
(52, 'abad', 1244, 1, 2.30259),
(53, '<p', 1266, 1, 1.20397),
(54, 'style', 1266, 2, 0.71335),
(55, 'text', 1266, 2, 0.71335),
(56, 'align', 1266, 2, 0.446287),
(57, 'justify', 1266, 2, 2.40795),
(58, '><strong>pengertian<', 1266, 1, 2.30259),
(59, 'strong><', 1266, 1, 0.105361),
(60, 'p>\n<p', 1266, 1, 1.20397),
(61, '>Â Â Â Â Â Â Â ', 1266, 1, 2.30259),
(62, 'tesaurus', 1266, 1, 1.20397),
(63, 'sarana', 1266, 1, 2.30259),
(64, 'untuk', 1266, 1, 1.60944),
(65, 'menggambarkan', 1266, 1, 2.30259),
(66, 'subyek', 1266, 1, 2.30259),
(67, 'cara', 1266, 1, 2.30259),
(68, 'dokumen', 1266, 1, 2.30259),
(69, 'independen', 1266, 1, 2.30259),
(70, 'merupakan', 1266, 1, 1.60944),
(71, 'bentuk', 1266, 1, 2.30259),
(72, 'berguna', 1266, 1, 2.30259),
(73, 'representasi', 1266, 1, 2.30259),
(74, 'penge', 1266, 1, 2.30259),
(75, '<p><strong>pengertian', 1271, 1, 2.30259),
(76, 'thesaurus<', 1271, 1, 0.693147),
(77, 'strong><', 1271, 1, 0.105361),
(78, 'p>\n<p>tesaurus', 1271, 1, 2.30259),
(79, 'merupakan', 1271, 2, 3.21888),
(80, 'referensi', 1271, 1, 2.30259),
(81, 'menyekan', 1271, 1, 2.30259),
(82, 'data', 1271, 1, 2.30259),
(83, 'untuk', 1271, 1, 1.60944),
(84, 'mencari', 1271, 1, 2.30259),
(85, 'samaan', 1271, 1, 2.30259),
(86, 'sinonim', 1271, 1, 2.30259),
(87, 'perbedaan', 1271, 1, 2.30259),
(88, 'antonim', 1271, 1, 2.30259),
(89, 'kata', 1271, 1, 1.60944),
(90, 'proses', 1271, 1, 2.30259),
(91, '<em>information', 1271, 1, 2.30259),
(92, 'retrieval', 1271, 1, 2.30259),
(93, '<', 1271, 1, 0.356675),
(94, 'em>', 1271, 1, 2.30259),
(95, 'ir', 1271, 1, 2.30259),
(96, 'temu', 1271, 1, 1.60944),
(97, 'mbali', 1271, 1, 2.30259),
(98, 'informasi', 1271, 1, 2.30259),
(99, 'tesaurus', 1271, 1, 1.20397),
(100, 'salah', 1271, 1, 2.30259),
(101, '<p><b>pengertian', 1278, 1, 2.30259),
(102, 'thesaurus<', 1278, 1, 0.693147),
(103, 'b><', 1278, 1, 2.30259),
(104, 'p>\n<ol>\n<li>berasal', 1278, 1, 2.30259),
(105, 'bahasa', 1278, 1, 0.693147),
(106, 'yunani', 1278, 1, 0.693147),
(107, 'ya', 1278, 1, 1.20397),
(108, 'â€œ', 1278, 1, 1.60944),
(109, 'thesauros', 1278, 1, 1.20397),
(110, 'artinya', 1278, 1, 1.60944),
(111, 'kayaan', 1278, 1, 1.60944),
(112, 'harta', 1278, 2, 3.21888),
(113, 'pun', 1278, 1, 1.60944),
(114, 'gug', 1278, 1, 1.60944),
(115, 'tempat', 1278, 1, 1.60944),
(116, 'menyimpan', 1278, 1, 1.60944),
(117, 'benda', 1278, 1, 2.30259),
(118, 'kayaanâ€', 1278, 1, 2.30259),
(119, 'sri', 1278, 2, 4.60517),
(120, 'rohyanti', 1278, 2, 4.60517),
(121, 'z', 1278, 2, 4.60517),
(122, '2002', 1278, 1, 2.30259),
(123, '1', 1278, 1, 2.30259),
(124, '<', 1278, 1, 0.356675),
(125, 'li>\n<li>menurut', 1278, 1, 2.30259),
(126, 'hornby', 1278, 1, 2.30259),
(127, 'dikutip', 1278, 1, 2.30259),
(128, '<h1', 1287, 1, 1.60944),
(129, 'style', 1287, 2, 0.71335),
(130, 'text', 1287, 2, 0.71335),
(131, 'align', 1287, 2, 0.446287),
(132, 'center', 1287, 1, 0.510826),
(133, '><strong>tesaurus<', 1287, 1, 2.30259),
(134, 'strong><', 1287, 1, 0.105361),
(135, 'h1>\n<p', 1287, 1, 2.30259),
(136, 'justify', 1287, 1, 1.20397),
(137, '>kata', 1287, 1, 2.30259),
(138, 'tesaurus', 1287, 1, 1.20397),
(139, 'berasal', 1287, 1, 2.30259),
(140, 'kata', 1287, 2, 3.21888),
(141, 'thesauros', 1287, 1, 1.20397),
(142, 'bahasa', 1287, 1, 0.693147),
(143, 'yunani', 1287, 1, 0.693147),
(144, 'bermakna', 1287, 1, 2.30259),
(145, 'â€˜khazanahâ€™', 1287, 1, 2.30259),
(146, 'lambat', 1287, 1, 2.30259),
(147, 'laun', 1287, 1, 2.30259),
(148, 'mengalami', 1287, 1, 2.30259),
(149, 'permbangan', 1287, 1, 2.30259),
(150, 'makna', 1287, 1, 2.30259),
(151, 'yakni', 1287, 1, 2.30259),
(152, 'â€˜buku', 1287, 1, 2.30259),
(153, 'ya', 1287, 1, 1.20397),
(154, '<p', 1305, 1, 1.20397),
(155, 'style', 1305, 4, 1.4267),
(156, 'text', 1305, 4, 1.4267),
(157, 'align', 1305, 4, 0.892574),
(158, 'center', 1305, 4, 2.0433),
(159, '><strong>tugas<', 1305, 1, 2.30259),
(160, 'strong><', 1305, 4, 0.421442),
(161, 'p>\n<p', 1305, 3, 3.61192),
(162, '><strong>temu', 1305, 1, 2.30259),
(163, 'balik', 1305, 1, 1.60944),
(164, 'informasi<', 1305, 1, 1.60944),
(165, '><strong>thesaurus<', 1305, 1, 2.30259),
(166, '><strong>Â <', 1305, 1, 2.30259),
(167, 'p>\n<table', 1305, 1, 2.30259),
(168, '<h3', 1316, 1, 1.60944),
(169, 'style', 1316, 1, 0.356675),
(170, 'text', 1316, 1, 0.356675),
(171, 'align', 1316, 1, 0.223144),
(172, 'center', 1316, 1, 0.510826),
(173, '><strong>thesaurus', 1316, 1, 1.60944),
(174, 'temu', 1316, 1, 1.60944),
(175, 'balik', 1316, 1, 1.60944),
(176, 'informasi<', 1316, 1, 1.60944),
(177, 'strong><', 1316, 1, 0.105361),
(178, 'h3>\n<p>&nbsp', 1316, 1, 1.60944),
(179, '<', 1316, 1, 0.356675),
(180, 'p>\n<h4>pengertian', 1316, 1, 2.30259),
(181, 'thesaurus<', 1316, 1, 0.693147),
(182, 'h4>\n<p>berasal', 1316, 1, 2.30259),
(183, 'bahasa', 1316, 1, 0.693147),
(184, 'yunani', 1316, 1, 0.693147),
(185, 'ya', 1316, 1, 1.20397),
(186, 'â€œ', 1316, 1, 1.60944),
(187, 'thesauros', 1316, 1, 1.20397),
(188, 'artinya', 1316, 1, 1.60944),
(189, 'kayaan', 1316, 1, 1.60944),
(190, 'harta', 1316, 2, 3.21888),
(191, 'pun', 1316, 1, 1.60944),
(192, 'gug', 1316, 1, 1.60944),
(193, 'tempat', 1316, 1, 1.60944),
(194, 'menyimpan', 1316, 1, 1.60944),
(195, 'bend', 1316, 1, 2.30259),
(196, '<h3', 1321, 1, 1.60944),
(197, 'style', 1321, 1, 0.356675),
(198, 'text', 1321, 1, 0.356675),
(199, 'align', 1321, 1, 0.223144),
(200, 'center', 1321, 1, 0.510826),
(201, '><strong>tugas', 1321, 1, 2.30259),
(202, '6', 1321, 1, 2.30259),
(203, 'tbi<', 1321, 1, 2.30259),
(204, 'strong><', 1321, 2, 0.210721),
(205, 'h3>\n<p>&nbsp', 1321, 1, 1.60944),
(206, '<', 1321, 2, 0.71335),
(207, 'p>\n<p><strong>nama', 1321, 1, 2.30259),
(208, 'lompok', 1321, 1, 2.30259),
(209, 'p>\n<p>yogi', 1321, 1, 2.30259),
(210, 'arif', 1321, 1, 2.30259),
(211, 'gunawan', 1321, 1, 2.30259),
(212, 's', 1321, 1, 2.30259),
(213, '14', 1321, 4, 6.43775),
(214, '11', 1321, 4, 6.43775),
(215, '0148', 1321, 1, 2.30259),
(216, '<br', 1321, 3, 6.90776),
(217, '>\nm', 1321, 1, 2.30259),
(218, 'bintang', 1321, 1, 2.30259),
(219, 'ariviano', 1321, 1, 2.30259),
(220, '0151', 1321, 1, 2.30259),
(221, '>\nkabul', 1321, 1, 2.30259),
(222, 'agus', 1321, 1, 2.30259),
(223, 'p', 1321, 2, 4.60517),
(224, '0152', 1321, 1, 2.30259),
(225, '>\nlendy', 1321, 1, 2.30259),
(226, 'wilyan', 1321, 1, 2.30259),
(227, '<p', 1323, 1, 1.20397),
(228, 'style', 1323, 1, 0.356675),
(229, 'text', 1323, 1, 0.356675),
(230, 'align', 1323, 1, 0.223144),
(231, 'center', 1323, 1, 0.510826),
(232, '><strong>&#8220', 1323, 1, 2.30259),
(233, 'thesaurus', 1323, 1, 1.60944),
(234, 'tbi&#8221', 1323, 1, 2.30259),
(235, '<', 1323, 4, 1.4267),
(236, 'strong><', 1323, 2, 0.210721),
(237, 'p>\n<p><strong>lompok', 1323, 1, 2.30259),
(238, 'p>\n<ol>\n<li>vin', 1323, 1, 2.30259),
(239, 'setiawan', 1323, 1, 2.30259),
(240, 'Â ', 1323, 8, 18.4207),
(241, 'Â Â ', 1323, 2, 4.60517),
(242, '14', 1323, 3, 4.82831),
(243, '11', 1323, 2, 3.21888),
(244, '0221', 1323, 1, 2.30259),
(245, 'li>\n<li>ahmad', 1323, 1, 2.30259),
(246, 'zainurÂ ', 1323, 1, 2.30259),
(247, '0254', 1323, 1, 2.30259),
(248, 'li>\n<li>bahrul', 1323, 1, 2.30259),
(249, 'amiqÂ ', 1323, 1, 2.30259);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbstem`
--

CREATE TABLE IF NOT EXISTS `tbstem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Term` varchar(30) NOT NULL,
  `Stem` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbvektor`
--

CREATE TABLE IF NOT EXISTS `tbvektor` (
  `DocId` int(11) NOT NULL,
  `Panjang` float NOT NULL,
  PRIMARY KEY (`DocId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbvektor`
--

INSERT INTO `tbvektor` (`DocId`, `Panjang`) VALUES
(1176, 9.72755),
(1244, 9.86162),
(1266, 8.95425),
(1271, 10.7534),
(1278, 12.2312),
(1287, 9.49339),
(1305, 7.44352),
(1316, 8.06131),
(1321, 16.0888),
(1323, 21.4292);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
