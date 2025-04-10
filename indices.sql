Otimização de banco de dados é assencial para garantir a performance do banco de dados especialmente quando o banco cresce

1. INDICES:
    - indices são estruturas de dados que melhoram a velocidade das consultas de uma tabela, permitindo que o banco encontre dados mais rapidamente. Funciona como se fosse o indice de um livro.

    Exemplo:
        - CREATE INDEX nome_index ON nome_tabela(campo);
        - CREATE INDEX idx_nome ON cliente(nome);

2. TIPO DE INDICES:
    - PRIMARY KEY - indice único e principal da tabela
    - UNIQUE - garante que valores não se repitam
    - INDEX ou KEY - indice normal para agilizar processo de busca (SELECT)
    - FULLTEXT - busca textual eficiente
    - COMPOSTO - indice em variás colunas

3. QUANDO USAR INDICES:
    * Use índices em colunas que:
        - Estarão presentes na cláusula WHERE
        - Participam de JOIN entre tabelas
        - Estão em ORDER BY ou GROUP BY
        - São usadas em LIKE

4. QUANDO NÂO USAR INDICES:
    - Em tabelas pequenas (ganho mínimo)
    - Em colunas com valores repetidos (baixa seletividade)
    - Quando se usa muito INSERT, UPDATE (indices podem atrasar essas operações)

-- Este comando exibe os indices que presentes em uma tabela:
    EXPLAIN SELECT * FROM alunos WHERE nome = 'Gustavo Petry';

-- Trabalhando com índices:
    CREATE TABLE artigos (
        id INT PRIMARY KEY AUTO_INCREMENT, -- Tipo índice: PRIMARY KEY
        titulo VARCHAR(255),
        username VARCHAR(50) UNIQUE, -- Tipo índice: UNIQUE (Garante valores únicos)
        telefone CHAR(11),
        conteudo TEXT,
        data_create DATE,
        INDEX idx_telefone (telefone), -- KEY e INDEX são a mesma coisa, o nome diferente é apenas sinônimo
        KEY idx_data (data_create),
        FULLTEXT (conteudo) -- Busca para textos
        INDEX idx_varios (username, titulo) -- Índice composto
    );