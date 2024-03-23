*** Settings ***
Resource    ../main.robot

*** Variables ***
${Browser}    Chrome
${URL}        https://www.saucedemo.com/


*** Keywords ***
Abrir o Navegador
    Open Browser    url=${URL}    browser=${Browser}

Fechar o Navegador
    Sleep    5s
    Close Browser
