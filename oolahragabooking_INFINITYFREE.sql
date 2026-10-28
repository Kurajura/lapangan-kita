-- Versi import ke database hosting yang sudah dibuat melalui control panel.
-- Pilih database if0_43277519_oolahragabooking_baru di phpMyAdmin, lalu Import.
-- Database target harus kosong. Tidak membuat, memilih, atau menghapus database.
-- Struktur dan data snapshot terbaru: 22 tabel.

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2026 at 09:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oolahragabooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_booking_hidden`
--

CREATE TABLE `admin_booking_hidden` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `hidden_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lapangan_id` int(11) NOT NULL,
  `nomor_lapangan` int(11) NOT NULL DEFAULT 1,
  `tanggal` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `vip_discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `vip_discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `platform_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `owner_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','paid','confirmed','cancelled') DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('unpaid','paid') DEFAULT 'unpaid',
  `payment_proof` varchar(255) DEFAULT NULL,
  `booking_code` varchar(20) DEFAULT NULL,
  `booking_source` enum('online','offline') NOT NULL DEFAULT 'online',
  `mode_main` enum('biasa','kompetitif','kursus') NOT NULL DEFAULT 'biasa',
  `match_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `match_type` enum('solo','team') NOT NULL DEFAULT 'solo',
  `match_status` enum('inactive','team_setup','team_ready','pending_opponent_team','pending_approval','approved','waiting_score','rejected','completed','cancelled') NOT NULL DEFAULT 'inactive',
  `match_requested_at` timestamp NULL DEFAULT NULL,
  `match_opponent_name` varchar(100) DEFAULT NULL,
  `match_rejected_reason` varchar(255) DEFAULT NULL,
  `requester_team_id` int(11) DEFAULT NULL,
  `opponent_team_id` int(11) DEFAULT NULL,
  `team_match_request_id` int(11) DEFAULT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `telepon_pelanggan` varchar(20) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `lapangan_id`, `nomor_lapangan`, `tanggal`, `jam_mulai`, `jam_selesai`, `total_harga`, `vip_discount_percent`, `vip_discount_amount`, `platform_fee`, `owner_amount`, `status`, `payment_method`, `payment_status`, `payment_proof`, `booking_code`, `booking_source`, `mode_main`, `match_enabled`, `match_type`, `match_status`, `match_requested_at`, `match_opponent_name`, `match_rejected_reason`, `requester_team_id`, `opponent_team_id`, `team_match_request_id`, `nama_pelanggan`, `telepon_pelanggan`, `catatan`, `created_at`) VALUES
