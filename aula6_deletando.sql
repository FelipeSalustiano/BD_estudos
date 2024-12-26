
select * from cliente;

-- Deletar 1 registro
DELETE FROM cliente WHERE id_cliente = 6;

-- Deletar resgistros com condições multiplas
DELETE FROM cliente WHERE cadastro_ativo = FALSE AND limite_credito < 2000; 

-- Deletar todos os registros 
DELETE FROM cliente;

TRUNCATE TABLE cliente; # Mais recomendado 

