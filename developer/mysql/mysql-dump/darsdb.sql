-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Мар 15 2023 г., 20:30
-- Версия сервера: 5.7.41
-- Версия PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `darsdb`
--
CREATE DATABASE IF NOT EXISTS `darsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `darsdb`;

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(555) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Автор',
  `country_id` int(11) DEFAULT NULL COMMENT 'ID страны ''country'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сущность Автор';

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('superadmin', '1', 1678887788);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1678885908, 1678885908),
('client', 1, NULL, NULL, NULL, 1678885938, 1678885938),
('superadmin', 1, NULL, NULL, NULL, 1678885922, 1678885922);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('superadmin', '/*');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(555) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `author_id` int(11) DEFAULT NULL COMMENT 'ID автора ''author''',
  `publish_date` date DEFAULT NULL COMMENT 'Дата публикации'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сущность Книга';

-- --------------------------------------------------------

--
-- Структура таблицы `book_genre`
--

CREATE TABLE `book_genre` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL COMMENT 'ID книги ''book''',
  `genre_id` int(11) NOT NULL COMMENT 'ID жанра ''genre'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Какие жанры имеют книги';

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `code` int(10) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alpha2` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alpha3` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `code`, `name`, `fullname`, `alpha2`, `alpha3`) VALUES
(1, 36, 'АВСТРАЛИЯ', 'АВСТРАЛИЯ', 'AU', 'AUS'),
(2, 40, 'АВСТРИЯ', 'АВСТРИЙСКАЯ РЕСПУБЛИКА', 'AT', 'AUT'),
(3, 31, 'АЗЕРБАЙДЖАН', 'РЕСПУБЛИКА АЗЕРБАЙДЖАН', 'AZ', 'AZE'),
(4, 8, 'АЛБАНИЯ', 'РЕСПУБЛИКА АЛБАНИЯ', 'AL', 'ALB'),
(5, 12, 'АЛЖИР', 'АЛЖИРСКАЯ НАРОДНАЯ ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА', 'DZ', 'DZA'),
(6, 660, 'АНГИЛЬЯ', 'АНГИЛЬЯ', 'AI', 'AIA'),
(7, 24, 'АНГОЛА', 'РЕСПУБЛИКА АНГОЛА', 'AO', 'AGO'),
(8, 20, 'АНДОРРА', 'КНЯЖЕСТВО АНДОРРА', 'AD', 'AND'),
(9, 10, 'АНТАРКТИДА', 'АНТАРКТИДА', 'AQ', 'ATA'),
(10, 28, 'АНТИГУА И БАРБУДА', 'АНТИГУА И БАРБУДА', 'AG', 'ATG'),
(11, 32, 'АРГЕНТИНА', 'АРГЕНТИНСКАЯ РЕСПУБЛИКА', 'AR', 'ARG'),
(12, 51, 'АРМЕНИЯ', 'РЕСПУБЛИКА АРМЕНИЯ', 'AM', 'ARM'),
(13, 533, 'АРУБА', 'ОСТРОВ АРУБА', 'AW', 'ABW'),
(14, 4, 'АФГАНИСТАН', 'ПЕРЕХОДНОЕ ИСЛАМСКОЕ ГОСУДАРСТВО АФГАНИСТАН', 'AF', 'AFG'),
(15, 44, 'БАГАМЫ', 'СОДРУЖЕСТВО БАГАМЫ', 'BS', 'BHS'),
(16, 50, 'БАНГЛАДЕШ', 'НАРОДНАЯ РЕСПУБЛИКА БАНГЛАДЕШ', 'BD', 'BGD'),
(17, 52, 'БАРБАДОС', 'БАРБАДОС', 'BB', 'BRB'),
(18, 48, 'БАХРЕЙН', 'КОРОЛЕВСТВО БАХРЕЙН', 'BH', 'BHR'),
(19, 112, 'БЕЛАРУСЬ', 'РЕСПУБЛИКА БЕЛАРУСЬ', 'BY', 'BLR'),
(20, 84, 'БЕЛИЗ', 'БЕЛИЗ', 'BZ', 'BLZ'),
(21, 56, 'БЕЛЬГИЯ', 'КОРОЛЕВСТВО БЕЛЬГИИ', 'BE', 'BEL'),
(22, 204, 'БЕНИН', 'РЕСПУБЛИКА БЕНИН', 'BJ', 'BEN'),
(23, 60, 'БЕРМУДЫ', 'БЕРМУДСКИЕ ОСТРОВА', 'BM', 'BMU'),
(24, 100, 'БОЛГАРИЯ', 'РЕСПУБЛИКА БОЛГАРИЯ', 'BG', 'BGR'),
(25, 68, 'БОЛИВИЯ', 'РЕСПУБЛИКА БОЛИВИЯ', 'BO', 'BOL'),
(26, 70, 'БОСНИЯ И ГЕРЦЕГОВИНА', 'БОСНИЯ И ГЕРЦЕГОВИНА', 'BA', 'BIH'),
(27, 72, 'БОТСВАНА', 'РЕСПУБЛИКА БОТСВАНА', 'BW', 'BWA'),
(28, 76, 'БРАЗИЛИЯ', 'ФЕДЕРАТИВНАЯ РЕСПУБЛИКА БРАЗИЛИЯ', 'BR', 'BRA'),
(29, 86, 'БРИТАН. ТЕРРИТ.', 'БРИТАНСКАЯ ТЕРРИТОРИЯ В ИНДИЙСКОМ ОКЕАНЕ (БРИТ.)', 'IO', 'IOT'),
(30, 96, 'БРУНЕЙ', 'БРУНЕЙ-ДАРУССАЛАМ', 'BN', 'BRN'),
(31, 74, 'БУВЕ', 'ОСТРОВ БУВЕ', 'BV', 'BVT'),
(32, 854, 'БУРКИНА-ФАСО', 'БУРКИНА-ФАСО', 'BF', 'BFA'),
(33, 108, 'БУРУНДИ', 'РЕСПУБЛИКА БУРУНДИ', 'BI', 'BDI'),
(34, 64, 'БУТАН', 'КОРОЛЕВСТВО БУТАН', 'BT', 'BTN'),
(35, 548, 'ВАНУАТУ', 'РЕСПУБЛИКА ВАНУАТУ', 'VU', 'VUT'),
(36, 336, 'ВАТИКАН', 'ПАПСКИЙ ПРЕСТОЛ (ГОСУДАРСТВО-ГОРОД ВАТИКАН)', 'VA', 'VAT'),
(37, 348, 'ВЕНГРИЯ', 'ВЕНГЕРСКАЯ РЕСПУБЛИКА', 'HU', 'HUN'),
(38, 862, 'ВЕНЕСУЭЛА', 'БОЛИВАРИЙСКАЯ РЕСПУБЛИКА ВЕНЕСУЭЛА', 'VE', 'VEN'),
(39, 850, 'ВИРГИН. О-ВА', 'ВИРГИНСКИЕ ОСТРОВА (США)', 'VI', 'VIR'),
(40, 92, 'ВИРГИН. О-ВА, БРИТАНСКИЕ', 'БРИТАНСКИЕ ВИРГИНСКИЕ ОСТРОВА', 'VG', 'VGB'),
(41, 16, 'ВОСТОЧНОЕ САМОА', 'АМЕРИКАНСКОЕ САМОА (США)', 'AS', 'ASM'),
(42, 704, 'ВЬЕТНАМ', 'СОЦИАЛИСТИЧЕСКАЯ РЕСПУБЛИКА ВЬЕТНАМ', 'VN', 'VNM'),
(43, 266, 'ГАБОН', 'ГАБОНСКАЯ РЕСПУБЛИКА', 'GA', 'GAB'),
(44, 332, 'ГАИТИ', 'РЕСПУБЛИКА ГАИТИ', 'HT', 'HTI'),
(45, 328, 'ГАЙАНА', 'РЕСПУБЛИКА ГАЙАНА', 'GY', 'GUY'),
(46, 270, 'ГАМБИЯ', 'РЕСПУБЛИКА ГАМБИЯ', 'GM', 'GMB'),
(47, 288, 'ГАНА', 'РЕСПУБЛИКА ГАНА', 'GH', 'GHA'),
(48, 312, 'ГВАДЕЛУПА', 'ГВАДЕЛУПА (ФР.)', 'GP', 'GLP'),
(49, 320, 'ГВАТЕМАЛА', 'РЕСПУБЛИКА ГВАТЕМАЛА', 'GT', 'GTM'),
(50, 254, 'ГВИАНА', 'ФРАНЦУЗСКАЯ ГВИАНА (ФР.)', 'GF', 'GUF'),
(51, 324, 'ГВИНЕЯ', 'ГВИНЕЙСКАЯ РЕСПУБЛИКА', 'GN', 'GIN'),
(52, 624, 'ГВИНЕЯ-БИСАУ', 'РЕСПУБЛИКА ГВИНЕЯ-БИСАУ', 'GW', 'GNB'),
(53, 276, 'ГЕРМАНИЯ', 'ФЕДЕРАТИВНАЯ РЕСПУБЛИКА ГЕРМАНИЯ', 'DE', 'DEU'),
(54, 831, 'ГЕРНСИ', 'ГЕРНСИ', 'GG', 'GGY'),
(55, 292, 'ГИБРАЛТАР', 'ГИБРАЛТАР (БРИТ.)', 'GI', 'GIB'),
(56, 340, 'ГОНДУРАС', 'РЕСПУБЛИКА ГОНДУРАС', 'HN', 'HND'),
(57, 344, 'ГОНКОНГ', 'СПЕЦИАЛЬНЫЙ АДМИНИСТРАТИВНЫЙ РЕГИОН КИТАЯ ГОНКОНГ', 'HK', 'HKG'),
(58, 308, 'ГРЕНАДА', 'ГРЕНАДА', 'GD', 'GRD'),
(59, 304, 'ГРЕНЛАНДИЯ', 'ГРЕНЛАНДИЯ', 'GL', 'GRL'),
(60, 300, 'ГРЕЦИЯ', 'ГРЕЧЕСКАЯ РЕСПУБЛИКА', 'GR', 'GRC'),
(61, 268, 'ГРУЗИЯ', 'РЕСПУБЛИКА ГРУЗИЯ', 'GE', 'GEO'),
(62, 316, 'ГУАМ', 'ГУАМ (США)', 'GU', 'GUM'),
(63, 208, 'ДАНИЯ', 'КОРОЛЕВСТВО ДАНИЯ', 'DK', 'DNK'),
(64, 832, 'ДЖЕРСИ', 'ДЖЕРСИ', 'JE', 'JEY'),
(65, 262, 'ДЖИБУТИ', 'РЕСПУБЛИКА ДЖИБУТИ', 'DJ', 'DJI'),
(66, 212, 'ДОМИНИКА', 'СОДРУЖЕСТВО ДОМИНИКИ', 'DM', 'DMA'),
(67, 214, 'ДОМИНИКАНСКАЯ РЕСПУБЛИКА', 'ДОМИНИКАНСКАЯ РЕСПУБЛИКА', 'DO', 'DOM'),
(68, 818, 'ЕГИПЕТ', 'АРАБСКАЯ РЕСПУБЛИКА ЕГИПЕТ (АРЕ)', 'EG', 'EGY'),
(69, 894, 'ЗАМБИЯ', 'РЕСПУБЛИКА ЗАМБИЯ', 'ZM', 'ZMB'),
(70, 732, 'ЗАПАДНАЯ САХАРА', 'ЗАПАДНАЯ САХАРА', 'EH', 'ESH'),
(71, 716, 'ЗИМБАБВЕ', 'РЕСПУБЛИКА ЗИМБАБВЕ', 'ZW', 'ZWE'),
(72, 376, 'ИЗРАИЛЬ', 'ГОСУДАРСТВО ИЗРАИЛЬ', 'IL', 'ISR'),
(73, 356, 'ИНДИЯ', 'РЕСПУБЛИКА ИНДИЯ', 'IN', 'IND'),
(74, 360, 'ИНДОНЕЗИЯ', 'РЕСПУБЛИКА ИНДОНЕЗИЯ', 'ID', 'IDN'),
(75, 400, 'ИОРДАНИЯ', 'ИОРДАНСКОЕ ХАШИМИТСКОЕ КОРОЛЕВСТВО', 'JO', 'JOR'),
(76, 368, 'ИРАК', 'РЕСПУБЛИКА ИРАК', 'IQ', 'IRQ'),
(77, 364, 'ИРАН', 'ИСЛАМСКАЯ РЕСПУБЛИКА ИРАН', 'IR', 'IRN'),
(78, 372, 'ИРЛАНДИЯ', 'ИРЛАНДИЯ', 'IE', 'IRL'),
(79, 352, 'ИСЛАНДИЯ', 'РЕСПУБЛИКА ИСЛАНДИЯ', 'IS', 'ISL'),
(80, 724, 'ИСПАНИЯ', 'КОРОЛЕВСТВО ИСПАНИЯ', 'ES', 'ESP'),
(81, 380, 'ИТАЛИЯ', 'ИТАЛЬЯНСКАЯ РЕСПУБЛИКА', 'IT', 'ITA'),
(82, 887, 'ЙЕМЕН', 'ЙЕМЕНСКАЯ РЕСПУБЛИКА', 'YE', 'YEM'),
(83, 132, 'КАБО-ВЕРДЕ', 'РЕСПУБЛИКА КАБО-ВЕРДЕ', 'CV', 'CPV'),
(84, 398, 'КАЗАХСТАН', 'РЕСПУБЛИКА КАЗАХСТАН', 'KZ', 'KAZ'),
(85, 136, 'КАЙМАН', 'ОСТРОВА КАЙМАН', 'KY', 'CYM'),
(86, 116, 'КАМБОДЖА', 'КОРОЛЕВСТВО КАМБОДЖА', 'KH', 'KHM'),
(87, 120, 'КАМЕРУН', 'РЕСПУБЛИКА КАМЕРУН', 'CM', 'CMR'),
(88, 124, 'КАНАДА', 'КАНАДА', 'CA', 'CAN'),
(89, 634, 'КАТАР', 'ГОСУДАРСТВО КАТАР', 'QA', 'QAT'),
(90, 404, 'КЕНИЯ', 'РЕСПУБЛИКА КЕНИЯ', 'KE', 'KEN'),
(91, 196, 'КИПР', 'РЕСПУБЛИКА КИПР', 'CY', 'CYP'),
(92, 296, 'КИРИБАТИ', 'РЕСПУБЛИКА КИРИБАТИ', 'KI', 'KIR'),
(93, 156, 'КИТАЙ', 'КИТАЙСКАЯ НАРОДНАЯ РЕСПУБЛИКА (КНР)', 'CN', 'CHN'),
(94, 166, 'КОКОСОВЫЕ О-ВА', 'КОКОСОВЫЕ (КИЛИНГ) ОСТРОВА', 'CC', 'CCK'),
(95, 170, 'КОЛУМБИЯ', 'РЕСПУБЛИКА КОЛУМБИЯ', 'CO', 'COL'),
(96, 174, 'КОМОРЫ', 'СОЮЗ КОМОРЫ', 'KM', 'COM'),
(97, 178, 'КОНГО', 'РЕСПУБЛИКА КОНГО', 'CG', 'COG'),
(98, 180, 'КОНГО', 'ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА КОНГО', 'CD', 'COD'),
(99, 410, 'КОРЕЯ', 'РЕСПУБЛИКА КОРЕЯ', 'KR', 'KOR'),
(100, 408, 'КОРЕЯ (КНДР)', 'КОРЕЙСКАЯ НАРОДНО-ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА', 'KP', 'PRK'),
(101, 188, 'КОСТА-РИКА', 'РЕСПУБЛИКА КОСТА-РИКА', 'CR', 'CRI'),
(102, 384, 'КОТ Д\'ИВУАР', 'РЕСПУБЛИКА КОТ Д\'ИВУАР', 'CI', 'CIV'),
(103, 192, 'КУБА', 'РЕСПУБЛИКА КУБА', 'CU', 'CUB'),
(104, 414, 'КУВЕЙТ', 'ГОСУДАРСТВО КУВЕЙТ', 'KW', 'KWT'),
(105, 417, 'КЫРГЫЗСТАН', 'РЕСПУБЛИКА КЫРГЫЗСТАН', 'KG', 'KGZ'),
(106, 418, 'ЛАОС', 'ЛАОССКАЯ НАРОДНО-ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА', 'LA', 'LAO'),
(107, 428, 'ЛАТВИЯ', 'ЛАТВИЙСКАЯ РЕСПУБЛИКА', 'LV', 'LVA'),
(108, 426, 'ЛЕСОТО', 'КОРОЛЕВСТВО ЛЕСОТО', 'LS', 'LSO'),
(109, 430, 'ЛИБЕРИЯ', 'РЕСПУБЛИКА ЛИБЕРИЯ', 'LR', 'LBR'),
(110, 422, 'ЛИВАН', 'ЛИВАНСКАЯ РЕСПУБЛИКА', 'LB', 'LBN'),
(111, 434, 'ЛИВИЯ', 'СОЦИАЛИСТИЧЕСКАЯ НАРОДНАЯ ЛИВИЙСКАЯ АРАБСКАЯ ДЖАМАХИРИЯ', 'LY', 'LBY'),
(112, 440, 'ЛИТВА', 'ЛИТОВСКАЯ РЕСПУБЛИКА', 'LT', 'LTU'),
(113, 438, 'ЛИХТЕНШТЕЙН', 'КНЯЖЕСТВО ЛИХТЕНШТЕЙН', 'LI', 'LIE'),
(114, 442, 'ЛЮКСЕМБУРГ', 'ВЕЛИКОЕ ГЕРЦОГСТВО ЛЮКСЕМБУРГ', 'LU', 'LUX'),
(115, 480, 'МАВРИКИЙ', 'РЕСПУБЛИКА МАВРИКИЙ', 'MU', 'MUS'),
(116, 478, 'МАВРИТАНИЯ', 'ИСЛАМСКАЯ РЕСПУБЛИКА МАВРИТАНИЯ', 'MR', 'MRT'),
(117, 450, 'МАДАГАСКАР', 'ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА МАДАГАСКАР', 'MG', 'MDG'),
(118, 175, 'МАЙОТТА', 'МАЙОТТА', 'YT', 'MYT'),
(119, 446, 'МАКАО', 'СПЕЦИАЛЬНЫЙ АДМИНИСТРАТИВНЫЙ РЕГИОН КИТАЯ МАКАО', 'MO', 'MAC'),
(120, 807, 'МАКЕДОНИЯ', 'РЕСПУБЛИКА МАКЕДОНИЯ', 'MK', 'MKD'),
(121, 454, 'МАЛАВИ', 'РЕСПУБЛИКА МАЛАВИ', 'MW', 'MWI'),
(122, 458, 'МАЛАЙЗИЯ', 'МАЛАЙЗИЯ', 'MY', 'MYS'),
(123, 466, 'МАЛИ', 'РЕСПУБЛИКА МАЛИ', 'ML', 'MLI'),
(124, 581, 'МАЛЫЕ ТИХООК. ОСТРОВА (США)', 'МАЛЫЕ ТИХООКЕАНСКИЕ ОТДАЛЕННЫЕ ОСТРОВА (США)', 'UM', 'UMI'),
(125, 462, 'МАЛЬДИВЫ', 'МАЛЬДИВСКАЯ РЕСПУБЛИКА', 'MV', 'MDV'),
(126, 470, 'МАЛЬТА', 'РЕСПУБЛИКА МАЛЬТА', 'MT', 'MLT'),
(127, 580, 'МАРИАНСКИЕ ОСТРОВА', 'СОДРУЖЕСТВО СЕВЕРНЫХ МАРИАНСКИХ ОСТРОВОВ', 'MP', 'MNP'),
(128, 504, 'МАРОККО', 'КОРОЛЕВСТВО МАРОККО', 'MA', 'MAR'),
(129, 474, 'МАРТИНИКА', 'МАРТИНИКА (ФР.)', 'MQ', 'MTQ'),
(130, 584, 'МАРШАЛЛОВЫ ОСТРОВА', 'РЕСПУБЛИКА МАРШАЛЛОВЫ ОСТРОВА', 'MH', 'MHL'),
(131, 484, 'МЕКСИКА', 'МЕКСИКАНСКИЕ СОЕДИНЕННЫЕ ШТАТЫ', 'MX', 'MEX'),
(132, 583, 'МИКРОНЕЗИЯ', 'ФЕДЕРАТИВНЫЕ ШТАТЫ МИКРОНЕЗИИ', 'FM', 'FSM'),
(133, 508, 'МОЗАМБИК', 'РЕСПУБЛИКА МОЗАМБИК', 'MZ', 'MOZ'),
(134, 498, 'МОЛДОВА', 'РЕСПУБЛИКА МОЛДОВА', 'MD', 'MDA'),
(135, 492, 'МОНАКО', 'КНЯЖЕСТВО МОНАКО', 'MC', 'MCO'),
(136, 496, 'МОНГОЛИЯ', 'МОНГОЛИЯ', 'MN', 'MHG'),
(137, 500, 'МОНТСЕРРАТ', 'МОНТСЕРРАТ (БРИТ.)', 'MS', 'MSR'),
(138, 104, 'МЬЯНМА', 'СОЮЗ МЬЯНМА', 'MM', 'MMR'),
(139, 516, 'НАМИБИЯ', 'РЕСПУБЛИКА НАМИБИЯ', 'NA', 'NAM'),
(140, 520, 'НАУРУ', 'РЕСПУБЛИКА НАУРУ', 'NR', 'NRU'),
(141, 524, 'НЕПАЛ', 'КОРОЛЕВСТВО НЕПАЛ', 'NP', 'NPL'),
(142, 562, 'НИГЕР', 'РЕСПУБЛИКА НИГЕР', 'NE', 'NER'),
(143, 566, 'НИГЕРИЯ', 'ФЕДЕРАТИВНАЯ РЕСПУБЛИКА НИГЕРИЯ', 'NG', 'NGA'),
(144, 530, 'НИДЕРЛАНДСКИЕ АНТИЛЫ', 'НИДЕРЛАНДСКИЕ АНТИЛЫ', 'AN', 'ANT'),
(145, 528, 'НИДЕРЛАНДЫ', 'КОРОЛЕВСТВО НИДЕРЛАНДЫ', 'NL', 'NLD'),
(146, 558, 'НИКАРАГУА', 'РЕСПУБЛИКА НИКАРАГУА', 'NI', 'NIC'),
(147, 570, 'НИУЭ', 'РЕСПУБЛИКА НИУЭ', 'NU', 'NIU'),
(148, 554, 'НОВАЯ ЗЕЛАНДИЯ', 'НОВАЯ ЗЕЛАНДИЯ', 'NZ', 'NZL'),
(149, 540, 'НОВАЯ КАЛЕДОНИЯ', 'НОВАЯ КАЛЕДОНИЯ', 'NC', 'NCL'),
(150, 578, 'НОРВЕГИЯ', 'КОРОЛЕВСТВО НОРВЕГИЯ', 'NO', 'NOR'),
(151, 574, 'НОРФОЛК', 'ОСТРОВ НОРФОЛК', 'NF', 'NFK'),
(152, 784, 'ОБЪЕД. АРАБСКИЕ ЭМИРАТЫ', 'ОБЪЕДИНЕННЫЕ АРАБСКИЕ ЭМИРАТЫ', 'AE', 'ARE'),
(153, 833, 'О-В МЭН', 'ОСТРОВ МЭН', 'IM', 'IMY'),
(154, 162, 'О-В РОЖДЕСТВА', 'ОСТРОВ РОЖДЕСТВА (АВСТРАЛ.)', 'CX', 'CXR'),
(155, 184, 'О-ВА КУКА', 'ОСТРОВА КУКА (Н. ЗЕЛ.)', 'СК', 'COK'),
(156, 512, 'ОМАН', 'СУЛТАНАТ ОМАН', 'OM', 'OMN'),
(157, 586, 'ПАКИСТАН', 'ИСЛАМСКАЯ РЕСПУБЛИКА ПАКИСТАН', 'PK', 'PAK'),
(158, 585, 'ПАЛАУ', 'РЕСПУБЛИКА ПАЛАУ', 'PW', 'PLW'),
(159, 275, 'ПАЛЕСТИНСКАЯ ТЕРРИТОРИЯ, ОККУПИРОВАННАЯ', 'ОККУПИРОВАННАЯ ПАЛЕСТИНСКАЯ ТЕРРИТОРИЯ', 'PS', 'PSE'),
(160, 591, 'ПАНАМА', 'РЕСПУБЛИКА ПАНАМА', 'PA', 'PAN'),
(161, 598, 'ПАПУА - НОВАЯ ГВИНЕЯ', 'ПАПУА - НОВАЯ ГВИНЕЯ', 'PG', 'PNG'),
(162, 600, 'ПАРАГВАЙ', 'РЕСПУБЛИКА ПАРАГВАЙ', 'PY', 'PRY'),
(163, 604, 'ПЕРУ', 'РЕСПУБЛИКА ПЕРУ', 'PE', 'PER'),
(164, 612, 'ПИТКЭРН', 'ПИТКЭРН (БРИТ.)', 'PN', 'PCN'),
(165, 616, 'ПОЛЬША', 'РЕСПУБЛИКА ПОЛЬША', 'PL', 'POL'),
(166, 620, 'ПОРТУГАЛИЯ', 'ПОРТУГАЛЬСКАЯ РЕСПУБЛИКА', 'PT', 'PRT'),
(167, 630, 'ПУЭРТО-РИКО', 'ПУЭРТО-РИКО', 'PR', 'PRI'),
(168, 638, 'РЕЮНЬОН', 'РЕЮНЬОН', 'RE', 'REU'),
(169, 643, 'РОССИЯ', 'РОССИЙСКАЯ ФЕДЕРАЦИЯ', 'RU', 'RUS'),
(170, 646, 'РУАНДА', 'РУАНДИЙСКАЯ РЕСПУБЛИКА', 'RW', 'RWA'),
(171, 642, 'РУМЫНИЯ', 'РУМЫНИЯ', 'RO', 'ROM'),
(172, 882, 'САМОА', 'НЕЗАВИСИМОЕ ГОСУДАРСТВО САМОА', 'WS', 'WSM'),
(173, 678, 'САН-ТОМЕ И ПРИНСИПИ', 'ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА САН-ТОМЕ И ПРИНСИПИ', 'ST', 'STR'),
(174, 674, 'САН-МАРИНО', 'РЕСПУБЛИКА САН-МАРИНО', 'SM', 'SMR'),
(175, 682, 'САУДОВСКАЯ АРАВИЯ', 'КОРОЛЕВСТВО САУДОВСКАЯ АРАВИЯ', 'SA', 'SAU'),
(176, 748, 'СВАЗИЛЕНД', 'КОРОЛЕВСТВО СВАЗИЛЕНД', 'SZ', 'SWZ'),
(177, 654, 'СВЯТАЯ ЕЛЕНА', 'ОСТРОВ СВЯТОЙ ЕЛЕНЫ (БРИТ.)', 'SH', 'SHN'),
(178, 690, 'СЕЙШЕЛЫ', 'РЕСПУБЛИКА СЕЙШЕЛЫ', 'SC', 'SYC'),
(179, 666, 'СЕН-ПЬЕР И МИКЕЛОН', 'СЕН-ПЬЕР И МИКЕЛОН (ФР.)', 'PM', 'SPM'),
(180, 686, 'СЕНЕГАЛ', 'РЕСПУБЛИКА СЕНЕГАЛ', 'SN', 'SEN'),
(181, 670, 'СЕНТ-ВИНСЕНТ И ГРЕНАДИНЫ', 'СЕНТ-ВИНСЕНТ И ГРЕНАДИНЫ', 'VC', 'VCT'),
(182, 659, 'СЕНТ-КИТС И НЕВИС', 'ФЕДЕРАЦИЯ СЕНТ-КИТС (СЕНТ-КРИСТОФЕР) И НЕВИС', 'KN', 'KNA'),
(183, 662, 'СЕНТ-ЛЮСИЯ', 'СЕНТ-ЛЮСИЯ', 'LC', 'LCA'),
(184, 688, 'СЕРБИЯ', 'РЕСПУБЛИКА СЕРБИЯ', 'RS', 'SRB'),
(185, 702, 'СИНГАПУР', 'РЕСПУБЛИКА СИНГАПУР', 'SG', 'SGP'),
(186, 760, 'СИРИЯ', 'СИРИЙСКАЯ АРАБСКАЯ РЕСПУБЛИКА', 'SY', 'SYR'),
(187, 703, 'СЛОВАКИЯ', 'СЛОВАЦКАЯ РЕСПУБЛИКА', 'SK', 'SVK'),
(188, 705, 'СЛОВЕНИЯ', 'РЕСПУБЛИКА СЛОВЕНИЯ', 'SI', 'SVN'),
(189, 826, 'СОЕДИНЕННОЕ КОРОЛЕВСТВО', 'СОЕДИНЕННОЕ КОРОЛЕВСТВО ВЕЛИКОБРИТАНИИ И СЕВЕРНОЙ ИРЛАНДИИ', 'GB', 'GBR'),
(190, 90, 'СОЛОМОНОВЫ О-ВА', 'СОЛОМОНОВЫ ОСТРОВА', 'SB', 'SLB'),
(191, 706, 'СОМАЛИ', 'СОМАЛИЙСКАЯ РЕСПУБЛИКА', 'SO', 'SOM'),
(192, 736, 'СУДАН', 'РЕСПУБЛИКА СУДАН', 'SD', 'SDN'),
(193, 740, 'СУРИНАМ', 'РЕСПУБЛИКА СУРИНАМ', 'SR', 'SUR'),
(194, 840, 'США', 'СОЕДИНЕННЫЕ ШТАТЫ АМЕРИКИ', 'US', 'USA'),
(195, 694, 'СЬЕРРА-ЛЕОНЕ', 'РЕСПУБЛИКА СЬЕРРА-ЛЕОНЕ', 'SL', 'SLE'),
(196, 762, 'ТАДЖИКИСТАН', 'РЕСПУБЛИКА ТАДЖИКИСТАН', 'TJ', 'TJK'),
(197, 764, 'ТАИЛАНД', 'КОРОЛЕВСТВО ТАИЛАНД', 'TH', 'THA'),
(198, 158, 'ТАЙВАНЬ', 'ТАЙВАНЬ (В СОСТАВЕ КИТАЯ)', 'TW', 'TWN'),
(199, 834, 'ТАНЗАНИЯ', 'ОБЪЕДИНЕННАЯ РЕСПУБЛИКА ТАНЗАНИЯ (ОРТ)', 'TZ', 'TZA'),
(200, 796, 'ТЕРКС И КАЙКОС', 'ОСТРОВА ТЕРКС И КАЙКОС (БРИТ.)', 'TC', 'TCA'),
(201, 626, 'ТИМОР-ЛЕСТЕ', 'ДЕМОКРАТИЧЕСКАЯ РЕСПУБЛИКА ТИМОР-ЛЕСТЕ', 'TP', 'TMP'),
(202, 768, 'ТОГО', 'ТОГОЛЕЗСКАЯ РЕСПУБЛИКА', 'TG', 'TGO'),
(203, 772, 'ТОКЕЛАУ', 'ТОКЕЛАУ (ЮНИОН) (Н. ЗЕЛ.)', 'TK', 'TKL'),
(204, 776, 'ТОНГА', 'КОРОЛЕВСТВО ТОНГА', 'TO', 'TON'),
(205, 780, 'ТРИНИДАД И ТОБАГО', 'РЕСПУБЛИКА ТРИНИДАД И ТОБАГО', 'TT', 'TTO'),
(206, 798, 'ТУВАЛУ', 'ТУВАЛУ', 'TV', 'TUV'),
(207, 788, 'ТУНИС', 'ТУНИССКАЯ РЕСПУБЛИКА', 'TN', 'TUN'),
(208, 795, 'ТУРКМЕНИЯ', 'ТУРКМЕНИСТАН', 'TM', 'TKM'),
(209, 792, 'ТУРЦИЯ', 'ТУРЕЦКАЯ РЕСПУБЛИКА', 'TR', 'TUR'),
(210, 800, 'УГАНДА', 'РЕСПУБЛИКА УГАНДА', 'UG', 'UGA'),
(211, 860, 'УЗБЕКИСТАН', 'РЕСПУБЛИКА УЗБЕКИСТАН', 'UZ', 'UZB'),
(212, 804, 'УКРАИНА', 'УКРАИНА', 'UA', 'UKR'),
(213, 876, 'УОЛЛИС И ФУТУНА', 'ОСТРОВА УОЛЛИС И ФУТУНА', 'WF', 'WLF'),
(214, 858, 'УРУГВАЙ', 'ВОСТОЧНАЯ РЕСПУБЛИКА УРУГВАЙ', 'UY', 'URY'),
(215, 234, 'ФАРЕРСКИЕ О-ВА', 'ФАРЕРСКИЕ ОСТРОВА (В СОСТАВЕ ДАНИИ)', 'FO', 'FRO'),
(216, 242, 'ФИДЖИ', 'РЕСПУБЛИКА ОСТРОВОВ ФИДЖИ', 'FJ', 'FJI'),
(217, 608, 'ФИЛИППИНЫ', 'РЕСПУБЛИКА ФИЛИППИНЫ', 'PH', 'PHL'),
(218, 246, 'ФИНЛЯНДИЯ', 'ФИНЛЯНДСКАЯ РЕСПУБЛИКА', 'FI', 'FIN'),
(219, 238, 'ФОЛКЛЕНДСКИЕ О-ВА', 'ФОЛКЛЕНДСКИЕ ОСТРОВА (МАЛЬВИНСКИЕ)', 'FK', 'FLK'),
(220, 260, 'ФР. ЮЖНЫЕ ТЕРРИТОРИИ', 'ФРАНЦУЗСКИЕ ЮЖНЫЕ ТЕРРИТОРИИ (ФР.)', 'TF', 'ATF'),
(221, 250, 'ФРАНЦИЯ', 'ФРАНЦУЗСКАЯ РЕСПУБЛИКА', 'FR', 'FRA'),
(222, 258, 'ФРАНЦУЗСКАЯ ПОЛИНЕЗИЯ', 'ФРАНЦУЗСКАЯ ПОЛИНЕЗИЯ (ФР.)', 'PF', 'PYF'),
(223, 334, 'ХЕРД И МАКДОНАЛЬД', 'ОСТРОВ ХЕРД И ОСТРОВА МАКДОНАЛЬД', 'HM', 'HMD'),
(224, 191, 'ХОРВАТИЯ', 'РЕСПУБЛИКА ХОРВАТИЯ', 'HR', 'HRV'),
(225, 140, 'ЦЕНТР. - АФР. РЕСПУБЛИКА', 'ЦЕНТРАЛЬНО-АФРИКАНСКАЯ РЕСПУБЛИКА (ЦАР)', 'CF', 'CAF'),
(226, 148, 'ЧАД', 'РЕСПУБЛИКА ЧАД', 'TD', 'TCD'),
(227, 499, 'ЧЕРНОГОРИЯ', 'РЕСПУБЛИКА ЧЕРНОГОРИЯ', 'ME', 'MNE'),
(228, 203, 'ЧЕХИЯ', 'ЧЕШСКАЯ РЕСПУБЛИКА', 'CZ', 'CZE'),
(229, 152, 'ЧИЛИ', 'РЕСПУБЛИКА ЧИЛИ', 'CL', 'CHL'),
(230, 756, 'ШВЕЙЦАРИЯ', 'ШВЕЙЦАРСКАЯ КОНФЕДЕРАЦИЯ', 'CH', 'CHE'),
(231, 752, 'ШВЕЦИЯ', 'КОРОЛЕВСТВО ШВЕЦИЯ', 'SE', 'SWE'),
(232, 744, 'ШПИЦБЕРГЕН И ЯН-МАЙЕН', 'ШПИЦБЕРГЕН И ЯН-МАЙЕН (НОРВ.)', 'SJ', 'SJM'),
(233, 144, 'ШРИ-ЛАНКА', 'ДЕМОКРАТИЧЕСКАЯ СОЦИАЛИСТИЧЕСКАЯ РЕСПУБЛИКА ШРИ-ЛАНКА', 'LK', 'LKA'),
(234, 218, 'ЭКВАДОР', 'РЕСПУБЛИКА ЭКВАДОР', 'EC', 'ECU'),
(235, 226, 'ЭКВАТОРИАЛЬНАЯ ГВИНЕЯ', 'РЕСПУБЛИКА ЭКВАТОРИАЛЬНАЯ ГВИНЕЯ', 'GQ', 'GNQ'),
(236, 248, 'ЭЛАНДСКИЕ ОСТРОВА', 'ЭЛАНДСКИЕ ОСТРОВА', 'AX', 'ALA'),
(237, 222, 'ЭЛЬ-САЛЬВАДОР', 'РЕСПУБЛИКА ЭЛ-САЛЬВАДОР', 'SV', 'SLV'),
(238, 232, 'ЭРИТРЕЯ', 'ЭРИТРЕЯ', 'ER', 'ERI'),
(239, 233, 'ЭСТОНИЯ', 'ЭСТОНСКАЯ РЕСПУБЛИКА', 'EE', 'EST'),
(240, 231, 'ЭФИОПИЯ', 'ФЕДЕРАТИВНАЯ ДЕМОКРАТИЧЕСКАЯ  РЕСПУБЛИКА ЭФИОПИЯ', 'ET', 'ETH'),
(241, 710, 'ЮЖНАЯ АФРИКА', 'ЮЖНО-АФРИКАНСКАЯ РЕСПУБЛИКА', 'ZA', 'ZAF'),
(242, 239, 'ЮЖНАЯ ДЖОРДЖИЯ И ЮЖНЫЕ САНДВИЧЕВЫ ОСТРОВА', 'ЮЖНАЯ ДЖОРДЖИЯ И ЮЖНЫЕ САНДВИЧЕВЫ ОСТРОВА', 'GS', 'SGS'),
(243, 388, 'ЯМАЙКА', 'ЯМАЙКА', 'JM', 'JAM'),
(244, 392, 'ЯПОНИЯ', 'ЯПОНИЯ', 'JP', 'JPN');

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Жанр'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сущность Жанр';

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1678538116),
('m130524_201442_init', 1678538118),
('m140506_102106_rbac_init', 1678885808),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1678885808),
('m180523_151638_rbac_updates_indexes_without_prefix', 1678885808),
('m190124_110200_add_verification_token_column_to_user_table', 1678538118),
('m200409_110543_rbac_update_mssql_trigger', 1678885808);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin', 'cl8_4cDhoa9KwxUJrnKcH-T8xDhXZ94H', '$2y$13$ut2GwMxhxlTQKDKpWzSsuux7tdkb7SQ9hZ6RqKWMK3W9jv5SpbowK', 'ExzkCOaYc1L8IOBs4wdTGGbgNiG3Wz1I_1402312317', '1@mail.ru', 10, '2023-03-15 09:37:25', '2023-03-15 09:37:25', 'Eh2QoV3SAEcccGf2k4x0XP5cR88O8jNl_1678538295'),
(2, 'client', 'TW-FOTt0xEQdL0BRtNXQR6j6W7wpRJO8', '$2y$13$RT84jF.TLuzzjfeGAH5wruk2TUb/JxnR8DAmIqCKqAY2z6ItyuC4S', NULL, 'client@mail.ru', 10, '2023-03-15 09:37:25', '2023-03-15 09:37:25', 'gmSb0B_gyFA6Njd9AMjAKyqDB15ACq8S_1678653599');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author_id`);

--
-- Индексы таблицы `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `book_genre`
--
ALTER TABLE `book_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `book_genre_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- База данных: `darsdb_test`
--
CREATE DATABASE IF NOT EXISTS `darsdb_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `darsdb_test`;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('client', '5', 1678908723);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1678885908, 1678885908),
('client', 1, NULL, NULL, NULL, 1678885938, 1678885938),
('superadmin', 1, NULL, NULL, NULL, 1678885922, 1678885922);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('superadmin', '/*');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1678881748),
('m130524_201442_init', 1678881751),
('m190124_110200_add_verification_token_column_to_user_table', 1678881752);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
