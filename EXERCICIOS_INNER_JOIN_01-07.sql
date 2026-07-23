-- ENTRANDO NO BD

USE DB_T04301_JESSE_ALVES

-- Criar tabela de fornecedores
CREATE TABLE fornecedores (
    fornecedor_id INT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    cidade VARCHAR(50)
);

-- Criar tabela de produtos
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);

-- Criar tabela de vendas
CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
 
 -- INSERINDO OS DADOS NAS TABELAS
 
 INSERT INTO fornecedores (fornecedor_id, nome_fornecedor, cidade) VALUES
(1, 'Café do Brasil', 'São Paulo'),
(2, 'Sabor Mineiro Alimentos', 'Belo Horizonte'),
(3, 'Grãos Gourmet', 'Curitiba'),
(4, 'Delícias da Serra', 'Porto Alegre');

-- Inserir produtos

INSERT INTO produtos (produto_id, nome_produto, preco, estoque, fornecedor_id) VALUES
(1, 'Café Espresso Premium 250g', 29.90, 20, 1),
(2, 'Pão de Queijo Congelado 1kg', 39.90, 45, 2),
(3, 'Chá Verde Orgânico 100g', 24.90, 25, 3),
(4, 'Doce de Leite Artesanal 500g', 19.90, 15, 2),
(5, 'Bolo de Cenoura com Cobertura', 49.90, 30, 4),
(6, 'Café Moído Reserva Especial 500g', 54.90, 10, 1),
(7, 'Cookies de Chocolate 200g', 14.90, 35, 4);

INSERT INTO vendas (venda_id, produto_id, quantidade, data_venda) VALUES
(1, 1, 2, '2025-08-01'),
(2, 2, 1, '2025-08-01'),
(3, 3, 3, '2025-08-02'),
(4, 4, 1, '2025-08-02'),
(5, 5, 2, '2025-08-03'),
(6, 6, 1, '2025-08-03'),
(7, 1, 1, '2025-08-04'),
(8, 2, 2, '2025-08-04'),
(9, 3, 1, '2025-08-05'),
(10, 4, 2, '2025-08-05'),
(11, 5, 3, '2025-08-06'),
(12, 7, 4, '2025-08-06'),
(13, 6, 1, '2025-08-07'),
(14, 3, 2, '2025-08-07'),
(15, 1, 1, '2025-08-08'),
(16, 2, 1, '2025-08-08'),
(17, 5, 2, '2025-08-09'),
(18, 7, 3, '2025-08-09'),
(19, 4, 1, '2025-08-10'),
(20, 6, 1, '2025-08-10');
 
 -- RESOLUÇÃO 
 
 -- CONSULTA INICIAL AS BASES DE DADOS
SELECT * FROM TB_FORNECEDORES_PAD;
SELECT * FROM TB_PRODUTOS_PAD;
SELECT * FROM TB_VENDAS_PAD;

 
 -- 1. Exibir nome dos produtos e nome do fornecedor DE CADA UM
 
 SELECT P.nome_produto P,
		F.nome_fornecedor F
FROM produtos AS P
INNER JOIN fornecedores AS F
ON P.fornecedor_id = F.fornecedor_id;
 -- 2. Listar produtos vendidos com suas quantidades e data da venda
 
 SELECT data_venda, nome_produto, quantidade
 FROM produtos 
 INNER JOIN vendas
 ON vendas.produto_id = produtos.produto_id
 ORDER BY data_venda;
 
 
-- 3. Ver nome do produto valor total da venda e nome do fornecedor

SELECT P.nome_produto AS Produto,
       DV.quantidade AS Quantidade,
       DV.data_venda AS DataVenda
FROM produtos AS P
INNER JOIN vendas AS DV 
ON P.produto_id = DV.produto_id
ORDER BY DV.data_venda;


-- 4. Ver o nome do produto, valor total da venda e nome do fornecedor

SELECT P.nome_produto AS Produto,
       V.quantidade * P.preco AS ValorTotal,
       F.nome_fornecedor AS Fornecedor
FROM vendas V
INNER JOIN produtos P
    ON V.produto_id = P.produto_id
INNER JOIN fornecedores F
WHERE P.fornecedor_id = F.fornecedor_id
ORDER BY V.data_venda;


