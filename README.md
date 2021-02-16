# Objetivo
Avaliação de Conhecimentos em Automação de Testes de APIRest Utilizando Java, Cucumber, Junit e RestAssured.

# Sobre os testes
Neste repositório você encontrará o projeto que criei utilizando Cucumber-Java, JUnit e RestAssured.
Foram criados duas features no Cucumber de acordo com o desafio proposto e com seus respectivos cenários de testes aplicáveis que juguei ser os mais importantes.

* Continuidade de Fluxos
*	Tipagem de Dados
* Passagem de Parâmetros:
  *	Corpo (body)
  * Filtros (na URI)
  * Path
  * Header
* Validação de Métodos
*	Estrutura da Resposta
* Código dos estados HTTP

# Para rodar os testes

* Dê um fork neste projeto da API: 
<a>https://github.com/MKappo/Brasilprev-qa-test-master<a>
* Instale as dependências 
```shell
mvn clean install
```
* Executar o projeto 
```shell
  * mvn spring-boot:run
```
* Dê um fork do projeto de testes: https://github.com/MKappo/TestesAutomatizadosBrasilPrev
* Importe no IntelliJ, Eclipse ou IDE de preferência
* Com a API rodando local basta executar os testes através da classe TestRunner.

Obs: O projeto foi configurado para gerar um test report após execução, bastar abrir o arquivo:
//
/target/cucumber-reports/cucumber.html
