*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login e transferência bancária
    Open Browser    https://demo.testfire.net/login.jsp    chrome
    Wait Until Element Is Visible    name=uid    10s
    Input Text    name=uid    admin
    Input Text    name=passw    admin
    Click Button    name=btnSubmit
    Wait Until Element Is Visible    id=MenuHyperLink3    10s
    Click Element    id=MenuHyperLink3
    Wait Until Element Is Visible    name=toAccount    10s
    Select From List By Value    name=toAccount    800001
    Input Text    name=transferAmount    1200
    Click Button    name=transfer
    Wait Until Element Is Visible    id=MenuHyperLink2    10s
    Click Element    id=MenuHyperLink2