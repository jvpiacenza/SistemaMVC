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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.aluguel: ~12 rows (aproximadamente)
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `nome_razao_social` varchar(255) NOT NULL,
  `nome_social_fantasia` varchar(255) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `pais` varchar(50) DEFAULT 'Brasil',
  `documento` varchar(14) NOT NULL,
  `tipo` enum('CPF','CNPJ') NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.pessoas: ~16 rows (aproximadamente)
DELETE FROM `pessoas`;
INSERT INTO `pessoas` (`id`, `nome_razao_social`, `nome_social_fantasia`, `cep`, `endereco`, `numero`, `bairro`, `cidade`, `estado`, `pais`, `documento`, `tipo`, `email`, `data_cadastro`) VALUES
	(5, 'Breno Guntendorfer Cabrera', 'Brenao Corinthiano', '19030260', 'Avenida Doutor Ibrain Nobre', '1300', 'Parque Furquim', 'Presidente Prudente', 'SP', 'Brasil', '43310149838', 'CPF', 'brenocabrera@gmail.com', '2026-05-05 12:19:35'),
	(6, 'João Silva Santos', 'João Silva', '30130100', 'Rua das Flores', '123', 'Centro', 'Belo Horizonte', 'MG', 'Brasil', '12345678901', 'CPF', 'joao.silva@email.com', '2026-05-26 16:34:32'),
	(7, 'Maria Oliveira Costa', NULL, '22041020', 'Avenida Atlântica', '456', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil', '98765432100', 'CPF', 'maria.oliveira@email.com', '2026-05-26 16:34:32'),
	(8, 'Tech Solutions LTDA', 'Tech Solutions', '01310900', 'Avenida Paulista', '1000', 'Bela Vista', 'São Paulo', 'SP', 'Brasil', '12345678000195', 'CNPJ', 'contato@techsolutions.com.br', '2026-05-26 16:34:32'),
	(9, 'Ana Clara Mendes', NULL, '69005010', 'Rua Eduardo Ribeiro', '789', 'Centro', 'Manaus', 'AM', 'Brasil', '45678912345', 'CPF', 'ana.mendes@email.com', '2026-05-26 16:34:32'),
	(10, 'Construções ABC Ltda', 'Construtora ABC', '40015010', 'Rua Chile', '250', 'Comércio', 'Salvador', 'BA', 'Brasil', '11223344000188', 'CNPJ', 'orcamento@abcconstrucoes.com.br', '2026-05-26 16:34:32'),
	(11, 'Carlos Eduardo Lima', 'Cadulima', '79002020', 'Rua 14 de Julho', '567', 'Centro', 'Campo Grande', 'MS', 'Brasil', '32165498701', 'CPF', 'carlos.lima@email.com', '2026-05-26 16:34:32'),
	(12, 'Supermercados Delta SA', 'Delta', '88010010', 'Rua Bocaiuva', '1200', 'Centro', 'Florianópolis', 'SC', 'Brasil', '99887766000155', 'CNPJ', 'contato@delta.com.br', '2026-05-26 16:34:32'),
	(13, 'Laura Fernanda Souza', NULL, '51020010', 'Avenida Engenheiro Domingos Ferreira', '890', 'Boa Viagem', 'Recife', 'PE', 'Brasil', '14785236901', 'CPF', 'laura.souza@email.com', '2026-05-26 16:34:32'),
	(14, 'Lucas Gabriel Rocha', NULL, '60150160', 'Rua Monsenhor Furtado', '345', 'Dionísio Torres', 'Fortaleza', 'CE', 'Brasil', '25874136902', 'CPF', 'lucas.rocha@email.com', '2026-05-26 16:34:32'),
	(15, 'Indústria Metalúrgica XYZ', 'Metal XYZ', '30140000', 'Rua Espírito Santo', '980', 'Funcionários', 'Belo Horizonte', 'MG', 'Brasil', '44556677000122', 'CNPJ', 'vendas@metalxyz.com.br', '2026-05-26 16:34:32'),
	(16, 'Fernanda Costa Almeida', 'Nanda Almeida', '20271030', 'Rua Barão de Mesquita', '432', 'Tijuca', 'Rio de Janeiro', 'RJ', 'Brasil', '36985214703', 'CPF', 'fernanda.almeida@email.com', '2026-05-26 16:34:32'),
	(17, 'Farmácia Popular Ltda', 'Farmácia Popular', '57020030', 'Avenida Fernandes Lima', '1500', 'Farol', 'Maceió', 'AL', 'Brasil', '77889966000133', 'CNPJ', 'contato@farmaciapopular.com.br', '2026-05-26 16:34:32'),
	(18, 'Rafael Mendes Oliveira', NULL, '88040001', 'Rua Almirante Lamego', '210', 'Trindade', 'Florianópolis', 'SC', 'Brasil', '74185296304', 'CPF', 'rafael.mendes@email.com', '2026-05-26 16:34:32'),
	(19, 'Consultoria Financeira Alpha', 'Alpha Consult', '01310921', 'Rua Haddock Lobo', '595', 'Cerqueira César', 'São Paulo', 'SP', 'Brasil', '55443322000144', 'CNPJ', 'contato@alphaconsult.com.br', '2026-05-26 16:34:32'),
	(20, 'Beatriz Santos Lima', NULL, '79002410', 'Avenida Afonso Pena', '678', 'Amambaí', 'Campo Grande', 'MS', 'Brasil', '85214796305', 'CPF', 'beatriz.lima@email.com', '2026-05-26 16:34:32');

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
