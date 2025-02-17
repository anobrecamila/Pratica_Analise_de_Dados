-- create database loja_informatica;

-- use loja_informatica

-- select * from backup_cliente limit 20

-- select * from backup_produto

/*create table if not exists cliente (
id_cliente int primary key, 
nome varchar(200),
email varchar(100), 
cidade varchar(100)
);

insert into cliente select * from backup_cliente; 

select * from cliente

-- SHOW VARIABLES LIKE 'character_set_database';
-- SHOW VARIABLES LIKE 'collation_database';
-- ALTER TABLE cliente CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

create table if not exists produto (
id_produto int primary key, 
nome varchar(200),
categoria varchar(100), 
preco decimal(10,2)
);

insert into produto select * from backup_produto

create table if not exists pedido (
id_pedido int primary key, 
id_cliente int, 
id_produto int, 
quantidade int, 
data date, 
foreign key (id_produto) references produto(id_produto), 
foreign key (id_cliente) references cliente(id_cliente)
);

insert into pedido select * from backup_pedido

/*INSERT INTO PEDIDO
SELECT ID_PEDIDO, ID_CLIENTE, ID_PRODUTO, QUANTIDADE, STR_TO_DATE(DATA, '%d/%m/%Y')
FROM BACKUP_PEDIDO; */

-- SELECT * FROM cliente

-- SELECT COUNT(DISTINCT ID_CLIENTE) FROM PEDIDO;

SELECT COUNT(QUANTIDADE) FROM PEDIDO;
SELECT COUNT(*) FROM PEDIDO;
SELECT COUNT(DISTINCT ID_CLIENTE) FROM PEDIDO

SELECT SUM(QUANTIDADE) FROM PEDIDO;
SELECT AVG(QUANTIDADE) FROM PEDIDO;

SELECT MAX(PRECO) FROM PRODUTO; 
SELECT MIN(PRECO) FROM PRODUTO; 

SELECT STDDEV(PRECO) FROM PRODUTO; 
SELECT STDDEV_SAMP(PRECO) FROM PRODUTO; 

SELECT GROUP_CONCAT(NOME)FROM PRODUTO; 

SELECT GROUP_CONCAT(DISTINCT QUANTIDADE) FROM PEDIDO; 

SELECT NOME, PRECO, RANK() OVER (ORDER BY PRECO DESC) AS RANKING_PRECO FROM PRODUTO; 

SELECT NOME, PRECO, ROW_NUMBER() OVER (ORDER BY PRECO DESC) AS RANKING_PRECO FROM PRODUTO;
-- Não executa com DISTINCT

SELECT NOME, PRECO, DENSE_RANK() OVER (ORDER BY PRECO DESC) AS RANKING_PRECO FROM PRODUTO;

SELECT DISTINCT NOME, PRECO, DENSE_RANK() OVER (ORDER BY PRECO DESC) AS RANKING_PRECO FROM PRODUTO LIMIT 5;