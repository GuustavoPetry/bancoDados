-- OBS: FOI UTILIZADO A MODELAGEM "modelagemEstudo.sql" PARA FAZER OS EXERCICIOS.

-- 1. Liste todos os produtos com suas respectivas categorias
	SELECT produtos.id,
	nome,
	descricao,
	preco,
	categorias.titulo
	FROM produtos
	INNER JOIN categorias ON produtos.from_categorias = categorias.id;

-- 2. Liste todos os produtos, com ou sem categoria
	SELECT * FROM produtos LEFT JOIN categorias ON produtos.from_categorias = categorias.id;

-- 3. Liste os produtos que pertencem a categorias ativas
	SELECT * FROM produtos INNER JOIN categorias ON produtos.from_categorias = categorias.id WHERE categorias.ativo = 1;

-- 4. Liste quantos produtos existem por categoria
	SELECT COUNT(*) AS total, from_categorias FROM produtos
	INNER JOIN categorias ON produtos.from_categorias = categorias.id
	GROUP BY from_categorias;

-- 5. Liste o produto mais caro de cada categoria
	SELECT MAX(preco) AS maximo, from_categorias FROM produtos
	INNER JOIN categorias ON produtos.from_categorias = categorias.id
	GROUP BY from_categorias;

/*6. DESAFIO - MONTE UMA CONSULTA COM AS REGRAS ABAIXO
Traga o nome do produto, o preço, a categoria
Filtre os produtos com preço entre X e Y
Mostre somente as categorias ativas.
Só traga os produtos cujo nome contenha uma palavra específica 
Agrupe os resultados por categoria.
Mostre também:
	•	A quantidade de produtos por categoria.
	•	O preço médio dos produtos daquela categoria.
	•	O produto mais caro da categoria.*/
	SELECT
	p.nome,
	p.preco,
	c.titulo,
	c.ativo,
	COUNT(p.id) AS total_produtos,
	AVG(p.preco) AS valor_medio,
	MAX(p.preco) AS mais_caro
	FROM produtos p
	INNER JOIN categorias c ON p.from_categorias = c.id
	WHERE p.preco BETWEEN 500 AND 1000
	AND c.ativo = 1
	AND p.nome LIKE "Cerveja%"
	GROUP BY c.id;

-- SELECT na tabela clientes utilizando as funções COUNT() e CONCAT():
	SELECT
	c.id,
	c.nome,
	e.cidade,
	e.principal,
	COUNT(e.id) AS total_enderecos,
	CONCAT(
		e.logradouro, ', ',
		e.numero, ' | ',
		IF(e.complemento IS NOT NULL, CONCAT(e.complemento, ' | '), ''),
		e.bairro, ' | ',
		e.cidade, ' | ',
		e.estado, ' | CEP: ',
		e.cep
	) AS endereco
	FROM
	clientes c
	INNER JOIN clientes_enderecos e ON e.cliente_id = c.id AND e.principal = 1
	GROUP BY e.cliente_id
	ORDER BY e.cliente_id ASC;

/* Exercicio:
Crie uma tabela chamada alunos, com nome, nota1, nota2, nota3, nota4;
Faça um Select de todas as colunas e calcule a média de cada aluno;
Por fim, crie uma condicional para indicar a situação do aluno (reprovado, aprovado)
 */
	CREATE TABLE alunos (
		nome VARCHAR(100) NOT NULL,
		nota1 DOUBLE NOT NULL,
		nota2 DOUBLE NOT NULL,
		nota3 DOUBLE NOT NULL,
		nota4 DOUBLE NOT NULL
	);

-- Instrução SELECT:
	SELECT nome,
	nota1,
	nota2,
	nota3,
	nota4,
	ROUND((nota1 + nota2 + nota3 + nota4) / 4, 1)  AS media,
	-- Exemplo com CASE:
	CASE
		WHEN ((nota1 + nota2 + nota3 + nota4) / 4) < 8 THEN 'Reprovado'
		WHEN ((nota1 + nota2 + nota3 + nota4) / 4) >= 8 THEN 'Aprovado'
	END AS situacao_case,
	-- Exemplo com IF:
	IF(((nota1 + nota2 + nota3 + nota4) / 4) >=8, 'Aprovado', 'Reprovado') AS situacao_if
	FROM alunos;

-- Instrução INSERT:
	INSERT INTO contas (nome, saldo) VALUES
	('Diego', 100.00),
	('Maria', 500.00);

	-- Criando uma transação de transferência de valores:
		START TRANSACTION;

		UPDATE contas SET saldo = saldo - 200 WHERE nome = 'Maria';
		SAVEPOINT depois_maria;
		UPDATE contas SET saldo = saldo + 200 WHERE nome = 'Diego';

		ROLLBACK TO depois_maria; -- O que tiver entre o SAVEPOINT e ROLLBACK não será executado;

		COMMIT; -- A transação só ira ocorrer se o 'COMMIT' for executado.



    