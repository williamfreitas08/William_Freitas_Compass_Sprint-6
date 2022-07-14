*** Settings ***
Documentation             Keywords e Variaveis para Ações do endpoint produtos

Resource                  ../support/base.robot

*** Keywords ***
GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Set Global Variable     ${response}
    Log to Console          Response: ${response.content}

GET Buscar /produtos/_id
    ${response}             GET On Session         serverest    /produtos/BeeJh5lz3k6kSIzA   
    ${_id_usuarios}         Set Variable               ${response.json()["_id"]}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response} 

POST Endpoint /produtos
    &{header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 POST On Session         serverest       /produtos/      json=&{payload}      headers=&{header}            
    Log to Console              Response: ${response.content}
    Set Global Variable         ${response}

DELETE Endpoint /produtos
    &{header}                   Create Dictionary       Authorization=${token_auth}
    ${response}                 DELETE On Session         serverest       /produtos/${id_produto}        headers=&{header}  
    Log to Console              Response: ${response.content}
    Set Global Variable         ${response}

PUT Endpoint /produtos/_id
    &{header}               Create Dictionary        Authorization=${token_auth}
    ${response}             PUT On Session           serverest           /produtos/${id_produto}          json=&{payload}      headers=&{header} 
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Ter Criado Produto
    Should be Equal             ${response.json()["message"]}              Cadastro realizado com sucesso
    Should Not Be Empty         ${response.json()["_id"]}

Validar Quantidade Produto "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}    ${quantidade}

Criar Um Produto e Armazenar ID
    Criar Produto
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}               Set Variable               ${response.json()["_id"]}
    Log To Console              ID Produto: ${id_produto}
    Set Global Variable         ${id_produto}



