# 📆 Registro dia 15 - Mercado e sistema de compras
- **Data:** 18/01/2026
- **Foco:** Lógica completa do mercado;

---

### ✅ O que eu fiz hoje:
#### 1. Lógica do mercado (loja de comidas)
- Criação dinâmica dos botões usando `instantiate()` e loops for, permitindo que a lista cresça automaticamente;
- Resolução de lógica de sinais usando .bind(id) para identificar qual botão foi clicado;

#### 2. Interface do usuário (UI)
- **Sistema de "Vitrine":** O painel de detalhes inicia oculto com uma mensagem de boas-vindas e só exibe as informações (preço, stats, imagem grande) ao selecionar um item;
- **Feedback Visual:** O botão de compra atualiza automaticamente para "FALTA DINHEIRO" e bloqueia se o saldo for insuficiente;
- Conversão de tipos (int/string) corrigida para exibição nos Labels;

### 3. Efeitos sonoros
Escolhi efeitos sonoros para tudo que foi criado até então, como interações com os móveis na casa e cliques de botões;

---

### 🧠 Aprendizados e dificuldades
- Não conhecia até então como fazer botões automaticamente, até então só fiz manualmente, então o `instantiate()` e o `bind(id)` são novidades pra mim;
- Conehci o nó `MarginContainer`, que usei para o sistema de vitrine;
- Correção do atalho do GitHub Desktop no Linux (via terminal);

---

### 🚀 Próximos passos
- Implementar os efeitos sonoros;
- Escolher e implementar músicas que combinem com o clima do jogo;
- Cena da cozinha, onde o Ubby vai comer;
