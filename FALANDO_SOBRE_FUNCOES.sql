-- FALANDO SOBRE FUNÇÕES

USE DB_T04301_JESSE_ALVES;


-- Criação da tabela
CREATE TABLE tb_livros_esc (
    id_livro INT PRIMARY KEY,
    livro VARCHAR(150),
    autor VARCHAR(100),
    preco DECIMAL(10,2)
);

-- Inserção de dados (Literatura Brasileira)
INSERT INTO tb_livros_esc (id_livro, livro, autor, preco) VALUES
(1, 'Dom Casmurro', 'Machado de Assis', 29.90),
(2, 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 34.50),
(3, 'O Cortiço', 'Aluísio Azevedo', 27.80),
(4, 'Capitães da Areia', 'Jorge Amado', 31.20),
(5, 'Grande Sertão: Veredas', 'João Guimarães Rosa', 45.00),
(6, 'Vidas Secas', 'Graciliano Ramos', 28.90),
(7, 'Iracema', 'José de Alencar', 22.50);

SELECT * FROM tb_livros_esc;

-- 1º FUNÇÃO UPPER (MAIUSCULA)
SELECT UPPER(livro) AS Livro,
	   UPPER(autor) AS Autor,
       preco AS Preco
FROM tb_livros_esc;

-- 2 FUNÇÃO LOWER (MINUSCULA)

SELECT LOWER(livro) AS Livro,
	   LOWER(autor) AS Autor,
       preco AS Preco
FROM tb_livros_esc;

-- FUNÇÃO LENGHT (QUANTIDADE DE CARACTERES)

SELECT livro AS Livro,
	   LENGTH(livro) AS Qtde_Caracter
FROM tb_livros_esc
ORDER BY 2 DESC;

-- FUNÇÃO LEFT (BUSCA INFORMAÇOES QUE ESTAO A ESQUERDA
SELECT livro AS Livro,
	   LEFT(livro, 5) AS Os1º_Caracter
FROM tb_livros_esc;

-- FUNÇAO RIGHT ( BUSCA INFORMAÇOES QUE ESTAO A DIREITA)
SELECT livro AS Livro,
	   RIGHT(livro, 5) AS Os1º_Caracter
FROM tb_livros_esc;

-- FUNÇÃO ROUND (ARREDONDAR)

SELECT livro AS Livro,
	   ROUND(preco, 1) as Preco
FROM tb_livros_esc;

-- FUNÇÃO CURDATE (RETORNA A DATA ATUAL)

SELECT CURDATE() AS DATA_ATUAL;

SELECT L.*,
		CURDATE() AS DATA_ATUAL
FROM tb_livros_esc L;

-- FUNÇÃO NOW ( TRAS A DATA E A HORA)

SELECT L.*,
		NOW() AS DATA_ATUAL
FROM tb_livros_esc L;

-- FUNÇÃO REPLACE ( SUBSTITUI AS LETRAS)
SELECT livro AS Livro,
	   autor AS Autor,
       REPLACE(autor, 'a', '4') AS Autor_2,
       REPLACE(UPPER(autor), 'A', '4') AS Autor_3
FROM tb_livros_esc;       