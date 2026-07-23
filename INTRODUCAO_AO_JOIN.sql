-- ACESSANDO O BD
USE DB_T04301_JESSE_ALVES

-- CRIANDO A TABELA A 
CREATE TABLE TabelaA(
  Nome varchar(50) NULL
);
-- CRIANDO A TABELA B
CREATE TABLE TabelaB(
  Nome varchar(50) NULL
);

-- INSERINDO OS REGISTROS NAS TABELAS

INSERT INTO TabelaA VALUES('Fernanda');
INSERT INTO TabelaA VALUES('Josefa');
INSERT INTO TabelaA VALUES('Luiz');
INSERT INTO TabelaA VALUES('Fernando');

INSERT INTO TabelaB VALUES('Carlos');
INSERT INTO TabelaB VALUES('Manoel');
INSERT INTO TabelaB VALUES('Luiz');
INSERT INTO TabelaB VALUES('Fernando');

-- INTRODUÇÃO AO JOIN

SELECT * FROM TabelaA;
SELECT * FROM TabelaB;

-- INNER JOIN
-- 1º exemplo
SELECT * FROM TabelaA AS A
INNER JOIN TabelaB AS B
ON A.Nome = B.Nome;

-- 2º exemplo

SELECT A.Nome as A,
       B.Nome as B
FROM TabelaA AS A
INNER JOIN TabelaB AS B
ON A.Nome = B.Nome;

-- LEFT JOIN

SELECT A.Nome as A,
       B.Nome as B
FROM TabelaA AS A
LEFT JOIN TabelaB AS B
ON A.Nome = B.Nome;

-- RIGHT JOIN

SELECT A.Nome as A,
       B.Nome as B
FROM TabelaA AS A
RIGHT JOIN TabelaB AS B
ON A.Nome = B.Nome;

-- FULL OUTER JOIN -- NO MySQL Workbanch se utiliza o comando UNION

SELECT A.Nome as A,
       B.Nome as B
FROM TabelaA AS A
LEFT JOIN TabelaB AS B
ON A.Nome = B.Nome
UNION
-- RIGHT JOIN
SELECT A.Nome as A,
       B.Nome as B
FROM TabelaA AS A
RIGHT JOIN TabelaB AS B
ON A.Nome = B.Nome;

-- LEFT EXCLUDING JOIN

SELECT A.Nome as A,
       B.Nome as B
FROM TabelaA AS A
LEFT JOIN TabelaB AS B
ON A.Nome = B.Nome
WHERE B.Nome is NULL;