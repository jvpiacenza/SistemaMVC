-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para exemplos
DROP DATABASE IF EXISTS `exemplos`;
CREATE DATABASE IF NOT EXISTS `exemplos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `exemplos`;

-- Copiando estrutura para tabela exemplos.aluguel
DROP TABLE IF EXISTS `aluguel`;
CREATE TABLE IF NOT EXISTS `aluguel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_al` int(11) NOT NULL,
  `cliente_al` int(11) NOT NULL,
  `automovel_al` int(11) NOT NULL,
  `data_aluguel` datetime NOT NULL,
  `data_devolver` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_al` (`cliente_al`),
  KEY `automovel_al` (`automovel_al`),
  KEY `funcionario_al` (`funcionario_al`),
  CONSTRAINT `automovel_al` FOREIGN KEY (`automovel_al`) REFERENCES `automoveis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cliente_al` FOREIGN KEY (`cliente_al`) REFERENCES `pessoas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionario_al` FOREIGN KEY (`funcionario_al`) REFERENCES `funcionarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.aluguel: ~15 rows (aproximadamente)
DELETE FROM `aluguel`;
INSERT INTO `aluguel` (`id`, `funcionario_al`, `cliente_al`, `automovel_al`, `data_aluguel`, `data_devolver`) VALUES
	(16, 1, 5, 3, '2024-05-01 08:00:00', '2024-05-04 08:00:00'),
	(17, 2, 6, 1, '2024-05-01 10:30:00', '2024-05-05 10:30:00'),
	(18, 3, 7, 7, '2024-05-02 09:15:00', '2024-05-06 09:15:00'),
	(19, 4, 8, 12, '2024-05-02 14:00:00', '2024-05-05 14:00:00'),
	(20, 5, 9, 2, '2024-05-03 11:45:00', '2024-05-10 11:45:00'),
	(21, 6, 10, 5, '2024-05-03 16:20:00', '2024-05-06 16:20:00'),
	(22, 7, 11, 15, '2024-05-04 08:30:00', '2024-05-07 08:30:00'),
	(23, 8, 12, 4, '2024-05-04 13:10:00', '2024-05-08 13:10:00'),
	(24, 9, 13, 10, '2024-05-05 09:00:00', '2024-05-12 09:00:00'),
	(25, 10, 14, 6, '2024-05-05 15:50:00', '2024-05-08 15:50:00'),
	(26, 11, 15, 8, '2024-05-06 10:00:00', '2024-05-11 10:00:00'),
	(27, 12, 16, 11, '2024-05-06 14:25:00', '2024-05-09 14:25:00'),
	(28, 13, 17, 14, '2024-05-07 08:15:00', '2024-05-10 08:15:00'),
	(29, 14, 18, 9, '2024-05-07 17:00:00', '2024-05-14 17:00:00'),
	(30, 15, 19, 13, '2024-05-08 11:30:00', '2024-05-12 11:30:00');

-- Copiando estrutura para tabela exemplos.automoveis
DROP TABLE IF EXISTS `automoveis`;
CREATE TABLE IF NOT EXISTS `automoveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `ano_fabricacao` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.automoveis: ~15 rows (aproximadamente)
DELETE FROM `automoveis`;
INSERT INTO `automoveis` (`id`, `nome`, `tipo`, `marca`, `modelo`, `ano_fabricacao`) VALUES
	(1, 'Civic Touring', 'carro', 'Honda', 'Civic', '2022'),
	(2, 'Corolla XEI', 'carro', 'Toyota', 'Corolla', '2021'),
	(3, 'Onix LT', 'carro', 'Chevrolet', 'Onix', '2020'),
	(4, 'HB20 Comfort', 'carro', 'Hyundai', 'HB20', '2023'),
	(5, 'Gol Trend', 'carro', 'Volkswagen', 'Gol', '2019'),
	(6, 'Uno Mille', 'carro', 'Fiat', 'Uno', '2018'),
	(7, 'Renegade Sport', 'carro', 'Jeep', 'Renegade', '2022'),
	(8, 'Tracker Premier', 'carro', 'Chevrolet', 'Tracker', '2023'),
	(9, 'CG 160 Titan', 'moto', 'Honda', 'CG 160', '2021'),
	(10, 'Biz 125', 'moto', 'Honda', 'Biz', '2020'),
	(11, 'Factor 150', 'moto', 'Yamaha', 'Factor', '2022'),
	(12, 'Fazer 250', 'moto', 'Yamaha', 'Fazer', '2021'),
	(13, 'Ninja 400', 'moto', 'Kawasaki', 'Ninja 400', '2023'),
	(14, 'XRE 300', 'moto', 'Honda', 'XRE 300', '2022'),
	(15, 'Meteor 350', 'moto', 'Royal Enfield', 'Meteor 350', '2023');

