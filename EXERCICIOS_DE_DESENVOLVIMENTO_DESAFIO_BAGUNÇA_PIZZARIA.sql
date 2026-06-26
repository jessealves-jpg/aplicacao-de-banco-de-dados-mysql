-- EXERCICIOS DE DESENVOLVIMENTO
-- Desafio:  A base Babunçada da Pizzaria

-- ACESSANDO O BANCO DE DADOS
USE DB_T04301_JESSE_ALVES
-- 1º CRIANDO 3 TABELAS - CLIENTES_PIZZARIA - PRODUTOS_PIZZARIA & PEDIDOS_PIZZARIA

CREATE TABLE clientes_pizzaria ( 
 id INT PRIMARY KEY, 
 nome VARCHAR(100), 
 telefone VARCHAR(20) 
); 

CREATE TABLE produtos_pizzaria ( 
 id INT PRIMARY KEY, 
 nome VARCHAR(100), 
 preco DECIMAL(5,2) 
);

CREATE TABLE pedidos_pizzaria ( 
 id INT PRIMARY KEY, 
 id_cliente INT, 
 id_produto INT, 
 data_pedido DATE 
);

-- 2º Inserindo os dados com Erros

INSERT INTO clientes_pizzaria VALUES 
(1, 'Ana Paula', '11999999999'), 
(2, 'Lucas Santos', '11988888888'), 
(3, 'Ana Paula', '11999999999'), -- duplicado 
(4, 'Carlos', NULL), -- sem telefone 
(5, 'MARIA jose', '11912345678');-- nome mal formatado

-- PRODUTOS 
INSERT INTO produtos_pizzaria VALUES 
(1, 'Pizza Calabresa', '35.00'), 
(2, 'Pizza Mussarela', '999.99'), -- preço absurdo 
(3, 'Pizza Marguerita', '-5.00'), -- preço negativo 
(4, 'PIZZA BACON', '40.00'), 
(5, 'Pizza Portuguesa', '0.00'); -- preço zero – 

-- PEDIDOS (sem FK, proposital) 
INSERT INTO pedidos_pizzaria VALUES 
(1, 2, 1, '2024-10-10'), 
(2, 4, 3, '2024-10-12'), 
(3, 7, 2, '2024-10-13'); -- cliente ID 7 não existe

-- 3º Efetuando a Correção solicitada pelo Gerente.

-- 1º correção - Deletar o clinte com o nome duplicado mantendo apenas um.

START TRANSACTION;

DELETE FROM clientes_pizzaria
WHERE nome = 'Ana Paula';
-- Deletei mas acabei deletando os dois, vou utilizar o comando (ROLLBACK)
SELECT * FROM clientes_pizzaria; -- OK

ROLLBACK;
-- COMANDO ROLLBACK REALIZADO
-------
-- NOVO COMANDO PARA EXCLUIR APENAS UM NOME DUPLICADO

START TRANSACTION;

DELETE FROM clientes_pizzaria
WHERE id = 3;

SELECT * FROM clientes_pizzaria; -- OK


-- 2º correção - Corrijir a formatação do nome Maria -

UPDATE clientes_pizzaria
SET nome = 'Maria Jose'
WHERE nome = 'MARIA jose';

SELECT * FROM clientes_pizzaria; -- OK

-- 3º correção - Atualizar o telefone do Carlos 

START TRANSACTION;

UPDATE clientes_pizzaria
SET telefone = NULL
WHERE telefone = 11911112222

-- Obs: O comando acima nao deu erro mas nao mudou de NULL para o numero do telefone.  

UPDATE clientes_pizzaria
SET telefone = '11911112222'
WHERE nome = 'Carlos';

SELECT * FROM clientes_pizzaria -- ok
WHERE nome = 'Carlos';
COMMIT;

-- 4º correção - atualizar os valores das pizzas
START TRANSACTION;

-- Corrigir preço da Pizza Mussarela (de 999.99 para 32.00)
UPDATE produtos_pizzaria
SET preco = 32.00
WHERE nome = 'Pizza Mussarela';

-- Corrigir preço da Pizza Marguerita (de -5.00 para 36.00)
UPDATE produtos_pizzaria
SET preco = 36.00
WHERE nome = 'Pizza Marguerita';

-- Corrigir preço da Pizza Portuguesa (de 0.00 para 38.00)
UPDATE produtos_pizzaria
SET preco = 38.00
WHERE nome = 'Pizza Portuguesa';

SELECT * FROM produtos_pizzaria;

COMMIT;

-- 5º Correção - Deletar o pedido que tem o id_ = 7
START TRANSACTION;

DELETE FROM pedidos_pizzaria
WHERE id_cliente = 7;
SELECT * FROM produtos_pizzaria;
COMMIT;

SELECT * FROM produtos_pizzaria;


















