use restaurante;

SELECT * FROM pedidos;
SELECT * FROM produtos;
SELECT * FROM clientes;
SELECT * FROM info_produtos;
SELECT * FROM funcionarios;

SELECT * FROM pedidos WHERE id_funcionario = 4 AND status = 'Pendente';

SELECT * FROM pedidos WHERE status <>'Concluido';

SELECT * FROM pedidos WHERE id_produto IN (1, 3, 5, 7, 8);

SELECT * FROM clientes WHERE nome LIKE 'C%';

SELECT * FROM info_produtos WHERE ingredientes LIKE '%carne%' OR ingredientes LIKE '%frango%';

SELECT * FROM produtos WHERE preco BETWEEN 20 AND 30;

UPDATE pedidos SET status = NULL WHERE id_pedido = 6; 

SELECT * FROM pedidos WHERE status IS NULL;

SELECT id_pedido, IFNULL(status, 'Cancelado') AS coluna_status_tratada FROM pedidos;

SELECT nome, cargo, salario, IF(salario > 3000, 'Acima da média', 'Abaixo da média') AS media_salario FROM funcionarios;

