@FullTesting
Feature: Pesquisar Clientes

  @SmokeTesting
  Scenario: Pesquisar um cliente existente
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    And Eu devo ver que o corpo de resposta retornado esta dentro do especificado

  @SmokeTesting
  Scenario: Confirmar que o HTTP StatusCode de uma pesquisa está correto
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then Eu devo verificar que o HTTP StatusCode retornado é 200

  @NegativeTesting
  Scenario: Pesquisar um cliente utilizando um telefone inexistente na busca
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "789488877"
    Then Eu devo ver a mensagem de erro "Não existe pessoa com o telefone (11)789488877"

  @NegativeTesting
  Scenario: Pesquisar um cliente utilizando um DDD inexistente na busca
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu fizer uma pesquisa usando metodo GET informando DDD "99" e o numero "985388877"
    Then Eu devo ver a mensagem de erro "Não existe pessoa com o telefone (99)985388877"

  @NegativeTesting
  Scenario: Pesquisar um cliente utilizando DDD e o nome do cliente na busca
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "Rommel Von"
    Then Eu devo verificar que o HTTP StatusCode retornado é 404

  @NegativeTesting
  Scenario: Pesquisar um cliente utilizando um endpoint incorreto
    Given Eu acesse um endpoint invalido como /cliente
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then Eu devo verificar que o HTTP StatusCode retornado é 404
