USE loja_informatica;

SELECT * FROM pedido;
SELECT * FROM cliente;
SELECT * FROM produto;

-- Criando e selecionando View

CREATE VIEW vizualizacao_clientes AS 
SELECT id_cliente, nome, email 
FROM cliente;

SELECT * FROM vizualizacao_clientes;

-- Atualizando View

CREATE OR REPLACE VIEW vizualizacao_clientes AS 
SELECT id_cliente, nome, cidade 
FROM cliente;

SELECT * FROM vizualizacao_clientes;

-- Drop na view

DROP VIEW vizualizacao_clientes;

-- Criando e chamando Procedure

DELIMITER //
CREATE PROCEDURE AddCliente(IN pedidoID INT, IN produtoID INT, IN clienteID INT, IN qtd INT, IN dataPedido DATE)
BEGIN
    INSERT INTO pedido (id_pedido, id_produto, id_cliente, quantidade, data) VALUES (pedidoID, produtoID, clienteID, qtd, dataPedido);
    INSERT INTO backup_pedido(ID_Pedido, ID_Produto, ID_Cliente, Quantidade, Data) VALUES (pedidoID, produtoID, clienteID, qtd, dataPedido);
END //
DELIMITER ;

CALL AddCliente(201, 2, 1, 10, '2024-03-01');

SELECT * FROM pedido WHERE id_pedido = 201;
SELECT * FROM backup_pedido WHERE id_pedido = 201;
 
-- Criação de função

# Criando uma função que retorna o nome do cliente com base do seu ID

DELIMITER //
CREATE FUNCTION BuscarNomeCliente(IdCliente INT)
RETURNS VARCHAR(200)
READS SQL DATA
	BEGIN 
		DECLARE nomeCliente VARCHAR(200);
        SELECT nome INTO nomeCliente FROM cliente WHERE id_cliente = IdCliente;
		RETURN nomeCliente;
    END //
DELIMITER ;

SELECT BuscarNomeCliente(50);

# Criando uma função que para calcular o preço total de vendas de um produtos

DELIMITER //
CREATE FUNCTION PrecoTotalVendas(IdProduto INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
	BEGIN
		DECLARE totalPreco DECIMAL(10,2);
		SELECT SUM(p.preco * pe.quantidade) 
        INTO totalPreco 
        FROM produto p 
        JOIN pedido pe ON pe.id_produto = p.id_produto 
        WHERE p.id_produto = IdProduto;
        RETURN totalPreco;
	END //

DELIMITER ;

SELECT precoTotalVendas(10);

SELECT id_produto, nome, PrecoTotalVendas(id_produto) AS total_vendas FROM produto;

# Procedure igual a função anterior porém ele retorna o id, nome e categoria do produto também
DELIMITER //
CREATE PROCEDURE AcharPrecoTotalVendas(IDproduto INT)
BEGIN 
	SELECT p.id_produto, p.nome, p.categoria ,SUM(p.preco * pe.quantidade) 
        FROM produto p 
        JOIN pedido pe ON pe.id_produto = p.id_produto
        WHERE p.id_produto = IDproduto
        GROUP BY p.id_produto, p.nome, p.categoria;
END //
DELIMITER ;

call AcharPrecoTotalVendas(24);
DROP procedure AcharPrecoTotalVendas;


# Função para classificar o desempenho das vendas dos produtos

DELIMITER //
CREATE FUNCTION classificaDesempenhoVendas(produtoID INT)
RETURNS VARCHAR(200)
READS SQL DATA
	BEGIN
    DECLARE totalPreco DECIMAL(10,2);
    DECLARE desempenho VARCHAR(200);
    
    SELECT COALESCE(SUM(p.preco * pe.quantidade),0) 
    INTO totalPreco
    FROM produto p
    LEFT JOIN pedido pe ON p.id_produto = pe.id_produto
    WHERE p.id_produto = produtoID;
    
    SET desempenho =
		CASE 
			WHEN totalPreco = 0 THEN 'Não tem vendas'
			WHEN totalPreco <= 1000 THEN 'Baixo'
            WHEN totalPreco <= 5000 THEN 'Médio'
		ELSE 'Alto'
	END;
    
    RETURN desempenho;
END //
DELIMITER ;

SELECT classificaDesempenhoVendas(7);

select * from produto;



