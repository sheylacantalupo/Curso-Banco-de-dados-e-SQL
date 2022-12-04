USE COMERCIO;

-- MUDAR DELIMITADOR
DELIMITER $

SELECT * FROM V_RELATORIO;

-- STORED PROCEDURES

SELECT 'SHEYLA';

DELIMITER $$
create procedure exemplo()
begin
	SELECT * FROM V_RELATORIO;
end $$
DELIMITER ;

call exemplo();


-- PROCEDURES COM PARAMETROS

select 10 + 10 AS CONTA;

DELIMITER $$
create procedure CONTA()
begin
	select 10 + 10 AS CONTA;
end $$

DELIMITER ;

call CONTA();

-- APAGAR PROCEDURE

DROP PROCEDURE CONTA;

DELIMITER $$
create procedure CONTA(NUMERO1 INT, NUMERO2 INT)
begin
	select NUMERO1 + NUMERO2 AS CONTA;
end $$

CALL CONTA(100,50);

-- PROCEDURES
DELIMITER ;
CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCOS DE DADOS',40,700.00);

SHOW TABLES;

SELECT * FROM CURSOS;

DELIMITER $$
CREATE PROCEDURE CAD_CURSO(P_NOME varchar(30), P_HORAS INT(30),P_PRECO FLOAT(10,2) )
BEGIN
	INSERT INTO CURSOS VALUES(NULL, P_NOME, P_HORAS, P_PRECO);
END $$

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER', 35, 3000.00);
CALL CAD_CURSO('POWER BI', 20, 4000.00);

SELECT * FROM CURSOS;


-- CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS