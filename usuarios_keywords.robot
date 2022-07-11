*** Settings ***
Documentation       Keywords e Variáveis para Ações do enpoint de usuarios
Resource            ./common.robot
Library             RequestsLibrary

*** Variables ***
${nome_do_usuario}          erbert rjjichards
${senha_do_usuario}         teste123
${email_do_usuario}         testesteste@gmail.com
${_id}                      0uxuPY0cbmQhpEz1

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
    Create Session          serverest           http://localhost:3000

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}
    Log to Console          Response: ${response.content}

POST Endpoint /usuarios
    &{payload}              Create Dictionary        nome=${nome_do_usuario}         email=${email_do_usuario}        password=${senha_do_usuario}          administrador=true
    ${response}             POST On Session          serverest        /usuarios       data=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}              Create Dictionary       nome=adelma oliveira    email=adelma@gmail.com     password=132345      administrador=true
    ${response}             PUT On Session          serverest           /usuarios/zfCCAA8lBwGVEAhU       data=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Buscar /usuarios/_id
    ${response}             GET On Session         serverest    /usuarios/0uxuPY0cbmQhpEz1   
    ${_id_usuarios}         Set Variable               ${response.json()["_id"]}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response} 

DELETE Endpoint /usuarios 
    ${response}             DELETE On Session          serverest           /usuarios/lDrnxfsSLmM2bJaY 
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}    ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain          ${response.json()["message"]}       ${palavra}

Printar Conteudo Response
    Log To Console      Response: ${response.json()["usuarios"][0]["nome"]}

Criar Usuario Estatico Valido
    ${json}            Importar JSON Estatico           json_usuario_ex.json
    ${payload}         Set Variable         ${json["user_valido"]}
    Set Global Variable        ${payload}
    POST Endpoint /usuarios