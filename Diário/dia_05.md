# 📆 Relato dia 05 - Central de estilo
- **Data:** 08/01/2026
- **Foco:** Save System, lógica de loja e UI dinâmica;

---

### ✅ O que fiz hoje:
#### 1. Layout e lógica da loja/vestiário
- **Criação da cena:** Criei a cena que corresponde tanto como loja de itens quanto como vestiário dos itens já adquiridos. A estrutura da cena foi a seguinte:
  - `Central de estilo`: Control (Nó raíz);
    - `HBoxContainer`: Para fazer a divisão da tela;
     - `Provador`: ColorRect (Fundo da tela de provador);
      - `Botão Ação`: Button (Botão para comprar ou equipar um item);
      - `Manequim Ubby`: TextureRect (Imagem do pet para experimentar roupas e acessórios antes de comprar;
        - `Manequim Óculos`: TextureRect (Posição para encaixar os itens de cada slot, começando pelo slot de óculos);
      - `Moedas`: Label (Mostra a quantidade de moedas que o player tem no momento);
     - `Abas`: TabContainer (Gerencia os GridContainers, que são cada aba de tipos de acessórios, cada um com um botão para cada item à venda);
       - `Chapéus`: GridContainer
       - `Óculos`: GridContainer;
       - `Pescoço`: GridContainer;
       - `Roupas`: GridContainer;
       - `Sapatos`: GridContainer;
    - `Fechar`: Button (Botão para fechar a loja e voltar à cena principal);
- **Padrão de botões**: Criei uma cena separada para um botão padrão para os itens da loja e depois apenas repliquei ele nos `GridContainers`;
- **Lógica da central de estilo:** Implementei a lógica que identifica:
  - Detecção de cliques;
  - Seleção de itens;
  - Manequim do Ubby que veste os itens selecionados;
  - Ver se o item já foi adquirido ou não. Se já foi comprado, você clica para equipar, senão você compra (Caso tenha a quantidade de moedas suficiente);
- **Itens:** Desenhei e apliquei 5 óculos para testar a loja, e depois de uma série de erros finalmente estão funcionais;

#### 2. Feedback visual
- Pequenos ajustes na loja que dão um toque a mais, como:
  - O preço some do item que foi adquirido;
  - O botão de ação muda de invisível quando não há nada selecionado, escrito "COMPRAR" quando é um item não adquirido e escrito "EQUIPAR" quando é um que já está no seu inventário;
  - O contador de moedas atualiza na hora;
  - Adicionei o ícone de 🪙 quando se trata de preço de algo ou no contador de moedas, pra deixar mais dinâmico;

#### 3. Sistema
- Adicionei ao sistema de save as varáveis `moedas` e `itens_adquiridos`;
- Decidi mudar a lógica do Ubby de usar frames para identificar os itens por usar diretamente os sprites dos itens para ficar mais prático de gerenciar;

---

### 🧠 Aprendizados e dificuldades
- Eu não conhecia os nós `TabContainer` e `GridContainer`, que tornam bem mais dinâmica a criação da UI do que ajustar manualmente;
- Conheci também o `ColorRect`, que é mais leve e serve como alternativa mais básica para o `Panel`;
- Tem alguma coisa bloqueando que eu mexa no `Style` de todos os nós que têm essa opção, preciso descobrir o que tá causando isso pra conseguir deixar a tela interface melhor;

---

### 🚀 Próximos passos
- Descobrir qual o problema com os `Style`;
- Preencher o catalogo_texturas com os caminhos reais das imagens (preload) e testar se o Ubby carrega o óculos certo ao iniciar a cena;
- Aplicar a mesma lógica para os outros slots de acessórios;
- Desenhar esses outros acessórios;
