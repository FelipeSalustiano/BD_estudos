USE restaurante;

SELECT * FROM pedidos;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM info_produtos;
SELECT * FROM funcionarios;

SELECT p.id_produto, p.nome, p.descricao, info.ingredientes 
FROM produtos p
JOIN info_produtos info ON info.id_produto = p.id_produto;

SELECT c.nome, c.email, pe.id_pedido, pe.quantidade, pe.data_pedido
FROM pedidos pe
JOIN clientes c ON c.id_cliente = pe.id_cliente;

SELECT f.nome AS nome_funcionario, c.nome AS nome_cliente, c.email, pe.id_pedido, pe.quantidade, pe.data_pedido 
FROM pedidos pe
JOIN clientes c ON c.id_cliente = pe.id_cliente
JOIN funcionarios f ON f.id_funcionario = pe.id_funcionario;

SELECT  f.nome AS nome_funcionario, c.nome AS nome_cliente, c.email, pe.id_pedido, pe.quantidade, pe.data_pedido, p.nome AS nome_produto, p.preco
FROM pedidos pe
JOIN clientes c ON c.id_cliente = pe.id_cliente
JOIN funcionarios f ON f.id_funcionario = pe.id_funcionario
JOIN produtos p ON p.id_produto = pe.id_produto;

SELECT c.nome, pe.status
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
WHERE status = 'Pendente';

SELECT c.nome, pe.id_pedido
FROM clientes c
LEFT JOIN pedidos pe ON pe.id_cliente = c.id_cliente
WHERE id_pedido IS NULL;

SELECT c.nome AS nome_cliente, COUNT(pe.quantidade) AS total_quantidade
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
GROUP BY nome_cliente;

SELECT pe.id_pedido, SUM(pe.quantidade * p.preco) AS preco_total
FROM pedidos pe
JOIN produtos p ON p.id_produto = pe.id_produto
GROUP BY pe.id_pedido
ORDER BY pe.id_pedido; 





