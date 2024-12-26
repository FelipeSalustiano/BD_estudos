use restaurante;

SELECT * FROM pedidos;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM info_produtos;
SELECT * FROM funcionarios;

# Usei as funções de media e maximo para poder calcular mais precisamente a questão do "mediaPedido"
SELECT AVG(preco) FROM produtos;
SELECT MAX(PRECO) FROM produtos;

CREATE VIEW resumo_pedido AS
SELECT func.nome AS nome_funcionario, c.nome AS nome_cliente, c.email AS email_cliente, pe.id_pedido, p.nome, p.preco, pe.quantidade, pe.data_pedido
FROM pedidos pe
JOIN produtos p ON p.id_produto = pe.id_produto
JOIN clientes c ON c.id_cliente = pe.id_cliente
JOIN funcionarios func ON func.id_funcionario = pe.id_funcionario;

SELECT id_pedido, nome_cliente, (quantidade * preco) AS total 
FROM resumo_pedido
ORDER BY id_pedido;

CREATE OR REPLACE VIEW resumo_pedido AS
SELECT func.nome AS nome_funcionario, c.nome AS nome_cliente, c.email AS email_cliente, pe.id_pedido, p.nome, p.preco, pe.quantidade, (p.preco * pe.quantidade) AS total, pe.data_pedido
FROM pedidos pe
JOIN produtos p ON p.id_produto = pe.id_produto
JOIN clientes c ON c.id_cliente = pe.id_cliente
JOIN funcionarios func ON func.id_funcionario = pe.id_funcionario;

SELECT id_pedido, nome_cliente, total
FROM resumo_pedido
ORDER BY id_pedido;

EXPLAIN 
SELECT id_pedido, nome_cliente, total 
FROM resumo_pedido;

DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto(produtoID INT)
RETURNS VARCHAR(300)
READS SQL DATA
BEGIN 
	DECLARE infoIngredientes VARCHAR(300);
	SELECT ingredientes INTO infoIngredientes FROM info_produtos WHERE id_produto = produtoID;
	RETURN infoIngredientes;
END //
DELIMITER ;

SELECT BuscaIngredientesProduto(10);

DELIMITER //
CREATE FUNCTION mediaPedido(pedidoID INT)
RETURNS VARCHAR(200)
READS SQL DATA
BEGIN 
    DECLARE totalPedido DECIMAL(10,2);
    DECLARE desempenho VARCHAR(200);
    
    SELECT COALESCE(SUM(p.preco * pe.quantidade), 0) INTO totalPedido
    FROM produtos p
    JOIN pedidos pe ON pe.id_produto = p.id_produto
    WHERE pe.id_pedido = pedidoID;
    
    SET desempenho = 
		CASE 
			WHEN totalPedido = 0 THEN 'Sem Pedidos'
            WHEN totalPedido <= 20 THEN 'Baixo'
			WHEN totalPedido <= 35 THEN 'Médio'
			ELSE 'Alto'
		END;
	RETURN desempenho;
END //
DELIMITER ;

SELECT mediaPedido(5);
SELECT mediaPedido(6);



