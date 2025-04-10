-- Lista as permissões do usuário atual:
    SHOW GRANTS FOR CURRENT_USER;

-- Cria um novo usuário:
    CREATE USER 'gustavo'@'localhost' IDENTIFIED BY '123';

-- Atribuir permissões para o usuário:
    GRANT SELECT, INSERT, UPDATE ON nome_banco.* TO 'gustavo'@'localhost';
    -- nome_banco.* -> isso indica que a permissão é válida para todas as tabelas do banco 'nome_banco'

-- Atribuir todos os privilégios para um usuário (cuidado!):
    GRANT ALL PRIVILEGES ON modelagem_fisica.* to 'gustavo'@'localhost';

-- Revogar permissão do usuário:
    REVOKE ALL PRIVILEGES ON modelagem_fisica.* FROM 'gustavo'@'localhost';

-- Limpar cache e atualizar permissões:
    FLUSH PRIVILEGES;

-- Listar todos os usuários:
    SELECT user, host FROM mysql.user;

-- Altera senha de um usuário:
    ALTER USER 'gustavo'@'localhost' IDENTIFIED BY '1234';

/* Comando para ativar ou desativar SQL_SAFE_UPDATES
    - Ativar = SET SQL_SAFE_UPDATES = 1;
    - Desativar = SET SQL_SAFE_UPDATES = 0;
*/