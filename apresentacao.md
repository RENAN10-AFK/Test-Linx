# Bom dia Débora, tudo bem?

Segue o Desafio realizado e pronto. Qualquer dúvida estou à disposição.

## Respostas para a Seção de Conceitos Básicos

1. **Qual é o objetivo principal dos testes de regressão?**

A resposta correta é a C) Garantir que as alterações recentes no software não afetem as funcionalidades existentes.

Em outras palavras, o teste de regressão funciona como uma verificação de segurança. Sua principal função é confirmar que as novas implementações ou correções de bugs não "quebraram" funcionalidades que já existiam e estavam funcionando bem.

2. **Qual é o objetivo principal do teste de software?**

A resposta correta é a B) Garantir que o software atenda aos requisitos e expectativas do cliente.

Embora encontrar bugs seja parte importante do processo, o objetivo maior é garantir que o produto final entregue valor ao cliente. Isso significa que ele deve funcionar conforme o esperado e atender às suas necessidades reais, sendo útil e confiável.

3. **Explique três tipos diferentes de testes manuais que podem ser realizados em um software ERP como o Microvix.**

Para um sistema completo como um ERP, é fundamental testar de diferentes maneiras. Três abordagens manuais importantes seriam:

- **Teste de Integração:** Validamos o fluxo de trabalho entre diferentes partes do sistema. Por exemplo, simulamos a criação de uma venda e verificamos se o produto vendido teve seu estoque atualizado automaticamente e se a cobrança foi gerada corretamente no módulo financeiro. O objetivo é garantir que os módulos "conversem" entre si sem erros.

- **Teste Funcional:** O foco é confirmar se uma função específica opera segundo as regras de negócio. Por exemplo, testamos se o cálculo de impostos de uma nota fiscal está correto para diferentes situações ou se um desconto promocional é aplicado como deveria no caixa.

- **Teste de Usabilidade (UX):** Avalia o quão fácil e intuitivo o sistema é para o usuário final. Nos colocamos no lugar de um operador para ver se é simples realizar tarefas comuns, como cadastrar um cliente ou fechar o caixa, identificando pontos que podem ser confusos ou demorados no dia a dia.

4. **Qual é a principal diferença entre testes de regressão e testes de aceitação?**

A opção correta é a B). A principal diferença está na direção do foco:

- O teste de regressão olha "para trás", para garantir que nada do que já funcionava foi quebrado.
- O teste de aceitação olha "para a frente", para validar se o novo recurso atende aos requisitos do cliente e está pronto para ser usado.

5. **Descreva o conceito de teste exploratório, seus benefícios e como equilibrá-lo com testes planejados.**

- **Conceito:** O teste exploratório é uma abordagem onde o testador explora o software com liberdade, como um usuário curioso, aprendendo sobre o sistema e criando novos testes em tempo real. É o oposto de seguir um roteiro fixo.

- **Benefícios:** Seu grande benefício é encontrar bugs inesperados que um roteiro não pegaria. É muito eficaz quando temos pouco tempo ou pouca documentação, permitindo um feedback rápido para a equipe de desenvolvimento.

- **Equilíbrio:** O segredo é o equilíbrio. Usamos testes planejados (muitas vezes automatizados) para os fluxos essenciais do sistema, a sua "espinha dorsal", garantindo que o básico esteja sempre funcionando. Já o teste exploratório é usado para investigar novas funcionalidades e áreas de maior risco. Um complementa o outro para uma cobertura de teste mais completa e inteligente.

6. **Cenário Scrum: Como abordar problemas de qualidade identificados na Sprint Review?**

Minha abordagem seria focada na solução e no aprendizado, sem caça às bruxas.

- **Ações Imediatas:** Na reunião, eu comunicaria o problema de forma clara e objetiva, mostrando o impacto para o usuário, sem apontar culpados. A ideia é dar ao Product Owner (PO) as informações necessárias para que ele possa decidir, com segurança, se a funcionalidade pode ser lançada ou não.

