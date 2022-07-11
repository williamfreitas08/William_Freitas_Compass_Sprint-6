*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot
Resource            ./carrinho_keywords.robot

#Sessão para criação dos cenários de teste
*** Test Cases ***

### ENPOINT/login ###
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

### ENPOINT/usuarios ###
Cenario: GET Todos os usuarios 200
    [Tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${2}"
    Printar Conteudo Response
    
Cenario: POST Cadastrar usuario 201
    [Tags]      POST
    Criar Sessao
    POST Endpoint/usuarios
    Validar Status Code "201"

Cenario: GET Buscar /usuarios/_id
    [Tags]      GETUSUARIOID
    Criar Sessao
    GET Buscar /usuarios/_id
    Validar Status Code "200"

Cenario: PUT Editar usuario 200
    [Tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE Deletar usuario 200
    [Tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

### ENPOINT/produtos ###
Cenario: GET Todos os produtos 200
    [Tags]      GETPRODUTO
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"
    Validar Quantidade Produto "${3}"

Cenario: GET Buscar /usuarios/_id
    [Tags]      GETPRODUTOID
    Criar Sessao
    GET Buscar /produtos/_id
    Validar Status Code "200"

Cenario: POST Criar Produto 201
    [Tags]       POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
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

Cenario: POST Criar Usuario de Massa Estatico 201
    [Tags]      POSTCRIARUSUARIOESTATICO
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

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


#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
    Create Session          serverest           http://localhost:3000
