
USE DB_T04301_JESSE_ALVES

CREATE TABLE tb_clientes_eletronic ( 
            id INT PRIMARY KEY AUTO_INCREMENT, 
            nome VARCHAR(50), 
            cidade VARCHAR(50), 
            idade INT, 
            ativo BOOLEAN 
); 


CREATE TABLE tb_produtos_eletronic ( 
          id INT PRIMARY KEY AUTO_INCREMENT, 
          nome VARCHAR(100), 
          categoria VARCHAR(50), 
          preco DECIMAL(10,2) 
);
 
 INSERT INTO tb_clientes_eletronic (nome, cidade, idade, ativo) 
VALUES ('João', 'São Paulo', 25, 1), 
               ('Maria', 'Santos', 30, 1), 
               ('Bruno', 'Campinas', 19, 0), 
               ('Ana', 'São Paulo', 40, 1), 
               ('Carla', 'Campinas', 25, 0), 
               ('Marcos', 'São Bernardo', 33, 1),
               ('Fernanda', 'Santos', 22, 1); 


INSERT INTO tb_produtos_eletronic (nome, categoria, preco) 
VALUES ('Fone Bluetooth', 'Eletrônicos', 120.00), 
               ('Mouse Gamer', 'Informática', 80.00),
               ('Capa Celular', 'Acessórios', 30.00), 
               ('Notebook', 'Eletrônicos', 2500.00),
               ('Teclado', 'Informática', 150.00),
               ('Carregador Turbo', 'Acessórios', 60.00), 
               ('Suporte de Celular', 'Acessórios', 25.00); 

-- RESOLUÇÃO DO EXERCICIO
-- 1º Liste todos os produtos com preço maior que 100 reais.

SELECT nome, categoria, preco FROM tb_produtos_eletronic
WHERE preco > 100
ORDER BY preco ASC;

-- 2º Liste os clientes que moram em São Paulo ou Campinas, com idade maior que 25 anos

SELECT nome, cidade, idade, ativo FROM tb_clientes_eletronic
WHERE cidade IN ('São Paulo', 'CAMPINAS')
AND idade > 25
ORDER BY nome ASC;

-- Opção 2 de resposta
SELECT nome, cidade, idade, ativo FROM tb_clientes_eletronic
WHERE (cidade = 'são Paulo' OR cidade = 'Campinas') AND idade >25;

-- 3º Liste os produtos que pertencem as categorias "Acessórios" ou "Informatica".
 
SELECT nome, categoria, preco FROM tb_produtos_eletronic
WHERE categoria IN ('Acessórios','Informática')
ORDER BY nome ASC;


