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

-- Copiando estrutura para tabela webpage.carrinho
CREATE TABLE IF NOT EXISTS `carrinho` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carrinho` int DEFAULT NULL,
  `produtoID` int DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  `observacao` varchar(18) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `dataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `indice` (`carrinho`),
  KEY `paraDispensaProdutos_idx` (`produtoID`),
  CONSTRAINT `paraDispensaProdutos` FOREIGN KEY (`produtoID`) REFERENCES `dispensa` (`produtoID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.carrinho: ~1 rows (aproximadamente)
INSERT INTO `carrinho` (`id`, `carrinho`, `produtoID`, `qtd`, `observacao`, `status`, `dataHora`) VALUES
	(1, 1, 10, 2, 'temp amb', 1, '2023-01-28 09:26:29');

-- Copiando estrutura para tabela webpage.comanda
CREATE TABLE IF NOT EXISTS `comanda` (
  `pedidoID` int NOT NULL,
  `carrinhoID` int DEFAULT NULL,
  `clienteID` int DEFAULT NULL,
  `vendedorID` int DEFAULT NULL,
  `dataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pedidoID`),
  UNIQUE KEY `pedidoID_UNIQUE` (`pedidoID`),
  KEY `paraCarrinho_idx` (`carrinhoID`),
  KEY `paraConferencia_idx` (`clienteID`),
  CONSTRAINT `paraCarrinho` FOREIGN KEY (`carrinhoID`) REFERENCES `carrinho` (`carrinho`),
  CONSTRAINT `paraConferencia` FOREIGN KEY (`clienteID`) REFERENCES `conferencia` (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.comanda: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.conferencia
CREATE TABLE IF NOT EXISTS `conferencia` (
  `id` int NOT NULL,
  `comanda` int NOT NULL,
  `totalBruto` float DEFAULT NULL,
  `totalDesconto` float DEFAULT NULL,
  `totalAPagar` float DEFAULT NULL,
  `totalTaxa` float DEFAULT NULL,
  `bandeira` varchar(12) DEFAULT NULL,
  `valorRecebido` float DEFAULT NULL,
  `clienteID` int DEFAULT NULL,
  `funcionarioID` int DEFAULT NULL,
  `status` float DEFAULT NULL,
  `dataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paraLogradouro_idx` (`clienteID`),
  KEY `paraNotafiscal` (`comanda`),
  CONSTRAINT `paraLogradouro` FOREIGN KEY (`clienteID`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.conferencia: ~0 rows (aproximadamente)

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
  `produtoID` int NOT NULL,
  `lote` varchar(12) NOT NULL,
  `quantidade` int DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `obs` text,
  `tipoEstoque` int DEFAULT '0',
  KEY `paraProdutosIN_idx` (`produtoID`) /*!80000 INVISIBLE */,
  CONSTRAINT `paraProdutosIN` FOREIGN KEY (`produtoID`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.dispensa: ~2 rows (aproximadamente)
INSERT INTO `dispensa` (`produtoID`, `lote`, `quantidade`, `validade`, `dataHora`, `obs`, `tipoEstoque`) VALUES
	(10, 'AMRF DLVV1', 12, '2024-01-28 09:24:55', '2023-01-28 09:24:40', NULL, 0),
	(10, 'AMRF DLVV2', 12, '2024-04-28 09:25:59', '2023-01-28 09:25:46', NULL, 0);

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
  KEY `paraPessoa_idx` (`usuario`),
  CONSTRAINT `paraPessoa` FOREIGN KEY (`usuario`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.logradouro: ~0 rows (aproximadamente)

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
  `dataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `paraConf_idx` (`conferencia`),
  CONSTRAINT `paraConf` FOREIGN KEY (`conferencia`) REFERENCES `conferencia` (`comanda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.notafiscal: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.pessoa
CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `fisica` char(16) DEFAULT NULL,
  `telefone` char(16) DEFAULT NULL,
  `celular` char(16) DEFAULT NULL,
  `email` varchar(55) NOT NULL,
  `aniversario` date DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `paraUsuario` FOREIGN KEY (`id`) REFERENCES `usuario` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.pessoa: ~1 rows (aproximadamente)
INSERT INTO `pessoa` (`id`, `nome`, `fisica`, `telefone`, `celular`, `email`, `aniversario`) VALUES
	(1, 'user name', '32', '32', '32', '32@32.2', '2023-01-28');

-- Copiando estrutura para tabela webpage.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int NOT NULL,
  `nomeProduto` varchar(20) NOT NULL,
  `nomeFantasia` varchar(23) NOT NULL,
  `descricao` text NOT NULL,
  `promo` varchar(12) DEFAULT NULL,
  `custo` float DEFAULT '0',
  `valor` float DEFAULT '0',
  `imposto` decimal(2,0) DEFAULT '0',
  `taxa` float DEFAULT '0',
  `g_id` varchar(12) NOT NULL,
  `p_bl` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomeProduto_UNIQUE` (`nomeProduto`),
  UNIQUE KEY `nomeFantasia_UNIQUE` (`nomeFantasia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.produtos: ~1 rows (aproximadamente)
INSERT INTO `produtos` (`id`, `nomeProduto`, `nomeFantasia`, `descricao`, `promo`, `custo`, `valor`, `imposto`, `taxa`, `g_id`, `p_bl`) VALUES
	(10, 'agua s', 'agua mineral', 'agua mineral sem gas', '0', 1, 0, 0, 0, 'bebidas', 0);

-- Copiando estrutura para tabela webpage.rota
CREATE TABLE IF NOT EXISTS `rota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rotaID` int DEFAULT NULL,
  `notafiscalID` int DEFAULT NULL,
  `entregadorID` int DEFAULT NULL,
  `taxa` float DEFAULT NULL,
  `clienteLocal` int DEFAULT NULL,
  `dataHora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rota_logradouro_idx` (`clienteLocal`),
  KEY `rota_notafiscal_idx` (`notafiscalID`),
  CONSTRAINT `rota_logradouro` FOREIGN KEY (`clienteLocal`) REFERENCES `logradouro` (`usuario`),
  CONSTRAINT `rota_notafiscal` FOREIGN KEY (`notafiscalID`) REFERENCES `notafiscal` (`conferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.rota: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela webpage.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `login` varchar(23) NOT NULL,
  `senha` char(16) NOT NULL,
  `perfil` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela webpage.usuario: ~1 rows (aproximadamente)
INSERT INTO `usuario` (`codigo`, `login`, `senha`, `perfil`) VALUES
	(1, 'usuario', 'senha', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
