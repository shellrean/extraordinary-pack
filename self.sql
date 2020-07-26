-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2020 at 03:08 PM
-- Server version: 8.0.20-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `self`
--

-- --------------------------------------------------------

--
-- Table structure for table `agamas`
--

CREATE TABLE `agamas` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agamas`
--

INSERT INTO `agamas` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Islam', NULL, NULL),
(2, 'Protestan', NULL, NULL),
(3, 'Katolik', NULL, NULL),
(4, 'Hindu', NULL, NULL),
(5, 'Budha', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banksoals`
--

CREATE TABLE `banksoals` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_banksoal` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_soal` int NOT NULL COMMENT 'jumlah soal pilihan ganda',
  `jumlah_pilihan` int NOT NULL COMMENT 'jumlah pilihan / opsi pada pilihan ganda',
  `jumlah_soal_esay` int DEFAULT '0',
  `matpel_id` bigint UNSIGNED NOT NULL,
  `author` bigint UNSIGNED NOT NULL,
  `directory_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directories`
--

CREATE TABLE `directories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directories`
--

INSERT INTO `directories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'TZX-2020-BBHS', 'tzx-2020-bbhs', '2020-07-21 07:37:41', '2020-07-21 07:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `event_ujians`
--

CREATE TABLE `event_ujians` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `directory_id` bigint UNSIGNED NOT NULL,
  `dirname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exstension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_ujians`
--

CREATE TABLE `hasil_ujians` (
  `id` bigint UNSIGNED NOT NULL,
  `banksoal_id` bigint UNSIGNED NOT NULL,
  `peserta_id` bigint UNSIGNED NOT NULL,
  `jadwal_id` bigint UNSIGNED NOT NULL,
  `jumlah_salah` int NOT NULL,
  `jumlah_benar` int NOT NULL,
  `point_esay` double(8,2) NOT NULL,
  `tidak_diisi` int NOT NULL,
  `hasil` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint UNSIGNED NOT NULL,
  `banksoal_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `mulai` time NOT NULL,
  `lama` int NOT NULL,
  `status_ujian` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `sesi` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_esays`
--

CREATE TABLE `jawaban_esays` (
  `id` bigint UNSIGNED NOT NULL,
  `banksoal_id` bigint UNSIGNED NOT NULL,
  `peserta_id` bigint UNSIGNED NOT NULL,
  `jawab_id` bigint UNSIGNED NOT NULL,
  `corrected_by` bigint UNSIGNED NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_pesertas`
--

