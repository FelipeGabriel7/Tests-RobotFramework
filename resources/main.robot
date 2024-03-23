*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Resource    ./pages/login_formulario.robot
Resource    ./pages/carrinho.robot
Resource    ./shared/setup_teardown.robot