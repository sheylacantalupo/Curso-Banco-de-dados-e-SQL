USE COMERCIO;

SELECT * FROM CLIENTE;
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;
DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;


-- RELATÓRIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDEREÇO)

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


-- RELATÓRIO HOMENS

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

-- UPDATE SEXO PELA CHAVE PRIMÁRIA : 11, 12, 16, 17
SELECT * FROM CLIENTE WHERE IDCLIENTE = 11
OR IDCLIENTE = 12
OR IDCLIENTE = 16
OR IDCLIENTE = 17;

SELECT * FROM CLIENTE WHERE IDCLIENTE IN (11,12,16,17);

UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE IN (11,12,16,17);


-- RELATÓRIO MULHERES

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';


-- QUANTIDADE DE HOMENS E MULHERES

SELECT COUNT(*) AS QUANTIDADE, SEXO 
FROM CLIENTE
GROUP BY SEXO;


-- IDS E EMAIL DAS MULHERES QUE MORAM NO CENTRO DO RIO DE JANEIRO E NÃO TEM CELULAR

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND E.BAIRRO = 'CENTRO' AND E.CIDADE = 'RIO DE JANEIRO'
AND T.TIPO IN ('RES','COM');


/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE TIPO = 'CEL' AND E.ESTADO = 'RJ';


/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' AND E.ESTADO = 'SP';