*** Settings ***
Documentation       Arquivo de Testes para o Endpoint /login

Resource            ../keywords/login_keywords.robot

Suite Setup         Criar Sessao

*** Test Cases ***
### ENDPOINT/login ###
Cenario: POST Realizar Login 200
    [Tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Realizar Login email já cadastrado 400
    [Tags]      POSTLOGINVALIDO
    Criar Sessao
    POST Endpoint /logininvalido
    Validar Status Code "400"
    Informar ocorrencia ERRO