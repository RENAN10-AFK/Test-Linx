*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Adicionar três atividades e marcar a segunda como concluída
    Open Browser    https://todomvc.com/examples/react/dist/    chrome
    Wait Until Element Is Visible    css=.new-todo    10s
    Input Text    css=.new-todo    Atividade 1
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 1']    10s
    Input Text    css=.new-todo    Atividade 2
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 2']    10s
    Input Text    css=.new-todo    Atividade 3
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 3']    10s
    Sleep    1s
    Click Element    xpath=//label[text()='Atividade 2']/preceding-sibling::input[@class='toggle']
    Sleep    1s
    Click Element    xpath=//ul[@class='filters']/li/a[text()='Completed']
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 2']    10s
    Page Should Contain    Atividade 2
    Click Element    xpath=//ul[@class='filters']/li/a[text()='All']
    Sleep    1s
    Close Browser

Adicionar quatro atividades, marcar e excluir a terceira, filtrar concluídas
    Open Browser    https://todomvc.com/examples/react/dist/    chrome
    Wait Until Element Is Visible    css=.new-todo    30s
    Input Text    css=.new-todo    Atividade A
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade A']    10s
    Input Text    css=.new-todo    Atividade B
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade B']    10s
    Input Text    css=.new-todo    Atividade C
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade C']    10s
    Input Text    css=.new-todo    Atividade D
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade D']    10s
    Sleep    1s
    Click Element    xpath=//label[text()='Atividade C']/preceding-sibling::input[@class='toggle']
    Sleep    1s
    Click Element    xpath=//ul[@class='filters']/li/a[text()='Completed']
    Wait Until Element Is Visible    xpath=//label[text()='Atividade C']    10s
    Mouse Over    xpath=//label[text()='Atividade C']
    Click Element    xpath=//label[text()='Atividade C']/following-sibling::button[contains(@class,'destroy')]
    Sleep    1s
    Page Should Not Contain    Atividade C
    Click Element    xpath=//ul[@class='filters']/li/a[text()='Active']
    Sleep    1s
    Close Browser

Adicionar quatro atividades, marcar a quarta, limpar concluídas
    Open Browser    https://todomvc.com/examples/react/dist/    chrome
    Wait Until Element Is Visible    css=.new-todo    30s
    Input Text    css=.new-todo    Atividade 1
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 1']    10s
    Input Text    css=.new-todo    Atividade 2
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 2']    10s
    Input Text    css=.new-todo    Atividade 3
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 3']    10s
    Input Text    css=.new-todo    Atividade 4
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 4']    10s
    Sleep    1s
    Click Element    xpath=//label[text()='Atividade 4']/preceding-sibling::input[@class='toggle']
    Sleep    1s
    Click Element    xpath=//ul[@class='filters']/li/a[text()='Completed']
    Wait Until Element Is Visible    xpath=//label[text()='Atividade 4']    10s
    Page Should Contain    Atividade 4
    Wait Until Element Is Visible    css=.clear-completed    10s
    Element Text Should Be    css=.clear-completed    Clear completed
    Click Element    css=.clear-completed
    Sleep    1s
    Page Should Not Contain    Atividade 4
    Click Element    xpath=//ul[@class='filters']/li/a[text()='All']
    Sleep    1s
    Close Browser   