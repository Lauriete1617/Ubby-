# 📆 Relato do dia 02 - Ajustes técnicos e estruturação do player

- **Data:** 03/01/2026
- **Foco do dia:** Configuração do ambiente local, design do Ubby e criação de sua cena no godot

---

### ✅ O que fiz hoje:

#### 1. Configuração do ambiente local
- **Git & GitHub:** Consegui configurar o GitHub Desktop no Linux, agora o repositório está sincronizado e seguro.
- **Diretórios:** Organizei os diretórios no meu Linux, já inserindo arquivos que eu já tinha mas não estavam agrupados enquanto o projeto era apenas um rascunho.
- **Projeto no godot:** Criei um projeto no Godot usando essa pasta e mexi em algumas configurações do projeto, como:
  - Mudei a renderização para **Nearest**, ela funciona melhor para pixel arts, pois não tenta suavizar as imagens;
  - Coloquei o ícone do app como o rostinho feliz do Ubby!

#### 2. Sprites e estilo
- **Nova animação:** Fiz uma animação dele comemorando ou empolgado com algo.
- **Óculos:** Fiz 2 variantes de óculos para efetuar os primeiros testes nos próximos dias, depois vou criar outros tipos de acessórios.
- **ìcone:** Editei um dos sprites do pet, deixando apenas seu rosto, para ser o ícone do app.

#### 3. Cena do Ubby no Godot: (Abaixo a estrutura que usei)
- **Ubby:** `CharacterBody2D`
  - `AnimationPlayer`
    - **Corpo:** `Sprite2D`
    - **Acessórios:** `Node`
      - **SlotOculos:** `Sprite2D`

---

### 🧠 Aprendizados e dificuldades:
- **Planejamento dos acessórios:** Fiquei em dúvida inicialmente de como colocar os acessórios de forma eficiente no pet, encontrei várias formas em pesquisa, mas estou testando essa por não ter que redesenhar o mesmo várias vezes ou quebrar o sprite do corpo em partes.
- **GitHub Desktop:** Demorei para começar a usar o app, o que é bem mais prático que os outros métodos de atualizar o backup do projeto;
- **AnimationPlayer:** Antes eu costumava usar o AnimatedSprite, mas percebi que nesse contexto o AnimationPlayer se encaixa muito melhor, então tô aprendendo aos poucos como ele funciona;

---

### 🚀 Próximos passos:
- **Animações básicas:** Implementar as animações básicas no Godot;
- **AnimationPlayer:** Aprender mais sobre como esse nó funciona e aplicar de forma eficiente;
- **Testar Acessórios:** Testar a teoria de como colocar os acessórios de forma coerente usando os óculos que criei;
