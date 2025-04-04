Comandos Básicos (instruções) de SQL

Dividimos as instruções em algumas categorias, são elas:
    DDL, DML, DQL, DCL e TCL

DDL -> DATA DEFINITION LANGUAGE (Linguagem de definição de dados)
    - Contém comandos utilizados para criar, modificar ou excluir estruturas de banco de dados.
    - Estes comandos não manipulam dados, apenas estrutura.
    - Comandos relacionados: CREATE, ALTER, DROP, TRUNCATE

    Exemplos:
        CREATE TABLE nome_tabela
        ALTER TABLE nome_tabela
        DROP TABLE nome_tabela
        TRUNCATE TABLE nome_tabela

--------------------------------------------

DML -> DATA MANIPULATION LANGUAGE (Linguagem de manipulação de dados)
    - Contém comandos utilizados para manipular dados nas tabelas, inclui inserção, atualização
      e remoção de registros.
    - Comandos relacionados: INSERT, UPDATE, DELETE

    Exemplos:
        INSERT INTO nome_tabela
        UPDATE nome_tabela
        DELETE FROM nome_tabela

--------------------------------------------

DQL -> DATA QUERY LANGUAGE (Linguagem de consulta de dados)
    - Contém um comando utilizado para consultas os dados no banco de dados, ou seja, para fazer 'Queries' (consultas)
    - Comando relacionado: SELECT

    Exemplo: SELECT * FROM nome_tabela
    - O simbolo '*' refere-se a todas as colunas de uma tabela.
    - Também é possivel informar o nome das colunas que deseja
    selecionar, separando-as por vírgula.

--------------------------------------------

DCL -> DATA CONTROL LANGUAGE (Linguagem de controle de dados)
    - Contém comandos que controlam o acesso e permissões de usuários sobre objetos de banco de dados
      como tabelas, views e etc.
    - Comandos relacionados: GRANT, REVOKE

    Exemplos:
        GRANT SELECT, INSERT ON nome_tabela
        REVOKE INSERT ON nome_tabela
        
--------------------------------------------

TCL -> TRANSACTION CONTROL LANGUAGE (Linguagem de controle de transações)
    - Contém comandos que gerenciam as transações de banco de dados.
    - Transações são blocos de operações que devem ser executadas juntas ou não executadas.
    - Comandos relacionados: BEGIN/START TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT

    Exemplos:
    - START TRANSACTION;
        INSERT INTO ...
    COMMIT; -- Se caso for tudo certo

    - START TRANSACTION
        UPDATE ...
    ROLLBACK; -- Se caso algo der errado

    - RELEASE SAVEPOINT nome 

