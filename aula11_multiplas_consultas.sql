USE loja_informatica;

SELECT * FROM pedido;
SELECT * FROM cliente;
SELECT * FROM produto;

-- INNER JOIN: Vizualização de duas tabelas 

SELECT cliente.nome, cliente.email, pedido.id_pedido
FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id_cliente;

-- INNER JOIN: Vizualização com mais de duas tabelas 

SELECT DISTINCT c.nome AS cliente, p.nome , p.categoria AS produto, p.preco, pe.data AS pedido
FROM cliente c
JOIN pedido pe ON pe.id_cliente = c.id_cliente
JOIN produto p ON p.id_produto = pe.id_produto;

-- LEFT JOIN: Vizualização de duas tabelas porém a tabela principal é a da esquerda 

SELECT cliente.nome, cliente.email, pedido.id_pedido
FROM cliente
LEFT JOIN pedido ON pedido.id_cliente = cliente.id_cliente;

-- RIGHT JOIN: Vizualização de duas tabelas porém a tabela principal é a da direita

SELECT cliente.nome, cliente.email, pedido.id_pedido
FROM cliente
RIGHT JOIN pedido ON pedido.id_cliente = cliente.id_cliente;