-- Copiando estrutura para tabela exemplos.funcionarios
DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  `datanascimento` date NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.funcionarios: ~15 rows (aproximadamente)
DELETE FROM `funcionarios`;
INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `telefone`, `datanascimento`, `email`) VALUES
	(1, 'Ana Silva', 123456789, 988881111, '1990-05-15', 'ana.silva@email.com'),
	(2, 'Bruno Oliveira', 234567890, 988882222, '1985-10-20', 'bruno.o@email.com'),
	(3, 'Carla Santos', 345678901, 988883333, '1992-03-12', 'carla.santos@email.com'),
	(4, 'Diego Souza', 456789012, 988884444, '1988-07-25', 'diego.souza@email.com'),
	(5, 'Elena Martins', 567890123, 988885555, '1995-12-30', 'elena.m@email.com'),
	(6, 'Fernando Costa', 678901234, 988886666, '1982-01-14', 'fernando.c@email.com'),
	(7, 'Gisele Rocha', 789012345, 988887777, '1993-09-08', 'gisele.rocha@email.com'),
	(8, 'Hugo Almeida', 890123456, 988888888, '1991-04-22', 'hugo.almeida@email.com'),
	(9, 'Isabela Lima', 901234567, 988889999, '1994-11-05', 'isabela.lima@email.com'),
	(10, 'João Pereira', 112233445, 977771111, '1987-06-18', 'joao.p@email.com'),
	(11, 'Karina Mendes', 223344556, 977772222, '1996-02-28', 'karina.mendes@email.com'),
	(12, 'Lucas Fernandes', 334455667, 977773333, '1989-08-10', 'lucas.f@email.com'),
	(13, 'Mariana Gomes', 445566778, 977774444, '1992-12-15', 'mariana.g@email.com'),
	(14, 'Natan Ribeiro', 556677889, 977775555, '1984-03-03', 'natan.r@email.com'),
	(15, 'Olívia Castro', 667788990, 977776666, '1997-07-07', 'olivia.castro@email.com');

-- Copiando estrutura para tabela exemplos.pessoas
DROP TABLE IF EXISTS `pessoas`;
CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_razao_social` varchar(255) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `documento` varchar(14) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.pessoas: ~17 rows (aproximadamente)
DELETE FROM `pessoas`;
INSERT INTO `pessoas` (`id`, `nome_razao_social`, `cep`, `documento`, `email`, `data_cadastro`) VALUES
	(5, 'Breno Guntendorfer Cabrera', '19030260', '43310149838', 'brenocabrera@gmail.com', '2026-05-05 12:19:35'),
	(6, 'João Silva Santos', '30130100', '12345678901', 'joao.silva@email.com', '2026-05-26 16:34:32'),
	(7, 'Maria Oliveira Costa', '22041020', '98765432100', 'maria.oliveira@email.com', '2026-05-26 16:34:32'),
	(8, 'Tech Solutions LTDA', '01310900', '12345678000195', 'contato@techsolutions.com.br', '2026-05-26 16:34:32'),
	(9, 'Ana Clara Mendes', '69005010', '45678912345', 'ana.mendes@email.com', '2026-05-26 16:34:32'),
	(10, 'Construções ABC Ltda', '40015010', '11223344000188', 'orcamento@abcconstrucoes.com.br', '2026-05-26 16:34:32'),
	(11, 'Carlos Eduardo Lima', '79002020', '32165498701', 'carlos.lima@email.com', '2026-05-26 16:34:32'),
	(12, 'Supermercados Delta SA', '88010010', '99887766000155', 'contato@delta.com.br', '2026-05-26 16:34:32'),
	(13, 'Laura Fernanda Souza', '51020010', '14785236901', 'laura.souza@email.com', '2026-05-26 16:34:32'),
	(14, 'Lucas Gabriel Rocha', '60150160', '25874136902', 'lucas.rocha@email.com', '2026-05-26 16:34:32'),
	(15, 'Indústria Metalúrgica XYZ', '30140000', '44556677000122', 'vendas@metalxyz.com.br', '2026-05-26 16:34:32'),
	(16, 'Fernanda Costa Almeida', '20271030', '36985214703', 'fernanda.almeida@email.com', '2026-05-26 16:34:32'),
	(17, 'Farmácia Popular Ltda', '57020030', '77889966000133', 'contato@farmaciapopular.com.br', '2026-05-26 16:34:32'),
	(18, 'Rafael Mendes Oliveira', '88040001', '74185296304', 'rafael.mendes@email.com', '2026-05-26 16:34:32'),
	(19, 'Consultoria Financeira Alpha', '01310921', '55443322000144', 'contato@alphaconsult.com.br', '2026-05-26 16:34:32'),
	(20, 'Beatriz Santos Lima', '79002410', '85214796305', 'beatriz.lima@email.com', '2026-05-26 16:34:32');

-- Copiando estrutura para tabela exemplos.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.produtos: ~0 rows (aproximadamente)
DELETE FROM `produtos`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
