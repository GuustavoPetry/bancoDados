-- Instrução que insere um registro na tabela 'categorias':
INSERT INTO categorias
(titulo, ativo, ordem)
VALUES
('Carnes', 1, null),
('Bebidas', 1, 1)

-- Instrução completa para cada registro (atalho -> Ctlr + D, para alterar multiplas linhas simultaneamente):
INSERT INTO categorias (titulo, ativo, ordem) VALUES ('Carnes', 1, null);
INSERT INTO categorias (titulo, ativo, ordem) VALUES ('Bebidas', 1, 1);

-- Atualiza o valor de um campo já existente:
UPDATE categorias SET titulo = 'Massas' WHERE id=2;
    /* obs: Se não passar a cláusula WHERE, todas as linhas da tabela serão atualizadas
    caso o SAFE UPDATE estiver desabilitado */

-- Deleta linhas de uma tabela:
DELETE FROM categorias WHERE id = 1;

DELETE FROM categorias WHERE id IN(1, 2, 3, 4); -- Deleta as linhas de todos os id's informados
    /* obs: Se não passar a cláusula WHERE, todas as linhas da tabela serão deletadas
    caso o SAFE UPDATE estiver desabilitado */


