use restaurante; 

/*Selecionar:
produtos: id, nome e descrição
info_produtos:  ingredientes*/

select p.id_produto, p.nome, p.descricao, inf.ingredientes from produtos p
join info_produtos inf on p.id_produto = inf.id_produto;

/*Selecionar:
pedidos:  id, quantidade e data
clientes: nome e email */

select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome, c.email from pedidos pe
join clientes c on pe.id_cliente = c.id_cliente;

/* Selecionar:
pedidos:  id, quantidade e data
clientes: nome e email
funcionarios: nome */

select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome, c.email, f.nome as funcionario from pedidos pe
join clientes c on pe.id_cliente = c.id_cliente
join funcionarios f on pe.id_funcionario = f.id_funcionario;

/* Selecionar:
pedidos:  id, quantidade e data
clientes: nome e email
funcionarios: nome
produtos: nome, preco */

select pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome as cliente, c.email, f.nome as funcionario, pro.nome as produto, pro.preco from pedidos pe
join clientes c on pe.id_cliente = c.id_cliente
join funcionarios f on pe.id_funcionario = f.id_funcionario
join produtos pro on pe.id_produto = pro.id_produto;

-- Selecionar o nome dos clientes com os pedidos com status ‘Pendente’ e exibir por ordem descendente de acordo com o id do pedido

select c.nome as cliente, pe.id_pedido from clientes c 
join pedidos pe on c.id_cliente = pe.id_cliente 
where pe.status = 'Pendente'
order by pe.id_pedido desc;

-- Selecionar clientes sem pedidos

select c.nome as cliente_sem_pedido from clientes c
left join pedidos pe on c.id_cliente = pe.id_cliente 
where pe.id_pedido is null; 

-- Selecionar o nome do cliente e o total de pedidos cada cliente

select c.nome as cliente, count(pe.id_pedido) as total_pedidos from clientes c
left join pedidos pe on c.id_cliente = pe.id_cliente 
group by c.id_cliente;

-- Selecionar o preço total (quantidade*preco) de cada pedido

select pe.id_pedido, sum(pe.quantidade*pro.preco) as preco_total from pedidos pe
left join produtos pro on pe.id_produto = pro.id_produto 
group by pe.id_pedido;