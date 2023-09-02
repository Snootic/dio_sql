USE ecommerce_bd;

-- contando clientes
SELECT count(*) FROM cliente;

-- pedidos por cliente
SELECT distinct * FROM cliente, pedidos WHERE cliente.id_cliente = pedidos.id_cliente;

-- informações específicas
SELECT primeiro_nome, ultimo_nome, id_pedido, status_pedido FROM cliente, pedidos WHERE cliente.id_cliente = pedidos.id_cliente;

--  nome concatenado
SELECT concat(primeiro_nome,' ',ultimo_nome) as Cliente, id_pedido as Pedido, status_pedido FROM cliente, pedidos WHERE cliente.id_cliente = pedidos.id_cliente;

-- contando os pedidos
SELECT count(*) FROM cliente, pedidos WHERE cliente.id_cliente = pedidos.id_cliente;

-- cliente x pedido
SELECT * FROM cliente
		LEFT OUTER JOIN pedidos ON cliente.id_cliente = pedidos.id_cliente;


-- cliente x quantidade de pedidos
SELECT c.id_cliente, primeiro_nome, count(*) AS num_pedidos FROM cliente c
		INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
        GROUP BY id_cliente;
        
