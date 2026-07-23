-- EXERCICIOS DE DESENVOLVIMENTO

USE DB_T04301_JESSE_ALVES
/* -- TABELA EXCLUIDA
CREATE TABLE TB_GRUPO_CONTATOS(
	id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    grupo INT NOT NULL 
    );
    
    INSERT INTO TB_GRUPO_CONTATOS (grupo)
	VALUES ('Amigos'), 
		   ('Trabalho'), 
           ('Família');
           
    DROP TABLE TB_GRUPO_CONTATOS
    */


CREATE TABLE TB_GRUPO_CONTATO(
	id_grupo int PRIMARY KEY AUTO_INCREMENT,
    grupo varchar(60) NOT NULL
    );
    
    INSERT INTO TB_GRUPO_CONTATO (grupo)
	VALUES ('Amigos'),
		   ('Trabalho'), 
	       ('Familia');

    SELECT * FROM TB_GRUPO_CONTATO
    
 /*   
CREATE TABLE TB_NOVOS_CONTATOS(
    id_contato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(60),
    grupo_contato INT NOT NULL 
    );
    
    ALTER TABLE TB_NOVOS_CONTATOS
MODIFY grupo_contato INT NOT NULL DEFAULT 1;

  /*  
    INSERT INTO TB_NOVOS_CONTATOS (nome, email)
    VALUES ('João Paulo', 'joao@email.com','Familia'),
		   ('Isabel Souza', 'isabel@email.com','Fmilia'),
           ('Manoel', 'manoel@email.com','Amigo'),
		   ('Andreia Oliveira', 'andreia@email.com','Trabalho');
	-- Alterei a tabela criando a colula grupo
    ALTER TABLE TB_NOVOS_CONTATOS
    ADD COLUMN grupo VARCHAR(50) NOT NULL;
    
    -- removi a coluna grupo
    ALTER TABLE TB_NOVOS_CONTATOS
	DROP COLUMN grupo;
    
    --  Alterei a tabela excluindo a coluna grupo_contato
    ALTER TABLE TB_NOVOS_CONTATOS
	DROP COLUMN grupo_contato;
    
-- Alterei a tabela criando a coluna grupo

ALTER TABLE TB_NOVOS_CONTATOS
ADD COLUMN grupo VARCHAR(60);


    
    SELECT * FROM TB_NOVOS_CONTATOS
    */
    
    DROP TABLE TB_NOVOS_CONTATOS;
    
CREATE TABLE TB_TELEFONES(
    telefone VARCHAR(25) NOT NULL,
    id_contato INT NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES TB_NOVOS_CONTATOS (id_contato)    
    );
    
     INSERT INTO TB_TELEFONES (telefone, id_contato)
     VALUES ('(+55) 11 99999-8888', 1),
			('(+55) 11 88888-9999', 2),
            ('(+55) 15 77777-9999', 3),
            ('(+55) 75 11111-2222', 4);
            
	SELECT * FROM TB_GRUPO_CONTATO          
    SELECT * FROM TB_NOVOS_CONTATOS   
    SELECT * FROM TB_TELEFONES
    