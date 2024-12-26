/* Aula 03 */

use informatica;

desc cliente;
desc produto;

-- Alterações básicas de adição e remoção de colunas
ALTER TABLE cliente ADD COLUMN endereco VARCHAR(255);
ALTER TABLE cliente ADD COLUMN cidade VARCHAR(255);
ALTER TABLE cliente DROP COLUMN endereco;
ALTER TABLE cliente ADD UNIQUE (email);

-- Alterações de colunas exitentes
ALTER TABLE cliente MODIFY COLUMN nome VARCHAR(100);
ALTER TABLE cliente CHANGE COLUMN nome nome_completo VARCHAR(255);
ALTER TABLE cliente ALTER COLUMN cidade SET DEFAULT 'Não informado';

-- Alterações de chave [ CUIDADO ]
ALTER TABLE cliente MODIFY id_cliente INT;
ALTER TABLE cliente DROP PRIMARY KEY;
ALTER TABLE cliente ADD PRIMARY KEY (id_cliente);

CREATE TABLE produto (id_produto INT PRIMARY KEY);
ALTER TABLE cliente ADD FOREIGN KEY (id_produto) REFERENCES produto(id_produto);

-- Renomear tabelas 
ALTER TABLE cliente RENAME TO clientes_antigos;

-- Exclusão de tabela
DROP TABLE clientes_antigos; # Não recomendado utilizar
DROP TABLE IF EXISTS clientes_antigos; # Recomendado (Dá para fazer na criação de tabelas também)


