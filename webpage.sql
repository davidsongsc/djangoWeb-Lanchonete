-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.32 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para webpage
CREATE DATABASE IF NOT EXISTS `webpage` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webpage`;

-- Copiando estrutura para tabela webpage.account_emailaddress
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.account_emailaddress: ~2 rows (aproximadamente)
INSERT INTO `account_emailaddress` (`id`, `email`, `verified`, `primary`, `user_id`) VALUES
	(1, 'daviiiwilliams@live.com', 0, 1, 1),
	(2, 'chav3s@msn.com', 0, 1, 2);

-- Copiando estrutura para tabela webpage.account_emailconfirmation
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.account_emailconfirmation: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.auth_group: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.auth_group_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.auth_permission: ~88 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add dados', 7, 'add_dados'),
	(26, 'Can change dados', 7, 'change_dados'),
	(27, 'Can delete dados', 7, 'delete_dados'),
	(28, 'Can view dados', 7, 'view_dados'),
	(29, 'Can add dispensa', 8, 'add_dispensa'),
	(30, 'Can change dispensa', 8, 'change_dispensa'),
	(31, 'Can delete dispensa', 8, 'delete_dispensa'),
	(32, 'Can view dispensa', 8, 'view_dispensa'),
	(33, 'Can add logradouro', 9, 'add_logradouro'),
	(34, 'Can change logradouro', 9, 'change_logradouro'),
	(35, 'Can delete logradouro', 9, 'delete_logradouro'),
	(36, 'Can view logradouro', 9, 'view_logradouro'),
	(37, 'Can add notafiscal', 10, 'add_notafiscal'),
	(38, 'Can change notafiscal', 10, 'change_notafiscal'),
	(39, 'Can delete notafiscal', 10, 'delete_notafiscal'),
	(40, 'Can view notafiscal', 10, 'view_notafiscal'),
	(41, 'Can add pedido carrinho', 11, 'add_pedidocarrinho'),
	(42, 'Can change pedido carrinho', 11, 'change_pedidocarrinho'),
	(43, 'Can delete pedido carrinho', 11, 'delete_pedidocarrinho'),
	(44, 'Can view pedido carrinho', 11, 'view_pedidocarrinho'),
	(45, 'Can add pedido comanda', 12, 'add_pedidocomanda'),
	(46, 'Can change pedido comanda', 12, 'change_pedidocomanda'),
	(47, 'Can delete pedido comanda', 12, 'delete_pedidocomanda'),
	(48, 'Can view pedido comanda', 12, 'view_pedidocomanda'),
	(49, 'Can add pedido conferencia', 13, 'add_pedidoconferencia'),
	(50, 'Can change pedido conferencia', 13, 'change_pedidoconferencia'),
	(51, 'Can delete pedido conferencia', 13, 'delete_pedidoconferencia'),
	(52, 'Can view pedido conferencia', 13, 'view_pedidoconferencia'),
	(53, 'Can add pessoa', 14, 'add_pessoa'),
	(54, 'Can change pessoa', 14, 'change_pessoa'),
	(55, 'Can delete pessoa', 14, 'delete_pessoa'),
	(56, 'Can view pessoa', 14, 'view_pessoa'),
	(57, 'Can add produtos', 15, 'add_produtos'),
	(58, 'Can change produtos', 15, 'change_produtos'),
	(59, 'Can delete produtos', 15, 'delete_produtos'),
	(60, 'Can view produtos', 15, 'view_produtos'),
	(61, 'Can add rota', 16, 'add_rota'),
	(62, 'Can change rota', 16, 'change_rota'),
	(63, 'Can delete rota', 16, 'delete_rota'),
	(64, 'Can view rota', 16, 'view_rota'),
	(65, 'Can add usuario', 17, 'add_usuario'),
	(66, 'Can change usuario', 17, 'change_usuario'),
	(67, 'Can delete usuario', 17, 'delete_usuario'),
	(68, 'Can view usuario', 17, 'view_usuario'),
	(69, 'Can add email address', 18, 'add_emailaddress'),
	(70, 'Can change email address', 18, 'change_emailaddress'),
	(71, 'Can delete email address', 18, 'delete_emailaddress'),
	(72, 'Can view email address', 18, 'view_emailaddress'),
	(73, 'Can add email confirmation', 19, 'add_emailconfirmation'),
	(74, 'Can change email confirmation', 19, 'change_emailconfirmation'),
	(75, 'Can delete email confirmation', 19, 'delete_emailconfirmation'),
	(76, 'Can view email confirmation', 19, 'view_emailconfirmation'),
	(77, 'Can add social account', 20, 'add_socialaccount'),
	(78, 'Can change social account', 20, 'change_socialaccount'),
	(79, 'Can delete social account', 20, 'delete_socialaccount'),
	(80, 'Can view social account', 20, 'view_socialaccount'),
	(81, 'Can add social application', 21, 'add_socialapp'),
	(82, 'Can change social application', 21, 'change_socialapp'),
	(83, 'Can delete social application', 21, 'delete_socialapp'),
	(84, 'Can view social application', 21, 'view_socialapp'),
	(85, 'Can add social application token', 22, 'add_socialtoken'),
	(86, 'Can change social application token', 22, 'change_socialtoken'),
	(87, 'Can delete social application token', 22, 'delete_socialtoken'),
	(88, 'Can view social application token', 22, 'view_socialtoken');

-- Copiando estrutura para tabela webpage.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `pessoafisica` char(16) DEFAULT NULL,
  `aniversario` datetime DEFAULT NULL,
  `telefone1` char(16) DEFAULT NULL,
  `telefone2` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.auth_user: ~2 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `pessoafisica`, `aniversario`, `telefone1`, `telefone2`) VALUES
	(1, 'pbkdf2_sha256$390000$3l349XFvDKNL6m01J21nMD$VR5Sdo+v6Yglsj+aTtrVkVLw5ykbsRt0TFCsVfyh5dI=', '2023-01-31 15:27:21.852433', 0, 'daviiiwilliams@live.com', 'Davidson George', 'Silverio Correa', 'daviiiwilliams@live.com', 1, 1, '2023-01-29 07:20:09.899151', NULL, NULL, NULL, NULL),
	(2, 'pbkdf2_sha256$390000$hVAs54fW4SAdn7ewG07Hej$uXZuytjIgcDa7qAUZw7VxDcDXzOXSsrahpnZCkxj2PU=', '2023-01-30 23:53:25.000000', 0, 'chav3s@msn.com', '', '', 'chav3s@msn.com', 0, 1, '2023-01-29 07:37:27.692916', NULL, NULL, NULL, NULL);

-- Copiando estrutura para tabela webpage.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.auth_user_groups: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.auth_user_user_permissions: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.dados
CREATE TABLE IF NOT EXISTS `dados` (
  `nomefiscal` varchar(45) NOT NULL,
  `nomesocial` varchar(60) DEFAULT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `telefonea` char(11) DEFAULT NULL,
  `telefoneb` char(11) DEFAULT NULL,
  `telefonec` char(11) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `fundacao` datetime DEFAULT NULL,
  `historia` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.dados: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.dispensa
CREATE TABLE IF NOT EXISTS `dispensa` (
  `produtoid` int NOT NULL,
  `lote` varchar(12) NOT NULL,
  `quantidade` int DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `obs` text,
  `tipoEstoque` int DEFAULT '0',
  KEY `FK_dispensa_produtos` (`produtoid`),
  CONSTRAINT `FK_dispensa_produtos` FOREIGN KEY (`produtoid`) REFERENCES `produtos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.dispensa: ~5 rows (aproximadamente)
