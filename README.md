# Challenge da Sprint 6 <img src="https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png" width="120" height="120"/>

## Sobre o Projeto
O presente repositório foi utilizado para a realização de teste automatizados para a API ServeRest referente a Sprint 5 do Programa de Bolsa da Compass.UOL. Foram automatizados os Endpoints abaixo:
- `Login` - Método: POST;
- `Usuários` - Métodos: GET, POST, DELETE, PUT;
- `Produtos` - Métodos: GET, POST, DELETE, PUT;
- `Carrinhos`- Métodos: GET, POST, DELETE.

### Instalação
- Instalar o Python
- Instalar o driver do navegador e adicionar ao path nas variáveis de ambiente do sistema
- Instalar as dependências do Robot Framework: python -m pip install -r requirements.txt

### Tecnologias Utilizadas
- Python
- Robot Framework <img src="https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png" width="15" height="15"/>
- Bibliotecas:
  - BuiltIn
  - RequestsLibrary
  - FakerLibrary
  - JSONLibrary  

### Instalação Localmente da ServeRest com NPM
   Realizar a execução do seguinte comando no terminal:
   `npx serverest@latest`
   
 ### Execução dos Testes
 - Executar no terminal: robot -d ./reports ./tests/produtos_tests.robot
   
### Ferramentas
- RobotFramework <img src="https://miro.medium.com/max/553/1*wnMQPTmEsIq0TiRgfX4hig.png" width="80" height="40"/>
- VScode <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg"  width="15" height="15"/>      
- GitHub <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original-wordmark.svg" width="15" height="15"/>
- Git <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original-wordmark.svg" width="25" height="25"/>  

### Resultado dos testes
  - Acessar o arquivo log.html na pasta reports

#### Autor:
#### William Freitas Marinho

<div> 
  <a href = "williamfreitas39@gmail.com"><img src="https://img.shields.io/badge/-Gmail-%23333?style=for-the-badge&logo=gmail&logoColor=white" target="_blank"></a>
  <a href="https://www.linkedin.com/in/william-freitas-marinho/" target="_blank"><img src="https://img.shields.io/badge/-LinkedIn-%230077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank"](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white></a>  
</div>

### License

<img src = "https://img.shields.io/apm/l/modo">
