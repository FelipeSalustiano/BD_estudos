USE informatica;

INSERT INTO clientes VALUES 
(NULL, 'Marcos', 'marcos@email.com', '1991-01-05', 8000.00, NULL, TRUE, 2),
(NULL, 'Carol', 'carol@email.com', '1998-02-26', 5500.00, NULL, TRUE, 1),
(NULL, 'Ana', 'ana@email.com', '1980-08-25', 10000.00, 'Revisão de cadastro', TRUE, 1),
(NULL, 'joão', 'joao@email.com', '1995-10-14', 5500.00, 'Inativo', FALSE, NULL),
(NULL, 'Thiago', 'thiago@email.com', '2001-08-20', 5600.00, NULL, TRUE, 1);

-- Selecionar todas colunas de uma tabela
SELECT * FROM clientes;

-- Selecionar colunas específicas 
SELECT nome, email FROM clientes;

-- Criar tabelas a partir das seleções de dados (Backup*)
CREATE TABLE backup_clientes AS SELECT * FROM clientes;

desc clientes;
desc backup_clientes; 

-- CONDIÇÕES

-- Inserir registro a partir da seleção de dados (Backup*)
TRUNCATE backup_clientes;
SELECT * FROM backup_clientes;
INSERT INTO backup_clientes SELECT * FROM clientes;

-- Filtrar por campo numérico
SELECT nome, limite_credito FROM clientes WHERE limite_credito > 5000;

-- Filtrar por campo de texto
SELECT nome, limite_credito FROM clientes WHERE nome = 'João';
SELECT nome, limite_credito FROM clientes WHERE nome LIKE 'Jo%';

-- Filtra por campo boleano
SELECT nome, limite_credito FROM clientes WHERE cadastro_ativo = TRUE;

-- Filtrar por campo de data 
SELECT nome, limite_credito, data_nascimento FROM clientes WHERE data_nascimento > '1990-01-01'; -- yyyy-mm-dd
SELECT nome, limite_credito, data_nascimento FROM clientes WHERE YEAR (data_nascimento) > '1990'; -- year, month, day

-- ORDENAÇÃO

-- Ordenar por ordem ascendente (alfabetica)
SELECT nome, limite_credito FROM clientes ORDER BY nome;

-- Ordenar por ordem decrescente 
SELECT nome, data_nascimento FROM clientes ORDER BY data_nascimento DESC;

-- Ordenar por mais de um campo
SELECT nome, data_nascimento, limite_credito FROM clientes ORDER BY limite_credito DESC, nome ASC;

-- LIMITAÇÃO

-- Selecionar um registro (Boa prática)
SELECT * FROM clientes LIMIT 2;

-- Selecionar os 3 clientes com mais limite de crédito
SELECT nome, limite_credito FROM clientes ORDER BY nome LIMIT 2;

-- Pular o 3 primeiros registros e selecionar os próximos 2
SELECT nome, limite_credito FROM clientes ORDER BY nome LIMIT 2 OFFSET 3;





