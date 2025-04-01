CREATE DATABASE restaurante;

USE restaurante;

CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(14) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE clientes_enderecos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(150) NOT NULL,
    numero CHAR(5) NOT NULL DEFAULT "S/N",
    complemento VARCHAR(45),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    principal TINYINT(1) NOT NULL DEFAULT 0,
    cliente_id INT NOT NULL,
    CONSTRAINT `fk_clientes_enderecos_clientes`
		FOREIGN KEY (cliente_id) REFERENCES clientes (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE funcionarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE funcionarios_funcoes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    funcao VARCHAR(50) NOT NULL,
    cbo CHAR(7) NOT NULL,
    descricao VARCHAR(255),
    funcionario_id INT NOT NULL,
    CONSTRAINT `fk_funcionarios_funcoes_funcionarios`
    FOREIGN KEY (funcionario_id) 
		REFERENCES funcionarios (id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);	

CREATE TABLE pedidos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    `status` TINYINT NOT NULL DEFAULT 0,
    data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DOUBLE NOT NULL DEFAULT 0,
    nf VARCHAR(255),
    cliente_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    CONSTRAINT `fk_pedidos_clientes`
		FOREIGN KEY (cliente_id) 
			REFERENCES clientes (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE,
            
	CONSTRAINT `fk_pedidos_funcionarios`
		FOREIGN KEY (funcionario_id) 
			REFERENCES funcionarios (id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
);

CREATE TABLE pedidos_itens (
	id INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(150) NOT NULL,
    quantidade INT NOT NULL,
    valor DOUBLE NOT NULL,
    pedido_id INT NOT NULL,
    cliente_id INT NOT NULL,
    CONSTRAINT `fk_pedidos_itens_pedidos`
		FOREIGN KEY (pedido_id)
			REFERENCES pedidos (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
            
	CONSTRAINT `fk_pedidos_itens_clientes`
		FOREIGN KEY (cliente_id)
			REFERENCES clientes (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45) NOT NULL,
    ativo TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100),
    preco DOUBLE NOT NULL DEFAULT 0,
    from_categorias INT NOT NULL,
    CONSTRAINT `fk_categorias`
		FOREIGN KEY (from_categorias) 
			REFERENCES categorias (id)
			ON DELETE RESTRICT
			ON UPDATE RESTRICT
);