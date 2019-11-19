-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Lis 2019, 17:13
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
  `status` varchar(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `races`
--

INSERT INTO `races` (`id`, `gender`, `slots`, `localization`, `age_min`, `age_max`, `deadline`, `race_date`, `status`) VALUES
(1, 'ALL', 16, 'Madrid', 16, 40, '2019-11-19 16:00:51', '2019-11-30 00:00:00', 'OPEN'),
(2, 'ALL', 16, 'Paris', 16, 40, '2019-11-19 16:00:47', '2019-11-30 00:00:00', 'OPEN');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `race_signup`
--

CREATE TABLE `race_signup` (
  `race_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `token`
--

CREATE TABLE `token` (
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

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
