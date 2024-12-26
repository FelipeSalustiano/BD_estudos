/* Aula 2 */

use informatica;

create table IF NOT EXISTS cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE,
    limite_credito DECIMAL(10,2),
    info_adicionais TEXT,
    cadastro_ativo BOOLEAN DEFAULT 1,
    id_produto INT,
    UNIQUE (email)
    /* FOREIGN KEY (id_produto) REFERENCES produto(id_produto) */
)COMMENT='Tabela de clientes de informatica';

drop table cliente;

