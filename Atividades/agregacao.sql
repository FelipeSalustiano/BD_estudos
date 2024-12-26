use restaurante;

SELECT * FROM pedidos;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM info_produtos;


SELECT COUNT(quantidade) AS total_pedidos FROM pedidos;

SELECT COUNT(DISTINCT id_cliente) AS quantidade_clientes_unicos FROM pedidos;

SELECT ROUND(AVG(preco), 2)FROM produtos;

SELECT MAX(preco) AS produto_maior_valor, MIN(preco) AS produto_menor_valor FROM produtos;

SELECT nome, preco, ROW_NUMBER() OVER (ORDER BY preco DESC) AS rank_produtos FROM produtos ORDER BY rank_produtos LIMIT 5;

SELECT categoria, ROUND(AVG(preco),2) AS media_precos FROM produtos GROUP BY categoria;

SELECT fornecedor, COUNT(*) AS quantidade_produtos FROM info_produtos GROUP BY fornecedor;

SELECT fornecedor, COUNT(*) AS quantidade_produtos FROM info_produtos GROUP BY fornecedor HAVING quantidade_produtos > 1;

SELECT id_cliente, COUNT(quantidade) AS quantidade_pedidos FROM pedidos GROUP BY id_cliente HAVING quantidade_pedidos < 2;
