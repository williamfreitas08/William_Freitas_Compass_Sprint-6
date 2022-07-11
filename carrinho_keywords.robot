*** Settings ***
Documentation       Keywords e Variaveis para Ações do endpoint carrinhos
Library             RequestsLibrary

*** Variables ***
${token_auth}            

*** Keywords ***
GET Endpoint /carrinhos
    ${response}             Get On Session      serverest       /carrinhos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}


POST Endpoint /carrinhos
    &{header}                   Create Dictionary       Authorization=${token_auth}
    &{payload}                  Create Dictionary       idProduto=YaeJ455lz3k6kSIzA      quantidade=4
    ${response}                 POST On Session         serverest       /carrinhos      data=&{payload}      headers=&{header}            
    Log to Console              Response: ${response.content}
    Set Global Variable         ${response}

Criar Um Carrinho e Armazenar ID
    POST Endpoint /carrinhos
    ${id_produto}               Set Variable               ${response.json()["_id"]}
    Log To Console              ID Produto: ${id_produto}
    Set Global Variable         ${id_produto}