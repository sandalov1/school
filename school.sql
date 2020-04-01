-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 01 2020 г., 20:34
-- Версия сервера: 5.7.29-0ubuntu0.16.04.1
-- Версия PHP: 7.0.33-0ubuntu0.16.04.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `school`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add group', 3, 'add_group'),
(6, 'Can change group', 3, 'change_group'),
(7, 'Can delete group', 3, 'delete_group'),
(8, 'Can view group', 3, 'view_group'),
(9, 'Can add user', 2, 'add_user'),
(10, 'Can change user', 2, 'change_user'),
(11, 'Can delete user', 2, 'delete_user'),
(12, 'Can view user', 2, 'view_user'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add auth group', 11, 'add_authgroup'),
(26, 'Can change auth group', 11, 'change_authgroup'),
(27, 'Can delete auth group', 11, 'delete_authgroup'),
(28, 'Can view auth group', 11, 'view_authgroup'),
(29, 'Can add auth group permissions', 13, 'add_authgrouppermissions'),
(30, 'Can change auth group permissions', 13, 'change_authgrouppermissions'),
(31, 'Can delete auth group permissions', 13, 'delete_authgrouppermissions'),
(32, 'Can view auth group permissions', 13, 'view_authgrouppermissions'),
(33, 'Can add auth permission', 21, 'add_authpermission'),
(34, 'Can change auth permission', 21, 'change_authpermission'),
(35, 'Can delete auth permission', 21, 'delete_authpermission'),
(36, 'Can view auth permission', 21, 'view_authpermission'),
(37, 'Can add auth user', 12, 'add_authuser'),
(38, 'Can change auth user', 12, 'change_authuser'),
(39, 'Can delete auth user', 12, 'delete_authuser'),
(40, 'Can view auth user', 12, 'view_authuser'),
(41, 'Can add auth user groups', 15, 'add_authusergroups'),
(42, 'Can change auth user groups', 15, 'change_authusergroups'),
(43, 'Can delete auth user groups', 15, 'delete_authusergroups'),
(44, 'Can view auth user groups', 15, 'view_authusergroups'),
(45, 'Can add auth user user permissions', 17, 'add_authuseruserpermissions'),
(46, 'Can change auth user user permissions', 17, 'change_authuseruserpermissions'),
(47, 'Can delete auth user user permissions', 17, 'delete_authuseruserpermissions'),
(48, 'Can view auth user user permissions', 17, 'view_authuseruserpermissions'),
(49, 'Can add День недель', 23, 'add_denbnedeli'),
(50, 'Can change День недель', 23, 'change_denbnedeli'),
(51, 'Can delete День недель', 23, 'delete_denbnedeli'),
(52, 'Can view День недель', 23, 'view_denbnedeli'),
(53, 'Can add django admin log', 18, 'add_djangoadminlog'),
(54, 'Can change django admin log', 18, 'change_djangoadminlog'),
(55, 'Can delete django admin log', 18, 'delete_djangoadminlog'),
(56, 'Can view django admin log', 18, 'view_djangoadminlog'),
(57, 'Can add django content type', 16, 'add_djangocontenttype'),
(58, 'Can change django content type', 16, 'change_djangocontenttype'),
(59, 'Can delete django content type', 16, 'delete_djangocontenttype'),
(60, 'Can view django content type', 16, 'view_djangocontenttype'),
(61, 'Can add django migrations', 22, 'add_djangomigrations'),
(62, 'Can change django migrations', 22, 'change_djangomigrations'),
(63, 'Can delete django migrations', 22, 'delete_djangomigrations'),
(64, 'Can view django migrations', 22, 'view_djangomigrations'),
(65, 'Can add django session', 19, 'add_djangosession'),
(66, 'Can change django session', 19, 'change_djangosession'),
(67, 'Can delete django session', 19, 'delete_djangosession'),
(68, 'Can view django session', 19, 'view_djangosession'),
(69, 'Can add Кабинет', 8, 'add_kabinet'),
(70, 'Can change Кабинет', 8, 'change_kabinet'),
(71, 'Can delete Кабинет', 8, 'delete_kabinet'),
(72, 'Can view Кабинет', 8, 'view_kabinet'),
(73, 'Can add Класс', 20, 'add_klass'),
(74, 'Can change Класс', 20, 'change_klass'),
(75, 'Can delete Класс', 20, 'delete_klass'),
(76, 'Can view Класс', 20, 'view_klass'),
(77, 'Can add Предмет', 9, 'add_predmet'),
(78, 'Can change Предмет', 9, 'change_predmet'),
(79, 'Can delete Предмет', 9, 'delete_predmet'),
(80, 'Can view Предмет', 9, 'view_predmet'),
(81, 'Can add Преподаватель', 7, 'add_prepodavateli'),
(82, 'Can change Преподаватель', 7, 'change_prepodavateli'),
(83, 'Can delete Преподаватель', 7, 'delete_prepodavateli'),
(84, 'Can view Преподаватель', 7, 'view_prepodavateli'),
(85, 'Can add raspisanie', 14, 'add_raspisanie'),
(86, 'Can change raspisanie', 14, 'change_raspisanie'),
(87, 'Can delete raspisanie', 14, 'delete_raspisanie'),
(88, 'Can view raspisanie', 14, 'view_raspisanie'),
(89, 'Can add Урок', 10, 'add_uroki'),
(90, 'Can change Урок', 10, 'change_uroki'),
(91, 'Can delete Урок', 10, 'delete_uroki'),
(92, 'Can view Урок', 10, 'view_uroki');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$MK2jOlwa6I5b$vzmgAOEEW2Ka6h/RTJAnBNPWYmUadmCs2IZyHsVGwdA=', '2020-04-01 07:23:56.254641', 1, 'admin', '', '', '', 1, 1, '2020-03-30 18:27:27.523209');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `denb_nedeli`
--

CREATE TABLE `denb_nedeli` (
  `id_Denb_Nedeli` int(11) NOT NULL,
  `Denb_Nedeli` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `denb_nedeli`
--

INSERT INTO `denb_nedeli` (`id_Denb_Nedeli`, `Denb_Nedeli`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-03-30 18:34:18.956770', '25', 'Prepodavateli object (25)', 2, '[]', 7, 1),
(2, '2020-03-30 18:44:55.451485', '3', 'Алгебра', 2, '[]', 9, 1),
(3, '2020-03-30 18:46:34.990129', '1', '1', 2, '[]', 8, 1),
(4, '2020-03-30 18:48:38.919312', '1', '1', 2, '[]', 10, 1),
(5, '2020-03-30 18:56:14.643653', '25', 'Борунова Наталья Валентиновна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(6, '2020-03-30 18:56:22.940312', '25', 'Борунова Наталья Валентиновна', 2, '[]', 7, 1),
(7, '2020-03-30 18:56:39.773085', '1', 'Бычковская Елена Александровна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(8, '2020-03-30 18:56:49.115257', '2', 'Воронова Наталья Михайловна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(9, '2020-03-30 18:57:08.129077', '24', 'Галашан  Елизавета Николаевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(10, '2020-03-30 18:57:18.858606', '3', 'Губочкин Андрей Владимирович', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(11, '2020-03-30 18:57:29.667265', '5', 'Забавнова Татьяна Юрьевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(12, '2020-03-30 18:57:47.526507', '6', 'Заркова Наталья Петровна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(13, '2020-03-30 18:57:52.483825', '6', 'Заркова Наталья Петровна', 2, '[]', 7, 1),
(14, '2020-03-30 18:58:04.144903', '7', 'Кабанова Лидия Васильевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(15, '2020-03-30 18:58:15.808652', '10', 'Ковалева Танзиля Наильевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(16, '2020-03-30 18:58:34.775566', '8', 'Кремешкова Наталья Валерьевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(17, '2020-03-30 18:59:11.919016', '18', 'Информатика', 1, '[{"added": {}}]', 9, 1),
(18, '2020-03-30 18:59:15.798814', '12', 'Кузьмина Людмила Вячеславовна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(19, '2020-03-30 18:59:32.850859', '9', 'Кукушкина Ольга Валентиновна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(20, '2020-03-30 18:59:44.794536', '11', 'Курхина Инесса Евгеньевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(21, '2020-03-30 19:00:28.883143', '14', 'Малахова Надежда Николаевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(22, '2020-03-30 19:00:41.531780', '13', 'Мовенко Сергей Иванович', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(23, '2020-03-30 19:02:04.947453', '15', 'Морозова Светлана Николаевна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(24, '2020-03-30 19:02:46.407160', '16', 'Морозова Нина Викторовна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(25, '2020-03-30 19:03:07.501152', '18', 'Нехорошева Наталья Юрьевна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(26, '2020-03-30 19:03:20.533237', '17', 'Низяева Наталья Владимировна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(27, '2020-03-30 19:03:36.259215', '19', 'Пенкина Галина Евгеньевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(28, '2020-03-30 19:03:48.782574', '20', 'Полякова  Юлия Дмитриевна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(29, '2020-03-30 19:04:03.749024', '21', 'Просандеева Елена Александровна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(30, '2020-03-30 19:04:22.719567', '22', 'Самосюк Лариса Николаевна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(31, '2020-03-30 19:04:36.678303', '4', 'Свирина Вероника Олеговна', 2, '[{"changed": {"fields": ["predmet_1", "predmet_2"]}}]', 7, 1),
(32, '2020-03-30 19:04:45.553918', '23', 'Случевская Елена Ивановна', 2, '[{"changed": {"fields": ["predmet_1"]}}]', 7, 1),
(33, '2020-03-30 19:06:08.592526', '25', 'Борунова Наталья Валентиновна', 2, '[]', 7, 1),
(34, '2020-03-30 19:06:44.697317', '8', 'Кремешкова Наталья Валерьевна', 2, '[{"changed": {"fields": ["predmet_2", "predmet_3"]}}]', 7, 1),
(35, '2020-03-30 19:07:31.143222', '19', 'Пенкина Галина Евгеньевна', 2, '[{"changed": {"fields": ["predmet_2", "predmet_3"]}}]', 7, 1),
(36, '2020-03-30 19:07:45.513285', '23', 'Случевская Елена Ивановна', 2, '[{"changed": {"fields": ["predmet_2", "predmet_3"]}}]', 7, 1),
(37, '2020-03-31 06:59:00.668993', '4', 'Понедельник/1', 1, '[{"added": {}}]', 14, 1),
(38, '2020-03-31 15:00:13.377697', '5', 'Вторник / Урок 4 - 8А', 1, '[{"added": {}}]', 14, 1),
(39, '2020-04-01 08:52:13.179657', '4', 'Понедельник / Урок 1 - 5А', 3, '', 14, 1),
(40, '2020-04-01 08:52:13.293667', '8', 'Вторник / Урок 1 - 5А', 3, '', 14, 1),
(41, '2020-04-01 08:52:13.439458', '9', 'Вторник / Урок 2 - 5А', 3, '', 14, 1),
(42, '2020-04-01 08:52:13.484052', '7', 'Вторник / Урок 3 - 5А', 3, '', 14, 1),
(43, '2020-04-01 08:52:13.528716', '5', 'Вторник / Урок 4 - 8А', 3, '', 14, 1),
(44, '2020-04-01 08:52:13.573476', '6', 'Среда / Урок 1 - 5А', 3, '', 14, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(4, 'auth', 'permission'),
(2, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'schoolbase', 'authgroup'),
(13, 'schoolbase', 'authgrouppermissions'),
(21, 'schoolbase', 'authpermission'),
(12, 'schoolbase', 'authuser'),
(15, 'schoolbase', 'authusergroups'),
(17, 'schoolbase', 'authuseruserpermissions'),
(23, 'schoolbase', 'denbnedeli'),
(18, 'schoolbase', 'djangoadminlog'),
(16, 'schoolbase', 'djangocontenttype'),
(22, 'schoolbase', 'djangomigrations'),
(19, 'schoolbase', 'djangosession'),
(8, 'schoolbase', 'kabinet'),
(20, 'schoolbase', 'klass'),
(9, 'schoolbase', 'predmet'),
(7, 'schoolbase', 'prepodavateli'),
(14, 'schoolbase', 'raspisanie'),
(10, 'schoolbase', 'uroki'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-30 18:24:53.226084'),
(2, 'auth', '0001_initial', '2020-03-30 18:24:55.487878'),
(3, 'admin', '0001_initial', '2020-03-30 18:25:04.590445'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-30 18:25:06.724313'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-30 18:25:06.801239'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-30 18:25:08.505021'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-30 18:25:09.467736'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-30 18:25:10.428547'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-30 18:25:10.492740'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-30 18:25:11.145802'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-30 18:25:11.190839'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-30 18:25:11.248448'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-30 18:25:12.108367'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-30 18:25:13.071037'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-03-30 18:25:15.934398'),
(16, 'auth', '0011_update_proxy_permissions', '2020-03-30 18:25:16.071986'),
(17, 'sessions', '0001_initial', '2020-03-30 18:25:16.429178'),
(18, 'schoolbase', '0001_initial', '2020-03-30 18:52:18.811370'),
(19, 'schoolbase', '0002_auto_20200330_2214', '2020-03-30 19:14:57.147180'),
(20, 'schoolbase', '0003_auto_20200330_2244', '2020-03-30 19:44:39.390603'),
(21, 'schoolbase', '0004_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_django', '2020-03-30 19:44:39.452060'),
(22, 'schoolbase', '0005_auto_20200330_2244', '2020-03-30 19:44:39.521863');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('x4id493t4wpa5e0djpefqwmm8dghumdy', 'OWQxNzQ0OTUyMWY2MmMwNDc4NzZlOTBjNmJlM2ZlNGM3YzdkNDk4NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZmNiNWZhM2Y2ZDc3ZTYxNmJhNDJkMDUzZGNhMGFkZjEzNGY5ZjNkIn0=', '2020-04-15 07:23:56.299802');

-- --------------------------------------------------------

--
-- Структура таблицы `kabinet`
--

CREATE TABLE `kabinet` (
  `id_Kabinet` int(11) NOT NULL,
  `Kabinet` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `kabinet`
--

INSERT INTO `kabinet` (`id_Kabinet`, `Kabinet`) VALUES
(1, '1'),
(2, '2'),
(5, '5'),
(6, '6'),
(8, '8'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, '26'),
(27, '27'),
(28, '28'),
(36, '36');

-- --------------------------------------------------------

--
-- Структура таблицы `klass`
--

CREATE TABLE `klass` (
  `id_Klass` int(11) NOT NULL,
  `Nomer` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `klass`
--

INSERT INTO `klass` (`id_Klass`, `Nomer`) VALUES
(1, '5А'),
(2, '5Б'),
(3, '6А'),
(4, '6Б'),
(5, '7А'),
(6, '7Б'),
(7, '8А'),
(8, '8Б'),
(9, '9А'),
(10, '9Б'),
(11, '10'),
(12, '11');

-- --------------------------------------------------------

--
-- Структура таблицы `predmet`
--

CREATE TABLE `predmet` (
  `id_Predmet` int(11) NOT NULL,
  `Predmet` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `predmet`
--

INSERT INTO `predmet` (`id_Predmet`, `Predmet`) VALUES
(1, 'Русский язык'),
(2, 'Математика'),
(3, 'Алгебра'),
(4, 'Геометрия'),
(5, 'Физика'),
(6, 'Химия'),
(7, 'Биология'),
(8, 'Английский язык'),
(9, 'Немецкий язык'),
(10, 'Технология'),
(11, 'Физическая культура'),
(12, 'Литература'),
(13, 'География'),
(14, 'ОБЖ'),
(15, 'Музыка'),
(16, 'История'),
(17, 'Обществознание'),
(18, 'Информатика');

-- --------------------------------------------------------

--
-- Структура таблицы `prepodavateli`
--

CREATE TABLE `prepodavateli` (
  `id_Prepodavatelya` int(11) NOT NULL,
  `FIO` varchar(60) NOT NULL,
  `Predmet_1` int(11) NOT NULL,
  `Predmet_2` int(11) DEFAULT NULL,
  `Predmet_3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prepodavateli`
--

INSERT INTO `prepodavateli` (`id_Prepodavatelya`, `FIO`, `Predmet_1`, `Predmet_2`, `Predmet_3`) VALUES
(1, 'Бычковская Елена Александровна', 11, NULL, NULL),
(2, 'Воронова Наталья Михайловна', 8, NULL, NULL),
(3, 'Губочкин Андрей Владимирович', 11, NULL, NULL),
(4, 'Свирина Вероника Олеговна', 8, 9, NULL),
(5, 'Забавнова Татьяна Юрьевна', 13, NULL, NULL),
(6, 'Заркова Наталья Петровна', 1, 12, NULL),
(7, 'Кабанова Лидия Васильевна', 10, NULL, NULL),
(8, 'Кремешкова Наталья Валерьевна', 2, 3, 4),
(9, 'Кукушкина Ольга Валентиновна', 1, 12, NULL),
(10, 'Ковалева Танзиля Наильевна', 14, NULL, NULL),
(11, 'Курхина Инесса Евгеньевна', 8, NULL, NULL),
(12, 'Кузьмина Людмила Вячеславовна', 18, NULL, NULL),
(13, 'Мовенко Сергей Иванович', 10, NULL, NULL),
(14, 'Малахова Надежда Николаевна', 5, NULL, NULL),
(15, 'Морозова Светлана Николаевна', 8, 9, NULL),
(16, 'Морозова Нина Викторовна', 16, 17, NULL),
(17, 'Низяева Наталья Владимировна', 16, NULL, NULL),
(18, 'Нехорошева Наталья Юрьевна', 1, 12, NULL),
(19, 'Пенкина Галина Евгеньевна', 2, 3, 4),
(20, 'Полякова  Юлия Дмитриевна', 8, NULL, NULL),
(21, 'Просандеева Елена Александровна', 15, NULL, NULL),
(22, 'Самосюк Лариса Николаевна', 1, 12, NULL),
(23, 'Случевская Елена Ивановна', 2, 3, 4),
(24, 'Галашан  Елизавета Николаевна', 6, NULL, NULL),
(25, 'Борунова Наталья Валентиновна', 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `raspisanie`
--

CREATE TABLE `raspisanie` (
  `id_Raspisanie` int(11) NOT NULL,
  `Day_Nedeli` int(11) NOT NULL,
  `Urok` int(11) NOT NULL,
  `Klass` int(11) NOT NULL,
  `R_Predmet` int(11) NOT NULL,
  `Kabinet` int(11) NOT NULL,
  `Prepodavatel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `raspisanie`
--

INSERT INTO `raspisanie` (`id_Raspisanie`, `Day_Nedeli`, `Urok`, `Klass`, `R_Predmet`, `Kabinet`, `Prepodavatel`) VALUES
(11, 2, 2, 3, 7, 24, 25),
(12, 1, 1, 1, 8, 24, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `uroki`
--

CREATE TABLE `uroki` (
  `id_Uroka` int(11) NOT NULL,
  `Nom_Uroka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `uroki`
--

INSERT INTO `uroki` (`id_Uroka`, `Nom_Uroka`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `denb_nedeli`
--
ALTER TABLE `denb_nedeli`
  ADD PRIMARY KEY (`id_Denb_Nedeli`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `kabinet`
--
ALTER TABLE `kabinet`
  ADD PRIMARY KEY (`id_Kabinet`);

--
-- Индексы таблицы `klass`
--
ALTER TABLE `klass`
  ADD PRIMARY KEY (`id_Klass`);

--
-- Индексы таблицы `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_Predmet`);

--
-- Индексы таблицы `prepodavateli`
--
ALTER TABLE `prepodavateli`
  ADD PRIMARY KEY (`id_Prepodavatelya`);

--
-- Индексы таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  ADD PRIMARY KEY (`id_Raspisanie`),
  ADD KEY `fk_Raspisanie_Den'_Nedeli_idx` (`Day_Nedeli`),
  ADD KEY `fk_Raspisanie_Uroki1_idx` (`Urok`),
  ADD KEY `fk_Raspisanie_Klass1_idx` (`Klass`),
  ADD KEY `fk_Raspisanie_Kabinet1_idx` (`Kabinet`),
  ADD KEY `fk_Raspisanie_Prepodavateli1_idx` (`Prepodavatel`),
  ADD KEY `fk_Raspisanie_Predmet1_idx` (`R_Predmet`);

--
-- Индексы таблицы `uroki`
--
ALTER TABLE `uroki`
  ADD PRIMARY KEY (`id_Uroka`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `denb_nedeli`
--
ALTER TABLE `denb_nedeli`
  MODIFY `id_Denb_Nedeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `klass`
--
ALTER TABLE `klass`
  MODIFY `id_Klass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `predmet`
--
ALTER TABLE `predmet`
  MODIFY `id_Predmet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `prepodavateli`
--
ALTER TABLE `prepodavateli`
  MODIFY `id_Prepodavatelya` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `raspisanie`
--
ALTER TABLE `raspisanie`
  MODIFY `id_Raspisanie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `uroki`
--
ALTER TABLE `uroki`
  MODIFY `id_Uroka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
