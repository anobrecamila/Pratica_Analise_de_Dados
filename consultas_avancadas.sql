use restaurante;

/*Crie uma view chamada resumo_pedido do join entre essas tabelas:
pedidos: id, quantidade e data
clientes: nome e email
funcionarios: nome
produtos: nome, preco*/

CREATE VIEW RESUMO_PEDIDO AS 
SELECT PED.ID_PEDIDO, PED.QUANTIDADE, PED.DATA_PEDIDO, CLI.NOME AS CLIENTE, CLI.EMAIL, FUN.NOME AS FUNCIONARIO, PRO.NOME AS PRODUTO, PRO.PRECO
FROM PEDIDOS PED
JOIN CLIENTES CLI ON PED.ID_CLIENTE = CLI.ID_CLIENTE
JOIN  FUNCIONARIOS FUN ON PED.ID_FUNCIONARIO = FUN.ID_FUNCIONARIO
JOIN  PRODUTOS PRO ON PED.ID_PRODUTO = PRO.ID_PRODUTO; 

SELECT * FROM RESUMO_PEDIDO ORDER BY ID_PEDIDO;

-- Selecione o id do pedido, nome do cliente e o total (quantidade * preco) de cada pedido da view resumo_pedido:

SELECT ID_PEDIDO, CLIENTE, SUM(QUANTIDADE*PRECO) AS TOTAL_PEDIDO FROM RESUMO_PEDIDO GROUP BY ID_PEDIDO ORDER BY ID_PEDIDO;

-- Atualiza o view resumo pedido, adicionando campo total:

CREATE OR REPLACE VIEW RESUMO_PEDIDO AS 
SELECT PED.ID_PEDIDO, PED.QUANTIDADE, PED.DATA_PEDIDO, CLI.NOME AS CLIENTE, CLI.EMAIL, FUN.NOME AS FUNCIONARIO, PRO.NOME AS PRODUTO, PRO.PRECO, SUM(PED.QUANTIDADE*PRO.PRECO) AS TOTAL_PEDIDO
FROM PEDIDOS PED
JOIN CLIENTES CLI ON PED.ID_CLIENTE = CLI.ID_CLIENTE
JOIN  FUNCIONARIOS FUN ON PED.ID_FUNCIONARIO = FUN.ID_FUNCIONARIO
JOIN  PRODUTOS PRO ON PED.ID_PRODUTO = PRO.ID_PRODUTO
GROUP BY PED.ID_PEDIDO, PED.QUANTIDADE, PED.DATA_PEDIDO, CLI.NOME, CLI.EMAIL, FUN.NOME, PRO.NOME, PRO.PRECO;

-- Repita a consulta da questão 3, utilizando o campo total adicionado:
SELECT ID_PEDIDO, CLIENTE, TOTAL_PEDIDO FROM RESUMO_PEDIDO GROUP BY ID_PEDIDO ORDER BY ID_PEDIDO;

-- Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o JOIN que está oculto na nossa query:

EXPLAIN SELECT ID_PEDIDO, CLIENTE, TOTAL_PEDIDO FROM RESUMO_PEDIDO GROUP BY ID_PEDIDO ORDER BY ID_PEDIDO;

-- Crie uma função chamada ‘BuscaIngredientesProduto’, que irá retornar os ingredientes da tabela info produtos, quando passar o id de produto como argumento (entrada) da função.

DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto(idProduto INT)
RETURNS VARCHAR (500)  
READS SQL DATA 
BEGIN 
DECLARE BuscaIngredientes VARCHAR(500); 
SELECT ingredientes INTO BuscaIngredientes FROM info_produtos WHERE id_produto = idProduto; 
RETURN BuscaIngredientes; 
END //
DELIMITER ;

-- Execute a função ‘BuscaIngredientesProduto’ com o id de produto 10:
SELECT BuscaIngredientesProduto(10);

-- Crie uma função chamada ‘mediaPedido’ que irá retornar uma mensagem dizendo que o total do pedido é acima, abaixo ou igual a média de todos os pedidos, quando passar o id do pedido como argumento da função:

DELIMITER //
CREATE FUNCTION mediaPedido(idPedido INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE mediaGeral DECIMAL(10,2);
    DECLARE totalPedido DECIMAL(10,2);
    DECLARE classificacaoPedido VARCHAR(100);
    SELECT COALESCE(AVG(PED.QUANTIDADE * PRO.PRECO),0) INTO mediaGeral FROM PEDIDOS PED
    LEFT JOIN PRODUTOS PRO ON PED.ID_PRODUTO = PRO.ID_PRODUTO;
    SELECT coalesce(SUM(PED.QUANTIDADE * PRO.PRECO),0) INTO totalPedido FROM PEDIDOS PED
    LEFT JOIN PRODUTOS PRO ON PED.ID_PRODUTO = PRO.ID_PRODUTO
    WHERE ID_PEDIDO = idPedido;
    SET classificacaoPedido = 
        CASE 
            WHEN totalPedido > mediaGeral THEN 'Acima da média'
            WHEN totalPedido < mediaGeral THEN 'Abaixo da média'
            ELSE 'Igual à média'
        END;
    RETURN classificacaoPedido;
END //
DELIMITER ;

DROP FUNCTION mediaPedido;

-- Execute a função ‘mediaPedido’ com o id de pedido 5 e depois 6.

SELECT mediaPedido(5);
SELECT mediaPedido(6);

/*SELECT COALESCE(AVG(PED.QUANTIDADE * PRO.PRECO),0) AS MEDIA FROM PEDIDOS PED
    LEFT JOIN PRODUTOS PRO ON PED.ID_PRODUTO = PRO.ID_PRODUTO WHERE PED.ID_PEDIDO = 6;
    
SELECT coalesce(SUM(PED.QUANTIDADE * PRO.PRECO),0) AS totalPedido FROM PEDIDOS PED
    LEFT JOIN PRODUTOS PRO ON PED.ID_PRODUTO = PRO.ID_PRODUTO;*/