/* Exercício Prático
Enunciado da Prática

Pensando em um negócio de papelaria, dadas as tabelas de produtos, vendas e fornecedores.

Pergunta-se quais comandos para ciar, inserir e visualizar os registros dessas tabelas.

*/
USE DB_T04301_JESSE_ALVES;

-- EXERCICIO - TABELA FORNECEDORES

CREATE TABLE tb_fornecedores (
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome_fornecedor VARCHAR(100),
cnpj VARCHAR(20),
telefone VARCHAR(20),
email VARCHAR(50),
endereco VARCHAR(100)
);

SELECT * FROM tb_fornecedores

-- ALTERAR VALORES OU NOME DENTRO DA TABELA
ALTER TABLE tb_fornecedores
MODIFY COLUMN cnpj VARCHAR(30);

INSERT INTO tb_fornecedores (nome_fornecedor, cnpj, telefone, email, endereco)
VALUE('Tilibra','07282516000180','(55)11-95555-7777','tilibra@tilibra.com','Zona Franca de Manaus');
	
SELECT * FROM tb_fornecedores;

INSERT INTO tb_fornecedores (nome_fornecedor, cnpj, telefone, email, endereco)
		VALUE('Jandaia','06272516000380','(55)17-95555-6688','jandaia@jandaia.com','Mato Grosso do Sul');
        
INSERT INTO tb_fornecedores (nome_fornecedor, cnpj, telefone, email, endereco)
		VALUE('Brochura','72.062.725/0003-80','(55)75-98575-6188','brochura@brochura.com','Bahia');

-- EXERCICIO - TABELA PRODUTOS

CREATE TABLE tb_produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preco_unitario VARCHAR(100)
);
INSERT INTO tb_produtos(nome_produto, categoria, preco_unitario)
		VALUE('Caderno brochura', 'Material escolar','12,50'),
	 ('Caneta azul','Material escolar','2.00'),
     ('Lápis grafite','Material escolar','1.00'),
     ('Agenda','Organização','10.00')
     ;
    SELECT * FROM tb_produtos;
    
    -- EXERCÍCIO - TABELA VENDAS
    
    CREATE TABLE tb_vendas (
		id_venda int PRIMARY KEY AUTO_INCREMENT,
        data_venda DATE NOT NULL,
        quantidade INT,
		forma_pagamento VARCHAR(60)
        
  ) ;
  INSERT INTO tb_vendas (data_venda, quantidade, forma_pagamento)
			VALUE('2026-01-15', '100','Boleto 28 dias'),
				 ('2023-07-07', '50','Parcelado 5x'),
                 ('2003-05-26','180','Pix')
                 ;
  
SELECT * FROM tb_vendas;

