-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2018 at 02:02 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
(2, 'Finance', '2017-08-15 09:55:03', '2017-08-15 09:55:03'),
(3, 'Science', '2017-08-15 15:00:02', '2017-08-15 15:00:02'),
(4, 'Film', '2017-08-15 15:00:07', '2017-08-15 15:00:07'),
(5, 'Entertainment', '2017-08-17 16:23:34', '2017-08-17 16:23:34'),
(6, 'Sports', '2017-08-17 16:23:48', '2017-08-17 16:23:48'),
(7, 'Music', '2017-08-17 16:25:39', '2017-08-17 16:25:39'),
(8, 'Education', '2017-08-17 16:25:54', '2017-08-17 16:25:54'),
(9, 'News', '2017-08-17 16:26:26', '2017-08-17 16:26:26'),
(19, 'Health', '2017-08-21 10:40:55', '2017-08-21 10:40:55'),
(20, 'Technology', '2018-03-07 10:51:24', '2018-03-07 10:51:24');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `comment`, `created_at`, `updated_at`) VALUES
(27, 6, 69, 'Admin PHP Codeigniter COMMENT 1', '2018-03-10 11:47:38', '2018-03-10 11:47:38'),
(28, 6, 69, 'Admin PHP Codeigniter comment 2', '2018-03-10 11:47:55', '2018-03-10 11:47:55'),
(29, 6, 86, 'Admin Sudden death comment 1', '2018-03-10 11:48:51', '2018-03-10 11:48:51'),
(30, 6, 86, 'Admin Sudden death comment 2', '2018-03-10 11:48:57', '2018-03-10 11:48:57'),
(31, 6, 76, 'Admin finance help comment 1', '2018-03-10 11:49:22', '2018-03-10 11:49:22'),
(35, 7, 71, 'User1 Bollywood comment 1', '2018-03-10 11:51:55', '2018-03-10 11:51:55'),
(36, 7, 78, 'User1 cartoon network  comment 1', '2018-03-10 11:52:16', '2018-03-10 11:52:16'),
(37, 7, 87, 'User1 PHP laravel comment 1', '2018-03-10 11:52:28', '2018-03-10 11:52:28'),
(38, 7, 88, 'User1 technology comment 1', '2018-03-10 11:53:00', '2018-03-10 11:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_15_113504_create_posts_table', 2),
(4, '2017_08_15_113520_create_categories_table', 2),
(5, '2017_08_15_113539_create_comments_table', 2),
(6, '2017_08_15_113555_create_likes_table', 2),
(7, '2017_08_15_113612_create_dislikes_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_title`, `post_body`, `category_id`, `post_image`, `created_at`, `updated_at`) VALUES
(69, 6, 'PHP Codeigniter', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 8, 'codeigniter-img_1520679430.png', '2018-03-10 09:57:10', '2018-03-10 09:57:10'),
(71, 7, 'Bollywood', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc', 4, 'bollywood_1520679789.jpg', '2018-03-10 10:03:09', '2018-03-10 10:03:09'),
(72, 9, 'films', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 4, 'bollywood2_1520679834.jpg', '2018-03-10 10:03:54', '2018-03-10 10:03:54'),
(73, 9, 'science post', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 3, 'Science_1520679889.png', '2018-03-10 10:04:49', '2018-03-10 10:04:49'),
(74, 10, 'Nasa news', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 3, 'science2_1520679955.png', '2018-03-10 10:05:55', '2018-03-10 10:05:55'),
(75, 10, 'Finance news', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 2, 'finance_1520679992.jpg', '2018-03-10 10:06:32', '2018-03-10 10:06:32'),
(76, 6, 'finance help', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 2, 'finance2_1520680071.jpg', '2018-03-10 10:07:51', '2018-03-10 10:07:51'),
(77, 6, 'Hollywood', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 5, 'hollywood_1520680175.jpg', '2018-03-10 10:09:35', '2018-03-10 10:09:35'),
(78, 7, 'cartoon network', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 5, 'hollywood2_1520680210.jpg', '2018-03-10 10:10:10', '2018-03-10 10:10:10'),
(79, 7, 'football', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 6, 'football_1520680298.jpg', '2018-03-10 10:11:38', '2018-03-10 10:11:38'),
(80, 8, 'cricket news', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 6, 'cricket_1520680326.jpg', '2018-03-10 10:12:06', '2018-03-10 10:12:06'),
(81, 8, 'Enrique songs', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 7, '1_1520680422.jpg', '2018-03-10 10:13:42', '2018-03-10 10:13:42'),
(82, 9, 'guitar', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 7, 'guitar_1520680458.jpg', '2018-03-10 10:14:18', '2018-03-10 10:14:18'),
(83, 9, 'news', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 9, 'news1_1520680511.gif', '2018-03-10 10:15:11', '2018-03-10 10:15:11'),
(84, 10, 'politcal news', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 9, 'news_1520680550.gif', '2018-03-10 10:15:50', '2018-03-10 10:15:50'),
(85, 10, 'Cancer', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 19, 'health_1520680590.jpg', '2018-03-10 10:16:30', '2018-03-10 10:16:30'),
(86, 6, 'Sudden death', 'Why do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable E', 19, 'health2_1520680671.jpg', '2018-03-10 10:17:51', '2018-03-10 10:17:51'),
(87, 7, 'PHP laravel is the best', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'', 20, 'laravel_1520680804.jpg', '2018-03-10 10:20:04', '2018-03-10 10:20:04'),
(88, 7, 'Technology helps you to grow', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'', 20, 'tecknology_1520680832.jpg', '2018-03-10 10:20:32', '2018-03-10 10:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Admin', 'admin@gmail.com', '$2y$10$dcv1s/TWnHqYw5ByqQ4EUO6UDmPdGPIo7S7A3krWym/HZ4R/KAtha', '7MMf5rY0sP0KVFm7l4vV0Whl3nrSoZXshOu9huYYDDn3YqR6dw9146j0dKG5', '2017-08-20 11:52:54', '2017-08-20 11:52:54'),
(7, 'User1', 'user1@gmail.com', '$2y$10$8Rk6vPC4coCHyq6qdbqbCeaYrfr7gAKjqKsjzEJsKu1ICigphZWK6', 'KBxeDiH5kJ07qiq8KhKfQLtiHETX9jTNoGQnrwQtMhrIwBwXRUqBdvGulGiS', '2017-08-20 11:55:17', '2017-08-20 11:55:17'),
(8, 'user2', 'user2@gmail.com', '$2y$10$Y.qDVQ44Co8BXfo4oZfXVOhU.AdcJ9FnyXQPNtg9AY./c8wgQqqxG', 'odF4CJxoFSPKvBqm3hydnnLiZQOCw7KaFHEcUBaoPAvD3xgvBK8SiBpUzxrC', '2017-08-20 11:55:39', '2017-08-20 11:55:39'),
(9, 'user3', 'user3@gmail.com', '$2y$10$.sNBem8dZWYF3.N9mOXZj.dR33c5ZkWoSEdpUpbc6KiAQqBwpt5x.', 'ZN4CJqpfl3at7Fm44l0X3D1uj6IGygyIMjtQy66QuLTqgoz7srK9GTbT6rZD', '2018-02-14 17:09:14', '2018-02-14 17:09:14'),
(10, 'user4', 'user4@gmail.com', '$2y$10$rNXAwrshQ0z6EfSK2YvECuM5rWj9wg6rmnHpf/1cVzZoGKFhDacLu', 'dM8SP51D6vZYFtK906VE7LQYcPvuSCsOf1MGVqirZVHKmQ9gWHfW00mIjeEw', '2018-03-10 07:42:33', '2018-03-10 07:42:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