CREATE TABLE `jawaban_pesertas` (
  `id` bigint UNSIGNED NOT NULL,
  `banksoal_id` bigint UNSIGNED NOT NULL,
  `soal_id` bigint UNSIGNED NOT NULL,
  `peserta_id` bigint UNSIGNED NOT NULL,
  `jadwal_id` bigint UNSIGNED NOT NULL,
  `jawab` bigint NOT NULL,
  `esay` longtext COLLATE utf8mb4_unicode_ci,
  `ragu_ragu` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `iscorrect` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_soals`
--

CREATE TABLE `jawaban_soals` (
  `id` bigint UNSIGNED NOT NULL,
  `soal_id` bigint UNSIGNED NOT NULL,
  `text_jawaban` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusans`
--

CREATE TABLE `jurusans` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matpels`
--

CREATE TABLE `matpels` (
  `id` bigint UNSIGNED NOT NULL,
  `kode_mapel` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama_id` int DEFAULT '0',
  `correctors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matpels`
--

INSERT INTO `matpels` (`id`, `kode_mapel`, `jurusan_id`, `agama_id`, `correctors`, `nama`, `created_at`, `updated_at`) VALUES
(2, '41-LOD-U', '0', 1, '[1]', 'Pendidikan Agama dan Budi Pekerti', '2020-07-21 17:16:46', '2020-07-21 17:16:46'),
(3, '36-LOD-U', '0', 0, '[1]', 'Pendidikan Pancasila dan Kewarganegaraan', '2020-07-21 17:16:46', '2020-07-21 17:16:46'),
(4, '37-LOD-U', '0', 0, '[1]', 'Bahasa Indonesia', '2020-07-21 17:16:46', '2020-07-21 17:16:46'),
(5, '38-LOD-U', '0', 0, '[1]', 'Matematika', '2020-07-21 17:16:46', '2020-07-21 17:16:46'),
(6, '39-LOD-U', '0', 0, '[1]', 'Sejarah Indonesia', '2020-07-21 17:16:46', '2020-07-21 17:16:46'),
(7, '40-LOD-U', '0', 0, '[1]', 'Bahasa Inggris', '2020-07-21 17:16:46', '2020-07-21 17:16:46'),
(8, '42-LOD-U', '0', 0, '[1]', 'Seni Budaya', '2020-07-21 17:16:46', '2020-07-21 17:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_07_10_011018_create_jurusans_table', 1),
(9, '2020_07_10_011145_create_matpels_table', 1),
(10, '2020_07_10_011228_create_event_ujians_table', 1),
(11, '2020_07_10_011304_create_pesertas_table', 1),
(12, '2020_07_10_011355_create_directories_table', 1),
(13, '2020_07_10_011431_create_banksoals_table', 1),
(14, '2020_07_10_011535_create_files_table', 1),
(15, '2020_07_10_011609_create_jadwals_table', 1),
(16, '2020_07_10_011707_create_hasil_ujians_table', 1),
(17, '2020_07_10_011745_create_soals_table', 1),
(18, '2020_07_10_011826_create_jawaban_soals_table', 1),
(19, '2020_07_10_011852_create_jawaban_pesertas_table', 1),
(20, '2020_07_10_011939_create_jawaban_esays_table', 1),
(21, '2020_07_10_012014_create_agamas_table', 1),
(22, '2020_07_10_012151_create_settings_table', 1),
(23, '2020_07_11_112718_create_siswa_ujians_table', 1),
(24, '2020_07_15_120620_create_ujians_table', 1),
(25, '2020_07_15_145941_create_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0e36877548ce3d3c16a7256fb45af4015dd85993fc27c4174e6e93aae6d068303480c1b32494cf40', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-21 06:14:16', '2020-07-21 06:14:16', '2021-07-21 13:14:16'),
('10a4784985d49022adf9c16c1cf4d2abb8689b26784720cb200fd2fbffe00b2b9895efdb568e36e4', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-21 04:03:25', '2020-07-21 04:03:25', '2021-07-21 11:03:25'),
('4bc5274a24f6318053e95a07f7815a5f1d80405ca9e004f3c80c4980112ea70bfc7f44fc1d103cc2', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-21 17:15:58', '2020-07-21 17:15:58', '2021-07-22 00:15:58'),
('6e2a40726113ebf086ffc5260bc2a9dd9464808fd14f3504f0df8f76db0dcba97611e719645efdef', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-23 23:28:36', '2020-07-23 23:28:36', '2021-07-24 06:28:36'),
('7ac9d011cf226242ad519e0526e0ce66cc52710c953b979c06d1c41828dd9bae1a83cf38042f55fc', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-21 06:19:28', '2020-07-21 06:19:28', '2021-07-21 13:19:28'),
('7b8abed5a61b3b12a27e6d85e380b4db4b3e61dbfda5b82572637f6eec8442b718497adb545ef399', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-23 23:31:20', '2020-07-23 23:31:20', '2021-07-24 06:31:20'),
('ae3b386dc9dae4270934a5204d34a304066edeefac5c08f06b24d1d53478adb54e759b87e352d06f', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-24 01:07:04', '2020-07-24 01:07:04', '2021-07-24 08:07:04'),
('affde366d41f98e20b1b54764a86bb495f9103397956b5b9dc1d6a757ff076000e22f12a52588533', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-21 06:03:55', '2020-07-21 06:03:55', '2021-07-21 13:03:55'),
('f84db579d6652836a6753e9a0eed7f547595b334af52023df4293f21188f8e2ec4d6f6f37cf874a4', 1, 1, 'Personal Access Token', '[]', 0, '2020-07-23 05:19:07', '2020-07-23 05:19:07', '2021-07-23 12:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'KJQtl2047pH8Q4yUob4iDqHHSYGAHjtNwPVOtwmX', NULL, 'http://localhost', 1, 0, 0, '2020-07-21 02:58:45', '2020-07-21 02:58:45'),
(2, NULL, 'Laravel Password Grant Client', '3rfCJD8KhGcT6nFAbTixBhuNlKTqKGCPZ08ZdVL7', 'users', 'http://localhost', 0, 1, 0, '2020-07-21 02:58:45', '2020-07-21 02:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-07-21 02:58:45', '2020-07-21 02:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesertas`
--

CREATE TABLE `pesertas` (
  `id` bigint UNSIGNED NOT NULL,
  `sesi` int NOT NULL,
  `no_ujian` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama_id` int NOT NULL,
  `jurusan_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'set_sekolah', 'sekolah', '{\"logo\":\"23_07_2020_050409-user.png\",\"nama_sekolah\":\"\",\"email\":\"\",\"alamat\":\"\",\"kepala_sekolah\":\"\",\"nip_kepsek\":\"\"}', '2020-07-21 02:58:34', '2020-07-22 22:04:09'),
(2, 'airlock', 'auth', '{\"isactive\":true,\"client_id\":\"1\",\"client_secret\":\"ouK39d64wkqXD0zQy6O6XgiurIVWHLMP3gFWuXwD\",\"server_url\":\"http:\\/\\/localhost:82\\/oauth\\/authorize\",\"token_url\":\"http:\\/\\/localhost:82\\/oauth\\/token\",\"user_url\":\"http:\\/\\/localhost:82\\/api\\/user\",\"consumer_url\":\"http:\\/\\/localhost:8080\\/oauth\"}', '2020-07-21 06:08:04', '2020-07-21 18:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_ujians`
--

CREATE TABLE `siswa_ujians` (
  `id` bigint UNSIGNED NOT NULL,
  `peserta_id` bigint NOT NULL,
  `jadwal_id` bigint NOT NULL,
  `mulai_ujian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded` int NOT NULL DEFAULT '0',
  `sisa_waktu` int NOT NULL,
  `status_ujian` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soals`
--

CREATE TABLE `soals` (
  `id` bigint UNSIGNED NOT NULL,
  `banksoal_id` bigint UNSIGNED NOT NULL,
  `tipe_soal` int NOT NULL,
  `pertanyaan` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rujukan` longtext COLLATE utf8mb4_unicode_ci,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analys` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KHBLU9', '0', '2020-07-21 18:52:22', '2020-07-23 23:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `ujians`
--

CREATE TABLE `ujians` (
  `id` bigint UNSIGNED NOT NULL,
  `jadwal_id` bigint UNSIGNED NOT NULL,
  `status` enum('aktif','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','guru') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guru',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@admin.com', NULL, '$2y$10$xd9sH4/giLxQ1aSB1M5L3ORGXjWHPzwlEhAIryPVPp180dOQVcPjq', 'admin', '2020-07-21 02:58:33', '2020-07-21 02:58:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agamas`
--
ALTER TABLE `agamas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banksoals`
--
ALTER TABLE `banksoals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banksoals_matpel_id_foreign` (`matpel_id`),
  ADD KEY `banksoals_author_foreign` (`author`),
  ADD KEY `banksoals_directory_id_foreign` (`directory_id`);

--
-- Indexes for table `directories`
--
ALTER TABLE `directories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_ujians`
--
ALTER TABLE `event_ujians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasil_ujians`
--
ALTER TABLE `hasil_ujians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hasil_ujians_peserta_id_foreign` (`peserta_id`),
  ADD KEY `hasil_ujians_banksoal_id_foreign` (`banksoal_id`),
  ADD KEY `hasil_ujians_jadwal_id_foreign` (`jadwal_id`);

--
-- Indexes for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawaban_esays`
--
ALTER TABLE `jawaban_esays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jawaban_esays_banksoal_id_foreign` (`banksoal_id`),
  ADD KEY `jawaban_esays_peserta_id_foreign` (`peserta_id`),
  ADD KEY `jawaban_esays_jawab_id_foreign` (`jawab_id`),
  ADD KEY `jawaban_esays_corrected_by_foreign` (`corrected_by`);

--
-- Indexes for table `jawaban_pesertas`
--
ALTER TABLE `jawaban_pesertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jawaban_pesertas_banksoal_id_foreign` (`banksoal_id`),
  ADD KEY `jawaban_pesertas_soal_id_foreign` (`soal_id`),
  ADD KEY `jawaban_pesertas_peserta_id_foreign` (`peserta_id`),
  ADD KEY `jawaban_pesertas_jadwal_id_foreign` (`jadwal_id`);

--
-- Indexes for table `jawaban_soals`
--
ALTER TABLE `jawaban_soals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jawaban_soals_soal_id_foreign` (`soal_id`);

--
-- Indexes for table `jurusans`
--
ALTER TABLE `jurusans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matpels`
--
ALTER TABLE `matpels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesertas`
--
ALTER TABLE `pesertas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pesertas_no_ujian_unique` (`no_ujian`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa_ujians`
--
ALTER TABLE `siswa_ujians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soals`
--
ALTER TABLE `soals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `soals_banksoal_id_foreign` (`banksoal_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujians`
--
ALTER TABLE `ujians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agamas`
--
ALTER TABLE `agamas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banksoals`
--
ALTER TABLE `banksoals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `directories`
--
ALTER TABLE `directories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_ujians`
--
ALTER TABLE `event_ujians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_ujians`
--
ALTER TABLE `hasil_ujians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_esays`
--
ALTER TABLE `jawaban_esays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_pesertas`
--
ALTER TABLE `jawaban_pesertas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_soals`
--
ALTER TABLE `jawaban_soals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `jurusans`
--
ALTER TABLE `jurusans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matpels`
--
ALTER TABLE `matpels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pesertas`
--
ALTER TABLE `pesertas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `siswa_ujians`
--
ALTER TABLE `siswa_ujians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soals`
--
ALTER TABLE `soals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ujians`
--
ALTER TABLE `ujians`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banksoals`
--
ALTER TABLE `banksoals`
  ADD CONSTRAINT `banksoals_author_foreign` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banksoals_directory_id_foreign` FOREIGN KEY (`directory_id`) REFERENCES `directories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banksoals_matpel_id_foreign` FOREIGN KEY (`matpel_id`) REFERENCES `matpels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hasil_ujians`
--
ALTER TABLE `hasil_ujians`
  ADD CONSTRAINT `hasil_ujians_banksoal_id_foreign` FOREIGN KEY (`banksoal_id`) REFERENCES `banksoals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_ujians_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hasil_ujians_peserta_id_foreign` FOREIGN KEY (`peserta_id`) REFERENCES `pesertas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_esays`
--
ALTER TABLE `jawaban_esays`
  ADD CONSTRAINT `jawaban_esays_banksoal_id_foreign` FOREIGN KEY (`banksoal_id`) REFERENCES `banksoals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_esays_corrected_by_foreign` FOREIGN KEY (`corrected_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_esays_jawab_id_foreign` FOREIGN KEY (`jawab_id`) REFERENCES `jawaban_pesertas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_esays_peserta_id_foreign` FOREIGN KEY (`peserta_id`) REFERENCES `pesertas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_pesertas`
--
ALTER TABLE `jawaban_pesertas`
  ADD CONSTRAINT `jawaban_pesertas_banksoal_id_foreign` FOREIGN KEY (`banksoal_id`) REFERENCES `banksoals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_pesertas_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_pesertas_peserta_id_foreign` FOREIGN KEY (`peserta_id`) REFERENCES `pesertas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jawaban_pesertas_soal_id_foreign` FOREIGN KEY (`soal_id`) REFERENCES `soals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_soals`
--
ALTER TABLE `jawaban_soals`
  ADD CONSTRAINT `jawaban_soals_soal_id_foreign` FOREIGN KEY (`soal_id`) REFERENCES `soals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `soals`
--
ALTER TABLE `soals`
  ADD CONSTRAINT `soals_banksoal_id_foreign` FOREIGN KEY (`banksoal_id`) REFERENCES `banksoals` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
