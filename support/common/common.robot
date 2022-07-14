*** Settings ***
Documentation             Keywords e Variaveis para Ações Gerais
Library                   OperatingSystem



*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}

Validar Se Mensagem Contem "${palavra}"
    Should Contain          ${response.json()["message"]}       ${palavra}

Importar JSON Estatico
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File        ${EXECDIR}/support/fixtures/static/${nome_arquivo}
    ${data}         Evaluate        json.loads('''${arquivo}''')        json
    [return]        ${data}

