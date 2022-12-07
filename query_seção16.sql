USE COMERCIO;

-- Alterando tabelas
CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

-- adcionar um pk (não tem como colocar o incremento se a pk for adcionar após a criação da tabela)
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

-- adcionando uma coluna SEM posição, vai p última posição
ALTER TABLE TABELA
ADD COLUNA VARCHAR(30);

ALTER TABLE TABELA
ADD COLUNA99 INT;

DESC TABELA;

-- adcionando uma coluna COM posição
ALTER TABLE TABELA
ADD COLUNAx VARCHAR(40) NOT NULL UNIQUE
AFTER COLUNA3;

DESC TABELA;

-- modificar o tipo de dado da coluna (campo)
ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;

-- renomenado tabela 
ALTER TABLE TABELA 
RENAME PESSOA;



CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

-- adcionando FK
ALTER TABLE TIME
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

DESC PESSOA;
DESC TIME;

-- verificar as chaves de uma tabela
SHOW CREATE TABLE TIME;


-- organização de chaves
CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIMES;

-- organizando as chaves e ações de constraints
DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;


--  dicionário de dados
SHOW DATABASES;

USE INFORMATION_SCHEMA;

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = 'COMERCIO';


-- apagando CONSTRAINTS
USE COMERCIO;
ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;









