package steps;

import io.cucumber.java.en.*;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.Assert;

import static io.restassured.RestAssured.*;


public class StepDefinitions {

    private String path;
    private Response response;

    //Body Segundo Especificação
    private final String validRequest = "{\n" +
            "    \"codigo\": 1,\n" +
            "    \"nome\": \"Rommel Von\",\n" +
            "    \"cpf\": \"12345678909\",\n" +
            "    \"enderecos\": [\n" +
            "        {\n" +
            "            \"logradouro\": \"Rua Alexandre Dumas\",\n" +
            "            \"numero\": 123,\n" +
            "            \"complemento\": \"Empresa\",\n" +
            "            \"bairro\": \"Chacara Santo Antonio\",\n" +
            "            \"cidade\": \"São Paulo\",\n" +
            "            \"estado\": \"SP\"\n" +
            "        }\n" +
            "    ],\n" +
            "    \"telefones\": [\n" +
            "        {\n" +
            "            \"ddd\": \"11\",\n" +
            "            \"numero\": \"985388877\"\n" +
            "        }\n" +
            "    ]\n" +
            "}";

    @Given("Eu tenha acesso ao endpoint {word}")
    public void setUp(String endpoint) {
        RestAssured.baseURI = "http://localhost:8080";
        path = endpoint;
    }

    @Given("Eu acesse um endpoint invalido como {word}")
    public void setUpPathIncorreto(String endpoint) {
        RestAssured.baseURI = "http://localhost:8080";
        path = endpoint;
    }

    @When("Eu adicionar um cliente usando metodo POST")
    public void cadastrarNovoCliente() {
        response =
                given()
                    .contentType(ContentType.JSON)
                    .body(validRequest)
                .when()
                    .post(path)
                .then()
                    .extract().response();
    }

    @Then("Eu devo verificar que o HTTP StatusCode retornado é {int}")
    public void validarStatusCode(int codigo) {
        Assert.assertEquals(codigo, response.getStatusCode());
    }

    @And("Eu devo ver que o corpo de resposta retornado esta dentro do especificado")
    public void validarCadastroDeNovoCliente() {
        String codigoCliente = response.jsonPath().get("codigo").toString();
        String nome = response.jsonPath().get("nome");
        String cpf = response.jsonPath().get("cpf");
        String codigoEnderecos = response.jsonPath().get("enderecos[0].codigo").toString();
        String logradouro = response.jsonPath().get("enderecos[0].logradouro");
        String numeroEndereco = response.jsonPath().get("enderecos[0].numero").toString();
        String complemento = response.jsonPath().get("enderecos[0].complemento");
        String bairro = response.jsonPath().get("enderecos[0].bairro");
        String cidade = response.jsonPath().get("enderecos[0].cidade");
        String estado = response.jsonPath().get("enderecos[0].estado");
        String codigoTelefones = response.jsonPath().get("telefones[0].codigo").toString();
        String ddd = response.jsonPath().get("telefones[0].ddd");
        String telefone = response.jsonPath().get("telefones[0].numero");

        Assert.assertEquals("1", codigoCliente);
        Assert.assertEquals("Rommel Von", nome);
        Assert.assertEquals("12345678909", cpf);
        Assert.assertEquals("1", codigoEnderecos);
        Assert.assertEquals("Rua Alexandre Dumas", logradouro);
        Assert.assertEquals("123", numeroEndereco);
        Assert.assertEquals("Empresa", complemento);
        Assert.assertEquals("Chacara Santo Antonio", bairro);
        Assert.assertEquals("São Paulo", cidade);
        Assert.assertEquals("SP", estado);
        Assert.assertEquals("1", codigoTelefones);
        Assert.assertEquals("11", ddd);
        Assert.assertEquals("985388877", telefone);
    }

    @And("Eu devo ver a mensagem de erro {string}")
    public void validarMensagemDeErro(String mensagem) {
        String mensagemDeErro = response.jsonPath().get("erro");

        Assert.assertEquals(mensagem, mensagemDeErro);
    }

    @When("Eu adicionar um cliente usando metodo POST com CPF nunca cadastrado porém com telefone já cadastrado")
    public void cadastrarNovoClienteComTelefoneJaCadastrado() {
        String telefoneJaCadastradoRequest = "{\n" +
                "    \"codigo\": 1,\n" +
                "    \"nome\": \"Rommel Von\",\n" +
                "    \"cpf\": \"32568524722\",\n" +
                "    \"enderecos\": [\n" +
                "        {\n" +
                "            \"logradouro\": \"Rua Alexandre Dumas\",\n" +
                "            \"numero\": 123,\n" +
                "            \"complemento\": \"Empresa\",\n" +
                "            \"bairro\": \"Chacara Santo Antonio\",\n" +
                "            \"cidade\": \"São Paulo\",\n" +
                "            \"estado\": \"SP\"\n" +
                "        }\n" +
                "    ],\n" +
                "    \"telefones\": [\n" +
                "        {\n" +
                "            \"ddd\": \"11\",\n" +
                "            \"numero\": \"985388877\"\n" +
                "        }\n" +
                "    ]\n" +
                "}";

        response =
                given()
                    .contentType(ContentType.JSON)
                    .body(telefoneJaCadastradoRequest)
                .when()
                    .post(path)
                .then()
                     .extract().response();
    }

