USE DB_T04301_JESSE_ALVES;
-- Criando a tabela Padaria
CREATE TABLE TB_PADARIA (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome_produto VARCHAR(50),
preco_produto DECIMAL(5,2),
categoria_produto VARCHAR(30)
);

-- 
SELECT * FROM TB_PADARIA;

-- Inserindo registros na tabela TB_PADARIA
INSERT INTO TB_PADARIA (nome_produto, preco_produto, categoria_produto)
VALUES  ('Pão Francês', 0.50, 'Pães'),
		('Bolo de Cenoura', 20.00, 'Bolos'),
		('Croissant', 4.50, 'Doces'),
		('Empada de Frango', 6.00, 'Salgados');
        
--         
SELECT * FROM TB_PADARIA;

-- Atualizando um produto

UPDATE TB_PADARIA
SET preco_produto = 5.00
WHERE nome_produto = 'Croissant';

--
SELECT * FROM TB_PADARIA;

-- Excluindo um desses registros na TB_PADARIA

DELETE FROM TB_PADARIA
WHERE id_produto = 4;

-- Usando START Transaction para atualizar 1 registro

START TRANSACTION;

UPDATE TB_PADARIA
SET preco_produto = 0.75
WHERE id_produto = 1;

DELETE FROM TB_PADARIA

-- Confirmando a transaçãORDER BY

COMMIT;



