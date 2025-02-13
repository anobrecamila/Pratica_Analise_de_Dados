-- use restaurante; 
-- select * from pedidos where id_funcionario = 4 and status = 'Pendente'

-- select * from pedidos where status <> 'Concluído'

-- select * from pedidos where id_produto in (1, 3, 5, 7,8)

-- select * from clientes where nome like 'c%'

-- select * from info_produtos where ingredientes like '%carne%' or ingredientes like '%frango%'

-- select * from produtos where preco between 20 and 30

-- update pedidos set status = null where id_pedido = 6

-- select * from pedidos where status is null

-- Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'

-- select id_pedido, status, ifnull(status, 'Cancelado') from pedidos 

select nome, cargo, salario,
if (salario>3000, 'Acima da média', 'Abaixo da média')
as media_salario from funcionarios