    @When("Eu adicionar um cliente usando metodo POST porém com corpo da request inválido")
    public void cadastrarNovoClienteComCorpoDaRequestInvalido() {
        // Body em desacordo com especificação, sem o campo "cpf"
        String invalidRequest = "{\n" +
                "    \"codigo\": 1,\n" +
                "    \"nome\": \"Marcelo Capobianco\",\n" +
                "    \"enderecos\": [\n" +
                "        {\n" +
                "            \"logradouro\": \"Rua Libero Badaró\",\n" +
                "            \"numero\": 21,\n" +
                "            \"bairro\": \"Centro\",\n" +
                "            \"cidade\": \"São Paulo\",\n" +
                "            \"estado\": \"SP\"\n" +
                "        }\n" +
                "    ],\n" +
                "    \"telefones\": [\n" +
                "        {\n" +
                "            \"ddd\": \"11\",\n" +
                "            \"numero\": \"985652563\"\n" +
                "        }\n" +
                "    ]\n" +
                "}";
        response =
                given()
                    .contentType(ContentType.JSON)
                    .body(invalidRequest)
                .when()
                    .post(path)
                .then()
                    .extract().response();
    }

    @When("Eu adicionar um cliente usando metodo POST porém com corpo da request em branco")
    public void cadastrarNovoClienteComCorpoDaRequestEmBranco() {
        response =
                given()
                    .contentType(ContentType.JSON)
                    .body("")
                .when()
                    .post(path)
                .then()
                    .extract().response();
    }

    @When("Eu adicionar um cliente usando metodo POST porém sem content-type no header")
    public void cadastrarNovoClienteSemContentTypeNoHeader() {
        response =
                given()
                   .body(validRequest)
                .when()
                   .post(path)
                .then()
                   .extract().response();
    }

    @When("Eu adicionar um cliente usando metodo POST porém com nomes de campos errados no corpo")
    public void cadastrarNovoClienteComNomesDeCamposErradosNoCorpo() {
        //Body com nome dos campos diferentes do especificado
        String camposIncorretosRequest = "{\n" +
                "    \"codigos\": 1,\n" +
                "    \"nomes\": \"Rommel Von\",\n" +
                "    \"cpf\": \"95125875365\",\n" +
                "    \"enderecos\": [\n" +
                "        {\n" +
                "            \"logradouro\": \"Rua Alexandre Dumas\",\n" +
                "            \"numero\": 123,\n" +
                "            \"complemento\": \"Empresa\",\n" +
                "            \"bairro\": \"Chacara Santo Antonio\",\n" +
                "            \"cidade\": \"São Paulo\",\n" +
                "            \"estado\": \"SP\"\n" +
                "        }\n" +
                "    ],\n" +
                "    \"telefone\": [\n" +
                "        {\n" +
                "            \"ddd\": \"11\",\n" +
                "            \"numero\": \"955682436\"\n" +
                "        }\n" +
                "    ]\n" +
                "}";
        response =
                given()
                    .contentType(ContentType.JSON)
                    .body(camposIncorretosRequest)
                .when()
                    .post(path)
                .then()
                    .extract().response();
    }

    @When("Eu adicionar um cliente usando metodo POST porém com tipagem errada dos campos no corpo do request")
    public void cadastrarNovoClienteUtilizandoTipagemErradaNoCampoDoRequest() {
        //Utilizando tipagens diferentes do especificado em diversos campos do body
        String tipagemErradaDosCamposRequest = "{\n" +
                "    \"codigo\": \"1\",\n" +
                "    \"nome\": 321456465,\n" +
                "    \"cpf\": 68425715965,\n" +
                "    \"enderecos\": [\n" +
                "        {\n" +
                "            \"logradouro\": 2562258,\n" +
                "            \"numero\": \"123\",\n" +
                "            \"complemento\": 789456,\n" +
                "            \"bairro\": 321546,\n" +
                "            \"cidade\": 5465465,\n" +
                "            \"estado\": \"SP\"\n" +
                "        }\n" +
                "    ],\n" +
                "    \"telefones\": [\n" +
                "        {\n" +
                "            \"ddd\": 11,\n" +
                "            \"numero\": 975698457\n" +
                "        }\n" +
                "    ]\n" +
                "}";
        response =
                given()
                    .contentType(ContentType.JSON)
                    .body(tipagemErradaDosCamposRequest)
                .when()
                     .post(path)
                .then()
                     .extract().response();
    }

    @When("Eu fizer uma pesquisa usando metodo GET informando DDD {string} e o numero {string}")
    public void pesquisarUsuarioPorDDDeNumero(String DDD, String numero) {
        response =
                when()
                    .get(path + "/" + DDD + "/" + numero)
                .then()
                    .contentType(ContentType.JSON)
                    .extract().response();
    }
}



