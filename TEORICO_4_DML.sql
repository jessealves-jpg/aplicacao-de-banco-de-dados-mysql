-- ACESSANDO O BD

USE DB_T04301_JESSE_ALVES;

CREATE TABLE TB_CONTATOS_TESTE_DML (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome_contato VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO TB_CONTATOS_TESTE_DML (nome_contato, telefone, email)
VALUES ('LUIZA', '(11) 97777-8888', 'luiza@email.com'),
	   ('PETER', '(12) 99999-0000', 'peter@email.com'),
       ('PEDRO', '(13) 91111-2222', 'pedro@email.com'),
       ('VANESSA', '(14) 93333-4444', 'vanessa@email.com'),
       ('TATIANE', '(15) 95555-6666', 'tatiane@email.com');
       
       -- CONSULTA A TABELA DE CONTATOS
		SELECT * FROM TB_CONTATOS_TESTE_DML;

     
       
       -- UPDATE - ATUALIZANDO / ALTERANDO / MODIFICANDO
       UPDATE TB_CONTATOS_TESTE_DML
       SET telefone = '(13) 90000-0000'
       WHERE id_contato = 3;
       -- FOI ALTERADO NA TEBELA O NUMERO DO TELEFONE DO PEDRO
       
       -- ATUALIZANDO VARIOS CAMPOS DE UMA SÓ VEZ.
       
UPDATE TB_CONTATOS_TESTE_DML
SET nome_contato = 'PEDRO LUIZ',
    telefone = '(71) 95555-3333',
    email = 'pedro.luiz@email.com'
WHERE id_contato = 3;
-- FOI ALTERADO O NOME DO PEDRO E O EMAIL.
      
       -- CONSULTA A TABELA DE CONTATOS
		SELECT * FROM TB_CONTATOS_TESTE_DML;
        
       
-- EXCLUIR REGISTROS DE UMA TABELA
DELETE FROM TB_CONTATOS_TESTE_DML
WHERE id_contato = 3;

        
       
       
       
       
       
       
       
       
       
       