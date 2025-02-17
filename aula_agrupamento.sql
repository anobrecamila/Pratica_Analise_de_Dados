use loja_informatica; 

SELECT SUM(PRECO) AS PRECO_TOTAL FROM PRODUTO; 

SELECT SUM(PRECO) AS PRECO_TOTAL FROM PRODUTO GROUP BY CATEGORIA; 

SELECT CATEGORIA, SUM(PRECO) AS PRECO_TOTAL FROM PRODUTO GROUP BY CATEGORIA;

SELECT CATEGORIA,NOME, SUM(PRECO) AS PRECO_TOTAL FROM PRODUTO GROUP BY CATEGORIA,NOME;

SELECT CATEGORIA,NOME, SUM(PRECO) AS PRECO_TOTAL FROM PRODUTO GROUP BY CATEGORIA,NOME ORDER BY CATEGORIA, NOME; 

SELECT CATEGORIA, AVG(PRECO) AS PRECO_TOTAL FROM PRODUTO GROUP BY CATEGORIA;

SELECT CATEGORIA, ROUND(AVG(PRECO),2) AS PRECO_TOTAL FROM PRODUTO GROUP BY CATEGORIA ORDER BY CATEGORIA;

SELECT DISTINCT NOME, PRECO, DENSE_RANK() OVER (ORDER BY PRECO DESC) AS RANKING_PRECO FROM PRODUTO; -- Produto mais caro

SELECT CATEGORIA, SUM(PRECO) AS PRECO_TOTAL, RANK() OVER (ORDER BY SUM(PRECO) DESC) AS RANKING_PRECO FROM PRODUTO GROUP BY CATEGORIA; -- Ranking sobre o somatório dos produtos

SELECT CATEGORIA, COUNT(*) FROM PRODUTO GROUP BY CATEGORIA HAVING COUNT(*)>10; 

SELECT CATEGORIA, COUNT(*) FROM PRODUTO WHERE CATEGORIA <>'Acessorios' GROUP BY CATEGORIA ORDER BY CATEGORIA;

SELECT CATEGORIA, COUNT(*) FROM PRODUTO WHERE CATEGORIA <>'Acessorios' GROUP BY CATEGORIA HAVING COUNT(*)>10; -- WHERE para filtrar os dados da linha; HAVING para filtrar os dados agrupados. 
SELECT CATEGORIA, COUNT(*) FROM PRODUTO GROUP BY CATEGORIA HAVING COUNT(*)>10 AND CATEGORIA <>'Acessorios'; -- selects diferentes que retornam o mesmo resultado. Ver qual pode ser mais rápido. 

-- Resolução de problemas: 
-- Identificar quais produtos foram vendidos mais de uma vez com erro (quantidade=0);
select id_produto from pedido where quantidade is null group by id_produto order by id_produto;

-- Resposta correta: 
select id_produto, count(id_produto) from pedido where quantidade is null group by id_produto having count(id_produto)>1 order by id_produto;

/* Lógica: 
primeiro filtra os dados - WHERE; 
depois agrupa - GROUP BY; 
depois filtra os dados agrupados - HAVING; 
por fim ordena - ORDER BY. */

