
DROP TABLE cliente;
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

-- Selecionar tabela 
SELECT * FROM cliente;

-- Adicionar linha (registro)
INSERT INTO cliente ( nome, email, data_nascimento, limite_credito) 
VALUES ('Marcos', 'marcos@email.com', '1991-01-05', 8000.00); 

INSERT INTO cliente (nome) 
VALUES ('Pedro');

-- Inserir multiplos registros (Mais eficiente)
INSERT INTO cliente ( nome, email, data_nascimento, limite_credito) 
VALUES ('Ana', 'ana@email.com', '1980-05-28', 1000.00); 
INSERT INTO cliente ( nome, email, data_nascimento, limite_credito) 
VALUES ('Joao', 'joao@email.com', '1995-10-14', 5500.00); 

-- Inserir registros sem especificar os campos
INSERT INTO cliente VALUES (NULL, 'thiago', 'thiago@email.com', '1995-08-20', 4600, NULL, TRUE, 1);



