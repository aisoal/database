-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Server version: 5.7.44-log
-- PHP Version: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aisoal`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `generation_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `generation_sessions`
--

CREATE TABLE `generation_sessions` (
  `id` varchar(21) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `question_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_fk_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prompt_templates`
--

CREATE TABLE `prompt_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `generation_logs`
--

CREATE TABLE `generation_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(21) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `duration` decimal(10,2) NOT NULL COMMENT 'Durasi proses AI dalam detik',
  `pages` varchar(255) DEFAULT NULL COMMENT 'Halaman yang dipilih, cth: 1-3, 5, 8',
  `input_tokens` int(11) NOT NULL DEFAULT '0',
  `output_tokens` int(11) NOT NULL DEFAULT '0',
  `total_tokens` int(11) NOT NULL DEFAULT '0',
  `question_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Jumlah soal yang dihasilkan di log ini',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `generated_questions`
--

CREATE TABLE `generated_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `options` json DEFAULT NULL,
  `answer` text NOT NULL,
  `explanation` text,
  `source_text` text,
  `keywords` json DEFAULT NULL,
  `difficulty` varchar(50) DEFAULT NULL,
  `confidence` varchar(20) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `source` varchar(250) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL COMMENT 'Estimasi waktu pengerjaan siswa',
  PRIMARY KEY (`id`),
  KEY `idx_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `generated_questions`
--
ALTER TABLE `generated_questions`
  ADD CONSTRAINT `fk_question_to_log` FOREIGN KEY (`log_id`) REFERENCES `generation_logs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `generation_logs`
--
ALTER TABLE `generation_logs`
  ADD CONSTRAINT `fk_log_to_session` FOREIGN KEY (`session_id`) REFERENCES `generation_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_log_to_template` FOREIGN KEY (`template_id`) REFERENCES `prompt_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `generation_sessions`
--
ALTER TABLE `generation_sessions`
  ADD CONSTRAINT `fk_session_to_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;