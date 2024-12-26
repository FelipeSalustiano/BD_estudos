use informatica;

SELECT * FROM clientes;

-- AND, OR e NOT

SELECT * FROM clientes WHERE cadastro_ativo = TRUE AND limite_credito > 6000;

SELECT * FROM clientes WHERE cadastro_ativo = TRUE OR limite_credito > 6000;

SELECT * FROM clientes WHERE limite_credito > 6000 AND YEAR(data_nascimento) > 1980;

SELECT * FROM clientes WHERE cadastro_ativo = TRUE OR limite_credito > 6000 AND YEAR(data_nascimento) > 1980; -- Testar ()

SELECT * FROM clientes WHERE cadastro_ativo = TRUE OR (limite_credito > 6000 AND YEAR(data_nascimento) > 1980);

SELECT * FROM clientes WHERE (cadastro_ativo = TRUE OR limite_credito > 6000) AND YEAR(data_nascimento) > 1980; 

SELECT * FROM clientes WHERE NOT limite_credito > 6000;

-- IN 

SELECT * FROM clientes WHERE id_cliente IN (1, 2, 4, 6);

SELECT * FROM clientes WHERE YEAR(data_nascimento) IN (1991, 1995);

-- BETWEEN 

SELECT * FROM clientes WHERE data_nascimento BETWEEN '1990-01-01' AND '2000-01-01';

SELECT * FROM clientes WHERE limite_credito BETWEEN 6000 AND 10000;

-- LIKE

SELECT * FROM clientes WHERE info_adicionais LIKE 'revisao%';

SELECT * FROM clientes WHERE info_adicionais LIKE '%cadastro'; -- Custoso computacional

SELECT * FROM clientes WHERE info_adicionais  LIKE '%@%.com';

/* INSERT INTO clientes (nome, email, data_nascimento, info_adicionais)
VALUES ('A', 'a@a.com', '1990-01-01', ''); */ -- Cadastro incorreto

SELECT * FROM clientes WHERE NOT email LIKE '__%@__%.com'; -- Usar WHERE NOT

SELECT * FROM clientes WHERE email LIKE '____%@email.com';
SELECT * FROM clientes WHERE email LIKE '___@_mail.com' OR email LIKE '___@__mail.com';

SELECT * FROM clientes WHERE (nome LIKE 'A%' OR nome LIKE 'B%' OR nome LIKE 'C%') AND cadastro_ativo = TRUE;


-- NULL e NOT NULL

SELECT * FROM clientes WHERE info_adicionais IS NULL;	

SELECT * FROM clientes WHERE info_adicionais IS NOT NULL;	

SELECT * FROM clientes WHERE limite_credito > 5000 AND (info_adicionais IS NULL OR id_produto IS NULL);

SELECT nome, limite_credito, IFNULL(limite_credito, 0) FROM clientes;

SELECT nome, IFNULL(limite_credito, 0) AS limite_credito_tratado FROM clientes;  # "AS limite_credito_tratado" foi um apelido criado para a coluna "IFNULL(limite_credito, 0)"

SELECT nome, IFNULL(info_adicionais, 'Nada Consta') AS info_adicionais_tratada FROM clientes;

SELECT nome, info_adicionais, NULLIF(info_adicionais, 'Inativo') AS info_adicionais_tratada FROM clientes; # NULLIF faz o inverso do IFNULL
																										   # Exemplo: Se "info_adicionais" estiver 'Intativo' ele muda para nulo
SELECT nome, limite_credito, IFNULL(NULLIF(limite_credito, 5500), 0) as limite_credito_teste FROM clientes;

SELECT nome, info_adicionais, IFNULL(NULLIF(info_adicionais, ''), 'Nada Consta') as info_adicionais_tratadas FROM clientes; # "IFNULL(NULLIF())" Muda primeiro para NULL para depois alterar o resgistro
 
SELECT nome, info_adicionais, limite_credito, id_produto, COALESCE(limite_credito, id_produto, 'Cadastro Nulo') FROM clientes;  # Verifica se todos os campos são nulos. Se todos forem nulo ele vai mostrar "Cadastro Nulo"

-- TRATAR ESPAÇOS EM BRANCO

SELECT '     REMOVER ESPAÇOS     ', TRIM('REMOVER ESPAÇOS');

SELECT nome, info_adicionais FROM clientes WHERE info_adicionais <> TRIM(info_adicionais);

SELECT * FROM clientes WHERE NULLIF(TRIM(info_adicionais), '') IS NULL;

SELECT * FROM clientes WHERE NULLIF(info_adicionais, '') IS NULL;

-- IF e CASE

SELECT nome, limite_credito, IF(limite_credito > 6000, 'Alto Salário', 'Baixo Salário') AS classificacao_salario FROM clientes; # IF é melhor que o CASE WHEN quando usar só uma condicional

SELECT nome, limite_credito,
	CASE 
		WHEN limite_credito IS NULL THEN 'Nulo'
		WHEN limite_credito > 6000 THEN 'Salario Alto' 
		ELSE 'Salário Baixo'
	END AS classific_salario 
    FROM clientes;
    
SELECT nome, limite_credito,
	CASE 
		WHEN limite_credito > 8000 THEN 'Premium'
        WHEN limite_credito BETWEEN 6000 AND 8000 THEN 'Gold'
        WHEN limite_credito < 6000 THEN 'Silver'
        WHEN limite_credito IS NULL THEN 'Não Consta'
	END AS categoria_salario 
    FROM clientes;
    







