-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.15.0.7171
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

-- Copiando estrutura para tabela exemplos.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `nome` varchar(50) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `datanascimento` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplos.funcionario: ~0 rows (aproximadamente)
DELETE FROM `funcionario`;

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
