USE oficina_bd;

ALTER TABLE cliente auto_increment=1;
INSERT INTO cliente (primeiro_nome, sobrenome, data_nascimento, celular) VALUES
			('Kaik', 'Mendes', '2005-03-23', 11961395863),
            ('Luis', default, '2004-05-18', 11933677540),
            ('Mickael', 'Leite', '2005-02-18', 11912436398),
			('Honkai', 'Impact', null, 11532048821),
            ('Gustavo', 'Freitas', null, 11926179203),
            ('Genshin', 'Impact', '1989-06-03', 21931314672);
SELECT * FROM cliente;

ALTER TABLE veiculo auto_increment=1;
INSERT INTO veiculo (veiculo_tipo, veiculo_marca, veiculo_modelo, veiculo_cor, ano_fabricacao) VALUES
			(default, 'chevrolet', 'monza sle 1.6', 'vermelho', 1983),
            ('moto', 'honda', 'xr 200r', 'preto', 2000),
            (default, 'chevrolet', 'monza hatch', 'branco', 1982),
            ('carro', 'gol', 'g5', 'vermelho', 2012),
            ('caminhao', 'scania', 'p360', 'amarelo', 2013),
            ('carreta', 'scania', 'p280', 'cinza', 2021);
SELECT * FROM veiculo;


ALTER TABLE pagamento auto_increment=1;
INSERT INTO pagamento (metodo_pagamento) VALUES
			('PIX'),
            ('Crédito'),
            ('Débito'),
            ('Boleto'),
            ('PIX'),
            ('Dinheiro'),
            ('Crédito');
SELECT * FROM pagamento;


INSERT INTO servico (nome_servico,dias_prazo,descricao,valor) VALUES
					('Rebaixamento', 3, 'Rebaixamento do carro', 2352),
                    ('Pneus', 3, 'troca de pneus + balanceamento', 1760),
                    ('Motor', 6, 'troca do motor', 4120),
                    ('Lanternas', 2, 'troca das lanternas', 200);
SELECT * FROM servico;


INSERT INTO veiculo_cliente (id_veiculo,id_cliente,descricao,quilometragem) VALUES
			(2, 2, 'Lanternas danificadas', 7824),
            (6, 2, 'trocar pneus', 37800),
            (1, 1, 'Rebaixar o monza', 12000),
            (4, 4, 'motor danificado', 12000);
SELECT * FROM veiculo_cliente;

ALTER TABLE peca auto_increment=1;
       
INSERT INTO peca (nome_peca,tipo_peca,valor_peca) VALUES
			('lanternas dianteira', 'lanterna', 45),
            ('lanternas freio', 'lanterna', 60),
            ('pneu scania', 'pneus', 900),
            ('motor gol g5', 'motores', 2500);
SELECT * FROM peca;
        
        
INSERT INTO orcamento (id_pagamento,id_cliente,descricao,valor) VALUES
			(1, 2, NULL, 200),
            (2, 5, NULL, 1760),
            (3, 1, null, 2352),
            (4, 4, null, 4120);
SELECT * FROM orcamento;
            
            
INSERT INTO pedido_servico (id_servico, id_orcamento, status_pedido) VALUES
			(1, 3, DEFAULT),
            (2, 2, 'Serviço finalizado'),
            (3, 4, default);
SELECT * FROM pedido_servico;


INSERT INTO troca_peca_servico (id_peca,id_servico) VALUES
			(1,2),
            (4,1),
            (3,2);
            
SELECT * FROM troca_peca_servico