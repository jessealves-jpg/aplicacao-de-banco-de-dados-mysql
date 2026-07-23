-- ACESSANDO O BD
USE DB_T04301_JESSE_ALVES;

-- CRIANDO AS TABELAS

CREATE TABLE Pedidos_JA (  
		id_pedido INT PRIMARY KEY AUTO_INCREMENT,
        nome_cliente VARCHAR(100),    
        produto VARCHAR(100),    
        valor DECIMAL(10,2),     
        desconto DECIMAL(10,2),    
        forma_pagamento VARCHAR(50) );
 
 -- INSERINDO OS DADOS NA TABELA
 
 INSERT INTO Pedidos_JA (nome_cliente, produto, valor, desconto, forma_pagamento) VALUES
 ('Ana Silva', 'Notebook', 3500.00, 200.00, 'Cartão'), 
 ('Bruno Lima', 'Mouse', 80.00, NULL, 'Pix'), 
 ('Carlos Souza', 'Teclado', 150.00, 0.00, 'Boleto'), 
 ('Daniela Rocha', 'Monitor', 1200.00, 100.00, 'Cartão'), 
 ('Eduardo Mendes', 'Headset', 300.00, NULL, 'Pix'), 
 ('Fernanda Alves', 'Cadeira Gamer', 900.00, 50.00, 'Boleto'), 
 ('Gabriel Costa', 'Webcam', 250.00, 0.00, 'Cartão'), 
 ('Helena Martins', 'Notebook', 4000.00, NULL, 'Cartão'), 
 ('Igor Santos', 'Mouse Pad', 40.00, 5.00, 'Pix'), 
 ('Juliana Freitas', 'Monitor', 1100.00, 0.00, 'Boleto');
 
 -- ACESSANDO A TABELA
 
 SELECT * FROM Pedidos_JA;
 -- -----------------------------------------------------------------------
 /* EXERCICIO 1 ► IF
 MOSTRAR: 
				NOME DO CLIENTE
                VALOR
                UMA COLUNA DIZENDO
                ►"ALTO" se valor > 1000
                ►"BAIXO" caso contrario
                */

SELECT	nome_cliente AS Cliente,
		valor AS Valor_Pedido,
        IF(valor > '1000.00','Alto','Baixo') AS COTACAO_VALOR
FROM Pedidos_JA;                
 -- -----------------------------------------------------------------------
 /* EXERCICIO 2 ► if:
 MOSTRAR
				CLIENTE
                FORMA DE PAGAMENTO
                COLUNA
                ►"A vista" se for Pix
                ►"Parcelado" caso contrario
                */
  -- CONSULTANDO A TABELA
 SELECT * FROM Pedidos_JA;    

SELECT	nome_cliente AS Cliente,
		forma_pagamento AS Forma_Pgt,
        IF(forma_pagamento = 'Pix','A vista','Parcelado') AS Forma_Pgt_Final	
FROM Pedidos_JA; 
 -- -----------------------------------------------------------------------
 /* EXERCICIO 3 ► CASE
 CLASSIFICAR PEDIDOS:
				<100 - "MUITO BARATO"
                100 A 500 "MEDIO"
                500 A 2000 "CARO"
                2000 "MUITO CARO"
                */
  -- CONSULTANDO A TABELA
 SELECT * FROM Pedidos_JA;    
 
 SELECT	nome_cliente AS Cliente,
		produto AS Produto,
        valor AS Valor_Produto,
        CASE
			WHEN valor < '100' THEN 'MUITO BARATO'
            WHEN valor BETWEEN  '100.00' AND '500.00' THEN 'MEDIO'
            WHEN valor < '500.01' AND '2000.00' THEN 'CARO'
        ELSE 'MUITO CARO' 
			END Tabela_valores		
 FROM Pedidos_JA;
 -- -----------------------------------------------------------------------
 /* EXERCICIO 4 ► CASE
CRIAR COLUNA: CATEGORIA_PRODUTO
			"informatica" Notebook, Mouse, Teclado,Webcam
			"MOVEIS" Cadeira Gamer
			"OUTROS" Restante 
*/

  -- CONSULTANDO A TABELA
 SELECT * FROM Pedidos_JA;    
 
 SELECT	nome_cliente AS Cliente,
		Produto AS Produtos,
		CASE
			WHEN Produto IN ('Notebook', 'Mouse', 'Teclado','Webcam') THEN 'Informática'
            WHEN Produto IN ('Cadeira Gamer') THEN 'Móveis'
		ELSE 'Outros'
			END CATEGORIA_PRODUTO
 FROM Pedidos_JA;
  -- -----------------------------------------------------------------------
 /* EXERCICIO 5 ► IFNULL (TRATAMENTO DE NULL
MOSTRAR:	CLIENTE
            DESCONTO
            SE FOR NULL MOSTRAR 0
*/
  -- CONSULTANDO A TABELA
 SELECT * FROM Pedidos_JA;  

SELECT 	nome_cliente AS Cliente,
		desconto AS Desconto,
         TRIM(ifnull(desconto, '0')) AS desconto
 FROM Pedidos_JA;









