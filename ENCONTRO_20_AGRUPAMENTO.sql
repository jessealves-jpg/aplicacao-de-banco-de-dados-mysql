
-- ACESSAR O BD
USE DB_T04301_JESSE_ALVES;

-- CRIANDO A TABELA DE DEMONSTRAÇÃOPTIMIZE
CREATE TABLE TB_PEDIDOS_LANCHONETE (
  id INT PRIMARY KEY,
  cliente VARCHAR(50),
  produto VARCHAR(50),
  valor DECIMAL(5,2),
  data_pedido DATE
);
 
-- INSERINDO OS REGISTROS
INSERT INTO TB_PEDIDOS_LANCHONETE (id, cliente, produto, valor, data_pedido) VALUES
(1, 'Ana', 'Hamburguer', 12.50, '2025-07-10'),
(2, 'Lucas', 'Coxinha', 5.00, '2025-07-10'),
(3, 'Beatriz', 'Suco', 4.00, '2025-07-10'),
(4, 'Carlos', 'Hamburguer', 12.50, '2025-07-10'),
(5, 'Ana', 'Refrigerante', 6.00, '2025-07-11'),
(6, 'Lucas', 'Hamburguer', 12.50, '2025-07-11'),
(7, 'Beatriz', 'Refrigerante', 6.00, '2025-07-11'),
(8, 'Carlos', 'Coxinha', 5.00, '2025-07-11'),
(9, 'Ana', 'Coxinha', 5.00, '2025-07-12'),
(10, 'Lucas', 'Suco', 4.00, '2025-07-12'),
(11, 'Beatriz', 'Hamburguer', 12.50, '2025-07-12'),
(12, 'Carlos', 'Refrigerante', 6.00, '2025-07-12'),
(13, 'Ana', 'Hamburguer', 12.50, '2025-07-13'),
(14, 'Lucas', 'Coxinha', 5.00, '2025-07-13'),
(15, 'Beatriz', 'Coxinha', 5.00, '2025-07-13'),
(16, 'Carlos', 'Suco', 4.00, '2025-07-13'),
(17, 'Ana', 'Suco', 4.00, '2025-07-14'),
(18, 'Lucas', 'Refrigerante', 6.00, '2025-07-14'),
(19, 'Beatriz', 'Suco', 4.00, '2025-07-14'),
(20, 'Carlos', 'Hamburguer', 12.50, '2025-07-14'),
(21, 'Ana', 'Coxinha', 5.00, '2025-07-15'),
(22, 'Lucas', 'Hamburguer', 12.50, '2025-07-15'),
(23, 'Beatriz', 'Refrigerante', 6.00, '2025-07-15'),
(24, 'Carlos', 'Coxinha', 5.00, '2025-07-15'),
(25, 'Ana', 'Hamburguer', 12.50, '2025-07-16'),
(26, 'Lucas', 'Coxinha', 5.00, '2025-07-16'),
(27, 'Beatriz', 'Hamburguer', 12.50, '2025-07-16'),
(28, 'Carlos', 'Suco', 4.00, '2025-07-16'),
(29, 'Lucas', 'Suco', 4.00, '2025-07-17'),
(30, 'Beatriz', 'Coxinha', 5.00, '2025-07-17');

-- CONSULTA INICIAL A TABELA
SELECT * FROM TB_PEDIDOS_LANCHONETE;

-- TOTAL ( QTDE) DE PEDIDOS POR CLIENTE

SELECT cliente AS Cliente,
	   COUNT(*) AS Total
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
ORDER BY Total DESC;
-- data pedido
SELECT data_pedido AS Cliente,
	   COUNT(*) AS Total
FROM TB_PEDIDOS_LANCHONETE
GROUP BY data_pedido
ORDER BY Total DESC;
 
 -- QTDE TOTAL DE PEDIDOS
 SELECT COUNT(*) AS TOTAL
 FROM TB_PEDIDOS_LANCHONETE;
 
 -- CONSULTA A BASE LANCHONETE
SELECT * FROM TB_PEDIDOS_LANCHONETE;

-- VALOR TOTAL GASTO POR CLIENTE
SELECT cliente AS Cliente,
	   SUM(valor) AS Valor_Total
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
ORDER BY Valor_Total DESC;

-- 	QTDE DE PEDIDOS E PRODUTOS COMPRADOS PELOS CLIENTES

SELECT cliente AS Cliente,
	   produto AS Produto,
       COUNT(*) AS Total
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente, produto
ORDER BY Total DESC;

-- TICKET MÉDIO POR CLIENTE -- função de arredondamento ROUND
SELECT cliente AS Cliente,
		ROUND(AVG(valor), 2) AS Ticket_Medio
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
ORDER BY Ticket_Medio DESC;

-- TICKET MÉDIO POR CLIENTE -- função de arredondamento FLOOR
SELECT cliente AS Cliente,
		FLOOR(AVG(valor)) AS Ticket_Medio
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
ORDER BY Ticket_Medio DESC;

-- TICKET MÉDIO POR CLIENTE -- FUNÇÃO CEIL

SELECT cliente AS Cliente,
	   CEIL(AVG(valor)) AS Ticket_Medio
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
ORDER BY Ticket_Medio DESC;

-- FUNÇÃO MIM E MAX

SELECT MAX(data_pedido) AS Data_pri_pedido,
       MIN(data_pedido) AS Data_ult_pedido
FROM TB_PEDIDOS_LANCHONETE;


-- TICKET MEDIO - FUNÇÃO (HAVING) FILTRO PARA SER USADO SOBRE O RESULTADO

SELECT cliente AS Cliente,
       ROUND(AVG(valor), 2) AS Ticket_Medio
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
HAVING Ticket_Medio >= '7.00';

-- 
SELECT cliente AS Cliente,
       ROUND(AVG(valor), 2) AS Ticket_Medio
FROM TB_PEDIDOS_LANCHONETE
GROUP BY cliente
HAVING AVG(valor) >= (SELECT AVG(valor) AS total
                      FROM TB_PEDIDOS_LANCHONETE);


