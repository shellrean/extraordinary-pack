-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2020 at 02:01 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `extraordinary-cbt`
--

-- --------------------------------------------------------

--
-- Table structure for table `agamas`
--

CREATE TABLE `agamas` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_banksoal` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_soal` int(11) NOT NULL COMMENT 'jumlah soal pilihan ganda',
  `jumlah_pilihan` int(11) NOT NULL DEFAULT '4' COMMENT 'jumlah pilihan / opsi pada pilihan ganda',
  `jumlah_soal_listening` int(11) NOT NULL DEFAULT '0' COMMENT 'jumlah soal listening',
  `jumlah_pilihan_listening` int(11) NOT NULL DEFAULT '4' COMMENT 'jumlah opsi listening',
  `jumlah_soal_esay` int(11) DEFAULT '0',
  `persen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matpel_id` bigint(20) UNSIGNED NOT NULL,
  `author` bigint(20) UNSIGNED NOT NULL,
  `directory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directories`
--

CREATE TABLE `directories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_ujians`
--

CREATE TABLE `event_ujians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `directory_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` bigint(20) UNSIGNED NOT NULL,
  `peserta_id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah_salah` int(11) NOT NULL DEFAULT '0',
  `jumlah_benar` int(11) NOT NULL DEFAULT '0',
  `jumlah_benar_listening` int(11) NOT NULL DEFAULT '0',
  `jumlah_salah_listening` int(11) NOT NULL DEFAULT '0',
  `point_esay` double(8,2) NOT NULL,
  `tidak_diisi` int(11) NOT NULL,
  `hasil` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `mulai` time NOT NULL,
  `lama` int(11) NOT NULL,
  `status_ujian` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `sesi` int(11) NOT NULL DEFAULT '1',
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_esays`
--

CREATE TABLE `jawaban_esays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` bigint(20) UNSIGNED NOT NULL,
  `peserta_id` bigint(20) UNSIGNED NOT NULL,
  `jawab_id` bigint(20) UNSIGNED NOT NULL,
  `corrected_by` bigint(20) UNSIGNED NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_pesertas`
--

CREATE TABLE `jawaban_pesertas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` bigint(20) UNSIGNED NOT NULL,
  `soal_id` bigint(20) UNSIGNED NOT NULL,
  `peserta_id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` bigint(20) UNSIGNED NOT NULL,
  `jawab` bigint(20) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `soal_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matpels`
--

CREATE TABLE `matpels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mapel` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama_id` int(11) DEFAULT '0',
  `correctors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
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
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `sesi` int(11) NOT NULL,
  `no_ujian` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama_id` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'set_sekolah', 'sekolah', '{\"logo\":\"\",\"nama_sekolah\":\"\",\"email\":\"\",\"alamat\":\"\",\"kepala_sekolah\":\"\",\"nip_kepsek\":\"\"}', '2020-07-30 02:00:57', '2020-07-30 02:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_ujians`
--

CREATE TABLE `siswa_ujians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `peserta_id` bigint(20) NOT NULL,
  `jadwal_id` bigint(20) NOT NULL,
  `mulai_ujian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded` int(11) NOT NULL DEFAULT '0',
  `sisa_waktu` int(11) NOT NULL,
  `status_ujian` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soals`
--

CREATE TABLE `soals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` bigint(20) UNSIGNED NOT NULL,
  `tipe_soal` int(11) NOT NULL COMMENT '1: Pilihan Ganda | 2: Esay | 3: Listening',
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ZYENG', '0', '2020-07-30 02:00:57', '2020-07-30 02:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `ujians`
--

CREATE TABLE `ujians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('aktif','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Administrator', 'admin@shellrean.com', NULL, '$2y$10$eroZvvEJavwGtK8Fxm7/1uJE2aNThTuHFia/mgxgIoV/RduN9l4k.', 'admin', '2020-07-30 02:00:57', '2020-07-30 02:00:57');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banksoals`
--
ALTER TABLE `banksoals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directories`
--
ALTER TABLE `directories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_ujians`
--
ALTER TABLE `event_ujians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_ujians`
--
ALTER TABLE `hasil_ujians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_esays`
--
ALTER TABLE `jawaban_esays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_pesertas`
--
ALTER TABLE `jawaban_pesertas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jawaban_soals`
--
ALTER TABLE `jawaban_soals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusans`
--
ALTER TABLE `jurusans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matpels`
--
ALTER TABLE `matpels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesertas`
--
ALTER TABLE `pesertas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa_ujians`
--
ALTER TABLE `siswa_ujians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soals`
--
ALTER TABLE `soals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ujians`
--
ALTER TABLE `ujians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
