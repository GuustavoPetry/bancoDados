-- Lista as permissões do usuário atual:
    SHOW GRANTS FOR CURRENT_USER;

-- Cria um novo usuário:
    CREATE USER 'gustavo'@'localhost' IDENTIFIED BY '123';

-- Atribuir permissões para o usuário:
    GRANT SELECT ON nome_banco.* TO 'gustavo'@'localhost';
    -- nome_banco.* -> isso indica que a permissão é válida para todas as tabelas do banco 'nome_banco'

    