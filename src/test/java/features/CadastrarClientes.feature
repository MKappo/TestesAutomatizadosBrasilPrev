@FullTesting
Feature: Cadastrar Novos Clientes

  @SmokeTesting
  Scenario: Cadastrar um novo cliente
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST
    Then Eu devo verificar que o HTTP StatusCode retornado é 201
    And Eu devo ver que o corpo de resposta retornado esta dentro do especificado

  @NegativeTesting
  Scenario: Cadastrar cliente utilizando um CPF já cadastrado
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST
    Then Eu devo verificar que o HTTP StatusCode retornado é 400
    And Eu devo ver a mensagem de erro "Já existe pessoa cadastrada com o CPF 12345678909"

  @NegativeTesting
  Scenario: Cadastrar cliente utilizando um Telefone já cadastrado
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST com CPF nunca cadastrado porém com telefone já cadastrado
    Then Eu devo verificar que o HTTP StatusCode retornado é 400
    And Eu devo ver a mensagem de erro "Já existe pessoa cadastrada com o Telefone (11)985388877"

  @NegativeTesting
  Scenario: Cadastrar um novo cliente com header da request incompleto
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST porém sem content-type no header
    Then Eu devo verificar que o HTTP StatusCode retornado é 415

  @NegativeTesting
  Scenario: Cadastrar um novo cliente sem enviar o corpo obrigatório da request
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST porém com corpo da request em branco
    Then Eu devo verificar que o HTTP StatusCode retornado é 400

  @NegativeTesting
  Scenario: Cadastrar um novo cliente com o corpo obigatório da request incompleto
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST porém com corpo da request inválido
    Then Eu devo verificar que o HTTP StatusCode retornado é 400
    And Eu devo ver a mensagem de erro "O corpo da Request está fora do padrão"

  @NegativeTesting
  Scenario: Cadastrar um novo cliente com nome de campos errados no corpo do request
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST porém com nomes de campos errados no corpo
    Then Eu devo verificar que o HTTP StatusCode retornado é 400
    And Eu devo ver a mensagem de erro "O corpo da Request está fora do padrão"

  @NegativeTesting
  Scenario: Cadastrar um novo cliente utilizando um endpoint incorreto
    Given Eu acesse um endpoint invalido como /pessoa
     When Eu adicionar um cliente usando metodo POST
    Then Eu devo verificar que o HTTP StatusCode retornado é 404

  @NegativeTesting
  Scenario: Cadastrar um novo cliente com tipagem errada dos campos no corpo do request
    Given Eu tenha acesso ao endpoint /pessoas
    When Eu adicionar um cliente usando metodo POST porém com tipagem errada dos campos no corpo do request
    Then Eu devo verificar que o HTTP StatusCode retornado é 400
    And Eu devo ver a mensagem de erro "O corpo da Request está fora do padrão"


