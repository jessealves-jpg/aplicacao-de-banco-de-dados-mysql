-- ACESSANDO O BD
USE DB_T04301_JESSE_ALVES;

CREATE TABLE tb_funcionarios_j (
    id INT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    nome_completo VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    email VARCHAR(100)
);


CREATE TABLE tb_vendas_j (
    id INT,
    id_funcionario INT,
    data_venda DATE,
    valor DECIMAL(10,2),
    quantidade INT,
    observacao VARCHAR(100)
);
 
 
 INSERT INTO tb_funcionarios_j VALUES
(1, ' Ana ', 'Silva', NULL, 'Analista', 3000.00, '2023-01-10', 'ana.silva@empresa.com'),
(2, 'Bruno', 'Souza', NULL, 'Gerente', 8000.00, '2020-06-20', NULL),
(3, 'Carlos', ' Pereira ', NULL, 'Analista', 3200.00, '2022-03-15', 'carlos.pereira@empresa.com'),
(4, 'Daniela', 'Costa', NULL, 'Diretora', 15000.00, '2018-11-01', NULL),
(5, 'Eduardo', 'Almeida', NULL, 'Estagiário', 1500.00, '2025-01-05', 'eduardo.almeida@empresa.com');
 
 
 INSERT INTO tb_vendas_j VALUES
(1, 1, '2025-04-01', 100.00, 2, ' venda normal '),
(2, 2, '2025-04-10', 500.00, 5, 'Venda urgente'),
(3, 2, '2025-04-15', 200.00, 0, 'erro quantidade'),
(4, 3, '2025-03-20', 50.00, 1, NULL),
(5, 4, '2025-02-10', 1000.00, 10, '  desconto aplicado  '),
(6, 5, '2025-04-18', 80.00, 1, 'nova venda');

-- CONSULTANDO AS TABELAS
SELECT * FROM tb_funcionarios_j;
SELECT * FROM tb_vendas_j;

-- USANDO A FUNÇÃO CONCATENAR
SELECT TRIM(nome) as Nome,
	   TRIM(sobrenome) as Sobrenome,
       CONCAT(TRIM(nome), ' ', TRIM(sobrenome)) AS Nome_Completo
FROM tb_funcionarios_j;

 -- PREENCHER A INFORMAÇÃO DO NOME COMPLETO DO FUNCIONARIO ( retirar os espaços em branco que existe antes do nome)
 UPDATE tb_funcionarios_j
 SET nome_completo = CONCAT(TRIM(nome), ' ',TRIM(sobrenome))
 WHERE 1 = 1;
 
  UPDATE tb_funcionarios_j
 SET nome = CONCAT(TRIM(nome), ' ',TRIM(sobrenome))
 WHERE 1 = 1;
 
   UPDATE tb_funcionarios_j
 SET sobrenome = CONCAT(TRIM(nome), ' ',TRIM(sobrenome))
 WHERE 1 = 1;
 
 -- FUNÇÃO REPLACE -- 
 
 SELECT * FROM tb_vendas_j;
 
 SELECT observacao,
		trim(replace(lower(observacao), ' venda', 'pedido')) as observacao_tratada
FROM tb_vendas_j;

-- FUNÇÃO SUBSTRING

 SELECT * FROM tb_vendas_j;
 
 SELECT observacao,
		substring(observacao, 4, 5) as observacao_avaliada
FROM tb_vendas_j;

-- FUNÇOES NUMERIAS

SELECT	id,
		id_funcionario,
        data_venda,
        valor AS valor_original,
        ROUND(valor, 1) AS valor_tratado_round, -- arredonda
        FORMAT(FLOOR(valor), 2) as valor_tratado_floor, -- arredonda para baixo
		FORMAT(CEIL(valor), 2) as valor_tratado_ceil -- arredonda para CIMA
FROM tb_vendas_j;

-- FUNÇÃO ABS
select ABS(-10) AS VALOR;

-- FUNÇÃO MOD -- RESTO DA DIVISAO

SELECT MOD(10 , 3) AS RESTO_DIVISAO;

-- FUÇOES NUMERIAS
-- POTENCIA

SELECT POWER(2, 3) AS POTENCIA;

-- FUNCOES DE DATA - TRAS A DATA E A HORA ATUAL - DE ACORDO ONDE ESTIVER INSTALADO O SERVIDOR
-- 
SELECT NOW() AS DATA_HORA;

SELECT  id,
		data_venda,
        DAY(data_venda) AS DIA,
        MONTH(data_venda) AS MES,
        YEAR(data_venda) AS ANO,
        WEEK(data_venda) AS SEMANA
FROM tb_vendas_j
ORDER BY DIA ASC;

-- FUNÇÃO DATEDIFF

SELECT 	id,
		data_venda,
        ABS(datediff(data_venda, NOW())) AS DIF
FROM tb_vendas_j
ORDER BY ID ASC;

-- FUNÇÃO DATE_ADD

SELECT 	id,
		data_venda,
        date_add(data_venda, interval -1  MONTH) AS DATA_LIMITE
FROM tb_vendas_j;

-- DATE_FORMAT

SELECT	id,
		data_venda,
        date_format(data_venda, '%d/%m/%Y') AS data_formatada
FROM tb_vendas_j;

-- FUNÇOES LOGICAS E DE CONTROLE - IF

SELECT * FROM tb_funcionarios_j;
SELECT * FROM tb_vendas_j;

SELECT nome_completo,
		cargo,
        salario,
        IF(salario >= '5000.00', 'Alto Salário', 'Reajustar') AS classificacao
FROM tb_funcionarios_j;

-- FUNCAO CASE -- 
SELECT	nome_completo,
		cargo,
        salario,
		CASE
			WHEN cargo =  'Estagiário' THEN '1400.00'
            WHEN cargo =  'Analista' THEN '2900.00'
            WHEN cargo =  'Gerente' THEN '6500.00'
			ELSE '10000.00'
            END Salario_Base
-- WHEN cargo =  'Diretoria' THEN '1400.00'
FROM tb_funcionarios_j;


-- FUNÇÃO IFNULL
SELECT	id_funcionario,
		data_venda,
        observacao,
        TRIM(ifnull(observacao, 'Não Informado')) AS OBS
FROM tb_vendas_j;

-- NULLIF - SE DUAS INFORMAÇÕES FOREM INCORRETAS - ELE RETORNA NULO

SELECT	id,
		id_funcionario,
        quantidade,
		nullif(quantidade, 0) as qtde_tratado
FROM tb_vendas_j;

