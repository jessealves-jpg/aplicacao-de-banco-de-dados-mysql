-- PRATICA FUNÇÕES - AULA 13/07/2026

-- CRIANDO A TABELA 
CREATE TABLE TB_ProdutosPadaria(
		Nome CHAR (50) PRIMARY KEY,
        Preco DECIMAL (6,2)
        );
        
-- INSERINDO OS DADOS NA TABELA

INSERT INTO TB_ProdutosPadaria (Nome, Preco) VALUES
    ('Pão Francês', 0.50),
    ('Croissant', 4.50),
    ('Bolo de Fubá', 12.00),
    ('Sonho', 3.00),
    ('Queijo Minas', 25.00),
    ('Café Expresso', 5.00);

-- CONSULTANDO A TABELA

SELECT * FROM TB_ProdutosPadaria;
-- 1► MOSTRAR O NOME DOS PRODUTOS EM CAIXA ALTA (MAIUSCULA)

SELECT UPPER(Nome) AS NomeProduto,
	Preco AS Preço
FROM TB_ProdutosPadaria;
        
-- 2► MOSTRAR NOME DOS PRODUTOS EM MINUSCULO

 SELECT LOWER(Nome) AS NomeProduto,
	Preco AS Preço
FROM TB_ProdutosPadaria;       

-- 3► CONTAR QUANTAS LETRAS TEM O NOME

 SELECT Nome AS Nome_Produto,
    LENGTH(Nome) AS QTDD_LETRAS
FROM TB_ProdutosPadaria
ORDER BY 2 DESC;

-- 4► EXIBIR AS 3 PRIMEIRAS LETRAS DO NOME

SELECT Nome AS Nome_Produto,
		LEFT(Nome, 3) AS Os_3_Pri_Letras
FROM TB_ProdutosPadaria;

-- 5► ARREDONDAR O PRECO
SELECT Nome AS Nome_Produto,
	ROUND(Preco, 1) AS Preço
FROM TB_ProdutosPadaria;

-- 6► MOSTRAR A DATA ATUAL COM OS PRODUTOS

SELECT CURDATE() AS DATA_ATUAL;

SELECT N.*,
		CURDATE() AS DATA_ATUAL
FROM TB_ProdutosPadaria N;

