-- OBS: FOI UTILIZADO A MODELAGEM "modelagemRestaurante.sql" PARA FAZER OS EXERCICIOS.

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
SELECT produtos.nome, produtos.preco, produtos.from_categorias, categorias.ativo FROM produtos
INNER JOIN categorias ON produtos.from_categorias = categorias.id
WHERE preco BETWEEN 500 AND 1000 AND categorias.ativo = 1
AND produtos.nome LIKE "Cerveja%" GROUP BY from_categorias;

    