-- Seleciona todas as colunas, de todos os elementos de uma tabela:
    SELECT * FROM nome_tabela;

-- Seleciona somente as colunas desejadas de determinada tabela:
    SELECT id, nome FROM nome_tabela

-- Seleciona somente as colunas desejadas de determinada tabela, e de determinado id:
    SELECT id, nome FROM nome_tabela WHERE id = 1;

-- Seleciona somente as colunas desejadas de determinada tabela, que atendem determinada condição:
    SELECT id, nome FROM nome_tabela WHERE id > 10;
    SELECT id, nome FROM nome_tabela WHERE id < 10;
    SELECT id, nome FROM nome_tabela WHERE id >= 50;
    SELECT id, nome FROM nome_tabela WHERE id <= 50;

-- Seleciona todas as colunas de todos os elementos da tabela, onde o preço atenda a condição na claúsula WHERE:
    SELECT * FROM nome_tabela WHERE preco > 10 AND preco < 100;

-- O método mais adequado para filtrar dados com um determinado intervalo:
    SELECT * FROM produtos WHERE preco BETWEEN 100 AND 500;

-- Seleciona todos os produtos de uma tabela que o preço atende determinado intervalo, ordenando em ordem crescente: 
    SELECT * FROM produtos WHERE preco BETWEEN 100 AND 500 ORDER BY preco ASC; -- ASC: CRESCENTE / DESC: DECRESCENTE
    -- Executa a mesma coisa, porém com uma limitação de no máximo 5 registros:
    SELECT * FROM produtos WHERE preco BETWEEN 100 AND 500 ORDER BY preco ASC LIMIT 5; -- LIMIT é sempre o ultimo comando da instrução
                                                                                       -- ORDER BY é sempre o penúltimo comanda do instrução

--Seleciona todos os produtos de uma tabela, onde o nome começa com a letra "c":
    SELECT * FROM produtos WHERE nome LIKE "c%";

-- Seleciona todos os produtos de uma tabela, onde o nome termina com a letra "c":
    SELECT * FROM produtos WHERE nome LIKE "%c";    

-- Seleciona todos os produtos de uma tabela, que contenham determinados caracteres no nome:
    SELECT * FROM produtos WHERE nome LIKE "Con__le%"; -- "Console"

-- Seleciona quantos registros existem em uma tabela, e exibe em um campo apelidade de "total":
    SELECT COUNT(*) AS total FROM produtos;

-- Seleciona quantos registros existem em determinada coluna, e exibe a soma de todos os dados de determinada coluna:
    SELECT COUNT(preco) AS total, -- soma a quantidade de linhas não nulas
    SUM(preco) AS soma, -- soma o valor de todas as linhas de uma coluna específica
    AVG(preco) AS media, -- calcula a média de valores de determinada coluna
    MIN(preco) AS minimo, -- Exibe o valor mínimo de determinada coluna
    MAX(preco) AS maximo -- Exibe o valor máximo de determinada coluna
    FROM produtos; 

-- Calcula quantos registros existem com determinada categoria relacionada:
    SELECT COUNT(*) AS total, from_categorias FROM produtos GROUP BY from_categorias;

-- Utiliza-se o INNER JOIN para juntar uma tabela com outra, e trazer dados de duas tabelas relacionadas:
    -- Exemplo 01:
    SELECT COUNT(*) AS total, from_categorias,
    categorias.titulo,
    categorias.ordem
    FROM produtos
    INNER JOIN categorias ON categorias.id = produtos.from_categorias
    GROUP BY from_categorias;

    -- Exemplo 02:
    SELECT produtos.id,
    produtos.nome,
    produtos.preco,
    categorias.titulo
    FROM produtos
    INNER JOIN categorias ON produtos.from_categorias = categorias.id;


