USE COMERCIO;

-- SUBQUERIES

SELECT * FROM VENDEDORES;

-- VENDEDOR QUE VENDEU MENOS EM MARÇO E SEU NOME
SELECT MIN(MARCO)
FROM VENDEDORES;

SELECT NOME, MARCO AS VENDAS_MARCO
FROM VENDEDORES
WHERE MARCO =(SELECT MIN(MARCO)
FROM VENDEDORES);

-- VENDEDOR QUE VENDEU MAIS EM MARÇO E SEU NOME
SELECT NOME, MARCO AS VENDAS_MARCO
FROM VENDEDORES
WHERE MARCO =(SELECT MAX(MARCO)
FROM VENDEDORES);

-- VENDEDOR QUE VENDEU MAIS QUE A MÉDIA EM MARÇO E SEU NOME
SELECT NOME, MARCO AS VENDAS_MARCO
FROM VENDEDORES
WHERE MARCO >(SELECT AVG(MARCO)
FROM VENDEDORES);

SELECT AVG(MARCO)
FROM VENDEDORES;

SELECT NOME, FEVEREIRO AS VENDAS_FEVEREIRO
FROM VENDEDORES
WHERE FEVEREIRO >(SELECT AVG(FEVEREIRO)
FROM VENDEDORES);

SELECT AVG(FEVEREIRO)
FROM VENDEDORES;

SELECT NOME, FEVEREIRO AS VENDAS_FEVEREIRO
FROM VENDEDORES
WHERE FEVEREIRO <(SELECT AVG(FEVEREIRO)
FROM VENDEDORES);


-- OPERAÇÕES EM LINHAS
SELECT * FROM VENDEDORES;

SELECT NOME
	   JANEIRO,
       FEVEREIRO,
       MARCO,
       (JANEIRO + FEVEREIRO + MARCO) AS "TOTAL TRIMESTRE",
       TRUNCATE((JANEIRO + FEVEREIRO + MARCO)/3, 2) AS "MÉDIA TRIMESTRE"
FROM VENDEDORES;




