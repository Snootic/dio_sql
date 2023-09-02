USE ecommerce_bd;

ALTER TABLE cliente AUTO_INCREMENT=1;
ALTER TABLE cliente CHANGE COLUMN endereco endereco varchar(250);


INSERT INTO cliente(primeiro_nome, incial_mid_name, ultimo_nome, cpf, celular, endereco, data_nascimento)
			VALUES ('Kaik', '', 'Mendes', 83729149075, 11955988342, 'rua bolinho de chuva 20, paraiso - Cidade dos doces', '2005-03-23');
            
INSERT INTO cliente (primeiro_nome, incial_mid_name, ultimo_nome, CPF, celular, endereco)
			VALUES ('Roger', 'O', 'Freitas', 72663953059, 11955988342, 'rua sao joao 320, Centro - Cidade dos doces'),
				   ('Francisco', 'F', 'Sousa', 82006231065, NULL, '293 Frederico Avenida, Centro - Cidade dos doces'),
				   ('Maria', 'J', 'França', 28335277052, 11955988342, '842 Carvalho Rodovia, Centro - Cidade dos doces'),
				   ('Ana', 'J', 'Luiz', 74444613092, NULL, '4046 César Marginal, Centro - Cidade dos doces'),
				   ('Sabryna', ' ', 'Oliveira', 49691283085, NULL,  '92423 Nataniel Rua, Centro - Cidade dos doces');
                   
SHOW TABLES;
SELECT * FROM cliente;

INSERT INTO produto (nome_produto, peso_kg, categoria, valor, avaliacao) VALUES
					('Conjunto de panelas', 6, 'Cozinha', 589, 50),
					('Casinha', 2.4, 'Infantis', 60, 90),
					('Tenis Nike', 0.2, 'Calçados', 250, 320),
					('Computador', 4.5, 'Eletrônicos', 2000, 150),
					('Microondas', 5, 'Eletrodomesticos', 230, 800),
					('Mesa', 12, 'Outros', 210, 15),
					('Furadeira', 2, 'Ferramentas', 120, 180);
							
SELECT * FROM produto;

INSERT INTO fornecedor (razao_social,CNPJ,celular) VALUES
						('NIKE AUTORIZADA', 123456789123456, 21985474167),
						('GAMER GAMERSON', 789541236985214, 21587456318),
						('FABRICANTE DIVERSA', 854123654894235, 21547895123);

SELECT * FROM fornecedor;

INSERT INTO estoque (id_produto,nome_produto, estoque, armazem, id_fornecedor) VALUES
					(1, 'Conjunto de panelas', 50, 'RJ', 3),
                    (2, 'Casinha', 20, 'SP',3),
                    (3, 'Tenis Nike',30,'RJ',1),
					(4, 'Computador', 15,'SP',2),
					(5, 'Microondas',20,'RJ',3),
					(6, 'Mesa', 15, 'RJ', 3),
					(7, 'Furadeira', 20, 'SP', 3);
                    
SELECT * FROM estoque;

INSERT INTO vendedor (razao_social,nome_fantasia,CNPJ,celular) VALUES
					('Eletronicos Tech', null, 48588127000108, 21914102855),
					('Vanessa Varejo', null, 36439225000196, 21920503053),
					('Brinquedos Infantis', null, 08006103000170, 11920503053);

SELECT * FROM vendedor;

INSERT INTO pedidos(status_pedido,pagamento, valor, frete, id_cliente, id_produto, id_vendedor )
			VALUES ('Processando','Cartão de Crédito', 120, 15, 4, 2, 3),
				   ('Em Andamento','PIX', 2000, 0, 1, 4, 1),
                   ('Enviado','Boleto', 230, 0, 3, 5, 2),
                   ('Entregue','Cartão de Débito', 250, 20, 2, 3, 2);

SELECT * FROM pedidos;
            

