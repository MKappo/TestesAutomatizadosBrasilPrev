Feature: Buscar Clientes

  @SanityTesting
  Scenario: Validar Busca de um cliente exitente
    Given Que o endpoint /pessoas esteja disponivel
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then O corpo de resposta retornado deve estar correto

  @SanityTesting
  Scenario: Validar StatusCode de uma pesquisa está correto
    Given Que o endpoint /pessoas esteja disponivel
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then O StatusCode retornado deverá ser 200

  @SanityTesting
  Scenario: Validar se o usuário recebe algum feedback ao pesquisar um telefone inexistente
    Given Que o endpoint /pessoas esteja disponivel
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "789488877"
    Then A mensagem de erro "Não existe pessoa com o telefone (11)789488877" deverá ser exibida

  @SanityTesting
  Scenario: Validar se o usuário recebe algum feedback ao pesquisar um DDD inexistente
    Given Que o endpoint /pessoas esteja disponivel
    When Eu fizer uma pesquisa usando metodo GET informando DDD "99" e o numero "985388877"
    Then A mensagem de erro "Não existe pessoa com o telefone (99)985388877" deverá ser exibida

  @NegativeTesting
  Scenario: Validar statusCode ao Buscar informações de um cliente utilizando endpoint incorreto
    Given Que eu aponte o endpoint /cliente
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then O StatusCode retornado deverá ser 404