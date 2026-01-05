# 📆 Relato do dia 03 - Vida, cliques e fantasmas
- **Data:** 04/01/2026
- **Foco:** Novos sprites e resolução de bugs visuais

---

### ✅ O que fiz hoje:
#### 1. Criação de novos sprites e animações
- **Animação de respiração (Idle):** Desenhei e importei o spritesheet da animação idle, depois cortei os frames (`Hframes`/`Vframes`);
- **Partículas de corações:** Fiz a arte de um coração único e o importei para o projeto, amanhã vou aprender a usar o nó `CPUParticles2D` para implementá-lo;

#### 2. Interação de cliques e ajustes da cena
- **Detecção de cliques em objeto:** Aprendi a como colocar o `_input_event`, que foi feito para detectar cliques apenas no objeto em questão,diferente do `_input`, que detecta no todo;
  - Para funcionar, ativei no nó raíz do personagem a opção `Pickable`;
- **Substituição de arte base da cena:** Enquanto antes eu usava uma arte provisória para o Ubby, agora substituí pelo sprite novo da animação idle;

#### 3. Praticando o uso do AnimationPlayer
- **Adicionando as 2 primeiras animações:** Criei no AnimationPlayer a animação Idle, que roda por padrão ao executar o jogo, e a animação de Carinho, que roda quando você clica no pet;
  - **Chaves/Keys:** Aprendi que neste nó se usam `keys` não apenas para onde os frames ficam na animação, mas também para fixar um sprite específico pra aquela animação, bem como `Hframes` e `Vframes`;
  - **Correção do frame fantasma:** Tinha um bug visual no último frame ao mudar de animação, resolvi colocando todas as faixas em `Discrete` (Símbolo de escadinha ou linhas pontilhadas) e colocando todas as `keys` exatamente no 0 da faixa;

#### 4. Primeiro script
- **Lógica de carinho:** Criei o script ubby.gd, onde ficou implementada a lógica de receber carinho ao clicar no personagem e esperar a animação de carinho acabar pra voltar pra idle usando `await animation_finished`;

#### 5. Introdução à partículas
- **Nó para partículas:** Eu ia usar o mesmo método para as animações do personagem, mas descobri que existem os nós `CPUParticles2d` e `GPUParticles2D` dedicados a isso, mas optei pela primeira opção por se aplicar melhor para pixel art e ser mais simples de lidar;
- **Sprite de teste:** Importei a arte que fiz de coração para testar na prática, assim que conseguir implementar vou adicionar outras para estados diferentes;

---

### 🧠 Aprendizados e dificuldade
   Quase tudo neste dia foram novidades para mim, nunca tinha lidado com `AnimationPlayer` antes e nem sabia que nós para partículas existiam, as únicas coisas que não foram novidade para mim foi criar os sprites e a lógica do primeiro script, mas as coisas que mais tive dificuldade foram:
- Entender como `AnimationPlayer` funciona e o papel das `keys`;
- Correção do glitch visual, especialmente descobrir o que tava causando aquilo;

---

### 🚀 Próximos passos
- Implementar partículas e aprender mais sobre o `CPUParticles2D`;
- Criar sprites e pensar na lógica dos outros estados (fome e sono);
- Montar cenário da casa do pet;
- Implementar os óculos para depois pensar nos outros acessórios;
