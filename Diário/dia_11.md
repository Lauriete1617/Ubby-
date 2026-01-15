# 📆 Relatório dia 11 - Construindo e mobiliando a casa
- **Data:** 14/01/2026
- **Foco:** Cena da casa no Godot;

---

### ✅ O que eu fiz hoje:
#### 1. Criação da cena da casa
Criei a cena no Godot seguindo a seguinte estrutura:
- `Casa` - Node2D;
  - `Background` - Sprite2D (Arte de fundo com paredes e chão);
    - `Camera2D` - Zoom de 3.6;
  - `Moveis` - Node (Cada um com sua `Area2D` e `CollisionShape2D` retangulares);
    - `Cama+Abajur` - AnimatedSprite2D (Cada estado da cama é uma animação);
    - `Armario` - AnimatedSprite2D (Animação da porta abrindo);
    - `Sofa` - Sprite2D;
    - `TV+Rack` - AnimatedSprite2D (Dá pra ligar e desligar a TV);
    - `Fogao` - Sprite2D;
    - `Mesa` - Sprite2D;
    - `Geladeira+Balcao` - AnimatedSprite2D (A porta da geladeira abre antes de levar a loja de comidas);
  - `Ubby` - Cena instanciada;

#### 2. Resolução e câmera
Inicialmente ia tentar aprender a usar e aplicar o `SubViewPort`, mas vi que era complexo demais sem necessidade, então optei pela opção mais simples da `Camera2D` com 3.6 de zoom. Isso por conta da diferença de resolução, já que a resolução padrão é de 1152x648, mas minha arte de Background é de 320x180.
- **Lógica de profundidade:** Ao invés de quebrar a cabeça com o `Offset`, optei por simplesmente mexer com o `Z-index fixo` no `Ordering`, colocando o Ubby com o valor 5 e os móveis atrás ficam de 0 a 2, enquanto os na frente ficam com 6;

#### 3.Mecânica de dormir
Ao invés de mexer com a cena do Ubby original, vou deixar ela invisível e ativar uma animação com ele deitando na cama com o pijaminha, deixando programação e arte mais simples, além de dar um toque fofo à cena;

---

### 🧠 Aprendizados e dificuldades
- **Dificuldades com escala:** Sem querer em algum momento eu mexi na resolução da cena do Ubby, e ele ficou MUITO maior que a casa, demorei um tempo até descobrir o problema, mas coloquei todos os `Size` na cena do Ubby em 1, voltando ao tamanho original que eu fiz;
- **O bug do "fantasma":** Tem um problema que eu ainda não resolvi, o `CollisionShpae2D` tá no local certo, mas o sprite não acompanha e sim flutua fora da tela;
- **Conheci novos nós:** Descobri que o `SubViewPort` e o `PointLight` existem, o segundo ainda quero aplicar no futuro;
- **Aprendizado:** Entendi que problemas de posição muitas vezes vêm de "sujeira" no arquivo original `.tscn` ou de espaços vazios gigantes no PNG transparente;

---

### 🚀 Próximos passos
- Resolver o problema do bug "fantasma";
- Ver os detalhes que faltam da mobília, como algumas decorações e as janelas;
- Adicionar os pontos de luz;
- Lógicas individuais dos móveis;
