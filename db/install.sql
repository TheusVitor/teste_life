-- Remover tabelas existentes, começando pelas dependentes
DROP TABLE IF EXISTS rastreamento;
DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS funcao;
DROP TABLE IF EXISTS veiculos;

-- Criar tabelas novamente
CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    vel_max DECIMAL(5, 2) NOT NULL
);

CREATE TABLE funcao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE funcionarios (
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
    velocidade_registrada DECIMAL(5, 2) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
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

-- Inserts para a tabela funcionarios
INSERT INTO funcionarios (nome, funcao_id) VALUES
('João Silva', 1),
('Maria Oliveira', 2),
('Carlos Souza', 3),
('Ana Costa', 4),
('Pedro Lima', 5),
('Fernanda Santos', 6),
('Rafael Carvalho', 7),
('Juliana Mendes', 8),
('Rodrigo Borges', 9),
('Patrícia Almeida', 10);

-- Inserts para a tabela veiculos
INSERT INTO veiculos (placa, nome, vel_max) VALUES
('ABC1234', 'Caminhão Volvo', 80.00),
('DEF5678', 'Ônibus Mercedes', 60.00),
('GHI9012', 'Carro Sedan', 120.00),
('JKL3456', 'SUV Toyota', 100.00),
('MNO7890', 'Van Fiat', 90.00),
('PQR1234', 'Moto Yamaha', 110.00),
('STU5678', 'Caminhão Scania', 80.00),
('VWX9012', 'SUV Honda', 100.00),
('YZA3456', 'Carro Hatch', 130.00),
('BCD7890', 'Pickup Ford', 110.00);

-- Inserts para a tabela rastreamento
INSERT INTO rastreamento (veiculo_id, funcionario_id, data_ocorrencia, velocidade_registrada, latitude, longitude) VALUES
(1, 1, '2024-12-04 08:00:00', 90.00, -23.55052, -46.63330),
(2, 2, '2024-12-04 09:30:00', 70.00, -23.55123, -46.63245),
(3, 3, '2024-12-04 10:15:00', 125.00, -23.55212, -46.63421),
(4, 4, '2024-12-04 11:45:00', 105.00, -23.55345, -46.63178),
(5, 5, '2024-12-04 13:00:00', 95.00, -23.55467, -46.63089),
(6, 6, '2024-12-04 14:20:00', 115.00, -23.55589, -46.63567),
(7, 7, '2024-12-04 15:10:00', 85.00, -23.55612, -46.63312),
(8, 8, '2024-12-04 16:30:00', 102.00, -23.55723, -46.63234),
(9, 9, '2024-12-04 17:00:00', 135.00, -23.55834, -46.63123),
(10, 10, '2024-12-04 18:45:00', 120.00, -23.55912, -46.63078);
