# Objetivo
Avaliação de Conhecimentos em Automação de Testes de APIRest Utilizando Java, Cucumber, Junit e RestAssured.

# Sobre os testes
Neste repositório você encontrará o projeto que criei utilizando __Cucumber-Java__, __JUnit__,__RestAssured__ e __TestNG__.
Eu criei duas features no Cucumber de acordo com o desafio proposto e com seus respectivos cenários de testes aplicáveis utilizando uma abordagem de testes que podesse cobrir tudo que envolve testes de API, como:

* Continuidade de Fluxos
*	Tipagem de Dados
* Passagem de Parâmetros:
  *	Corpo (body)
  * Filtros (na URI)
  * Path
  * Header
* Validação de Métodos
*	Estrutura da Resposta (Contrato)
* Código dos estados HTTP

Durante a criação do projeto também utilizei o POSTMAN como ponto de partida para testar manualmente e verificar os cenários que eu planejei estavam aderentes e também para descobrir como a API se comportava em algumas situações.

# Para rodar os testes

* Dê um fork neste projeto da <a href="https://github.com/MKappo/Brasilprev-qa-test-master">API</a> 
* Executar o projeto 
```shell
mvn clean install
```
```shell
mvn spring-boot:run
```
* Dê um fork do projeto de testes: <a href="https://github.com/MKappo/TestesAutomatizadosBrasilPrev">TestesAutomatizadosBrasilPrev</a>
* Importe no IntelliJ, Eclipse ou IDE de preferência
* Com a API rodando local basta executar os testes através da classe TestRunner.

__Obs__: O projeto foi configurado para gerar um test report após execução, bastar abrir o arquivo:
```shell
/target/cucumber-reports/cucumber.html
```
