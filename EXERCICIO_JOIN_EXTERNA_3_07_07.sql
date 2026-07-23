
-- ELIMANDO TABELAS CASO JA EXISTAM
DROP TABLE IF EXISTS tb_departamentos;
DROP TABLE IF EXISTS tb_funcionarios;
DROP TABLE IF EXISTS tb_faixa_salarial;

-- CRIANDO A TABELA DEPART
CREATE TABLE tb_departamentos_1 (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

-- CRIANDO A TABELA FUNCIONARIO
CREATE TABLE tb_funcionarios_1 (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES tb_departamentos_1(id_departamento)
);

-- CRIANDO A TABELA FAIXA SALARIAL
CREATE TABLE tb_faixa_salarial_1 (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);

-- Departamentos
INSERT INTO tb_departamentos_1 (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Vendas'),
(5, 'Inovação');

-- Funcionários
INSERT INTO tb_funcionarios_1 (id_funcionario, nome_funcionario, salario, id_departamento) VALUES
(1, 'Ana', 1800.00, 1),
(2, 'Bruno', 2500.00, 4), -- Vendas (Pleno)
(3, 'Carlos', 3200.00, 2),
(4, 'Daniela', 4500.00, 4), -- Vendas (Pleno)
(5, 'Eduardo', 5200.00, 3),
(6, 'Fernanda', 7000.00, 4);

-- Faixas salariais
INSERT INTO tb_faixa_salarial_1 (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);
 
 /* Parte 3 (Combinando Conceitos)  
Título: Desafio 3: Relatório Específico

Problema: Para finalizar, o RH pediu uma lista específica: eles querem o nome de todos os funcionários do nível 'Pleno' que trabalham no departamento de 'Vendas'.

Tarefa: Escreva a consulta SQL para este filtro.

(Dica: você precisará usar JOIN em 3 tabelas e também uma cláusula WHERE!)*/

SELECT * FROM tb_funcionarios_1 AS F
JOIN tb_faixa_salarial_1 AS FS
ON F.salario BETWEEN FS.salario_min AND FS.salario_max
JOIN tb_departamentos_1 AS D
ON F.id_departamento = D.id_departamento
WHERE FS.nivel = 'Pleno' AND D.nome_departamento = 'Vendas';


