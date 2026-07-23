
USE DB_T04301_JESSE_ALVES
-- Apagando as tabelas
DROP TABLE tb_produtosx;
DROP TABLE tb_vendasx;
DROP TABLE tb_vendasx;

-- Tabela de Produtos
CREATE TABLE tb_produtosx (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela de Vendas
CREATE TABLE tb_vendasx (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES tb_produtosx(id_produto)
);

CREATE TABLE tb_faixa_precox (
    id_faixa INT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    preco_min DECIMAL(10,2) NOT NULL,
    preco_max DECIMAL(10,2)
);

-- Inserindo Produtos
INSERT INTO tb_produtosx (id_produto, nome, preco) VALUES
(1, 'Caderno', 10.00),
(2, 'Caneta', 2.50),
(3, 'Mochila', 120.00),
(4, 'Notebook', 3500.00),
(5, 'Mouse', 80.00),
(6, 'Teclado', 150.00),
(7, 'Garrafa', 25.00),
(8, 'Livro', 60.00),
(9, 'Fone de Ouvido', 250.00),
(10, 'Calculadora', 90.00);

-- Inserindo Vendas
INSERT INTO tb_vendasx (id_venda, id_produto, quantidade, data_venda) VALUES
(1, 1, 3, '2025-08-01'),
(2, 2, 10, '2025-08-02'),
(3, 3, 1, '2025-08-02'),
(4, 5, 2, '2025-08-03'),
(5, 1, 1, '2025-08-04'),
(6, 9, 4, '2025-08-04'),
(7, 10, 1, '2025-08-05'),
(8, 2, 5, '2025-08-05'),
(9, 5, 1, '2025-08-06'),
(10, 8, 2, '2025-08-07');

INSERT INTO tb_faixa_precox (id_faixa, descricao, preco_min, preco_max) VALUES
(1, 'Barato', 0.00, 50.00),
(2, 'Intermediário', 50.01, 500.00),
(3, 'Caro', 500.01, 5000.00);

SELECT * FROM tb_produtosx;
SELECT * FROM tb_vendasx;
SELECT * FROM tb_faixa_precox;
-- RESOLVENDO O EXERCICIO

-- desafio 1 - 
/*1º MONTANDO O COMANDO

SELECT * FROM tb_produtosx AS P
LEFT JOIN tb_vendasx AS V
ON tb_produtosx.id_produto = tb_vendasx.id_produto;
*/
-- REESTRUTURANDO O COMANDO
SELECT
	P.nome AS NOME,
    V.quantidade AS QTDD,
    V.data_venda AS DATA
FROM tb_produtosx AS P
LEFT JOIN tb_vendasx AS V
ON P.id_produto = V.id_produto
ORDER BY V.quantidade DESC;

-- Desafio 2 
/* 1º MONTANDO O COMANDO 
SELECT * FROM tb_produtosx AS P
JOIN tb_faixa_precox AS F
ON P.preco BETWEEN F.preco_min AND F.preco_max
*/
-- 2º REESTRUTURANDO O COMANDO
SELECT P.nome Nome,
       P.preco Preço,
       F.descricao Classificação
FROM tb_produtosx P
JOIN tb_faixa_precox F
ON P.preco BETWEEN F.preco_min AND F.preco_max
ORDER BY F.descricao ASC;

