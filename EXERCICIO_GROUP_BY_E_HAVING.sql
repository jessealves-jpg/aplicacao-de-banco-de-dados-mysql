

-- CRIANDO A TABELA 

CREATE TABLE PedidosKarrot ( 
     id INT AUTO_INCREMENT PRIMARY KEY, 
     cliente VARCHAR(50), 
     produto VARCHAR(50), 
     data_pedido DATE, 
     hora_pedido TIME,  
     preco DECIMAL(6,2),
     observacao VARCHAR(100) 
);
 
 -- INSERINDO OS REGISTROS
 
 INSERT INTO PedidosKarrot (cliente, produto, data_pedido, hora_pedido, preco, observacao) VALUES
('Ana Paula', 'Café Expresso', '2025-07-19', '08:10:00', 6.50, 'Com açúcar'),
('Bruno Costa', 'Cappuccino', '2025-07-19', '08:35:00', 8.00, 'Leite vegetal'),
('Carla Dias', 'Latte', '2025-07-19', '09:05:00', 7.50, 'Sem espuma'),
('Daniela Souza', 'Croissant', '2025-07-18', '10:15:00', 5.00, 'Com queijo'),
('Eduardo Lima', 'Chá Gelado', '2025-07-18', '11:20:00', 6.00, 'Com limão'),
('Fernanda Alves', 'Café Expresso', '2025-07-17', '14:30:00', 6.50, 'Sem açúcar'),
('Gabriel Silva', 'Pão de Queijo', '2025-07-16', '08:50:00', 4.00, 'Quentinho'),
('Heloísa Martins', 'Café Expresso', '2025-07-15', '07:45:00', 6.50, 'Com leite'),
('Igor Monteiro', 'Latte', '2025-07-14', '09:20:00', 7.50, 'Espuma extra'),
('Juliana Mendes', 'Cappuccino', '2025-07-14', '10:50:00', 8.00, 'Com canela'),
('Karen Rocha', 'Café Gelado', '2025-07-13', '16:00:00', 6.00, 'Com caramelo'),
('Lucas Prado', 'Chá Verde', '2025-07-13', '17:25:00', 6.00, 'Bem quente'),
('Mariana Borges', 'Pão de Queijo', '2025-07-13', '08:15:00', 4.00, 'Sem sal'),
('Nicolas Duarte', 'Croissant', '2025-07-12', '12:45:00', 5.00, 'Simples'),
('Olívia Ribeiro', 'Cappuccino', '2025-07-12', '13:00:00', 8.00, 'Com leite'),
('Paulo Vitor', 'Café Expresso', '2025-07-11', '08:05:00', 6.50, 'Forte'),
('Quésia Freitas', 'Latte', '2025-07-10', '11:40:00', 7.50, 'Com baunilha'),
('Rodrigo Lopes', 'Chá Gelado', '2025-07-10', '12:10:00', 6.00, 'Com hortelã'),
('Sara Oliveira', 'Café Expresso', '2025-07-10', '09:55:00', 6.50, 'Duplo'),
('Thiago Nunes', 'Cappuccino', '2025-07-10', '10:15:00', 8.00, 'Meio amargo');
 
 -- Exercícios Propostos para os Alunos
 
 -- CONSULTANDO A TABELA
 SELECT * FROM PedidosKarrot;
 
 -- EX1 – Mostrar quantos pedidos foram feitos por data do pedido.
 
 SELECT data_pedido AS Data_pedido,
	    COUNT(*) AS Total_Pedidos
FROM PedidosKarrot
GROUP BY data_pedido
ORDER BY data_pedido DESC;

 -- CONSULTANDO A TABELA
 SELECT * FROM PedidosKarrot;

-- EX2 – Mostrar a soma por produto dos pedidos que contêm a palavra leite na observação.
 
SELECT produto AS Produtos,
	   observacao AS OBS,
	    SUM(preco) AS Soma_pedidos
FROM PedidosKarrot
WHERE observacao LIKE '%leite%'
GROUP BY produto, observacao;

 -- CONSULTANDO A TABELA
 SELECT * FROM PedidosKarrot;

-- EX3 – Mostre a média de preços dos pedidos feitos no turno da manhã (antes de 12h), agrupado por produto.

SELECT produto AS Produto,
	  hora_pedido AS Horário_Pedido,
	   ROUND(AVG(preco), 2) AS Media_Precos
FROM PedidosKarrot
WHERE hora_pedido < '12:00'
GROUP BY produto, hora_pedido;

 -- CONSULTANDO A TABELA
 SELECT * FROM PedidosKarrot;
 
-- EX4 – Mostrar qual foi o menor e o maior valor cobrado para cada produto dos clientes cujo sobrenome termine com a palavra “a”.

SELECT produto AS Produtos,
       cliente AS Clientes,
       MAX(preco) AS Maior_Valor,
       MIN(preco) AS Menor_Valor
FROM PedidosKarrot
WHERE cliente LIKE '%a'
GROUP BY produto, cliente
ORDER BY produtos ASC;

 -- CONSULTANDO A TABELA
 SELECT * FROM PedidosKarrot;

-- EX5 – Quais produtos tiveram mais de 3 pedidos? (Use HAVING após o GROUP BY)

SELECT produto AS Produtos,
	   COUNT(*) AS Total_Pedidos
FROM PedidosKarrot
GROUP BY produtos
HAVING COUNT(*) >3;
