-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Sty 2020, 18:52
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `erasmus`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `races`
--

CREATE TABLE `races` (
  `id` int(16) NOT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `slots` int(4) NOT NULL,
  `localization` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `age_min` int(2) NOT NULL,
  `age_max` int(3) NOT NULL,
  `deadline` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `race_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `races`
--

INSERT INTO `races` (`id`, `gender`, `slots`, `localization`, `age_min`, `age_max`, `deadline`, `race_date`, `status`, `name`, `details`) VALUES
(1, 'ALL', 16, 'Madrid', 16, 40, '2019-11-19 16:00:51', '2019-11-30 00:00:00', 'OPEN', '', ''),
(2, 'ALL', 16, 'Paris', 16, 40, '2019-11-19 16:00:47', '2019-11-30 00:00:00', 'OPEN', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `race_signup`
--

CREATE TABLE `race_signup` (
  `race_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `race_signup`
--

INSERT INTO `race_signup` (`race_id`, `user_id`) VALUES
(2, 5),
(1, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `token`
--

CREATE TABLE `token` (
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `token`
--

INSERT INTO `token` (`token`, `user`, `last_used`) VALUES
('6639106525824821TOK', 1, '2019-12-15 17:11:32'),
('7412179252035539TOK', 6, '2019-12-15 17:37:56'),
('8476684760258122TOK', 5, '2020-01-05 17:50:37'),
('av', 3, '2019-12-10 22:01:03');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USER',
  `track_record` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `age`, `gender`, `role`, `track_record`) VALUES
(1, 'asd', 'AAA@a', '$2y$10$2K81Q2gPveuyBw25.lyex.TqSb.a/xasMMNKEpEhTT2Zi.GWl7GUC', 22, 'Male', 'User', '-'),
(2, 'aa', 'aas', 'sas', 12, 'mm', 'User', '-'),
(3, 'aaa', 'ABAS@a', '$2y$10$3ZPbkdVP04T6dFzORNk0Bel7T7il5sB1/DcV73WRjuYY7fUqlnULu', 22, 'Male', 'User', '-'),
(4, 'bbb', 'bbb@b', '$2y$10$62aQjogrOPcP2ivvanLg9u6BKk/RgouH0YuQYEXt84tYijY11/fMq', 22, 'Male', 'User', '-'),
(5, 'CCC', 'CCC@C', '$2y$10$q7dtt7ROv9fXQjrDdOrX8.p5K0xWjIyLFT3GV57/.9XnlOjtfgz/q', 22, 'Male', 'User', '-'),
(6, 'DDD', 'DDD@D', '$2y$10$rGem1Snlx8aEBih1cXLiIOLVFDsvp2keBJHItx.xN6DwnDiBcd4l2', 22, 'Male', 'User', '-');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `race_signup`
--
ALTER TABLE `race_signup`
  ADD KEY `race_id_a` (`race_id`),
  ADD KEY `user_id_a` (`user_id`);

--
-- Indeksy dla tabeli `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id_token` (`user`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_user` (`email`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `races`
--
ALTER TABLE `races`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `race_signup`
--
ALTER TABLE `race_signup`
  ADD CONSTRAINT `race_id_a` FOREIGN KEY (`race_id`) REFERENCES `races` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `user_id_token` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
