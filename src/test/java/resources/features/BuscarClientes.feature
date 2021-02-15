Feature: Teste

  Scenario: Validar Busca de um cliente exitente
    Given Que o endpoint pessoas exista
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then Os dados do cliente "Rommel Von" deverão ser exibido

  Scenario: Validar StatusCode de uma pesquisa de cliente existente
    Given Que o endpoint esteja disponível
    When Eu fizer uma pesquisa usando metodo GET informando DDD "11" e o numero "985388877"
    Then O StatusCode retornado deverá ser 200

  Scenario: Validar se o usuário recebe algum feedback ao pesquisar um cliente inexistente
    Given Que o endpoint esteja disponível
    When Eu fizer uma pesquisa usando metodo GET informando DDD "12" e o numero "789488877"
    Then A mensagem de erro "Não existe pessoa com o telefone (12)789488877" deverá ser exibida

  Scenario: Validar statusCode ao Buscar informações de um cliente utilizando endpoint incorreto
    Given Que o endpoint esteja disponível
    When  Eu fizer uma pesquisa usando metodo GET informando apenas o DDD "11"
    Then O StatusCode retornado deverá ser 404


  Scenario: Validar o cadastro de um novo cliente
    Given Que o endpoint pessoas exista
    When Eu adicionar um cliente usando metodo POST
    Then O StatusCode retornado deverá ser 201
    And O corpo de resposta retornado esteja correto