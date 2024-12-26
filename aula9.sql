-- Preparação do BD

CREATE DATABASE loja_informatica;

USE loja_informatica;

SELECT * FROM backup_cliente;
SELECT * FROM backup_produto;
SELECT * FROM backup_pedido;

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT PRIMARY KEY,
    nome VARCHAR(200),
    email VARCHAR(100),
    cidade VARCHAR(100)
);

 CREATE TABLE IF NOT EXISTS produto (
	id_produto INT PRIMARY KEY,
    nome VARCHAR(200),
    categoria VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS pedido (
	id_pedido INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO cliente SELECT * FROM backup_cliente;
INSERT INTO produto SELECT * FROM backup_produto;
INSERT INTO pedido SELECT * FROM backup_pedido; -- Vai dar Erro
INSERT INTO pedido SELECT id_pedido, id_cliente, id_produto,  quantidade, STR_TO_DATE(data, '%d/%m/%Y') FROM backup_pedido;


SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM pedido;



