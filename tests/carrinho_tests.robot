*** Settings ***
Documentation       Arquivo de Testes para o Endpoint /carrinho

Resource            ../keywords/carrinho_keywords.robot

Suite Setup         Criar Sessao

*** Test Cases ***
### ENPOINT/carrinhos ###
Cenario: GET Buscar carrinhos
    [tags]      BUSCARCARRINHOS
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: POST Criar Carrinhos 201
    [Tags]       POSTCARRINHO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "201"