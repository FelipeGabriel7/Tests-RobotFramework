*** Settings ***
Resource       ../../resources/main.robot
Test Setup       Abrir o Navegador
Test Teardown    Fechar o Navegador

*** Test Cases ***
Test Case - Realizar o Login e inserir um item no carrinho
    Dado que eu preencha o formulario    ${Users[0]}
    Clicar no botao e Realizar Login
    Verifica se foi Exibido a pagina principal
    Clicar no botao e adicionar um item ao carrinho

Test Case - Remover um item do carrinho
    Dado que eu preencha o formulario    ${Users[0]}
    Clicar no botao e Realizar Login
    Verifica se foi Exibido a pagina principal
    Clicar no botao e remover um item do carrinho
    Verificar se o item foi removido e retorna a pagina principal

Test Case - Adicionar um item no carrinho e realizar o checkout
    Dado que eu preencha o formulario    ${Users[0]}
    Clicar no botao e Realizar Login
    Verifica se foi Exibido a pagina principal
    Clicar no botao e adicionar um item ao carrinho
    Clicar no botao de Checkout
    Preencher as informacoes de Checkout
    Verificar se foi exibido a compra e finalizar
    Mensagem de compra finalizada com sucesso e voltar a pagina principal