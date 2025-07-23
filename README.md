# Projeto de Automação de Testes

Este projeto utiliza **Robot Framework** com a biblioteca **SeleniumLibrary** para automação de testes web em diferentes aplicações de demonstração. Os testes estão organizados por nível de complexidade e cobrem cenários de login, manipulação de listas, fluxo de compra e transferência bancária.

## Estrutura do Projeto

```
tests/
  test_google.robot                # Teste simples de acesso ao Google
  advanced/
    testfire_test.robot            # Teste de login e transferência bancária
  basic/
    todo_test.robot                # Testes de manipulação de tarefas (TodoMVC)
  intermediate/
    saucedemo_test.robot           # Testes de fluxo de compra (SauceDemo)
    pages/                         # Keywords customizadas para o SauceDemo
      CheckoutPage.robot
      LoginPage.robot
      ProductPage.robot
results/                           # Resultados dos testes (logs, reports)
```

## Pré-requisitos

- Python 3.x
- Google Chrome instalado
- [Robot Framework](https://robotframework.org/) (`pip install robotframework`)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) (`pip install robotframework-seleniumlibrary`)
- [WebDriver do Chrome](https://chromedriver.chromium.org/downloads) compatível com sua versão do navegador

## Como Executar os Testes

1. Instale as dependências:
   ```powershell
   pip install robotframework robotframework-seleniumlibrary
   ```
2. Execute um teste específico:
   ```powershell
   robot tests/basic/todo_test.robot
   ```
   Ou execute todos os testes:
   ```powershell
   robot tests/
   ```
3. Os resultados serão gerados na pasta `results/` ou no diretório raiz como `log.html`, `report.html` e `output.xml`.

## Testes Automatizados

### Teste Google (`tests/test_google.robot`)
Verifica o acesso ao Google e valida o título da página.

**Cenário negativo:**
- Título da página não corresponde ao esperado, evidenciando falha de navegação ou acesso.

---

### Teste TodoMVC (`tests/basic/todo_test.robot`)
Automação de tarefas na aplicação [TodoMVC React](https://todomvc.com/examples/react/dist/):

**Cenários:**
1. Adicionar três atividades e marcar a segunda como concluída
2. Adicionar quatro atividades, marcar e excluir a terceira, filtrar concluídas
3. Adicionar quatro atividades, marcar a quarta, limpar concluídas

**Cenário negativo:**
- O botão "Clear completed" não remove tarefas concluídas (bug identificado e validado pelo teste).
- Tarefa marcada como concluída permanece na lista após limpeza, evidenciando falha na funcionalidade.

**Exemplo do cenário 3:**
```robotframework
Adicionar quatro atividades, marcar a quarta, limpar concluídas
    Input Text    css=.new-todo    Atividade 1
    Press Keys    css=.new-todo    RETURN
    Input Text    css=.new-todo    Atividade 2
    Press Keys    css=.new-todo    RETURN
    Input Text    css=.new-todo    Atividade 3
    Press Keys    css=.new-todo    RETURN
    Input Text    css=.new-todo    Atividade 4
    Press Keys    css=.new-todo    RETURN
    Click Element    xpath=//label[text()='Atividade 4']/preceding-sibling::input[@class='toggle']
    Click Element    xpath=//ul[@class='filters']/li/a[text()='Completed']
    Page Should Contain    Atividade 4
    Element Text Should Be    css=.clear-completed    Clear completed
    Click Element    css=.clear-completed
    Page Should Not Contain    Atividade 4
    Close Browser
```

---

### Teste SauceDemo (`tests/intermediate/saucedemo_test.robot`)
Simula cenários de compra, login e validações no site SauceDemo, utilizando keywords customizadas em `pages/`.

**Cenários:**
- Login, adicionar produtos, remover, finalizar pedido e validação do sucesso.
- Usuário com performance glitch: login, adicionar/remover produtos, finalizar pedido com dados diferentes.
- Cenário negativo: login, acessar carrinho e tentar finalizar compra sem produtos.

**Cenário negativo:**
- O sistema permite finalizar a compra mesmo sem produtos no carrinho, evidenciando um possível bug ou comportamento inesperado.

**Exemplo de fluxo negativo:**
```robotframework
Login standard_user, acessar carrinho e tentar finalizar pedido
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Abrir SauceDemo    ${options}
    Fazer Login    ${USER}    ${PASS}
    Wait Until Element Is Visible    class=shopping_cart_link    10s
    Click Element    class=shopping_cart_link
    Wait Until Element Is Visible    id=checkout    10s
    Click Button    id=checkout
    Wait Until Element Is Visible    id=first-name    10s
    Input Text    id=first-name    Renan
    Wait Until Element Is Visible    id=last-name    10s
    Input Text    id=last-name    Ribeiro
    Wait Until Element Is Visible    id=postal-code    10s
    Input Text    id=postal-code    06327-240
    Wait Until Element Is Visible    id=continue    10s
    Click Button    id=continue
    Wait Until Element Is Visible    id=finish    10s
    Click Button    id=finish
    Close Browser
```

---

### Teste TestFire (`tests/advanced/testfire_test.robot`)
Automação de login e transferência bancária no site TestFire.

**Cenários:**
- Login com usuário e senha
- Navegação até a área de transferência
- Seleção da conta de destino
- Preenchimento do valor e confirmação da transferência
- Navegação até o resumo de contas para validação do saldo
- Validação dos dados da conta e valor transferido

**Cenário negativo:**
- Campo de senha não encontrado, impedindo login e execução do fluxo (site pode estar fora do ar ou bloqueado).
- Transferência não realizada ou saldo não atualizado, evidenciando falha no sistema bancário.

**Exemplo de fluxo:**
```robotframework
Login e transferência bancária
    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    name=uid    15s
    Input Text    name=uid    ${USER}
    ${senha_visivel}=    Run Keyword And Return Status    Wait Until Element Is Visible    name=passw    15s
    IF    ${senha_visivel}
        Input Text    name=passw    ${PASS}
        Click Button    name=btnSubmit
        Wait Until Element Is Visible    id=MenuHyperLink3    10s
        Click Element    id=MenuHyperLink3
        Wait Until Element Is Visible    name=toAccount    10s
        Select From List By Value    name=toAccount    800001
        Input Text    name=transferAmount    1000
        Click Button    name=transfer
        Sleep    1s
        Wait Until Element Is Visible    id=MenuHyperLink1    10s
        Click Element    id=MenuHyperLink1
        Wait Until Element Is Visible    name=listAccounts    10s
        Select From List By Value    name=listAccounts    800001
        Click Button    id=btnGetAccount
        Wait Until Page Contains    1000    10s
        Page Should Contain    Checking
        Page Should Contain    Corporate
    ELSE
        Log    Campo de senha não encontrado. Possível mudança ou bloqueio no site.
    END
    Close Browser
```

---

## Detalhes dos Testes do TodoMVC (`basic/todo_test.robot`)

Este arquivo cobre cenários essenciais de manipulação de tarefas na aplicação [TodoMVC React](https://todomvc.com/examples/react/dist/):

### Cenários Automatizados

1. **Adicionar três atividades e marcar a segunda como concluída**
   - Adiciona três tarefas.
   - Marca a segunda como concluída.
   - Filtra por concluídas e valida que a tarefa aparece na lista.

2. **Adicionar quatro atividades, marcar e excluir a terceira, filtrar concluídas**
   - Adiciona quatro tarefas.
   - Marca a terceira como concluída.
   - Filtra por concluídas, exclui a tarefa marcada e retorna ao filtro de tarefas ativas.

3. **Adicionar quatro atividades, marcar a quarta, limpar concluídas**
   - Adiciona quatro tarefas.
   - Marca a quarta como concluída.
   - Filtra por concluídas, valida o botão "Clear completed" e remove a tarefa concluída.
   - Valida que a tarefa foi removida da lista.

### Observações

- Todos os testes utilizam o Chrome em modo incógnito para evitar interferências de cache.
- O botão "Clear completed" é validado para garantir que tarefas concluídas são realmente removidas.
- Os cenários cobrem adição, marcação, exclusão e limpeza de tarefas, simulando o uso real do sistema.

---
Projeto criado para fins de estudo e demonstração de automação de testes web.
