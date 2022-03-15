-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2021 at 11:49 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `egycon_trivia`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `right_answer` tinyint(1) NOT NULL DEFAULT 0,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `right_answer`, `question_id`) VALUES
(1, 'Mo. Salah', 0, 1),
(2, 'Kirito', 0, 1),
(3, 'Levi', 0, 1),
(4, 'Ritsu', 1, 1),
(5, 'Kurapika', 0, 2),
(6, 'Borsalino', 0, 2),
(7, 'Minato', 0, 2),
(8, 'All Might', 1, 2),
(9, 'Ryuk/ Death Note', 0, 3),
(10, 'Hisoka/ Hunter x Hunter', 0, 3),
(11, 'Itachi', 0, 3),
(12, 'DEKO Midoriya/ BNHA', 1, 3),
(13, 'Vegta/ Dragon Ball', 0, 4),
(14, 'Ray/ The Promised Never Land', 0, 4),
(15, 'Wizard Howl/ Howl\'s Moving Castle', 0, 4),
(16, 'kara/ jojo\'s bizarre adventure', 1, 4),
(17, 'Minato/naruto', 0, 5),
(18, 'Cavendish/one piece', 0, 5),
(19, 'Erwin Smith/ AOT', 0, 5),
(20, 'Basil Hawkins/ One Piece', 1, 5),
(21, 'Erza/ Fairy Tail', 0, 6),
(22, 'Bon Kurei/one piece', 0, 6),
(23, 'Tsunade/ Naruto', 0, 6),
(24, 'Nico Robin/ One Piece', 1, 6),
(25, '10 مدرسين', 0, 7),
(26, '6 مدرسين', 0, 7),
(27, '12 مدرس', 0, 7),
(28, '9 مدرسين', 1, 7),
(29, 'Insect Awareness', 0, 8),
(30, 'Mist Breathing', 0, 8),
(31, 'Insect Breathing', 0, 8),
(32, 'Spatial Awareness', 1, 8),
(33, 'Izanami', 0, 9),
(34, 'Gelus', 0, 9),
(35, 'Midora', 0, 9),
(36, 'Rem', 1, 9),
(37, 'Arioshi', 0, 10),
(38, 'Banzai', 0, 10),
(39, 'Asuka', 0, 10),
(40, 'Anteiku', 1, 10),
(41, 'None of those', 0, 11),
(42, 'Koji Koda', 0, 11),
(43, 'Ryukyu', 0, 11),
(44, 'Uraraka', 1, 11),
(45, 'يوم واحد', 0, 12),
(46, 'اربعة ايام', 0, 12),
(47, 'ثلاثة ايام', 0, 12),
(48, 'يومين', 1, 12),
(49, 'Kakashi', 0, 13),
(50, 'Asuma', 0, 13),
(51, 'Iruka', 0, 13),
(52, 'Hiruzen Sarutobi', 1, 13),
(53, 'Inosuke Hashibira', 0, 14),
(54, 'Uzui Tengen', 0, 14),
(55, 'Rengoku Senjuro', 0, 14),
(56, 'Kamado Tanjiro', 1, 14),
(57, 'Inko Midoriya', 0, 15),
(58, 'All for One', 0, 15),
(59, 'Midoriya', 0, 15),
(60, 'Nana Shimura', 1, 15),
(61, 'Sota', 0, 16),
(62, 'Kazuo', 0, 16),
(63, 'Ryo', 0, 16),
(64, 'Ayato', 1, 16),
(65, 'Gomoku', 0, 17),
(66, 'Mahjong', 0, 17),
(67, 'Shogi', 0, 17),
(68, 'Gungi', 1, 17),
(69, 'Hakabou', 0, 18),
(70, 'Oak Town', 0, 18),
(71, 'Magnolia', 0, 18),
(72, 'Tenroujima', 1, 18),
(73, 'Muzan', 0, 19),
(74, 'Kyogai', 0, 19),
(75, 'Hisoka', 0, 19),
(76, 'Akaza', 1, 19),
(77, '5 إصبع', 0, 20),
(78, '10 أصابع', 0, 20),
(79, '15 إصبع', 0, 20),
(80, '20 إصبع', 1, 20),
(81, 'Sukuna', 0, 21),
(82, 'Panda', 0, 21),
(83, 'Junipe', 0, 21),
(84, 'Gojou', 1, 21),
(85, 'Dark Void', 0, 22),
(86, 'Space Void', 0, 22),
(87, 'Cosmic Void', 0, 22),
(88, 'Unlimited Void', 1, 22),
(89, 'Magic particles', 0, 23),
(90, 'Cultivation', 0, 23),
(91, 'Ki', 0, 23),
(92, 'Cursed energy', 1, 23),
(93, 'Mito', 0, 24),
(94, 'Zeno', 0, 24),
(95, 'Dong', 0, 24),
(96, 'Ging', 1, 24),
(97, 'Clanned', 0, 25),
(98, 'Fruites Basket', 0, 25),
(99, 'The Seven Deadly Sins', 0, 25),
(100, 'Don\'t Toy With Me, Miss Nagatoro', 1, 25),
(101, 'Inuyasha/ Inuyasha', 0, 26),
(102, 'L/ Death Note', 0, 26),
(103, 'Killua/ Hunter x Hunter', 0, 26),
(104, 'Kirari Momobami/Kakeguri', 1, 26),
(105, 'Koro-sensei', 0, 27),
(106, 'Doflamingoo', 0, 27),
(107, 'Roy Mustang', 0, 27),
(108, 'meliodas', 1, 27),
(109, 'UA', 0, 28),
(110, 'Grace Feild House', 0, 28),
(111, 'Grand Valley', 0, 28),
(112, 'Goldy Pond', 1, 28),
(113, 'Gintama', 0, 29),
(114, 'BNHA', 0, 29),
(115, 'FMA', 0, 29),
(116, 'one punch man', 1, 29),
(117, 'Mazinger', 0, 30),
(118, 'kengan ashura', 0, 30),
(119, 'jojo\'s bizarre adventure', 0, 30),
(120, 'shin hokuto no ken', 1, 30),
(121, 'Eren/AOT', 0, 31),
(122, 'Obito/naruto', 0, 31),
(123, 'Ginro/Dr Stone', 0, 31),
(124, 'Kinro/ dr stone', 1, 31),
(125, 'Michael Faraday', 0, 32),
(126, 'Thomas Ediso', 0, 32),
(127, 'Isaac Newton', 0, 32),
(128, 'Albert Einstein', 1, 32),
(129, '130', 0, 33),
(130, '200', 0, 33),
(131, '170', 0, 33),
(132, '152', 1, 33),
(133, '1194', 0, 34),
(134, '22194', 0, 34),
(135, '63194', 0, 34),
(136, '81194', 1, 34),
(137, 'Minato', 0, 35),
(138, 'Naruto', 0, 35),
(139, 'tsunade', 0, 35),
(140, 'Kakashi', 1, 35),
(141, 'Zenitsu Agatsuma', 0, 36),
(142, 'Sanemi Shinazugawa', 0, 36),
(143, 'Toge Inumaki', 0, 36),
(144, 'Kento Nanami', 1, 36),
(145, 'jujutsu kaisen', 0, 37),
(146, 'BNHA', 0, 37),
(147, 'one punch man', 0, 37),
(148, 'Dr. stone', 1, 37),
(149, 'Satoshi isshiki', 0, 38),
(150, 'Megumi tadokoro', 0, 38),
(151, 'Azami nakiri', 0, 38),
(152, 'Soma yukihira', 1, 38),
(153, 'Laxus/ Fairy Tale', 0, 39),
(154, 'Enel/One piece', 0, 39),
(155, 'Weisz Steiner/Edenes Zero', 0, 39),
(156, 'nishinoya/ HAIKYUU', 1, 39),
(157, 'аниме', 0, 40),
(158, 'אַנימע', 0, 40),
(159, 'أنيمي', 0, 40),
(160, 'アニメ', 1, 40),
(161, 'Genos', 0, 41),
(162, 'Goko', 0, 41),
(163, 'Connie Springer', 0, 41),
(164, 'Kachan / BNHA', 1, 41),
(165, '500 punches', 0, 42),
(166, '10000 thunder', 0, 42),
(167, '5000 swords', 0, 42),
(168, '1000 birds', 1, 42);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `selected` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `name`, `description`, `image`, `created`, `selected`) VALUES
(1, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'Picture1.jpg', '0000-00-00 00:00:00', 0),
(2, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'Picture2.png', '0000-00-00 00:00:00', 0),
(3, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'Picture3.png', '0000-00-00 00:00:00', 0),
(4, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'Picture4.jpg', '0000-00-00 00:00:00', 0),
(5, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'Picture5.png', '0000-00-00 00:00:00', 0),
(6, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'Picture6.png', '0000-00-00 00:00:00', 0),
(7, 'كم عدد المدرسين الي درسوا لناروتو ؟', 'كم عدد المدرسين الي درسوا لناروتو ؟', NULL, '0000-00-00 00:00:00', 0),
(8, 'ما اسم القدرة التي استخدمها Inoske ليحدد مكان ( الأم ) أو المتحكمة في عائلة العناكب الذين كانوا يقاتلونها؟', 'ما اسم القدرة التي استخدمها Inoske ليحدد مكان ( الأم ) أو المتحكمة في عائلة العناكب الذين كانوا يقاتلونها؟', NULL, '0000-00-00 00:00:00', 0),
(9, 'ماهو اسم الشينيجامي الخاص بMISA ؟', 'ماهو اسم الشينيجامي الخاص بMISA ؟', NULL, '0000-00-00 00:00:00', 0),
(10, 'ما هو اسم المقهى الذي كان يعمل بيه kaneki ؟', 'ما هو اسم المقهى الذي كان يعمل بيه kaneki ؟', NULL, '0000-00-00 00:00:00', 0),
(11, 'ما اسم اول شخص انقذه Izuku Midoriya ؟', 'ما اسم اول شخص انقذه Izuku Midoriya ؟', NULL, '0000-00-00 00:00:00', 0),
(12, 'ما المدة التي قضاها Ichigo Kurosaki ليتعلم استخدام أول بانكاي له ؟', 'ما المدة التي قضاها Ichigo Kurosaki ليتعلم استخدام أول بانكاي له ؟', NULL, '0000-00-00 00:00:00', 0),
(13, 'من كان المتكفل بناروتو بعد وفاة والديه ؟', 'من كان المتكفل بناروتو بعد وفاة والديه ؟', NULL, '0000-00-00 00:00:00', 0),
(14, 'من الذي لديه حاسة الشم قوية في انمي demon slayer ؟', 'من الذي لديه حاسة الشم قوية في انمي demon slayer ؟', NULL, '0000-00-00 00:00:00', 0),
(15, 'من اين حصل All Might على قوته ؟', 'من اين حصل All Might على قوته ؟', NULL, '0000-00-00 00:00:00', 0),
(16, 'ما هو اسم اخ توكا من Tokyo ghoul؟', 'ما هو اسم اخ توكا من Tokyo ghoul؟', NULL, '0000-00-00 00:00:00', 0),
(17, 'ميريوم و كوجومي كانوا بيلعبوا بورد جيم اسمها ايه في هانتر ؟', 'ميريوم و كوجومي كانوا بيلعبوا بورد جيم اسمها ايه في هانتر ؟', NULL, '0000-00-00 00:00:00', 0),
(18, 'أين يقع قبر مايفيز في فيري تايل ؟', 'أين يقع قبر مايفيز في فيري تايل ؟', NULL, '0000-00-00 00:00:00', 0),
(19, 'ما اسم اسم الديمون الي قتل Kyojuro Rengoku في فيلم Demon slayer mugen train ؟', 'ما اسم اسم الديمون الي قتل Kyojuro Rengoku في فيلم Demon slayer mugen train ؟', NULL, '0000-00-00 00:00:00', 0),
(20, 'كم عدد الاصابع التي يمتلكها الSukuna ؟', 'كم عدد الاصابع التي يمتلكها الSukuna ؟', NULL, '0000-00-00 00:00:00', 1),
(21, 'من هو أقوى Jujutsu Sorcerer في jujutsu kaisen؟', 'من هو أقوى Jujutsu Sorcerer في jujutsu kaisen؟', NULL, '0000-00-00 00:00:00', 0),
(22, 'ما هواسم توسيع المجال الخاص ب Saturo Gojou؟', 'ما هواسم توسيع المجال الخاص ب Saturo Gojou؟', NULL, '0000-00-00 00:00:00', 0),
(23, 'قصة انمي jujutsu kaisen تتمحور حول طاقة تسمى بــ؟', 'قصة انمي jujutsu kaisen تتمحور حول طاقة تسمى بــ؟', NULL, '0000-00-00 00:00:00', 0),
(24, 'ماهو اسم والد جون في هانتر ؟', 'ماهو اسم والد جون في هانتر ؟', NULL, '0000-00-00 00:00:00', 0),
(25, 'ما اسم هذا الأنمي؟', 'ما اسم هذا الأنمي؟', 'Ganbare Ganbare Senpai.mp4', '0000-00-00 00:00:00', 0),
(26, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'image.jpg', '0000-00-00 00:00:00', 0),
(27, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'SATE SATE SATE V2.mp4', '0000-00-00 00:00:00', 1),
(28, 'اين سافروا emma , Ray and Yugo لكي يجدوا Minerva؟', 'اين سافروا emma , Ray and Yugo لكي يجدوا Minerva؟', NULL, '0000-00-00 00:00:00', 0),
(29, 'ماهو الأنمي الذي توجد به هذه الشخصية؟', 'ماهو الأنمي الذي توجد به هذه الشخصية؟', 'unknown.png', '0000-00-00 00:00:00', 0),
(30, 'ما اسم الانمي الذي قيلت فيه هذه العبارة؟', 'ما اسم الانمي الذي قيلت فيه هذه العبارة؟', 'Omae Wa Mou Shindeiru - Original From Fist of The North Star Anime.mp4', '0000-00-00 00:00:00', 0),
(31, 'من قائل هذه العبارة؟', 'من قائل هذه العبارة؟', 'Compilation of Kinro saying _Rules are Rules_ - Dr. Stone.mp4\r\n', '0000-00-00 00:00:00', 0),
(32, 'من صاحب المعادلة الشهيرة على ملابس سينكو؟', 'من صاحب المعادلة الشهيرة على ملابس سينكو؟', NULL, '0000-00-00 00:00:00', 0),
(33, 'كم عدد الرصاصات التي تلقاها Whitebeard في الParamount War؟', 'كم عدد الرصاصات التي تلقاها Whitebeard في الParamount War؟', NULL, '0000-00-00 00:00:00', 0),
(34, 'ما هو رقم Ray في انميthe promised neverland ؟', 'ما هو رقم Ray في انميthe promised neverland ؟', NULL, '0000-00-00 00:00:00', 0),
(35, 'من هو الهوكاجي السادس؟', 'من هو الهوكاجي السادس؟', NULL, '0000-00-00 00:00:00', 0),
(36, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'image.png', '0000-00-00 00:00:00', 0),
(37, 'ما اسم هذا الأنمي؟', 'ما اسم هذا الأنمي؟', 'senku360Pmp3Music.mp4', '0000-00-00 00:00:00', 0),
(38, 'من هو البطل الاساسي في انمي food wars؟', 'من هو البطل الاساسي في انمي food wars؟', NULL, '0000-00-00 00:00:00', 0),
(39, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'rollingthunder360Pmp3Ringtone.mp4', '0000-00-00 00:00:00', 0),
(40, 'How do you spell anime in Japanese?', 'How do you spell anime in Japanese?', NULL, '0000-00-00 00:00:00', 0),
(41, 'ما اسم هذه الشخصية ؟', 'ما اسم هذه الشخصية ؟', 'kuchanheroacademy360Pmp3Music.mp4', '0000-00-00 00:00:00', 0),
(42, 'مامعنى كلمة Chidori؟', 'مامعنى كلمة Chidori؟', NULL, '0000-00-00 00:00:00', 0),
(43, 'Say  “Watashi wa baka’’ Out loud', 'Say  “Watashi wa baka’’ Out loud', NULL, '0000-00-00 00:00:00', 0),
(44, 'Say  ‘EGYCON ga daisuki desu’’ Out loud', 'Say  ‘EGYCON ga daisuki desu’’ Out loud', NULL, '0000-00-00 00:00:00', 0),
(45, 'Laugh like ‘’Brook’’ from one piece', 'Laugh like ‘’Brook’’ from one piece', NULL, '0000-00-00 00:00:00', 1),
(46, 'قلد صوت بيكاتشو', 'قلد صوت بيكاتشو', NULL, '0000-00-00 00:00:00', 0),
(47, 'اتني رجل و احده و ارفعها لوراء و ميل راسك و قول oni  chan', 'اتني رجل و احده و ارفعها لوراء و ميل راسك و قول oni  chan', NULL, '0000-00-00 00:00:00', 0),
(48, 'Do naruto run', 'Do naruto run', NULL, '0000-00-00 00:00:00', 1),
(49, 'قول ( omae wa mou shindeiru ) من غير ما تقفل بوقك', 'قول ( omae wa mou shindeiru ) من غير ما تقفل بوقك', NULL, '0000-00-00 00:00:00', 0),
(50, 'Say “Kage bunshin no jutsu” 5 times fast', 'Say “Kage bunshin no jutsu” 5 times fast', NULL, '2021-10-06 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