INSERT INTO `dispensa` (`produtoid`, `lote`, `quantidade`, `validade`, `dataHora`, `obs`, `tipoEstoque`) VALUES
	(10, 'abx 2252', 12, '2023-01-28 12:15:04', '2023-07-28 12:15:05', NULL, 0),
	(30, 'slara012023 ', 1, '2023-01-30 16:59:34', NULL, NULL, 0),
	(100, 'hamburguer', 1, NULL, NULL, NULL, 0),
	(220, 'sobremesa', 1, NULL, NULL, NULL, 0),
	(140, 'fritas', 1, NULL, NULL, NULL, 0);

-- Copiando estrutura para tabela webpage.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.django_admin_log: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.django_content_type: ~22 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(18, 'account', 'emailaddress'),
	(19, 'account', 'emailconfirmation'),
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'inicio', 'dados'),
	(8, 'inicio', 'dispensa'),
	(9, 'inicio', 'logradouro'),
	(10, 'inicio', 'notafiscal'),
	(11, 'inicio', 'pedidocarrinho'),
	(12, 'inicio', 'pedidocomanda'),
	(13, 'inicio', 'pedidoconferencia'),
	(14, 'inicio', 'pessoa'),
	(15, 'inicio', 'produtos'),
	(16, 'inicio', 'rota'),
	(17, 'inicio', 'usuario'),
	(6, 'sessions', 'session'),
	(20, 'socialaccount', 'socialaccount'),
	(21, 'socialaccount', 'socialapp'),
	(22, 'socialaccount', 'socialtoken');

