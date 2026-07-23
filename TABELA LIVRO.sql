
-- COMANDO PARA ACESSAR O BD
USE DB_T04301_JESSE_ALVES;



-- CRIANDO A TABELA LIVROS
CREATE TABLE tb_livros (
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
	autor VARCHAR(80) NOT NULL,
    ano_publicacao INT,
    genero_livro VARCHAR(50)
);
-- INSERIR REGISTROS NA TABELA LIVROS
INSERT INTO tb_livros (titulo, autor, ano_publicacao, genero_livro)
VALUE('Conhecendo o SQL', 'Alexandre', 2026, 'Tecnologia');

-- CONSULTAR AS INFORMAÇÔES DA TABELA 
SELECT * FROM tb_livros;


-- INSERIR NOVOS REGISTROS NA TABELA LIVROS
INSERT INTO tb_livros (titulo, autor, ano_publicacao, genero_livro)
VALUE('Dom Casmurro', 'MAchado de Assis', 1899, 'Romance'),
	 ('Vidas Secas', 'Graciliano Ramos', 1938, 'Drama'),
     ('Harry Potter e a Pedra Filosofal', 'J.K.Rowling', 1997, 'Fantasia')
     ;


-- CONSULTAR AS INFORMAÇÔES DA TABELA 
-- ORDEM ALFABETICA DO MENOR PARA O MAIOR (ASC) - OU DO MAIOR PARA O MENOR (DESC)
SELECT * FROM tb_livros
ORDER BY genero_livro DESC;

-- CONSULTAR AS INFORMAÇÔES DA TABELA SEM USAR O *
SELECT titulo, autor, ano_publicacao  FROM tb_livros
ORDER BY autor ASC;

-- 	SELECT COM WHERE
-- RETORNANDO UM GENERO DE LIVRO ESPECIFICO
SELECT * FROM tb_livros
WHERE genero_livro = 'Drama';

-- UTILIZANDO O COMANDO LIKE
SELECT * FROM tb_livros
WHERE titulo LIKE '%L%';

-- COMEÇA COM A LETRA "C"ALTER
SELECT * FROM tb_livros
WHERE titulo LIKE 'C%';

-- TERMINA COM A LETRA "c"
SELECT * FROM tb_livros
WHERE titulo LIKE '%S';

-- variação de uso do operador like

SELECT * FROM tb_livros
WHERE titulo LIKE '%S__a_%';


















