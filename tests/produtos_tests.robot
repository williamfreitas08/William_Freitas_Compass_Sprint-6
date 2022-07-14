*** Settings ***
Documentation       Arquivo de Testes para o Endpoint /produtos

Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

*** Test Cases ***
### ENPOINT/produtos ###
Cenario: GET Todos os produtos 200
    [Tags]      GETPRODUTO
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"
    Validar Quantidade Produto "${7}"

Cenario: GET Buscar /usuarios/_id
    [Tags]      GETPRODUTOID
    Criar Sessao
    GET Buscar /produtos/_id
    Validar Status Code "200"

Cenario: POST Criar Produto 201
    [Tags]       POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [Tags]      DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: PUT Editar produto/_id
    [Tags]      PUTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos/_id
    Validar Status Code "201"