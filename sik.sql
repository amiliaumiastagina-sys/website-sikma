-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Des 2025 pada 02.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `billings`
--

CREATE TABLE `billings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_tagihan` varchar(50) NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `total_biaya` decimal(15,2) NOT NULL,
  `tanggal_bayar` datetime DEFAULT NULL,
  `status_lunas` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `billings`
--

INSERT INTO `billings` (`id`, `kode_tagihan`, `patient_id`, `total_biaya`, `tanggal_bayar`, `status_lunas`, `created_at`, `updated_at`) VALUES
(6, 'TAG-1764871179', 1, 15000000.00, NULL, 0, '2025-12-04 10:59:39', '2025-12-04 10:59:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `billing_details`
--

CREATE TABLE `billing_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billing_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_biaya` varchar(50) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `jumlah` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `billing_details`
--

INSERT INTO `billing_details` (`id`, `billing_id`, `jenis_biaya`, `deskripsi`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 6, 'tindakan', 'Pemeriksaan Dokter Umum', 15000000.00, '2025-12-04 10:59:39', '2025-12-04 10:59:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `spesialisasi` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1,
  `jadwal_praktik` varchar(255) DEFAULT NULL,
  `status_kepegawaian` enum('Tetap','Kontrak','Paruh Waktu') NOT NULL DEFAULT 'Tetap',
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `doctors`
--

INSERT INTO `doctors` (`id`, `nip`, `nama_lengkap`, `jenis_kelamin`, `tanggal_lahir`, `spesialisasi`, `no_hp`, `alamat`, `status_aktif`, `jadwal_praktik`, `status_kepegawaian`, `catatan`, `created_at`, `updated_at`) VALUES
(2, '123456789', 'Dr. Fikram', 'Laki-laki', '2002-01-02', 'Dokter Umum', '08123456789', 'Donggo', 1, 'Senin-Jumat 07:00-22:00', 'Tetap', 'Spesialis Anak', '2025-12-03 08:50:02', '2025-12-03 08:50:02'),
(3, '100000001', 'Dr. Ahmad Suryadi', 'Laki-laki', '1980-05-12', 'Dokter Umum', '08111111111', 'Bima Kota', 1, 'Senin-Jumat 08:00-16:00', 'Tetap', 'Pengalaman 10 tahun', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(4, '100000002', 'Dr. Siti Rahma', 'Perempuan', '1985-09-20', 'Dokter Anak', '08122222222', 'Sape', 1, 'Senin-Jumat 08:00-16:00', 'Tetap', 'Ahli anak-anak', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(5, '100000003', 'Dr. Hendra Wijaya', 'Laki-laki', '1978-12-03', 'Dokter Gigi', '08133333333', 'Dompu', 1, 'Senin-Kamis 09:00-15:00', 'Tetap', 'Spesialis gigi', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(6, '100000004', 'Dr. Lina Putri', 'Perempuan', '1990-03-15', 'Dokter Kandungan', '08144444444', 'Bima Kota', 1, 'Selasa-Sabtu 08:00-16:00', 'Kontrak', 'Ahli kandungan', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(7, '100000005', 'Dr. Arief Pratama', 'Laki-laki', '1982-07-08', 'Dokter Umum', '08155555555', 'Raba', 1, 'Senin-Jumat 08:00-17:00', 'Tetap', 'Praktik umum', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(8, '100000006', 'Dr. Fitriani Dewi', 'Perempuan', '1988-11-25', 'Dokter Mata', '08166666666', 'Donggo', 1, 'Senin-Kamis 09:00-16:00', 'Tetap', 'Spesialis mata', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(9, '100000007', 'Dr. Budi Santoso', 'Laki-laki', '1975-04-18', 'Dokter Bedah', '08177777777', 'Mpunda', 1, 'Senin-Jumat 08:00-16:00', 'Tetap', 'Ahli bedah', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(10, '100000008', 'Dr. Maya Lestari', 'Perempuan', '1992-06-30', 'Dokter Anak', '08188888888', 'Kota Bima', 1, 'Senin-Jumat 08:00-15:00', 'Kontrak', 'Dokter anak', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(11, '100000009', 'Dr. Rudi Hartono', 'Laki-laki', '1983-10-10', 'Dokter Saraf', '08199999999', 'Sape', 1, 'Selasa-Sabtu 09:00-16:00', 'Tetap', 'Spesialis saraf', '2025-12-03 08:52:49', '2025-12-03 08:52:49'),
(12, '100000010', 'Dr. Indah Pratiwi', 'Perempuan', '1987-02-05', 'Dokter Gizi', '08110101010', 'Dompu', 1, 'Senin-Kamis 08:00-16:00', 'Tetap', 'Ahli gizi', '2025-12-03 08:52:49', '2025-12-03 08:52:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctor_poli`
--

CREATE TABLE `doctor_poli` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `poli_id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_hari` varchar(50) DEFAULT NULL COMMENT 'Hari kerja dokter di poli, contoh: Senin-Jumat',
  `jadwal_mulai` time DEFAULT NULL COMMENT 'Jam mulai praktik',
  `jadwal_selesai` time DEFAULT NULL COMMENT 'Jam selesai praktik',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `doctor_poli`
--

INSERT INTO `doctor_poli` (`id`, `doctor_id`, `poli_id`, `jadwal_hari`, `jadwal_mulai`, `jadwal_selesai`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(2, 4, 1, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(3, 7, 1, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(4, 3, 2, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(5, 11, 2, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(6, 12, 2, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(7, 2, 3, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(8, 9, 3, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(9, 11, 3, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(10, 8, 4, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(11, 9, 4, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(12, 12, 4, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(13, 3, 5, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(14, 5, 5, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(15, 7, 5, 'Senin-Jumat', '08:00:00', '16:00:00', '2025-12-03 06:42:50', '2025-12-03 06:42:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_obat`
--

CREATE TABLE `kategori_obat` (
  `id` bigint(20) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_obat`
--

INSERT INTO `kategori_obat` (`id`, `nama_kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Antibiotik', 'Obat untuk infeksi bakteri', '2025-12-04 17:11:58', '2025-12-04 17:11:58'),
(2, 'Analgesik', 'Pereda nyeri', '2025-12-04 17:11:58', '2025-12-04 17:11:58'),
(3, 'Vitamin', 'Menambah nutrisi', '2025-12-04 17:11:58', '2025-12-04 17:11:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `medical_records`
--

CREATE TABLE `medical_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_rekam` varchar(50) NOT NULL COMMENT 'Kode unik rekam medis',
  `patient_id` bigint(20) UNSIGNED NOT NULL COMMENT 'ID pasien',
  `doctor_id` bigint(20) UNSIGNED NOT NULL COMMENT 'ID dokter',
  `poli_id` bigint(20) UNSIGNED NOT NULL COMMENT 'ID poli',
  `diagnosa` text DEFAULT NULL COMMENT 'Diagnosa pasien',
  `tindakan` text DEFAULT NULL COMMENT 'Tindakan yang diberikan',
  `obat` text DEFAULT NULL COMMENT 'Obat yang diberikan',
  `tanggal_kunjungan` date NOT NULL COMMENT 'Tanggal kunjungan pasien',
  `file_lampiran` varchar(255) DEFAULT NULL COMMENT 'File tambahan seperti lab/x-ray',
  `status_aktif` tinyint(1) DEFAULT 1 COMMENT 'Status rekam aktif',
  `catatan` text DEFAULT NULL COMMENT 'Catatan tambahan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `medical_records`
--

INSERT INTO `medical_records` (`id`, `kode_rekam`, `patient_id`, `doctor_id`, `poli_id`, `diagnosa`, `tindakan`, `obat`, `tanggal_kunjungan`, `file_lampiran`, `status_aktif`, `catatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'RM-20251204-5010', 3, 5, 3, 'gigi berkarat', 'operasi ringan', 'berikan cium', '2025-12-18', NULL, 0, 'dia cantik, tapi saya tidak mau pacaran.', '2025-12-04 07:34:04', '2025-12-04 07:40:27', NULL),
(2, 'RM-20251203-3806', 1, 7, 1, 'tidak ada penyakit', 'beri dia uang', 'kasih kopi dan rokok', '2025-12-05', NULL, 0, 'Dia anak yang rajin', '2025-12-04 07:42:04', '2025-12-04 07:42:04', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_03_045420_create_patients_table', 2),
(5, '2025_12_03_061628_create_doctors_table', 3),
(6, '2025_12_03_065905_create_doctors_table', 4),
(7, '2025_12_03_133917_create_polis_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` bigint(20) NOT NULL,
  `kategori_id` bigint(20) NOT NULL,
  `kode_obat` varchar(50) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int(11) DEFAULT 0,
  `stok_minimum` int(11) DEFAULT 10,
  `harga_beli` decimal(12,2) DEFAULT NULL,
  `harga_jual` decimal(12,2) DEFAULT NULL,
  `tanggal_kadaluarsa` date DEFAULT NULL,
  `lokasi_rak` varchar(255) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `kategori_id`, `kode_obat`, `nama_obat`, `satuan`, `stok`, `stok_minimum`, `harga_beli`, `harga_jual`, `tanggal_kadaluarsa`, `lokasi_rak`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 'ABT-001', 'Amoxicillin 500mg', 'tablet', 120, 20, 1500.00, 3000.00, '2026-02-10', 'Rak A1', 1, '2025-12-04 17:12:20', '2025-12-04 17:12:20'),
(2, 2, 'ALG-003', 'Paracetamol 500mg', 'tablet', 350, 50, 500.00, 1500.00, '2025-11-03', 'Rak B2', 1, '2025-12-04 17:12:20', '2025-12-04 17:12:20'),
(3, 3, 'VTM-102', 'Vitamin C 1000mg', 'tablet', 200, 30, 1800.00, 4000.00, '2026-08-21', 'Rak C2', 1, '2025-12-04 17:12:20', '2025-12-04 10:28:23'),
(4, 3, 'VTM-014', 'uhiduea', 'Tablet', 200, 10, 10.00, 6.00, '2025-12-11', 'Lantai 2', 1, '2025-12-04 10:16:39', '2025-12-04 10:29:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rekam_medis` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `golongan_darah` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `status_pernikahan` enum('Belum Menikah','Menikah','Janda/Duda') NOT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  `alergi_obat` text DEFAULT NULL,
  `status_bpjs` tinyint(1) NOT NULL DEFAULT 0,
  `no_bpjs` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `patients`
--

INSERT INTO `patients` (`id`, `rekam_medis`, `nik`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `golongan_darah`, `no_hp`, `alamat`, `status_pernikahan`, `pekerjaan`, `alergi_obat`, `status_bpjs`, `no_bpjs`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'RM-20251203-3806', '12313138781913123', 'Alan Nuari', 'Kota Bima', '2001-10-14', 'L', 'O', '278428479230', 'penaraga', 'Belum Menikah', 'development', 'tidak ada', 1, 'w3y182732911931203', NULL, '2025-12-02 22:49:57', '2025-12-02 22:49:57'),
(2, 'RM-20251203-4816', '984958392592', 'Teguh', 'BUMI', '1996-03-06', 'L', 'A', '8937459259288', 'Bedi', 'Menikah', 'Dosen', 'bodrex', 0, NULL, NULL, '2025-12-02 23:00:33', '2025-12-02 23:01:59'),
(3, 'RM-20251204-5010', '876598687987978', 'Amilia Umi Astagina', 'WERA', '2005-11-22', 'P', 'O', '90395828242', 'WERA', 'Janda/Duda', 'IRT', 'Banyak', 1, NULL, NULL, '2025-12-04 06:54:48', '2025-12-04 06:54:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `polis`
--

CREATE TABLE `polis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_poli` varchar(10) NOT NULL COMMENT 'Kode unik Poli, misal: PLU-01',
  `nama_poli` varchar(100) NOT NULL COMMENT 'Nama poli / layanan kesehatan',
  `deskripsi` text DEFAULT NULL COMMENT 'Deskripsi layanan poli',
  `ruangan` varchar(50) DEFAULT NULL COMMENT 'Ruangan / Lokasi poli',
  `status_aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = aktif, 0 = tidak aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `polis`
--

INSERT INTO `polis` (`id`, `kode_poli`, `nama_poli`, `deskripsi`, `ruangan`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, 'PLU-01', 'Poli Umum', 'Pelayanan kesehatan umum untuk semua pasien.', 'Gedung A - Lantai 1', 1, '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(2, 'PLU-02', 'Poli Anak', 'Pelayanan kesehatan khusus anak-anak.', 'Gedung A - Lantai 2', 1, '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(3, 'PLU-03', 'Poli Gigi', 'Pelayanan kesehatan gigi dan mulut.', 'Gedung B - Lantai 1', 1, '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(4, 'PLU-04', 'Poli KIA', 'Pelayanan kesehatan ibu dan anak.', 'Gedung B - Lantai 2', 1, '2025-12-03 06:42:50', '2025-12-03 06:42:50'),
(5, 'PLU-05', 'Poli Bedah', 'Pelayanan operasi dan tindakan bedah.', 'Gedung C - Lantai 1', 1, '2025-12-03 06:42:50', '2025-12-03 06:42:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_stok`
--

CREATE TABLE `riwayat_stok` (
  `id` bigint(20) NOT NULL,
  `obat_id` bigint(20) NOT NULL,
  `jenis_transaksi` enum('masuk','keluar') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('sEZylmesTBIs67fbqQ1mD8NLQurpLvvktOzgtu2m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkgyZE5ndmhGa2VFTW9TWTZqTWVDcERnbHFCd3Mxb3czbHZMa2NpRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kb2N0b3JzP3NlYXJjaD11bXVtIjtzOjU6InJvdXRlIjtzOjEzOiJkb2N0b3JzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765413984),
('UxPPy3iM0HC0dgHh6Co7tsNE48kO7Ih5iYrmXjFE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjREREhVUzFtV3l3bHBVZ01tTzEyM0doWVpMZWRldkRYcG1yZEVONyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZXBvcnRzIjtzOjU6InJvdXRlIjtzOjEzOiJyZXBvcnRzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765274143);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_tagihan` (`kode_tagihan`),
  ADD KEY `fk_billings_patient` (`patient_id`);

--
-- Indeks untuk tabel `billing_details`
--
ALTER TABLE `billing_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_billing_details_billing` (`billing_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_nip_unique` (`nip`);

--
-- Indeks untuk tabel `doctor_poli`
--
ALTER TABLE `doctor_poli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctor_poli_unique` (`doctor_id`,`poli_id`),
  ADD KEY `doctor_poli_poli_id_foreign` (`poli_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_obat`
--
ALTER TABLE `kategori_obat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indeks untuk tabel `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_rekam` (`kode_rekam`),
  ADD KEY `fk_patient` (`patient_id`),
  ADD KEY `fk_doctor` (`doctor_id`),
  ADD KEY `fk_poli` (`poli_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_obat` (`kode_obat`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patients_rekam_medis_unique` (`rekam_medis`),
  ADD UNIQUE KEY `patients_nik_unique` (`nik`);

--
-- Indeks untuk tabel `polis`
--
ALTER TABLE `polis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `polis_kode_poli_unique` (`kode_poli`);

--
-- Indeks untuk tabel `riwayat_stok`
--
ALTER TABLE `riwayat_stok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_id` (`obat_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `billings`
--
ALTER TABLE `billings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `billing_details`
--
ALTER TABLE `billing_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `doctor_poli`
--
ALTER TABLE `doctor_poli`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori_obat`
--
ALTER TABLE `kategori_obat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `polis`
--
ALTER TABLE `polis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `riwayat_stok`
--
ALTER TABLE `riwayat_stok`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `billings`
--
ALTER TABLE `billings`
  ADD CONSTRAINT `fk_billings_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `billing_details`
--
ALTER TABLE `billing_details`
  ADD CONSTRAINT `fk_billing_details_billing` FOREIGN KEY (`billing_id`) REFERENCES `billings` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `doctor_poli`
--
ALTER TABLE `doctor_poli`
  ADD CONSTRAINT `doctor_poli_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctor_poli_poli_id_foreign` FOREIGN KEY (`poli_id`) REFERENCES `polis` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_poli` FOREIGN KEY (`poli_id`) REFERENCES `polis` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_obat` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `riwayat_stok`
--
ALTER TABLE `riwayat_stok`
  ADD CONSTRAINT `riwayat_stok_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
