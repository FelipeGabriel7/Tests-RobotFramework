*** Settings ***
Resource    ../main.robot

*** Variables ***
${password_users}    secret_sauce
${INPUT_USER}        id:user-name
${PASSOWORD_USER}    id:password
${BUTTON_LOGIN}      id:login-button
${SHOP}              id:inventory_container
${BUTTON_MENU}       id:react-burger-menu-btn
${LOGOUT}            id:logout_sidebar_link
${Lock_user}         locked_out_user
${message_error}     class:error-message-container
@{Users}
...    standard_user
...    problem_user
...    performance_glitch_user
...    visual_user
...    error_user


*** Keywords ***
Dado que eu preencha o formulario
    [Arguments]      ${username}    
    Input Text      ${INPUT_USER}        ${username}  
    Input Text      ${PASSOWORD_USER}    ${password_users}
    Sleep   2s

Clicar no botao e Realizar Login
    Click Element    ${BUTTON_LOGIN}
    Sleep   1s

Verifica se foi Exibido a pagina principal
    Element Should Be Visible    ${SHOP}
    Sleep    1s

Clicar no menu e Realizar o Logout
    Click Element    ${BUTTON_MENU}
    Sleep    2s
    Click Element    ${LOGOUT}
    Sleep    2s

Dado que eu preencha as informações Logar com todos os usuarios
    FOR    ${index}    IN RANGE    0    ${Users.__len__()} 
        Dado que eu preencha o formulario    ${Users[${index}]}
        Clicar no botao e Realizar Login
        Verifica se foi Exibido a pagina principal
        Clicar no menu e Realizar o Logout   
    END

Verificar se a mensagem de erro será exibida
    Element Should Be Visible    ${message_error}    messagem de erro exibida
    Sleep    5s