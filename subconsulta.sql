use loja_informatica; 

-- Clientes que fizeram pedido: 

SELECT DISTINCT NOME
FROM CLIENTE 
WHERE ID_CLIENTE IN (SELECT ID_CLIENTE FROM PEDIDO);

SELECT DISTINCT C.NOME
FROM CLIENTE C
JOIN PEDIDO PE ON C.ID_CLIENTE = PE.ID_CLIENTE;

-- Clientes que fizeram pedido mas com quantidade >5:

SELECT NOME, EMAIL 
FROM CLIENTE 
WHERE ID_CLIENTE IN (SELECT ID_CLIENTE FROM PEDIDO WHERE QUANTIDADE > 5); 

SELECT C.NOME, C.EMAIL 
FROM CLIENTE C
JOIN PEDIDO PE ON C.ID_CLIENTE = PE.ID_CLIENTE 
WHERE PE.QUANTIDADE > 5;

-- Subconsulta no SELECT 
-- Seleção da quantidade de pedidos do cliente, apresentando nome e quantidade:
SELECT NOME, 
(SELECT COUNT(*) FROM PEDIDO WHERE PEDIDO.ID_CLIENTE = CLIENTE.ID_CLIENTE) AS TOTAL_PEDIDOS
FROM CLIENTE; 

-- Seleção do nome e email dos clientes que tiveram pedido, apresentando também o total gasto no pedido:
SELECT C.NOME, C.EMAIL, 
(SELECT SUM(PE.QUANTIDADE*PR.PRECO)
FROM PEDIDO PE
JOIN PRODUTO PR ON PE.ID_PRODUTO = PR.ID_PRODUTO 
WHERE PE.ID_CLIENTE = C.ID_CLIENTE) AS TOTAL_PEDIDO
FROM CLIENTE C ORDER BY TOTAL_PEDIDO DESC; 

-- Subconsulta HAVING (filtro de agregação)
-- Seleção da categoria e média de preço do produto, agrupando por categoria, onde a média de preço é maior que a média geral de todos os produtos:
SELECT CATEGORIA, AVG(PRECO) AS MEDIA_PRECO
FROM PRODUTO
GROUP BY CATEGORIA 
HAVING AVG(PRECO) > (SELECT AVG(PRECO) FROM PRODUTO); 

SELECT AVG(PRECO) FROM PRODUTO;

-- Subconsulta FROM 
-- Seleção dos clientes pelo nome, total de pedidos e soma da quantidade, sendo que o total de pedidos e soma da quantidade são campos calculados da tabela pedido nomeada de pedidos_agregados, agrupado por cliente.
SELECT C1.NOME, PEDIDOS_AGREGADOS.TOTAL_PEDIDOS, PEDIDOS_AGREGADOS.SOMA_QUANTIDADE 
FROM CLIENTE C1
JOIN (
	SELECT ID_CLIENTE, COUNT(*) AS TOTAL_PEDIDOS, SUM(QUANTIDADE) AS SOMA_QUANTIDADE 
	FROM PEDIDO
	GROUP BY ID_CLIENTE
) AS PEDIDOS_AGREGADOS ON C1.ID_CLIENTE = PEDIDOS_AGREGADOS.ID_CLIENTE; 

-- Subconsulta ORDER BY 
-- Seleção do nome e email do cliente, ordenando por soma do valor do pedido, do maior para o menor.

SELECT C.NOME, C.EMAIL
FROM CLIENTE C 
ORDER BY (
	SELECT SUM(PE.QUANTIDADE*PR.PRECO)
	FROM PEDIDO PE JOIN PRODUTO PR ON PE.ID_PRODUTO = PR.ID_PRODUTO 
	WHERE PE.ID_CLIENTE=C.ID_CLIENTE
) DESC; 

-- Com o valor do pedido seria outro select: 
SELECT 
    C.NOME, 
    C.EMAIL, 
    SUM(PE.QUANTIDADE * PR.PRECO) AS VALOR_PEDIDO
FROM CLIENTE C
JOIN PEDIDO PE ON C.ID_CLIENTE = PE.ID_CLIENTE
JOIN PRODUTO PR ON PE.ID_PRODUTO = PR.ID_PRODUTO
GROUP BY C.ID_CLIENTE, C.NOME, C.EMAIL
ORDER BY VALOR_PEDIDO DESC;
