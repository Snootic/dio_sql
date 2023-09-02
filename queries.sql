USE oficina_bd;

SELECT * FROM cliente WHERE primeiro_nome = 'Genshin';

SELECT * FROM veiculo_cliente;

SELECT * FROM veiculo_cliente INNER JOIN cliente WHERE id_veiculo = 1;

SELECT * FROM veiculo ORDER BY veiculo_marca;

SELECT * FROM veiculo HAVING ano_fabricacao > 2010;