- **Ações Futuras:** Depois, na retrospectiva da sprint, o foco seria entender a causa raiz. A discussão giraria em torno de "Como podemos evitar que isso aconteça de novo?". A partir daí, poderíamos propor melhorias práticas, como refinar nossa "Definição de Pronto" ou fazer testes rápidos em dupla (desenvolvedor e testador) antes da entrega final da tarefa. O objetivo é sempre aprender e fortalecer o processo.

7. **Descreva três boas práticas para escrever scripts de automação de teste fáceis de manter.**

Para criar uma automação de testes que seja duradoura e fácil de gerenciar, sigo três práticas principais:

- **Criar blocos de código reutilizáveis:** Em vez de repetir os mesmos passos, como o de login, em todos os testes, criamos uma função única para isso. Se a tela de login mudar, alteramos o código em um só lugar, e todos os testes que usam essa função são corrigidos de uma vez. Isso facilita muito a manutenção.

- **Separar os dados dos testes:** Não se deve colocar dados como nomes de usuário e senhas diretamente no código. O ideal é mantê-los em arquivos externos, como uma planilha. Assim, para testar com 100 usuários diferentes, basta adicionar 100 linhas na planilha, sem precisar mexer no script. Isso o torna muito mais flexível.

- **Usar nomes claros e verificações diretas:** Um script de teste deve ser fácil de ler. O nome do teste precisa descrever o que ele faz (ex: Testar Login Com Senha Incorreta). No final, a verificação (chamada de "assertiva") deve ser direta e nos dizer exatamente o que falhou, o que ajuda a agilizar a identificação de qualquer problema.

---

## Assunto: Cenários de Teste para a Funcionalidade de Gerenciamento de Estoque

Para garantir que a nova funcionalidade de gerenciamento de estoque funcione perfeitamente, preparei alguns cenários de teste. O objetivo é cobrir as principais ações que um funcionário realizaria no dia a dia, validando desde a consulta de produtos até os ajustes e a integração com as vendas, sempre com foco na precisão e na atualização em tempo real, como solicitado pelo PO.

1. **Verificação da Disponibilidade de Produtos**

Primeiro, vamos garantir que a consulta ao estoque seja confiável. O primeiro teste é consultar um produto que tenha estoque. Por exemplo, ao buscar por um item que sabemos ter 50 unidades, o sistema deve exibir exatamente essa quantidade. Em seguida, faremos o teste inverso, consultando um produto com estoque zerado. Nesse caso, o sistema deve mostrar "0 unidades" e, idealmente, sinalizar que o item está indisponível para o funcionário.

2. **Ajustes Manuais no Estoque**

Depois, precisamos validar os ajustes manuais. Para adicionar itens (entrada de estoque), o funcionário deverá localizar um produto, selecionar a opção de ajuste, inserir a nova quantidade (ex: adicionar 10 unidades) e um motivo. O sistema precisa refletir essa mudança imediatamente, atualizando o total e salvando um registro dessa alteração. O mesmo vale para a remoção de itens (baixa por perda ou avaria). O funcionário deve conseguir remover uma quantidade específica, e o sistema deve atualizar o total na mesma hora, também registrando o motivo da baixa.

3. **Integração com o Ponto de Venda**

Por fim, o teste mais crítico é a integração com as vendas. Para validar a baixa automática após uma venda, verificamos o estoque de um produto (ex: 40 unidades), realizamos a venda de algumas unidades dele (ex: 3 unidades) no caixa e, ao finalizá-la, conferimos o estoque novamente. O esperado é que a quantidade tenha sido atualizada automaticamente para 37 unidades. Também testaremos a tentativa de venda de um produto sem estoque. Ao tentar adicionar um item com 0 unidades a uma venda, o sistema deve bloquear a ação e exibir uma mensagem clara, como "Produto indisponível", evitando erros no caixa.

Esses cenários cobrem os fluxos essenciais para validar a funcionalidade e garantir a robustez total do sistema.
