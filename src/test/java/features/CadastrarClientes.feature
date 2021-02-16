Feature: Cadastrar Novos Clientes

  @SanityTesting
  Scenario: Validar o cadastro de um novo cliente
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST
    Then O StatusCode retornado deverá ser 201
    And O corpo de resposta retornado deve estar correto

  @SanityTesting
  Scenario: Validar statusCode e feedback ao tentar cadastrar um CPF já existente
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST
    Then O StatusCode retornado deverá ser 400
    And A mensagem de erro "Já existe pessoa cadastrada com o CPF 12345678909" deverá ser exibida

  @SanityTesting
  Scenario: Validar statusCode e feedback ao tentar cadastrar um Telefone já existente
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST com CPF nunca cadastrado porém com telefone já cadastrado
    Then O StatusCode retornado deverá ser 400
    And A mensagem de erro "Já existe pessoa cadastrada com o Telefone (11)985388877" deverá ser exibida

  @NegativeTesting
  Scenario: Validar o cadastro de um novo cliente com header da request incompleto
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST porém sem content-type no header
    Then O StatusCode retornado deverá ser 415

  @NegativeTesting
  Scenario: Validar o cadastro de um novo cliente sem enviar o corpo da request
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST porém com corpo da request em branco
    Then O StatusCode retornado deverá ser 400

  @NegativeTesting
  Scenario: Validar o cadastro de um novo cliente com o corpo da request incompleto
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST porém com corpo da request inválido
    Then O StatusCode retornado deverá ser 400
    And A mensagem de erro "O corpo da Request está fora do padrão" deverá ser exibida

  @NegativeTesting
  Scenario: Validar o cadastro de um novo cliente com nome de campos errados no corpo do request
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST porém com nomes de campos errados no corpo
    Then O StatusCode retornado deverá ser 400
    And A mensagem de erro "O corpo da Request está fora do padrão" deverá ser exibida

  @NegativeTesting
  Scenario: Validar o cadastro de um novo cliente utilizando um endpoint incorreto
    Given Que eu aponte o endpoint /pessoa
     When Eu adicionar um cliente usando metodo POST
    Then O StatusCode retornado deverá ser 404

  @NegativeTesting
  Scenario: Validar o cadastro de um novo cliente com tipagem errada dos campos no corpo do request
    Given Que o endpoint /pessoas esteja disponivel
    When Eu adicionar um cliente usando metodo POST porém com tipagem errada dos campos no corpo do request
    Then O StatusCode retornado deverá ser 400
    And A mensagem de erro "O corpo da Request está fora do padrão" deverá ser exibida


