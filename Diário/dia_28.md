# 📆 Relatório dia 28 - Lógica de pause e correção de bugs
- **Data:** 13/02/2026
- **Foco:** Implementação de pause no jogo, correção de bugs e detalhes visuais

---

### ✅ O que eu fiz hoje:
#### 1. Pause
- **Interface gráfica:** Criei outro `VBoxContainer` dentro do mesmo `panel` usado para a tela de game over, mas dessa vez dedicado ao pause, quando um desses é visível, o outro não é. Dentro dele 3 botões, sendo eles:
  - **Jogar:** Segue o jogo de onde parou;
  - **Recomeçar:** Reinicia a partida do zero;
  - **Sair:** Fecha o minijogo, levando para o menu de jogos;
- **`Process Mode`:** Coisas que eu quisesse que seguissem funcionando mesmo pausado eu coloquei no modo `Inherit`, enquanto as coisas que deveriam parar eu coloquei como `Pausable`;

#### 2. Correção de bugs
- **Correção de Loops:** Resolução do bug onde o game_over rodava infinitamente no `_process`;
- **Debug:** Correção da colisão do `saco_moedas` (sinal desconectado e lógica de `await`);

#### 3. Polimento do minijogo
- **Sistema de Dificuldade:** Implementação de lógica de Spawn progressivo (quanto menos tempo, mais rápido caem os itens);
- **Persistência de Dados:** Integração do Recorde (High Score) com o sistema de Save Global;
- **Polimento Visual:** Feedback de dano (Ubby pisca vermelho) e ajuste de UI;

#### 4. Engenharia de áudio
- **Efeitos sonoros:** Escolha e aplicação dos efeitos sonoros do minijogo;
- **Músicas de fundo:** Fiz a escolha das músicas de fundo para cada cena que serão implementadas amanhã;

---

### 🧠 Aprendizado e dificuldades
Hoje foi um daqueles dias que o mais complicado é entender o problema do que de fato executar a solução;

---

### 🚀 Próximos passos
- Criar o script `AudioManager` para gerenciar as músicas ao longo do jogo;
- Planejamento de novas features e polimento do jogo geral;
