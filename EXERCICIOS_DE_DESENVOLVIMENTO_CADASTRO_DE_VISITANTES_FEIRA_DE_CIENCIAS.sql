-- EXERCICIO DE DESENVOLVIMENTO
-- CADASTRO DE VISITANTES NA FEIRA DE CIÊNCIAS

-- ACESSANDO O BANCO DE DADOS
USE DB_T04301_JESSE_ALVES; -- OK
-- 1º TAREFA
-- CRIANDO A TABELA VISITANTES

CREATE TABLE TB_VISITANTES (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL UNIQUE,
cidade VARCHAR (60) NOT NULL,
idade INT (3),
dia_visita DATE
);

-- CONFERINDO A TABELA CRIADA 
SELECT * FROM TB_VISITANTES; -- OK

-- Corrigindo o lançamento no camopo idade INT (3) deixando apenas INT
ALTER TABLE TB_VISITANTES
MODIFY idade INT;

-- CONFERINDO A TABELA CRIADA 
SELECT * FROM TB_VISITANTES; -- OK


-- 2º TAREFA
-- Inserindo 6 registros de visitantes
INSERT INTO TB_VISITANTES (nome, cidade, idade, dia_visita)
VALUES 	('Ana Souza', 'São Paulo', 25, '2024-09-10'),
		('Carlos Lima', 'Campinas', 30, '2024-09-10'),
		('Beatriz Santos', 'São Paulo', 22, '2024-09-11'),
		('João Pereira', 'Rio de Janeiro', 28, '2024-09-11'),
		('Mariana Alves', 'Campinas', 35, '2024-09-12'),
		('Pedro Costa', 'Curitiba', 40, '2024-09-12');


-- 3º TAREFA
-- Consultando todos os visitantes
SELECT * FROM TB_VISITANTES; -- OK

-- 4º TAREFA
-- Consultando um visitante de uma cidade esoecífica

SELECT * FROM TB_VISITANTES -- OK
WHERE cidade = 'Rio de Janeiro';

-- 5º TAREFA 
-- Atualizar a cidade de um visitante

UPDATE TB_VISITANTES
SET cidade = 'Indaiatuba'
WHERE nome = 'Pedro Costa';

SELECT * FROM TB_VISITANTES; -- OK

-- 6º TAREFA
-- Deletando um registro de um visitante pela idade

START TRANSACTION;

DELETE FROM TB_VISITANTES
WHERE idade = 28;

COMMIT;
SELECT * FROM TB_VISITANTES; -- OK



