-- Desafio Banco dados
-- Criar DATABASE do ecommerce

CREATE DATABASE ecommerce_bd;
use ecommerce_bd;
    
-- Criar tabela de produtos

CREATE TABLE produto(
	id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(20) NOT NULL,
    peso_kg FLOAT,
    categoria ENUM('Eletrodomesticos', 'Calçados', 'Infantis', 'Eletrônicos', 'Cozinha', 'Ferramentas', 'Outros'),
    descricao VARCHAR(50),
    valor FLOAT NOT NULL,
    avaliacao float
);


-- Criar tabela de fornecedores


CREATE TABLE fornecedor(
	id_fornecedor INT NOT NULL PRIMARY KEY auto_increment,
    razao_social VARCHAR(45) NOT NULL UNIQUE,
    cnpj char(15) NOT NULL UNIQUE,
    celular char(11) NOT NULL
);
    
    
-- Criar tabela de estoque de produtos

CREATE TABLE estoque(
	id_produto INT NOT NULL PRIMARY KEY,
    nome_produto VARCHAR(20) NOT NULL,
	estoque INT default 0,
    armazem VARCHAR(45),
    id_fornecedor INT NOT NULL,    
	CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);


-- Criar tabela de vendedores

CREATE TABLE vendedor(
	id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(45) NOT NULL UNIQUE,
    local VARCHAR(45),
    nome_fantasia VARCHAR(45),
    cnpj CHAR(15) NOT NULL UNIQUE,
    celular CHAR(11)
);


-- Criar tabela de relação produto/vendedor

CREATE TABLE produto_vendedor(
	id_vendedor INT NOT NULL PRIMARY KEY,
    id_produto INT NOT NULL,
    estoque INT DEFAULT 0,
	CONSTRAINT fk_id_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    CONSTRAINT fk_vend_id_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);


-- Criar tabela de clientes

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(10) NOT NULL,
    incial_mid_name CHAR(1),
    ultimo_nome VARCHAR (20),
    cpf CHAR(11) NOT NULL UNIQUE,
    celular CHAR(11),
    endereco VARCHAR(60),
    data_nascimento DATE
);


-- Criar tabela de pedidos
CREATE TABLE pedidos(
	id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status_pedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue'),
    pagamento VARCHAR(20) NOT NULL,
    valor FLOAT NOT NULL,
    FRETE FLOAT NOT NULL default 0,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    id_vendedor INT NOT NULL,
    CONSTRAINT fk_pedido_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_pedido_id_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CONSTRAINT fk_pedido_id_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

desc produto;
desc fornecedor;
desc estoque;
desc vendedor;
desc produto_vendedor;
desc cliente;
desc pedidos;

SHOW tables;