-- Copiando estrutura para tabela webpage.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.django_migrations: ~24 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2023-01-28 15:10:37.316799'),
	(2, 'auth', '0001_initial', '2023-01-28 15:10:37.865609'),
	(3, 'admin', '0001_initial', '2023-01-28 15:10:38.032595'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-28 15:10:38.045290'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-28 15:10:38.058961'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-28 15:10:38.174680'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2023-01-28 15:10:38.251826'),
	(8, 'auth', '0003_alter_user_email_max_length', '2023-01-28 15:10:38.335806'),
	(9, 'auth', '0004_alter_user_username_opts', '2023-01-28 15:10:38.349479'),
	(10, 'auth', '0005_alter_user_last_login_null', '2023-01-28 15:10:38.427111'),
	(11, 'auth', '0006_require_contenttypes_0002', '2023-01-28 15:10:38.431995'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2023-01-28 15:10:38.444697'),
	(13, 'auth', '0008_alter_user_username_max_length', '2023-01-28 15:10:38.533554'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2023-01-28 15:10:38.602409'),
	(15, 'auth', '0010_alter_group_name_max_length', '2023-01-28 15:10:38.668803'),
	(16, 'auth', '0011_update_proxy_permissions', '2023-01-28 15:10:38.682476'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2023-01-28 15:10:38.767433'),
	(18, 'sessions', '0001_initial', '2023-01-28 15:10:38.808935'),
	(19, 'inicio', '0001_initial', '2023-01-28 15:14:37.875894'),
	(20, 'account', '0001_initial', '2023-01-29 07:15:28.962608'),
	(21, 'account', '0002_email_max_length', '2023-01-29 07:15:29.041707'),
	(22, 'socialaccount', '0001_initial', '2023-01-29 07:36:31.805304'),
	(23, 'socialaccount', '0002_token_max_lengths', '2023-01-29 07:36:31.870732'),
	(24, 'socialaccount', '0003_extra_data_default_dict', '2023-01-29 07:36:31.885381');

-- Copiando estrutura para tabela webpage.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.django_session: ~3 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0l23ag5r1w8qxfed8fztd3rpv823eng2', '.eJxVjU0KwjAQhe-StZQmpmnSnV4kTGamNFhSaVJQxLubShe6GXg_872X8LCVyW-ZVx9JDEKK068XAG-c9gDmebcbQFy2VJpv54hzc6mKU4kIJS7penz9oSbIU-VoM3adUwbbwBZYG2sJoSUbzqCCUZLGUZueGEESs6sXSaqeHanWKb1DM-dcZzw_7nF9iqF9fwDo5kRy:1pMh2C:fpesvLOLa5NyDvzhwdqSKWCK-w0Luw8ASQoiqqaLE8s', '2023-02-14 03:10:12.642709'),
	('m8av7v7vxaqx4t5tblm1hl5c4bo0gr20', '.eJxVjU0KwjAQhe-StZQmpmnSnV4kTGamNFhSaVJQxLubShe6GXg_872X8LCVyW-ZVx9JDEKK068XAG-c9gDmebcbQFy2VJpv54hzc6mKU4kIJS7penz9oSbIU-VoM3adUwbbwBZYG2sJoSUbzqCCUZLGUZueGEESs6sXSaqeHanWKb1DM-dcZzw_7nF9iqF9fwDo5kRy:1pMSiJ:_vLHscByGBO0OABclaAcBIKrEkLcBGhhCSR1jUFjarM', '2023-02-13 11:52:43.242637'),
	('sgqbcdgq2fu3axjnjpwfqg0biio10nn0', '.eJxVjdEKwjAMRf-lzzLa2nXt3vRHSppkrDg2WTtQxH-3kz3oSyD3JOe-RICtjGHLvIZEohdKnH6zCHjjeQcwTXvcAOKyzaX53hw4N5e68VwSQknLfD2-_lQj5LF6jB3a1muLMrIDNtY5QpDk4hl0tFrRMBjbESMoYvZ1IindsSctvTa7NHPOtSbw457Wp-hVJVbK9weGLUWk:1pMgio:y8IAwMchjKjIdNUGKswTjnb2ma9tEDiUX-biJv1feU8', '2023-02-14 02:50:10.346909');

-- Copiando estrutura para tabela webpage.grupo_produto
CREATE TABLE IF NOT EXISTS `grupo_produto` (
  `id` int NOT NULL,
  `grupo_nome` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `grupo_identifica` varchar(45) NOT NULL DEFAULT '0',
  `modelo` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grupo_nome` (`grupo_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.grupo_produto: ~3 rows (aproximadamente)
INSERT INTO `grupo_produto` (`id`, `grupo_nome`, `grupo_identifica`, `modelo`) VALUES
	(1, 'hamburguers', '0', 1),
	(2, 'sobremesas', '0', 1),
	(3, 'bebidas', '0', 1);

-- Copiando estrutura para tabela webpage.logradouro
CREATE TABLE IF NOT EXISTS `logradouro` (
  `usuario` int NOT NULL,
  `cep` char(16) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `bloco` varchar(5) DEFAULT NULL,
  `casa` varchar(5) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `criadoem` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `logra_user_idx` (`usuario`),
  CONSTRAINT `logra_user` FOREIGN KEY (`usuario`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.logradouro: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.mostruario
CREATE TABLE IF NOT EXISTS `mostruario` (
  `reg` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `promocao` varchar(45) DEFAULT NULL,
  `nomefantasia` varchar(23) DEFAULT NULL,
  `descricao` text,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`reg`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `mostro_dispensa` FOREIGN KEY (`id`) REFERENCES `dispensa` (`produtoid`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.mostruario: ~4 rows (aproximadamente)
INSERT INTO `mostruario` (`reg`, `id`, `promocao`, `nomefantasia`, `descricao`, `valor`) VALUES
	(20, 30, 'bra', 'Fritas', 'Fritas', 1),
	(100, 100, 'bra', 'Fritas', 'Fritas', 1),
	(140, 140, 'bra', 'Fritas', 'Fritas', 1),
	(220, 220, 'bra', 'Fritas', 'Fritas', 1);

-- Copiando estrutura para tabela webpage.notafiscal
CREATE TABLE IF NOT EXISTS `notafiscal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idfiscal` int DEFAULT NULL,
  `conferencia` int DEFAULT NULL,
  `tributos` float DEFAULT NULL,
  `encargos` float DEFAULT NULL,
  `descontos` float DEFAULT NULL,
  `identificador` char(16) DEFAULT NULL,
  `identificapj` varchar(14) DEFAULT NULL,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.notafiscal: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.pedido_carrinho
CREATE TABLE IF NOT EXISTS `pedido_carrinho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrinho` int NOT NULL,
  `produtoid` int DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  `observacao` varchar(18) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `dataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index` (`carrinho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.pedido_carrinho: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.pedido_comanda
CREATE TABLE IF NOT EXISTS `pedido_comanda` (
  `pedidoid` int NOT NULL,
  `carrinhoid` int DEFAULT NULL,
  `clienteid` int DEFAULT NULL,
  `vendedorID` int DEFAULT NULL,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pedidoid`),
  KEY `pedido_carrinho2_idx` (`carrinhoid`),
  KEY `pedido_auth_idx` (`clienteid`),
  KEY `pedido_vendedor_idx` (`vendedorID`),
  CONSTRAINT `pedido_auth` FOREIGN KEY (`clienteid`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `pedido_carrinho2` FOREIGN KEY (`carrinhoid`) REFERENCES `pedido_carrinho` (`carrinho`),
  CONSTRAINT `pedido_vendedor` FOREIGN KEY (`vendedorID`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.pedido_comanda: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.pedido_conferencia
CREATE TABLE IF NOT EXISTS `pedido_conferencia` (
  `id` int NOT NULL,
  `comanda` int NOT NULL,
  `totalbruto` float DEFAULT NULL,
  `totaldesconto` float DEFAULT NULL,
  `totalapagar` float DEFAULT NULL,
  `totalTaxa` float DEFAULT NULL,
  `bandeira` varchar(12) DEFAULT NULL,
  `valorrecebido` float DEFAULT NULL,
  `clienteid` int DEFAULT NULL,
  `funcionarioid` int DEFAULT NULL,
  `status` float DEFAULT NULL,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paraNotafiscal` (`comanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.pedido_conferencia: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int NOT NULL,
  `nomeproduto` varchar(20) NOT NULL,
  `nomefantasia` varchar(23) NOT NULL,
  `descricao` text NOT NULL,
  `promo` varchar(12) DEFAULT NULL,
  `custo` float DEFAULT '0',
  `valor` float DEFAULT '0',
  `imposto` decimal(2,0) DEFAULT '0',
  `taxa` float DEFAULT '0',
  `g_id` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `p_bl` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomeProduto_UNIQUE` (`nomeproduto`),
  UNIQUE KEY `nomeFantasia_UNIQUE` (`nomefantasia`),
  KEY `FK_produtos_grupo_produto` (`g_id`),
  CONSTRAINT `FK_produtos_grupo_produto` FOREIGN KEY (`g_id`) REFERENCES `grupo_produto` (`grupo_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.produtos: ~29 rows (aproximadamente)
INSERT INTO `produtos` (`id`, `nomeproduto`, `nomefantasia`, `descricao`, `promo`, `custo`, `valor`, `imposto`, `taxa`, `g_id`, `p_bl`) VALUES
	(10, 'agua s ml', 'agua sem gas', 'agua mineral sem gas 500ml', NULL, 0, 4, 2, 0, 'bebidas', 0),
	(11, 'agua s lt', 'garrafa d\'agua mineral', 'agua mineral sem gas 1L', NULL, 0, 6, 2, 0, 'bebidas', 0),
	(12, 'agua c ml', 'agua com gas', 'agua mineral com gas 500ml', NULL, 0, 4, 2, 0, 'bebidas', 0),
	(13, 'agua c lt', 'garrafa d\'agua com gas', 'agua mineral com gas 1L', NULL, 0, 6, 2, 0, 'bebidas', 0),
	(20, 'sucolaranja', 'suco d\'laranja', 'suco de laranja expremida natural, feito na hora', NULL, 0, 6, 3, 0, 'bebidas', 1),
	(21, 'sc limao', 'suco d\'limao', 'suco de limão expremida natural, feito na hora', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(22, 'sc limonada', 'limonada suiça', 'batido com gelo no liquidificador, suco refrescante e natural.', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(23, 'sucomaracuja', 'suco d\'maracuja', 'suco de maracuja coado, batido no liquidificador.', NULL, 0, 6, 3, 0, 'bebidas', 1),
	(24, 'sc frutas v', 'suco d\'frutas vermelhas', 'suco de morango, framboesa e amora, batido no liquidificador.', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(25, 'sc abacaxi', 'suco d\'abacaxi', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(26, 'sc abacaxi h', 'suco d\'abacaxi hortela', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(27, 'sc manga', 'suco d\'manga', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(28, 'sucogoiaba', 'suco d\'goiaba', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 1),
	(29, 'sucokiwi', 'suco d\'kiwi', 'suco de laranja expremida natural, feito na hora', NULL, 0, 6, 3, 0, 'bebidas', 1),
	(30, 'sc laranja E', 'suco d\'laranja e', 'suco de laranja expremida natural, feito na hora', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(31, 'sc limao e', 'suco d\'limão e', 'suco de limão expremida natural, feito na hora', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(32, 'sc limonada e', 'limonada suiça e', 'batido com gelo no liquidificador, suco refrescante e natural.', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(33, 'sc maracuja e', 'suco d\'maracuja e', 'suco de maracuja coado, batido no liquidificador.', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(34, 'sc frutas v e', 'frutas vermelhas e', 'suco de morango, framboesa e amora, batido no liquidificador.', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(35, 'sc abacaxi e', 'suco d\'abacaxi e', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(36, 'sc abacaxi h e', 'abacaxi hortelã e', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(37, 'sc manga e', 'suco d\'manga e', 'batido com gelo no liquidificador, refrescante', NULL, 0, 6, 3, 0, 'bebidas', 0),
	(100, 'chavaburg', 'Djayk burguer', 'Hamburguer especial da casa, carne de 175g temperada e grelhada em chama aberta com queijo prato, pão brioche, maionese, alface, tomate e cebola.', NULL, 0, 23.95, 7, 0, 'hamburguers', 1),
	(101, 'baconmax', 'B\'Max Situation', 'Hamburguer de 200g especial Alcatra, queijo, bacon, alfate, tomate, cebola e picles', NULL, 0, 29.95, 7, 0, 'hamburguers', 1),
	(102, 'burgx', 'E.I.C.  burguer', 'Hamburguer especial de 295g, queijo cheddar, bacon tiras, bacon tosty, maionese defumada, alface e pão brioche de mel', NULL, 0, 32.95, 7, 0, 'hamburguers', 1),
	(140, 'fritasp', 'Fritas pequena', 'Porção de batata fritas especiais', NULL, 0, 7.95, 7, 0, 'hamburguers', 1),
	(220, 'melito', 'Duas taças de sobremesa', 'sobremesa saborosa', NULL, 0, 0, 0, 0, 'bebidas', 0),
	(230, 'maylito', 'May Lito Brownei', 'Brownei de chocolate com bola de sorvete e calda de chocolate. Otimo para compartilhar!', NULL, 0, 19.95, 0, 0, 'sobremesas', 1),
	(383, 'SambiFrang', 'SambiFrang', 'Sanduiche de frango com cream cheese, cenoura, pepino, alface', NULL, 0, 22.45, 7, 0, 'hamburguers', 1);

-- Copiando estrutura para tabela webpage.rota
CREATE TABLE IF NOT EXISTS `rota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rotaid` int DEFAULT NULL,
  `notafiscalid` int DEFAULT NULL,
  `entregadorid` int DEFAULT NULL,
  `taxa` float DEFAULT NULL,
  `clientelocal` int DEFAULT NULL,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.rota: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.socialaccount_socialaccount
CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.socialaccount_socialaccount: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.socialaccount_socialapp
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.socialaccount_socialapp: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.socialaccount_socialtoken
CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.socialaccount_socialtoken: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
