Exercício2 (modelagem fisica com interface): Sistema de Compra de Passagem de Ônibus
Contexto: Você precisa modelar um banco de dados para um sistema de vendas de passagens de ônibus. O sistema deve registrar informações sobre os passageiros, horários de viagens e assentos ocupados.

Requisitos:

Cada passageiro tem nome, CPF e telefone.

Cada viagem é operada por um ônibus e tem origem, destino, data e horário de partida.

Um ônibus tem um número único, quantidade total de assentos e uma empresa responsável.

Cada passagem comprada deve estar associada a um passageiro, a uma viagem específica e a um assento dentro do ônibus.

O sistema deve impedir a venda de um assento já reservado.

Tarefa:

Modele as tabelas para armazenar as informações.

Defina as chaves primárias e estrangeiras.

Pense nos índices necessários para otimizar buscas, como por CPF ou número da viagem.



Dica: A relação entre passageiro, passagem e viagem é essencial (1 viagem pode ter vári pertence a 1 passageiro).as passagens, 1 passagem