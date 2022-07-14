*** Settings ***
Documentation       Keywords e Variaveis para Ações do endpoint carrinhos
Resource            ../support/base.robot
         

*** Keywords ***
GET Endpoint /carrinhos
    ${response}             Get On Session      serverest       /carrinhos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Buscar Carrinho Por ID
    ${response}             Get On Session      serverest       /carrinhos/qbMqntef4iTOwWfg
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    Criando Carrinho
    &{header}               Create Dictionary           Authorization=${token_auth}         Content-Type=application/json
    ${response}             POST on Session      serverest       /carrinhos     json=&{payload}      headers=${header}      expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}               Create Dictionary           Authorization=${token_auth}         Content-Type=application/json
    ${response}             DELETE on Session      serverest       /carrinhos/cancelar-compra      headers=${header}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}               Create Dictionary           Authorization=${token_auth}         Content-Type=application/json
    ${response}             DELETE on Session      serverest       /carrinhos/concluir-compra      headers=${header}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}
    
#aprendir com o joão
Criando Carrinho
    ${json}                     Importar JSON Estatico              json_carrinho.json
    ${payload}                  Set Variable                        ${json}
    Set Global Variable         ${payload}