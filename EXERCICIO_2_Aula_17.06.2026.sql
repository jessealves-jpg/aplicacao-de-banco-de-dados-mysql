
-- EXERCICIOS
USE DB_T04301_JESSE_ALVES;   -- DROP TABLE tb_fornecedores;

-- TABELA PRODUTO --------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tb_produtos (
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
preco DECIMAL(8,2)
);

INSERT INTO tb_produtos ( nome, preco)
	VALUE ('Arroz', 23.99),
		  ('Feijão', 10.75),
          ('Ovo', 15.99);

SELECT * FROM tb_produtos;           
-- OK TABELA RECRIADA ----------------------------------------------------------------------------------------------------------------------------------
          
-- TABELA VENDAS ---------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tb_vendas(
id_venda INT PRIMARY KEY AUTO_INCREMENT,
id_produto INT, 
quantidade INT,
data_venda DATE,
FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
);
SELECT * FROM tb_vendas; 

INSERT INTO tb_vendas (quantidade, data_venda)
	VALUE (100, '2026-07-01'),
		(85, '2025-03-19'),
        (48, '2026-12-25');
-- OK TABELA VENDAS CRIADA --------------------------------------------------------------------------------------------------------------------------

-- TABELA FORNECEDOR --------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tb_fornecedor (
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
telefone VARCHAR(20)
);      
SELECT * FROM tb_fornecedor;

INSERT INTO tb_fornecedor (nome, telefone)
		VALUE ('Adamastor', '(11) 95988-5588'),
			  ('Creusa', '(75) 98855-5577'),
              ('Josefino','(14) 98574-7986');
        
-- OK TABELA CRIADA ---------------------------------------------------------------------------------------------------------------------------------

        
        
        
        
        
        
        
        
        
        
        
        