-- Remover tabelas existentes, começando pelas dependentes
DROP TABLE IF EXISTS rastreamento;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS funcao;
DROP TABLE IF EXISTS veiculo;

-- Criar tabelas novamente
CREATE TABLE veiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    vel_maxima INT NOT NULL
);

CREATE TABLE funcao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    funcao_id INT NOT NULL,
    FOREIGN KEY (funcao_id) REFERENCES funcao(id)
);

CREATE TABLE rastreamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    data_ocorrencia DATETIME NOT NULL,
    vel_registrada INT NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

-- Inserts para a tabela funcao
INSERT INTO funcao (nome) VALUES
('Motorista'),
('Gerente'),
('Técnico'),
('Analista'),
('Supervisor'),
('Operador'),
('Auxiliar'),
('Coordenador'),
('Engenheiro'),
('Diretor');

-- Inserts para a tabela funcionario
INSERT INTO funcionario (nome, funcao_id) VALUES
('João Silva', 1),
('Maria Oliveira', 2),
('Carlos Souza', 3),
('Ana Costa', 4),
('Pedro Lima', 5),
('Fernanda Santos', 6),
('Rafael Carvalho', 7),
('Juliana Mendes', 8),
('Rodrigo Borges', 9),
('Patrícia Almeida', 10),
('Bruno Pereira', 1),
('Simone Araújo', 2),
('Leonardo Costa', 3),
('Amanda Nunes', 4),
('Beatriz Lima', 5);

-- Inserts para a tabela veiculo
INSERT INTO veiculo (placa, nome, vel_maxima) VALUES
('ABC1234', 'Caminhão Volvo', 80),
('DEF5678', 'Ônibus Mercedes', 60),
('GHI9012', 'Carro Sedan', 120),
('JKL3456', 'SUV Toyota', 100),
('MNO7890', 'Van Fiat', 90),
('PQR1234', 'Moto Yamaha', 110),
('STU5678', 'Caminhão Scania', 80),
('VWX9012', 'SUV Honda', 100),
('YZA3456', 'Carro Hatch', 130),
('BCD7890', 'Pickup Ford', 110),
('EFG1234', 'Van Renault', 90),
('HIJ5678', 'Carro Esportivo', 140),
('KLM9012', 'SUV Nissan', 100),
('NOP3456', 'Moto Ducati', 150),
('QRS7890', 'Caminhão Iveco', 70);

-- Inserts para a tabela rastreamento
INSERT INTO rastreamento (veiculo_id, funcionario_id, data_ocorrencia, vel_registrada, latitude, longitude) VALUES
(1, 1, '2024-12-04 08:00:00', 90, -23.55052, -46.63330),
(2, 2, '2024-12-04 09:30:00', 70, -23.55123, -46.63245),
(3, 3, '2024-12-04 10:15:00', 125, -23.55212, -46.63421),
(4, 4, '2024-12-04 11:45:00', 105, -23.55345, -46.63178),
(5, 5, '2024-12-04 13:00:00', 95, -23.55467, -46.63089),
(6, 6, '2024-12-04 14:20:00', 115, -23.55589, -46.63567),
(7, 7, '2024-12-04 15:10:00', 85, -23.55612, -46.63312),
(8, 8, '2024-12-04 16:30:00', 102, -23.55723, -46.63234),
(9, 9, '2024-12-04 17:00:00', 135, -23.55834, -46.63123),
(10, 10, '2024-12-04 18:45:00', 120, -23.55912, -46.63078),
(11, 11, '2024-12-05 08:15:00', 100, -23.56045, -46.62956),
(12, 12, '2024-12-05 09:45:00', 140, -23.56123, -46.62834),
(13, 13, '2024-12-05 10:30:00', 110, -23.56234, -46.62789),
(14, 14, '2024-12-05 11:50:00', 155, -23.56345, -46.62678),
(15, 15, '2024-12-05 13:10:00', 75, -23.56456, -46.62567);
