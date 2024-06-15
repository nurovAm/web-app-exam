-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 14 2024 г., 23:32
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `std_2320_exam`
--

-- --------------------------------------------------------

--
-- Структура таблицы `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('65f8fff40933');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `publisher_year` int NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `size` int NOT NULL,
  `short_desc` varchar(500) NOT NULL,
  `full_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `name`, `publisher_year`, `publisher`, `author`, `size`, `short_desc`, `full_desc`) VALUES
(54, 'Анна Каренина', 2020, 'Издатель', 'Автор', 200, 'Короткое описание', 'Полное описание                \n            '),
(55, 'aasdf', 32, 'sfd', 'asfd', 324, 'asdf', '                asdf'),
(56, 'adsfasdf', 324, 'fsasdf', 'fasdfsadfdas', 234, 'asdfasdfsadf', '                sadfsadfsad\n            '),
(57, 'asdfsadf', 234, 'asdfasdfasdf', 'asdfsadf', 234, 'sfasdfasdf', '                \n            sadfasdf'),
(58, 'asdfasdf', 32234, 'sadfasdf', 'sadfasdfasdf', 23423, 'asdfasfsdf', '                \n    asdfasdf        '),
(59, 'sdafasd', 23423, 'fasdf', 'sadfasd', 234234, 'fsdafsadf', '                \n            sadf');

-- --------------------------------------------------------

--
-- Структура таблицы `books_category`
--

CREATE TABLE `books_category` (
  `id` int NOT NULL,
  `book_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `books_category`
--

INSERT INTO `books_category` (`id`, `book_id`, `category_id`) VALUES
(43, 54, 1),
(44, 54, 3),
(45, 55, 1),
(46, 55, 3),
(47, 56, 1),
(48, 57, 3),
(49, 58, 1),
(50, 59, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `books_collection`
--

CREATE TABLE `books_collection` (
  `id` int NOT NULL,
  `book_id` int NOT NULL,
  `collection_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `books_collection`
--

INSERT INTO `books_collection` (`id`, `book_id`, `collection_id`) VALUES
(1, 58, 18),
(2, 59, 19),
(3, 58, 20),
(4, 56, 18),
(5, 59, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Приключения'),
(3, 'Ужасы');

-- --------------------------------------------------------

--
-- Структура таблицы `collection`
--

CREATE TABLE `collection` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `collection`
--

INSERT INTO `collection` (`id`, `name`, `user_id`) VALUES
(18, 'love', 3),
(19, 'love', 3),
(20, 'love', 3),
(21, 'love', 3),
(22, 'my', 3),
(23, 'my', 3),
(24, 'my', 3),
(25, 'asd', 3),
(26, 'dasfasdf', 3),
(27, 'asdfasdf', 3),
(28, 'asdfasdf', 3),
(29, 'sdaf', 3),
(30, 'mylove', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `cover`
--

CREATE TABLE `cover` (
  `id` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL,
  `book_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cover`
--

INSERT INTO `cover` (`id`, `file_name`, `mime_type`, `md5_hash`, `book_id`) VALUES
('309d394f-b020-48d3-9626-f8ad3c4b40fa', 'photo_2024-06-10_20-43-26.jpg', 'image/jpeg', '32ea89b7f8713a2d5864238ba94be8cf', 58),
('7077719c-0032-4a6c-80f4-5d918f909a74', 'photo_2024-06-12_08-27-11.jpg', 'image/jpeg', '6eaf41e770a93848261969e9c021fae1', 54),
('85eeffeb-af06-4367-a96f-d9fe8e53d31e', 'photo_2024-03-28_18-53-22.jpg', 'image/jpeg', '3928fb2c5fee40dbf22b6f79789ae0bb', 56),
('8f8e5003-bb27-41c6-a79e-374f25e8e959', 'photo_2024-06-12_22-45-52.jpg', 'image/jpeg', '4a532057c01a37c9bfed64327592638c', 57);

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE `review` (
  `id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `rating` int NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `review`
--

INSERT INTO `review` (`id`, `book_id`, `user_id`, `rating`, `text`, `created_at`) VALUES
(4, 54, 1, 5, 'выафвыа', '2024-06-13 21:23:47'),
(5, 54, 3, 3, 'плюс минус', '2024-06-13 21:32:02'),
(6, 58, 1, 5, '#### sadfasdf**asdfasdfsadf**', '2024-06-14 17:14:22');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`, `description`) VALUES
(1, 'Администратор', 'Суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг'),
(2, 'Модератор', 'может редактировать данные книг и производить модерацию рецензий'),
(3, 'Пользователь', 'может оставлять рецензии');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(200) NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `middle_name`, `login`, `password_hash`, `role_id`) VALUES
(1, 'Амир', 'Нуров', 'Тахирович', 'amir', 'scrypt:32768:8:1$eQrvvOJVfasukNb0$4219d0b04c11ceeb7d47bbf223ee52916b6b8f69a9a477dbd737fb0bc54f39d7d5a8514449199b24041f9c3fc5fc442f67c7194e497b5e95338221f845fa6888', 1),
(2, 'moder', 'moder', 'moder', 'moder', 'scrypt:32768:8:1$FtN2IATTeWThWSG8$2f0b56707b1c1233cccf1c0ce379f6f521963a30314b952c255a6498cbcfc66d09a05f0d0c330e1a1beeb9bf25e930a7b6b671bd682f60616ab89666380cc871', 2),
(3, 'user', 'user', 'user', 'user', 'scrypt:32768:8:1$Ayz82wukeW2NcxD4$683464216a55736a2c938b6a5b1833ebcfc066fa5598510d5e42c6b78b02cab1c4ffe137364735077c605a56b3d1f3140b9d286fac048597d1c6f5ff3659bac2', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books_category`
--
ALTER TABLE `books_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `books_collection`
--
ALTER TABLE `books_collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `collection_id` (`collection_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `cover`
--
ALTER TABLE `cover`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `md5_hash` (`md5_hash`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `books_category`
--
ALTER TABLE `books_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `books_collection`
--
ALTER TABLE `books_collection`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books_category`
--
ALTER TABLE `books_category`
  ADD CONSTRAINT `books_category_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `books_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `books_collection`
--
ALTER TABLE `books_collection`
  ADD CONSTRAINT `books_collection_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `books_collection_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`);

--
-- Ограничения внешнего ключа таблицы `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `cover`
--
ALTER TABLE `cover`
  ADD CONSTRAINT `cover_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Ограничения внешнего ключа таблицы `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
