USE loja_informatica;

SELECT * FROM pedido;
SELECT * FROM cliente;
SELECT * FROM produto;


-- 	Funções de agregação

SELECT COUNT(*) FROM pedido;
SELECT COUNT(quantidade) FROM pedido;
SELECT COUNT(id_pedido) FROM pedido;
SELECT COUNT(DISTINCT id_cliente) FROM pedido;

SELECT SUM(quantidade) FROM pedido;
SELECT AVG(quantidade) FROM pedido;

SELECT MAX(preco) FROM produto;
SELECT MIN(preco) FROM produto;

SELECT VAR_POP(preco) FROM produto; -- Variancia populacional = VARIANCE()
SELECT VAR_SAMP(preco) FROM produto; -- Variancia amostral

SELECT STDDEV(preco) FROM produto; -- Desvio Padrão

SELECT GROUP_CONCAT(DISTINCT quantidade) FROM pedido;
 
SELECT nome, preco, RANK() OVER (ORDER BY preco) AS ranking_preco FROM produto;
SELECT nome, preco, ROW_NUMBER() OVER (ORDER BY preco) AS ranking_preco FROM produto;
SELECT DISTINCT nome, preco, DENSE_RANK() OVER (ORDER BY preco DESC) AS ranking_preco FROM produto;
SELECT DISTINCT nome, preco, DENSE_RANK() OVER (ORDER BY preco DESC) AS ranking_preco FROM produto LIMIT 5;

-- Agrupando resultados 

SELECT SUM(preco) AS preco_total FROM produto;
SELECT categoria, SUM(preco) AS preco_total FROM produto GROUP BY categoria;






