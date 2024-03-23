*** Settings ***
Resource   ../../resources/main.robot
Test Setup       Abrir o Navegador
Test Teardown    Fechar o Navegador

*** Test Cases ***
Test Case - Realizar o login no site com o standarduser e apos isso verificar o logout do mesmo se esta funcionando corretamente
    Dado que eu preencha o formulario    ${Users[0]}
    Clicar no botao e Realizar Login
    Verifica se foi Exibido a pagina principal
    Clicar no menu e Realizar o Logout

Test Case - Realizar o Login com todos os usuários disponíveis
    Dado que eu preencha as informações Logar com todos os usuarios

Test Case - Verificar se ao realizar o login com o usuário inválido o mesmo vai deixar visivel a mensagem de erro e bloquear o login
    Dado que eu preencha o formulario   ${Lock_user}
    Clicar no botao e Realizar Login