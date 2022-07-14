*** Settings ***
Documentation       Keywords e Variáveis para Ações do enpoint de usuarios
Resource            ../support/base.robot


#Sessão para criação de Keywords Personalizadas
*** Keywords ***

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}
    Log to Console          Response: ${response.content}

POST Endpoint /usuarios
    ${response}             POST On Session          serverest        /usuarios       data=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${response}             PUT On Session          serverest           /usuarios/${response.json()["_id"]}       json=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Buscar /usuarios/_id
    ${response}             GET On Session         serverest    /usuarios/0uxuPY0cbmQhpEz1   
    ${_id_usuarios}         Set Variable               ${response.json()["_id"]}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response} 

DELETE Endpoint /usuarios 
    ${response}             DELETE On Session          serverest           /usuarios/${response.json()["_id"]} 
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}    ${quantidade}

Pegar Dados Usuario Estatico Valido
    ${json}            Importar JSON Estatico           json_usuario_ex.json
    ${payload}         Set Variable                     ${json["user_valido"]}
    Set Global Variable        ${payload}