(9, 8, 6, 1, '2026-06-03', '07:00:00', '08:00:00', 50000.00, 0.00, 0.00, 2500.00, 47500.00, 'confirmed', NULL, 'paid', NULL, 'BK202606024901', 'online', 'biasa', 0, 'solo', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02 21:16:49'),
(10, 10, 6, 1, '2026-06-03', '06:00:00', '07:00:00', 50000.00, 0.00, 0.00, 2500.00, 47500.00, 'confirmed', NULL, 'paid', NULL, 'BK202606029367', 'online', 'biasa', 0, 'solo', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-02 21:17:45'),
(11, 10, 5, 1, '2026-06-08', '06:00:00', '08:00:00', 80000.00, 0.00, 0.00, 4000.00, 76000.00, 'confirmed', NULL, 'paid', NULL, 'BK202606081046', 'online', 'kompetitif', 1, 'solo', 'completed', '2026-06-08 20:37:03', 'syakir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 06:29:11'),
(12, 8, 7, 1, '2026-06-10', '06:00:00', '08:00:00', 99999999.99, 0.00, 0.00, 4999999.00, 95000000.99, 'confirmed', NULL, 'paid', NULL, 'BK202606088891', 'online', 'biasa', 0, 'solo', 'inactive', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 21:19:20'),
(13, 11, 6, 1, '2026-06-08', '06:00:00', '08:00:00', 90000.00, 10.00, 10000.00, 4500.00, 85500.00, 'confirmed', NULL, 'paid', NULL, 'BK202606082907', 'online', 'kompetitif', 1, 'solo', 'waiting_score', '2026-06-08 21:49:25', 'syakir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 21:48:50'),
(14, 8, 5, 1, '2026-06-08', '08:00:00', '10:00:00', 72000.00, 10.00, 8000.00, 3600.00, 68400.00, 'confirmed', NULL, 'paid', NULL, 'BK202606088314', 'online', 'kompetitif', 1, 'solo', 'completed', '2026-06-08 21:56:44', 'ayu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 21:56:17'),
(15, 8, 5, 1, '2026-06-09', '20:00:00', '22:00:00', 72000.00, 10.00, 8000.00, 3600.00, 68400.00, 'confirmed', NULL, 'paid', NULL, 'BK202606099157', 'online', 'kompetitif', 1, 'solo', 'pending_approval', '2026-06-08 22:23:47', 'laptop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 22:22:36'),
(16, 10, 3, 1, '2026-06-09', '15:00:00', '16:00:00', 31500.00, 10.00, 3500.00, 1575.00, 29925.00, 'confirmed', NULL, 'paid', NULL, 'BK202606094165', 'online', 'kompetitif', 1, 'solo', 'completed', '2026-06-08 22:26:09', 'syakir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-08 22:25:42');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `sender_id`, `receiver_id`, `message`, `is_read`, `created_at`) VALUES
(1, 8, 11, 'tetes', 1, '2026-06-08 21:55:12'),
(2, 8, 11, 'tes', 1, '2026-06-08 21:55:18'),
(3, 8, 10, 'ayo tanding', 1, '2026-06-08 22:23:59'),
(4, 10, 8, 'gas', 1, '2026-06-08 22:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `nama_lapangan` varchar(100) NOT NULL,
  `jenis_olahraga` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga_per_jam` decimal(10,2) NOT NULL,
  `jumlah_lapangan` int(11) NOT NULL DEFAULT 1,
  `foto` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `wilayah` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`id`, `admin_id`, `nama_lapangan`, `jenis_olahraga`, `deskripsi`, `harga_per_jam`, `jumlah_lapangan`, `foto`, `alamat`, `wilayah`, `kabupaten`, `status`, `created_at`) VALUES
(1, 4, 'lapangan futsal jaya', 'futsal', 'bermain futsal dengan kualitas mantap', 50000.00, 1, '1779231671_704747b12b4e21c03599a8429da2b8b4.jpg', 'jakarta', 'jakarta', 'jakarta', 'aktif', '2026-05-19 23:01:11'),
(3, 4, 'badminton indor senayan', 'badminton', 'badminton', 35000.00, 2, '1779238023_0cc0f6c8f3a0faa36ed7f941c70f9241.jpg', 'senayan', 'senayan', 'senayan', 'aktif', '2026-05-20 00:47:03'),
(5, 4, 'badminton', 'badminton', 'buka jam 08.00 - 03.00 am\r\nperalatan lengkap , fasilatak ok', 40000.00, 2, '1779240434_10116cc6bf87df122824d71db05391bd.jpg', 'jln.cendrawasih', 'jln.cendrawasih', 'jln.cendrawasih', 'aktif', '2026-05-20 01:27:14'),
(6, 9, 'tennis out door jln senayan', 'tennis', '', 50000.00, 1, '1779241345_fafa31b0eb6bff20650be9f5b301820c.jpg', 'jln senayan', 'jln senayan', 'jln senayan', 'aktif', '2026-05-20 01:42:25'),
(7, 4, 'Stadion Spotify Camp Nou', 'football', 'Lapangan dengan kelas internasional dan Markas bersar Team Catalan Barcelona', 99999999.99, 1, '1780899199_26d89a3f459881e3.png', 'Carrer d\'Arístides Maillol, 12, 08028 Barcelona, Spanyol.', NULL, NULL, 'aktif', '2026-06-08 06:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan_reviews`
--

CREATE TABLE `lapangan_reviews` (
  `id` int(11) NOT NULL,
  `lapangan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `rating` tinyint(1) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lapangan_tutup`
--

CREATE TABLE `lapangan_tutup` (
  `id` int(11) NOT NULL,
  `lapangan_id` int(11) NOT NULL,
  `nomor_lapangan` int(11) NOT NULL DEFAULT 1,
  `tanggal` date NOT NULL,
  `tipe_tutup` enum('manual','seharian') NOT NULL DEFAULT 'manual',
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lapangan_tutup`
--

INSERT INTO `lapangan_tutup` (`id`, `lapangan_id`, `nomor_lapangan`, `tanggal`, `tipe_tutup`, `jam_mulai`, `jam_selesai`, `alasan`, `created_at`) VALUES
(1, 7, 1, '2026-06-08', 'manual', '00:00:00', '12:00:00', '', '2026-06-08 06:15:12'),
(2, 7, 1, '2026-06-08', 'manual', '12:00:00', '23:59:00', '', '2026-06-08 06:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `match_participants`
--

CREATE TABLE `match_participants` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team` enum('challenger','opponent') NOT NULL DEFAULT 'challenger',
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `is_captain` tinyint(1) NOT NULL DEFAULT 0,
  `invited_by` int(11) DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_participants`
--

INSERT INTO `match_participants` (`id`, `booking_id`, `user_id`, `team`, `status`, `is_captain`, `invited_by`, `responded_at`, `created_at`) VALUES
(1, 13, 11, 'challenger', 'accepted', 1, 11, '2026-06-08 16:49:25', '2026-06-08 21:49:25'),
(2, 13, 8, 'opponent', 'accepted', 1, 11, '2026-06-08 22:47:48', '2026-06-08 21:49:25'),
(3, 14, 8, 'challenger', 'accepted', 1, 8, '2026-06-08 16:56:44', '2026-06-08 21:56:44'),
(4, 14, 11, 'opponent', 'accepted', 1, 8, '2026-06-08 22:48:52', '2026-06-08 21:56:44'),
(5, 15, 8, 'challenger', 'accepted', 1, 8, '2026-06-08 17:23:47', '2026-06-08 22:23:47'),
(6, 15, 10, 'opponent', 'pending', 1, 8, NULL, '2026-06-08 22:23:47'),
(7, 16, 10, 'challenger', 'accepted', 1, 10, '2026-06-08 17:26:09', '2026-06-08 22:26:09'),
(8, 16, 8, 'opponent', 'accepted', 1, 10, '2026-06-08 22:47:47', '2026-06-08 22:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `match_results`
--

CREATE TABLE `match_results` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lapangan_id` int(11) NOT NULL,
  `nomor_lapangan` int(11) NOT NULL DEFAULT 1,
  `jenis_olahraga` varchar(50) NOT NULL,
  `wilayah` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT NULL,
  `opponent_name` varchar(100) NOT NULL,
  `user_score` int(11) NOT NULL DEFAULT 0,
  `opponent_score` int(11) NOT NULL DEFAULT 0,
  `winner` enum('user','opponent','draw') NOT NULL DEFAULT 'draw',
  `points` int(11) NOT NULL DEFAULT 0,
  `score_diff` int(11) NOT NULL DEFAULT 0,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_results`
--

INSERT INTO `match_results` (`id`, `booking_id`, `user_id`, `lapangan_id`, `nomor_lapangan`, `jenis_olahraga`, `wilayah`, `kabupaten`, `opponent_name`, `user_score`, `opponent_score`, `winner`, `points`, `score_diff`, `catatan`, `created_at`) VALUES
(3, 11, 10, 5, 1, 'badminton', 'jln.cendrawasih', 'jln.cendrawasih', 'syakir', 2, 1, 'user', 3, 1, '', '2026-06-08 21:46:11'),
(4, 16, 10, 3, 1, 'badminton', 'senayan', 'senayan', 'syakir', 4, 5, 'opponent', 0, -1, '', '2026-06-08 22:52:59'),
(5, 16, 8, 3, 1, 'badminton', 'senayan', 'senayan', 'laptop', 5, 4, 'user', 3, 1, '', '2026-06-08 22:52:59'),
(6, 14, 8, 5, 1, 'badminton', 'jln.cendrawasih', 'jln.cendrawasih', 'ayu', 2, 1, 'user', 3, 1, '', '2026-06-09 05:39:02'),
(7, 14, 11, 5, 1, 'badminton', 'jln.cendrawasih', 'jln.cendrawasih', 'syakir', 1, 2, 'opponent', 0, -1, '', '2026-06-09 05:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `link`, `is_read`, `created_at`) VALUES
(1, 10, 'Skor tanding sudah diinput', 'Hasil pertandingan di badminton: Team 1 2 - 1 Team 2. Poin kamu: 3.', 'leaderboard.php?lapangan_id=5', 1, '2026-06-08 21:46:03'),
(2, 10, 'Skor tanding sudah diinput', 'Hasil pertandingan di badminton: Team 1 2 - 1 Team 2. Poin kamu: 3.', 'leaderboard.php?lapangan_id=5', 1, '2026-06-08 21:46:11'),
(3, 8, 'Undangan tanding solo', 'ayu mengundang kamu tanding solo di tennis out door jln senayan.', 'match-invitations.php', 1, '2026-06-08 21:49:25'),
(4, 11, 'Pesan chat baru', 'syakir mengirim pesan chat.', 'chat.php?user_id=8', 0, '2026-06-08 21:55:12'),
(5, 11, 'Pesan chat baru', 'syakir mengirim pesan chat.', 'chat.php?user_id=8', 0, '2026-06-08 21:55:18'),
(6, 11, 'Undangan tanding solo', 'syakir mengundang kamu tanding solo di badminton.', 'match-invitations.php', 0, '2026-06-08 21:56:44'),
(7, 10, 'Undangan tanding solo', 'syakir mengundang kamu tanding solo di badminton.', 'match-invitations.php', 1, '2026-06-08 22:23:47'),
(8, 10, 'Pesan chat baru', 'syakir mengirim pesan chat.', 'chat.php?user_id=8', 1, '2026-06-08 22:23:59'),
(9, 8, 'Pesan chat baru', 'laptop mengirim pesan chat.', 'chat.php?user_id=10', 1, '2026-06-08 22:24:33'),
(10, 8, 'Undangan tanding solo', 'laptop mengundang kamu tanding solo di badminton indor senayan.', 'match-invitations.php', 1, '2026-06-08 22:26:09'),
(11, 4, 'Mode tanding siap dicatat', 'Semua pemain sudah menyetujui pertandingan di badminton indor senayan. Silakan input skor akhir.', 'admin/bookings.php', 0, '2026-06-08 22:47:47'),
(12, 10, 'Mode tanding disetujui', 'Semua pemain sudah setuju. Pertandingan siap dimainkan dan admin akan input skor akhir.', 'riwayat.php', 0, '2026-06-08 22:47:47'),
(13, 9, 'Mode tanding siap dicatat', 'Semua pemain sudah menyetujui pertandingan di tennis out door jln senayan. Silakan input skor akhir.', 'admin/bookings.php', 0, '2026-06-08 22:47:48'),
(14, 11, 'Mode tanding disetujui', 'Semua pemain sudah setuju. Pertandingan siap dimainkan dan admin akan input skor akhir.', 'riwayat.php', 0, '2026-06-08 22:47:48'),
(15, 4, 'Mode tanding siap dicatat', 'Semua pemain sudah menyetujui pertandingan di badminton. Silakan input skor akhir.', 'admin/bookings.php', 0, '2026-06-08 22:48:52'),
(16, 8, 'Mode tanding disetujui', 'Semua pemain sudah setuju. Pertandingan siap dimainkan dan admin akan input skor akhir.', 'riwayat.php', 1, '2026-06-08 22:48:52'),
(17, 10, 'Skor tanding sudah diinput', 'Hasil pertandingan di badminton indor senayan: Team 1 4 - 5 Team 2. Poin kamu: 0.', 'leaderboard.php?lapangan_id=3', 0, '2026-06-08 22:52:59'),
(18, 8, 'Skor tanding sudah diinput', 'Hasil pertandingan di badminton indor senayan: Team 1 4 - 5 Team 2. Poin kamu: 3.', 'leaderboard.php?lapangan_id=3', 1, '2026-06-08 22:52:59'),
(19, 8, 'Skor tanding sudah diinput', 'Hasil pertandingan di badminton: Team 1 2 - 1 Team 2. Poin kamu: 3.', 'leaderboard.php?lapangan_id=5', 1, '2026-06-09 05:39:02'),
(20, 11, 'Skor tanding sudah diinput', 'Hasil pertandingan di badminton: Team 1 2 - 1 Team 2. Poin kamu: 0.', 'leaderboard.php?lapangan_id=5', 0, '2026-06-09 05:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `reset_code` varchar(10) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `user_id`, `email`, `reset_code`, `expires_at`, `used`, `created_at`) VALUES
(1, 8, 'syakir@gmail.com', '616569', '2026-06-09 04:25:06', 1, '2026-06-08 21:10:06'),
(2, 8, 'syakir@gmail.com', '463607', '2026-06-09 04:25:45', 1, '2026-06-08 21:10:45'),
(3, 8, 'syakir@gmail.com', '379738', '2026-06-09 04:25:55', 1, '2026-06-08 21:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `category` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 1,
  `photo` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','sold_out') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `product_name`, `category`, `description`, `price`, `stock`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 'Nike Dunk High \'Wheat Gold\'', 'basket', 'This take on the Dunk High sees the silhouette\'s classic leather base swapped with a course, tan-coated canvas material. The neutral upper is covered in shades of wheat and gold and create a scheme that\'s effortless to style, all atop a bright orange outsole that adds some pop underfoot.⁠ Shop now online.', 450001.00, 6, 'product_1780959084_feb69e60ee60.jpg', 'active', '2026-06-08 22:51:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `platform_fee` decimal(12,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `qr_code` text DEFAULT NULL,
  `transaction_code` varchar(50) NOT NULL,
  `status` enum('pending','success','failed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `product_id`, `buyer_id`, `seller_id`, `quantity`, `price`, `total_amount`, `platform_fee`, `seller_amount`, `payment_method`, `payment_channel`, `qr_code`, `transaction_code`, `status`, `payment_date`, `created_at`) VALUES
(1, 1, 8, 11, 1, 450001.00, 450001.00, 22500.00, 427501.00, 'qris', 'QRIS', '{\"transaction_code\":\"PRD20260609012810528\",\"product_id\":1,\"qty\":1,\"amount\":450001,\"method\":\"qris\",\"channel\":\"QRIS\"}', 'PRD20260609012810528', 'pending', NULL, '2026-06-08 23:28:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(1) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_orders`
--

CREATE TABLE `subscription_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `platform_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','success','failed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `transaction_code` varchar(50) NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration_days` int(11) NOT NULL DEFAULT 30,
  `features` text DEFAULT NULL,
  `allow_leaderboard` tinyint(1) NOT NULL DEFAULT 0,
  `allow_match_recording` tinyint(1) NOT NULL DEFAULT 0,
  `allow_course` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `name`, `slug`, `description`, `price`, `duration_days`, `features`, `allow_leaderboard`, `allow_match_recording`, `allow_course`, `status`, `created_at`) VALUES
(1, 'Pemain Tetap', 'pemain-tetap', 'Paket untuk user yang sering booking dan ingin menjadi member aktif.', 29000.00, 30, 'Status member aktif|Cocok untuk pemain rutin|Riwayat booking lebih rapi|Akses promo/member internal', 0, 0, 0, 'active', '2026-06-03 01:37:43'),
(2, 'Arena Kompetitif', 'arena-kompetitif', 'Paket turnamen/kompetitif untuk mencatat hasil pertandingan dan membuka leaderboard.', 49000.00, 30, 'Buka akses leaderboard|Catat hasil pertandingan|Ranking berdasarkan lapangan, wilayah, dan cabang olahraga|Cocok untuk sparing dan turnamen kecil', 1, 1, 0, 'active', '2026-06-03 01:37:43'),
(3, 'Akademi/Kursus', 'akademi-kursus', 'Paket untuk kelas latihan/kursus yang memakai lapangan bersama pelatih.', 79000.00, 30, 'Mode booking kursus|Cocok untuk latihan privat/kelompok|Membantu pengelolaan jadwal pelatih|Cocok untuk akademi olahraga', 0, 0, 1, 'active', '2026-06-03 01:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `team_code` varchar(12) NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `captain_id` int(11) NOT NULL,
  `jenis_olahraga` varchar(50) DEFAULT NULL,
  `status` enum('pending','active','rejected','inactive') NOT NULL DEFAULT 'pending',
  `created_by_booking_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_match_requests`
--

CREATE TABLE `team_match_requests` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `requester_user_id` int(11) NOT NULL,
  `requester_team_id` int(11) NOT NULL,
  `opponent_team_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected','completed','cancelled') NOT NULL DEFAULT 'pending',
  `message` varchar(255) DEFAULT NULL,
  `responded_by` int(11) DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `is_captain` tinyint(1) NOT NULL DEFAULT 0,
  `invited_by` int(11) DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `qr_code` text DEFAULT NULL,
  `transaction_code` varchar(50) DEFAULT NULL,
  `status` enum('pending','success','failed','cancelled') DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `booking_id`, `user_id`, `amount`, `payment_method`, `payment_channel`, `qr_code`, `transaction_code`, `status`, `payment_date`, `created_at`) VALUES
(10, 9, 8, 50000.00, 'qris', 'QRIS', '{\"transaction_code\":\"TRX20260602231652258\",\"amount\":\"50000.00\",\"method\":\"qris\",\"channel\":\"QRIS\"}', 'TRX20260602231652258', 'success', '2026-06-02 21:16:53', '2026-06-02 21:16:52'),
(11, 10, 10, 50000.00, 'qris', 'QRIS', '{\"transaction_code\":\"TRX20260602231748775\",\"amount\":\"50000.00\",\"method\":\"qris\",\"channel\":\"QRIS\"}', 'TRX20260602231748775', 'success', '2026-06-02 21:17:49', '2026-06-02 21:17:48'),
(12, 11, 10, 80000.00, 'qris', 'QRIS', '{\"transaction_code\":\"TRX20260608082915980\",\"amount\":\"80000.00\",\"method\":\"qris\",\"channel\":\"QRIS\"}', 'TRX20260608082915980', 'success', '2026-06-08 06:29:25', '2026-06-08 06:29:15'),
(13, 12, 8, 99999999.99, 'qris', 'QRIS', '{\"transaction_code\":\"TRX20260608231928956\",\"amount\":\"99999999.99\",\"method\":\"qris\",\"channel\":\"QRIS\"}', 'TRX20260608231928956', 'success', '2026-06-08 22:27:52', '2026-06-08 21:19:28'),
(14, 13, 11, 90000.00, 'qris', 'QRIS', '{\"transaction_code\":\"TRX20260608234852243\",\"amount\":\"90000.00\",\"method\":\"qris\",\"channel\":\"QRIS\"}', 'TRX20260608234852243', 'success', '2026-06-08 21:48:54', '2026-06-08 21:48:52'),
(15, 14, 8, 72000.00, 'mbanking', 'BCA Mobile', '{\"transaction_code\":\"TRX20260608235620562\",\"amount\":\"72000.00\",\"method\":\"mbanking\",\"channel\":\"BCA Mobile\"}', 'TRX20260608235620562', 'success', '2026-06-08 21:56:22', '2026-06-08 21:56:20'),
(16, 15, 8, 72000.00, 'mbanking', 'Mandiri Online', '{\"transaction_code\":\"TRX20260609002240169\",\"amount\":\"72000.00\",\"method\":\"mbanking\",\"channel\":\"Mandiri Online\"}', 'TRX20260609002240169', 'success', '2026-06-08 22:22:41', '2026-06-08 22:22:40'),
(17, 16, 10, 31500.00, 'qris', 'QRIS', '{\"transaction_code\":\"TRX20260609002546602\",\"amount\":\"31500.00\",\"method\":\"qris\",\"channel\":\"QRIS\"}', 'TRX20260609002546602', 'success', '2026-06-08 22:25:47', '2026-06-08 22:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `player_code` varchar(6) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `show_rank_badges` tinyint(1) NOT NULL DEFAULT 1,
  `vip_until` date DEFAULT NULL,
  `vip_discount_percent` decimal(5,2) NOT NULL DEFAULT 10.00,
  `role` enum('user','admin','super_admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `player_code`, `username`, `email`, `password`, `full_name`, `display_name`, `phone`, `bio`, `profile_photo`, `show_rank_badges`, `vip_until`, `vip_discount_percent`, `role`, `created_at`) VALUES
(1, '301901', 'superadmin', 'superadmin@lapangankita.com', '$2y$10$YourHashedPasswordHere', 'Super Admin', 'Super Admin', NULL, NULL, NULL, 1, NULL, 10.00, 'super_admin', '2026-05-19 22:04:19'),
(3, '301903', 'agif', 'yusufbro3030@gmail.com', '$2y$10$QIHP8p8vQUqsKe38mlo5PeOkFem1/sWTRXzn9fcxezoElpFaBPbOm', 'agif', 'agif', '083161423128', NULL, NULL, 1, NULL, 10.00, 'user', '2026-05-19 22:22:15'),
(4, '301904', 'zero', 'kukukaki.3019@gmail.com', '$2y$10$EANhX5UKOQqHRa4oqkW0j.uKU3BAMN37i7AKNTKSlQKOZiIg4PuMy', 'ziro', 'ziro', '083161423128', NULL, NULL, 1, NULL, 10.00, 'admin', '2026-05-19 22:24:30'),
(5, '301905', 'axel', 'pirmando.2005@gmail.com', '$2y$10$mu9JBVJARhfk/M6i4zjbYOJYyk3QCl/Cev.RnyFCExlzhaMVSTkRa', 'Agif', 'Agif', '083161423128', NULL, NULL, 1, NULL, 10.00, 'user', '2026-05-19 23:21:08'),
(6, '301906', 'nana', 'nana@gmail.com', '$2y$10$WKICvhvHthvp1ZboJeeK0uhybxjmPlmjJV5ElUNfuMzSXGFIBsQtC', 'nana', 'nana', '083161423128', NULL, NULL, 1, NULL, 10.00, 'super_admin', '2026-05-19 23:52:06'),
(7, '301907', 'sandy', 'sandy@gmail.com', '$2y$10$IRJ03nMcZy7A9Ktfa5C.a.Dbg77RnskTMaspfNmV0/9eDDCzWddGm', 'sandy', 'sandy', '083161423128', NULL, NULL, 1, NULL, 10.00, 'user', '2026-05-20 00:36:36'),
(8, '301908', 'syakir', 'syakir@gmail.com', '$2y$10$SDEridZxEQ5LbRdCwkCNsuipuZ7nniqjVIwS9vqw6Wj.NAqHPzlC.', 'syakir', 'syakir', '083161423128', NULL, NULL, 1, '2026-07-08', 10.00, 'user', '2026-05-20 01:30:56'),
(9, '301909', 'hasan', 'hasan@gmail.com', '$2y$10$VGc7TAlfBtX2ImEeK77qiOapEKTKPRS.M3BW0Odj9j2hxNcGPaSm2', 'hasan', 'hasan', '083161423128', NULL, NULL, 1, NULL, 10.00, 'admin', '2026-05-20 01:39:34'),
(10, '301910', 'laptop', 'laptop@gmail.com', '$2y$10$WFPd6q8ZGsDMEcqkigCxMOg2ZcpBwV.2/Vv93N3uOe.UyqsgYe4hG', 'laptop', 'laptop', '083161423128', '', '1780950940_b0b9661592adbb4b.jpg', 1, '2026-07-09', 10.00, 'user', '2026-06-02 21:17:18'),
(11, '301911', 'ayu', 'ayu@gmail.com', '$2y$10$9tj9ikurfh3SLjlrXdAWTONM/ZdRajDrDsEjg8QA.tub993G/C7yq', 'ayu', 'ayu', '083161423128', NULL, NULL, 1, '2026-07-08', 10.00, 'user', '2026-06-02 21:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('pending','active','expired','cancelled') NOT NULL DEFAULT 'active',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `platform_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vip_orders`
--

CREATE TABLE `vip_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration_days` int(11) NOT NULL DEFAULT 30,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 10.00,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `qr_code` text DEFAULT NULL,
  `transaction_code` varchar(50) NOT NULL,
  `status` enum('pending','success','failed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vip_orders`
--

INSERT INTO `vip_orders` (`id`, `user_id`, `amount`, `duration_days`, `discount_percent`, `payment_method`, `payment_channel`, `qr_code`, `transaction_code`, `status`, `payment_date`, `created_at`) VALUES
(1, 11, 29000.00, 30, 10.00, 'ewallet', 'OVO', '{\"transaction_code\":\"VIP20260608234711174\",\"amount\":29000,\"method\":\"ewallet\",\"channel\":\"OVO\",\"duration_days\":30,\"discount_percent\":10}', 'VIP20260608234711174', 'success', '2026-06-08 21:47:43', '2026-06-08 21:47:11'),
(2, 8, 29000.00, 30, 10.00, 'ewallet', 'OVO', '{\"transaction_code\":\"VIP20260608235031353\",\"amount\":29000,\"method\":\"ewallet\",\"channel\":\"OVO\",\"duration_days\":30,\"discount_percent\":10}', 'VIP20260608235031353', 'success', '2026-06-08 21:50:32', '2026-06-08 21:50:31'),
(3, 10, 29000.00, 30, 10.00, 'qris', 'QRIS', '{\"transaction_code\":\"VIP20260609002442923\",\"amount\":29000,\"method\":\"qris\",\"channel\":\"QRIS\",\"duration_days\":30,\"discount_percent\":10}', 'VIP20260609002442923', 'success', '2026-06-08 22:24:44', '2026-06-08 22:24:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_booking_hidden`
--
ALTER TABLE `admin_booking_hidden`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_admin_booking_hidden` (`admin_id`,`booking_id`),
  ADD KEY `idx_admin_booking_hidden_booking` (`booking_id`),
  ADD KEY `idx_admin_booking_hidden_admin` (`admin_id`,`hidden_at`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_code` (`booking_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lapangan_id` (`lapangan_id`),
  ADD KEY `idx_booking_cek_jadwal` (`lapangan_id`,`nomor_lapangan`,`tanggal`,`jam_mulai`,`jam_selesai`,`status`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_chat_pair` (`sender_id`,`receiver_id`,`created_at`),
  ADD KEY `idx_chat_receiver` (`receiver_id`,`is_read`,`created_at`);

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `lapangan_reviews`
--
ALTER TABLE `lapangan_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lapangan_reviews_lapangan` (`lapangan_id`,`created_at`),
  ADD KEY `idx_lapangan_reviews_user` (`user_id`),
  ADD KEY `idx_lapangan_reviews_booking` (`booking_id`);

--
-- Indexes for table `lapangan_tutup`
--
ALTER TABLE `lapangan_tutup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lapangan_id` (`lapangan_id`),
  ADD KEY `idx_tutup_cek_jadwal` (`lapangan_id`,`nomor_lapangan`,`tanggal`,`jam_mulai`,`jam_selesai`);

--
-- Indexes for table `match_participants`
--
ALTER TABLE `match_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_booking_user` (`booking_id`,`user_id`),
  ADD KEY `idx_match_participants_user` (`user_id`,`status`),
  ADD KEY `idx_match_participants_booking` (`booking_id`,`team`,`status`);

--
-- Indexes for table `match_results`
--
ALTER TABLE `match_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_booking_user_result` (`booking_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lapangan_id` (`lapangan_id`),
  ADD KEY `idx_leaderboard_filter` (`jenis_olahraga`,`wilayah`,`kabupaten`,`lapangan_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_user` (`user_id`,`is_read`,`created_at`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_password_resets_code` (`reset_code`,`used`),
  ADD KEY `idx_password_resets_user` (`user_id`,`used`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_products_seller` (`seller_id`,`status`),
  ADD KEY `idx_products_search` (`product_name`,`category`,`status`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_product_order_code` (`transaction_code`),
  ADD KEY `idx_product_orders_product` (`product_id`,`status`),
  ADD KEY `idx_product_orders_buyer` (`buyer_id`,`status`),
  ADD KEY `idx_product_orders_seller` (`seller_id`,`status`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_reviews_product` (`product_id`,`created_at`),
  ADD KEY `idx_product_reviews_user` (`user_id`);

--
-- Indexes for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_code` (`transaction_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_team_code` (`team_code`),
  ADD KEY `idx_team_name` (`team_name`),
  ADD KEY `idx_team_captain` (`captain_id`,`status`);

--
-- Indexes for table `team_match_requests`
--
ALTER TABLE `team_match_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_team_match_booking` (`booking_id`,`status`),
  ADD KEY `idx_team_match_opp` (`opponent_team_id`,`status`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_team_member` (`team_id`,`user_id`),
  ADD KEY `idx_team_member_user` (`user_id`,`status`),
  ADD KEY `idx_team_member_team` (`team_id`,`status`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_code` (`transaction_code`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uniq_player_code` (`player_code`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `vip_orders`
--
ALTER TABLE `vip_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_vip_transaction` (`transaction_code`),
  ADD KEY `idx_vip_user` (`user_id`,`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_booking_hidden`
--
ALTER TABLE `admin_booking_hidden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lapangan`
--
ALTER TABLE `lapangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lapangan_reviews`
--
ALTER TABLE `lapangan_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapangan_tutup`
--
ALTER TABLE `lapangan_tutup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `match_participants`
--
ALTER TABLE `match_participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `match_results`
--
ALTER TABLE `match_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_match_requests`
--
ALTER TABLE `team_match_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vip_orders`
--
ALTER TABLE `vip_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`lapangan_id`) REFERENCES `lapangan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD CONSTRAINT `lapangan_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lapangan_tutup`
--
ALTER TABLE `lapangan_tutup`
  ADD CONSTRAINT `lapangan_tutup_ibfk_1` FOREIGN KEY (`lapangan_id`) REFERENCES `lapangan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `match_results`
--
ALTER TABLE `match_results`
  ADD CONSTRAINT `match_results_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_results_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `match_results_ibfk_3` FOREIGN KEY (`lapangan_id`) REFERENCES `lapangan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_orders`
--
ALTER TABLE `subscription_orders`
  ADD CONSTRAINT `subscription_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscription_orders_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `user_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_subscriptions_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_subscriptions_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `subscription_orders` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
