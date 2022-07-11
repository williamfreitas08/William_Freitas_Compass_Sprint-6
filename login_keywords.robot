*** Settings ***
Documentation       Keywords e Variaveis para Ações do endpoint login
Library             RequestsLibrary

*** Variables ***
${email_para_login}            fulano@qa.com
${password_para_login}         teste

*** Keywords ***
POST Endpoint /login
    &{payload}                  Create Dictionary           email=${email_para_login}      password=${password_para_login}    
    ${response}                 POST On Session            serverest       /login     data=&{payload}
    Log to Console              Response: ${response.content}
    Set Global Variable         ${response}

POST Endpoint /logininvalido
    &{payload}              Create Dictionary       password=${password_para_login}
    ${response}             POST on Session         serverest        /login             data=&{payload}       expected_status= 400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Informar ocorrencia ERRO
    Log To Console            Atencao! Campos Não Informados: ${response.json()["email"]}

Validar Ter Logado
    Should be Equal             ${response.json()["message"]}           Login realizado com sucesso
    Should Not Be Empty         ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}             Set Variable             ${response.json()["authorization"]}
    Log To Console            Token Salvo: ${token_auth}
    Set Global Variable       ${token_auth}

