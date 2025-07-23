*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login, adicionar produtos, remover e finalizar pedido
        Open Browser    https://www.saucedemo.com/    chrome    options=add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False})
    Input Text    id=user-name    standard_user
    Input Text    id=password    secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-bike-light    10s
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-bolt-t-shirt    10s
    Click Button    id=add-to-cart-sauce-labs-bolt-t-shirt
    Wait Until Element Is Visible    class=shopping_cart_link    10s
    Click Element    class=shopping_cart_link
    Wait Until Element Is Visible    id=remove-sauce-labs-bike-light    10s
    Click Button    id=remove-sauce-labs-bike-light
    Wait Until Element Is Visible    id=checkout    10s
    Click Button    id=checkout
    Wait Until Element Is Visible    id=first-name    10s
    Input Text    id=first-name    Teste
    Wait Until Element Is Visible    id=last-name    10s
    Input Text    id=last-name    Renan
    Wait Until Element Is Visible    id=postal-code    10s
    Input Text    id=postal-code    06327-240
    Wait Until Element Is Visible    id=continue    10s
    Click Button    id=continue
    Wait Until Element Is Visible    id=finish    30s
    Click Button    id=finish
    
Login performance_glitch_user, adicionar/remover produtos e finalizar pedido
    Open Browser    https://www.saucedemo.com/    chrome    options=add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False})
    Input Text      id=user-name        performance_glitch_user
    Input Text      id=password         secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-bike-light    30s
    Click Button    id=add-to-cart-sauce-labs-bike-light
    Wait Until Element Is Visible    id=add-to-cart-sauce-labs-backpack      30s
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    class=shopping_cart_link                30s
    Click Element   class=shopping_cart_link
    Wait Until Element Is Visible    id=remove-sauce-labs-bike-light         30s
    Click Button    id=remove-sauce-labs-bike-light
    Wait Until Element Is Visible    id=checkout                             30s
    Click Button    id=checkout
    Wait Until Element Is Visible    id=first-name                           30s
    Input Text      id=first-name       teste
    Wait Until Element Is Visible    id=last-name                            30s
    Input Text      id=last-name        Renan
    Wait Until Element Is Visible    id=postal-code                          30s
    Input Text      id=postal-code      06040-120
    Wait Until Element Is Visible    id=continue                             30s
    Click Button    id=continue
    Wait Until Element Is Visible    id=finish                               30s
    Click Button    id=finish

Login standard_user, acessar carrinho e tentar finalizar pedido
    Open Browser    https://www.saucedemo.com/    chrome
    Input Text    id=user-name    standard_user
    Input Text    id=password    secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Visible    class=shopping_cart_link    10s
    Click Element    class=shopping_cart_link
    Wait Until Element Is Visible    id=checkout    10s
    Click Button    id=checkout
    # Validação: não deve ser possível finalizar a compra sem produtos
    Wait Until Element Is Visible    id=first-name    10s
    Input Text    id=first-name    Renan
    Wait Until Element Is Visible    id=last-name    10s
    Input Text    id=last-name    Ribeiro
    Wait Until Element Is Visible    id=postal-code    10s
    Input Text    id=postal-code    06327-240
    Wait Until Element Is Visible    id=continue    10s
    Click Button    id=continue
    Wait Until Element Is Visible    id=finish                               30s
    Click Button    id=finish 
    Close Browser