use restaurante;

SELECT * FROM funcionarios;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;
SELECT * FROM info_produtos;


SELECT nome, preco FROM produtos WHERE preco > 30; 

SELECT nome, telefone, data_nascimento FROM clientes WHERE year(data_nascimento) < 1985 ORDER BY data_nascimento;

SELECT id_produto, ingredientes FROM info_produtos WHERE ingredientes LIKE '%carne%';
  
SELECT nome, categoria FROM produtos ORDER BY categoria ASC, nome ASC;    

SELECT nome, preco FROM produtos ORDER BY preco DESC LIMIT 5;

SELECT nome, categoria FROM produtos WHERE categoria = 'Prato Principal' LIMIT 2 OFFSET 5;

CREATE TABLE backup_pedidos AS SELECT * FROM pedidos;
SELECT * FROM backup_pedidos;
