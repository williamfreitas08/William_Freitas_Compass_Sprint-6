* Test Cases *
Cenário: GET todos os Usuarios 200
    GET Endpoint /usuarios
    Validar Todos os Usuarios na Response
    Validar Status Code "200"

Cenário: GET Usuario Especifico 200
    GET Endpoint /usuarios com id "/GGTtwearsdw223"
    Validar o Usuario com id "/GGTtwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Nome =  Fulano da Silva"

Cenario: POST Criar Novo Usuarios 201
    Criar Usuário Dinâmico
    POST Usuarios Dinâmico no Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenario: PUT Editar Usuario Existente 200
    PUT Editar Usuário com id "/GGTtwearsdw223" usando Dados Dinâmicos
    Validar Status Code "200"
    Validar mensagem "Registro alterado com sucesso"

Cenario: DELETE Usuário Existente
    DELETE Usuário Especifico com id "/GGTtwearsdw223"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso | Nenhum registro excluído"