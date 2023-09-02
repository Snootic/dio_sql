CREATE DATABASE oficina_bd;
USE oficina_bd;

-- criar tabela do veiculo
CREATE TABLE veiculo(
	id_veiculo int not null auto_increment primary key,
    veiculo_tipo enum('carro', 'moto', 'caminhao', 'carreta', 'outro') not null default 'carro',
    veiculo_marca varchar(20) not null,
    veiculo_modelo varchar(30) not null,
    veiculo_cor varchar(20) not null,
    ano_fabricacao char(4)
);

-- criar tabela de cliente
CREATE TABLE cliente(
	id_cliente int not null auto_increment primary key,
    primeiro_nome varchar(20) not null,
    sobrenome varchar(20) default 'N/A',
    data_nascimento date,
    celular char(11) not null
);

-- criar tabela de peça
CREATE TABLE peca(
	id_peca int not null auto_increment primary key,
    nome_peca varchar(40) not null,
    tipo_peca varchar(40),
    valor_peca float not null
);



-- criar tabela de pagamento
CREATE TABLE pagamento(
	id_pagamento int not null auto_increment primary key,
    metodo_pagamento ENUM('PIX', 'Boleto', 'Crédito', 'Débito', 'Dinheiro') not null default 'PIX'
);


-- criar tabela de serviço
CREATE TABLE servico(
	id_servico int not null auto_increment primary key,
    nome_servico varchar(100) not null,
    dias_prazo int not null,
    descricao varchar(200),
    valor float not null
);



-- criar tabela de link veículo/cliente
CREATE TABLE veiculo_cliente(
	id_cliente int not null,
    id_veiculo int not null,
    descricao varchar(200),
    quilometragem int not null default 0,
    primary key (id_cliente, id_veiculo),
    CONSTRAINT fk_id_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


-- criar tabela do orçamento
CREATE TABLE orcamento(
	id_orcamento int not null auto_increment primary key,
    id_pagamento int not null,
    id_cliente int not null,
    descricao varchar(200),
    valor float not null,
    CONSTRAINT fk_id_pagamento FOREIGN KEY (id_pagamento) REFERENCES pagamento (id_pagamento),
    CONSTRAINT fk_orcamento_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);



-- criar link orçamento e serviço
CREATE TABLE pedido_servico(
	id_servico int not null,
    id_orcamento int not null,
    status_pedido ENUM('Aguardando reposição de peças', 'Serviço finalizado', 'Em andamento') default 'Em andamento',
    primary key (id_servico, id_orcamento),
    CONSTRAINT fk_servico FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    CONSTRAINT fk_orcamento FOREIGN KEY (id_orcamento) REFERENCES orcamento(id_orcamento)
);


-- criar link peca e serviço
CREATE TABLE troca_peca_servico(
	id_peca int not null,
    id_servico int not null,
    primary key (id_peca, id_servico),
    CONSTRAINT fk_peca FOREIGN KEY (id_peca) REFERENCES peca(id_peca),
    CONSTRAINT fk_peca_servico FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);