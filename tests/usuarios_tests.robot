*** Settings ***
Documentation       Arquivo de Testes para o Endpoint/usuarios
Resource            ../keywords/usuarios_keywords.robot

Suite Setup          Criar Sessao


*** Test Cases ***

### ENDPOINT/usuarios ###
Cenario: GET Todos os usuarios 200
    [Tags]      GET
    GET Endpoint /usuarios
    Validar Status Code "200"
    
Cenario: POST Cadastrar usuario 201
    [Tags]      POST
    Criar Dados Usuario Valido
    POST Endpoint/usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: GET Buscar /usuarios/_id
    [Tags]      GETUSUARIOID
    GET Buscar /usuarios/_id
    Validar Status Code "200"

Cenario: PUT Editar usuario 200
    [Tags]      PUT
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE Deletar usuario 200
    [Tags]      DELETE
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Criar Usuario de Massa Estatico 201
    [Tags]      POSTCRIARUSUARIOESTATICO
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: POST Criar Usuario De Massa Dinamica 201
    [Tags]       POSTCRIARUSUARIODINAMICO
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
