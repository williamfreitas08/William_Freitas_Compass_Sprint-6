*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Resource            ./fixtures/dynamics.robot
Resource            ./variaveis/serverest_variaveis.robot
Resource            ./common/common.robot



#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
  Create Session          serverest           ${BASE_URI}
