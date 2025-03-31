SQL -> Structured Query Language -> Linguagem de Consulta Estruturada

CREATE - cria alguma coisa
ALTER - altera alguma coisa
DROP - deleta alguma coisa

Na modelagem usamos:
    CREATE TABLE - cria uma tabela
    ALTER TABLE - altera uma tabela
    DROP TABLE - deleta uma tabela

Tipos de restrição FOREIGN KEY:
    NO ACTION - Sem efeito imediato a pode gerar erro no banco de dados casa a estrutura esteja 
    feita para a restrição de integridade de dados.

    CASCADE - Se o registro da tabela referenciada for delatado, os registros dependentes também
    serão automaticamente deletados.

    SET NULL - Se o registro da tabela referenciada for deletado, os registros dependentes terão
    o campe de chave estrangeira marcados como NULL (não funciona em campos com marcação NOT NULL).

    RESTRICT - Impede a exclusão de registros da tabela referenciada se houver registros dependentes.
