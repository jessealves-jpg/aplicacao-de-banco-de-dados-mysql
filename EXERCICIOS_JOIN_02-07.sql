
USE DB_T04301_JESSE_ALVES
-- 
CRIANDO AS TABELAS
-- Clientes
CREATE TABLE Clientes1 ( 
        id_cliente INT PRIMARY KEY, 
        nome VARCHAR(50) 
); 

-- Produtos
CREATE TABLE Produtos1 ( 
       id_produto INT PRIMARY KEY, 
       nome_produto VARCHAR(50) 
); 

-- Pedidos
CREATE TABLE Pedidos1 ( 
       id_pedido INT PRIMARY KEY, 
       id_cliente INT,
       id_produto INT 
);

SELECT * FROM Clientes1;
SELECT * FROM Produtos1;
SELECT * FROM Pedidos1;

 -- INSERINDO AS INFORMAÇÕES NA TABELA
 -- Clientes 
INSERT INTO Clientes1 (id_cliente, nome) VALUES 
(1, 'Amanda'), 
(2, 'Bernardo'), 
(3, 'Camila');

 -- Produtos 
INSERT INTO Produtos1 (id_produto, nome_produto) VALUES 
(101, 'Notebook'), 
(102, 'Mouse'), 
(103, 'Teclado'); 

-- Pedidos 
INSERT INTO Pedidos1 (id_pedido, id_cliente, id_produto) VALUES 
(1, 1, 101), -- Amanda comprou Notebook 
(2, 2, 102), -- Bernardo comprou Mouse 
(3, 4, 101), -- Cliente inexistente 
(4, 2, 105); -- Produto inexistente

-- RESOLUÇAO DO PROBLEMA
-- 1► INNER JOIN - Liste os pedidos com nome do cliente e nome do produto. Apenas pedidos válidos

SELECT P1.id_pedido AS Pedido,
	   C1.nome AS Cliente,
       PR1.nome_produto AS Produto
FROM Pedidos1 AS P1
INNER JOIN Clientes1 AS C1
ON P1.id_cliente = C1.id_cliente
INNER JOIN Produtos1 AS PR1
ON P1.id_produto = PR1.id_produto;

-- 

SELECT * FROM Clientes1;
SELECT * FROM Pedidos1;
SELECT * FROM Produtos1;

-- 2► LEFT JOIN - Mostre todos os cliente, com os produtos que compraram (se compraram).

SELECT C1.nome AS Nome,
       P1.id_pedido AS Pedido,
       PR1.nome_produto AS Produto 
FROM Clientes1 AS C1
LEFT JOIN Pedidos1 AS P1
ON C1.id_cliente = P1.id_cliente
LEFT JOIN Produtos1 AS PR1
ON P1.id_produto = PR1.id_produto;

-- 3► RIGHT JOIN - Mostre todos os pedidos, mesmo os que não têm cliente na base.
SELECT 

* FROM Pedidos1 AS P1
RIGHT JOIN Clientes1 AS C1
ON P1.id_cliente = C1.id_cliente
LEFT JOIN Produtos1 AS PR1
ON PR1.id_produto = P1.id_produto;

-- ESTRAS
-- Quais clientes ainda nao fizeram nenhum pedido?

SELECT C1.id_cliente, C1.nome
FROM Clientes1 	AS C1
LEFT JOIN Pedidos1 AS P1
ON C1.id_cliente = P1.id_cliente
WHERE P1.id_pedido IS NULL;
-- Quais pedidos estao com produto inexistente

SELECT P1.id_pedido,
       P1.id_cliente,
       P1.id_produto AS id_produto_invalido
FROM Pedidos1 AS P1
LEFT JOIN Produtos1 AS PR1
    ON P1.id_produto = PR1.id_produto
WHERE PR1.id_produto IS NULL;

-- Quais produtos ainda nao foram vendidos

SELECT PR1.id_produto, PR1.nome_produto
FROM Produtos1 AS PR1
LEFT JOIN Pedidos1 AS P1
    ON PR1.id_produto = P1.id_produto
WHERE P1.id_pedido IS NULL;


