*** Settings ***
Resource    ../main.robot

*** Variables ***
${button_Add}           id:add-to-cart-sauce-labs-backpack
${cart_icon}            class:shopping_cart_link
${cart_item}            class:cart_item
${cart_badge}           class:shopping_cart_badge
${continue-shopping}    id:continue-shopping
${button-remove}        id:remove-sauce-labs-backpack
${checkout_btn}         id:checkout
${fisrt_name}           id:first-name
${last_name}            id:last-name
${postal_code}          id:postal-code  
${button-continue}      id:continue
${finish-shop}          id:finish
${message-checkout}     id:checkout_complete_container
${return-products}      id:back-to-products
${container-items}      id:inventory_container


*** Keywords ***
Clicar no botao e adicionar um item ao carrinho
    Click Element    ${button_Add}
    Sleep   1s
    Click Element    ${cart_icon}
    Sleep   2s
    Element Should Be Visible    ${cart_badge}
    Element Should Be Visible    ${cart_item}
    Click Element    ${continue-shopping}
    Sleep  1s

Clicar no botao e remover um item do carrinho
    Click Element    ${button_Add}
    Click Element    ${cart_icon}
    Sleep    1s
    Click Element    ${button-remove}
    Sleep    1s
Verificar se o item foi removido e retorna a pagina principal
    Element Should Not Be Visible  ${cart_badge}
    Element Should Not Be Visible  ${cart_item}
    Sleep  1s
    Click Element    ${continue-shopping}

Clicar no botao de Checkout
    Element Should Be Visible     ${cart_icon}
    Click Element                ${cart_icon}
    Element Should Be Visible    ${checkout_btn}     Elemento Visivel
    Click Element                ${checkout_btn}
    Sleep    2s

Preencher as informacoes de Checkout
    Input Text       ${fisrt_name}    standard
    Input Text       ${last_name}     user
    Input Text       ${postal_code}   1234567
    Sleep    1s
    Click Element    ${button-continue}
    Sleep    1s

Verificar se foi exibido a compra e finalizar
    Element Should Be Visible    ${cart_item}
    Sleep    1s
    Click Element    ${finish-shop}
    Sleep    1s

Mensagem de compra finalizada com sucesso e voltar a pagina principal
    Element Should Be Visible    ${message-checkout}  messagem exibida com sucesso
    Sleep  1s
    Click Element    ${return-products}
    Sleep   1s
    Element Should Be Visible    ${container-items}
    Sleep    1s
