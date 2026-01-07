# 📆 Registro do dia 04 - Troca de acessórios e salvar o jogo
- **Data:** 06/01/2026
- **Foco:** Teste de equipamento e troca de acessórios, partículas visuais e persistência de dados

---

### ✅ O que fiz hoje:
#### 1. Colocar e trocar acessórios
- Aprendi a diferença entre `res://` (somente leitura) e `user://` (onde ficam os saves);
- Criei o `Global.gd` para armazenar e gerenciar as informações que devem ir para `user://` com as funções de:
  - **`salvar_jogo`:** Usando o `FileAcess`, coloco as informações como fome, sono, felicidade e o dicionário de acessórios no disco principal;
  - **`carregar_jogo()`:** Lê essas informações logo no `_ready`;
- Conectei o script `ubby.gd` com o `Global.gd` para manter a memória visual;  

#### 2. Partículas visuais
- **Aprendi a usar `CpuParticles2D`:** Finalmente entendi como fazer os ajustes, e na verdade são bem simples, escolhi alterar os seguintes pontos:
  - **`Texture`:** Coloquei as pixel arts que eu mesma fiz;
  - **`One Shot`:** Ativo (Evita loop);
  - **`Explosiveness`:** 0.9 (Velocidade que as imagens saem);
  - **`Scale amount`:** mínimo 0.1 e máximo 1.0 (Variação de tamanho);
  - **`Emission shape`:** Formato `sphere` com raio de 45px;
  - **`Inicial velocity`:** Mínimo de 50 e máximo de 80;
  - **`Gravity`:** -100
- **Estrelas:** Partículas para quando o pet muda de acessório;
- **Corações:** Partículas para quando o pet recebe carinho;

---

### 🧠 Aprendizados e dificuldades
Mais uma vez, o dia de hoje foi repleto de novidades e tô adorando esse projeto simples, e por mais que eu já tivesse implementado em outro projeto a persistência de dados, eu fui entender com propriedade mesmo agora reisitando esses conceitos. 

---

### 🚀 Próximos passos
- Implementar a UI da loja de acessórios e colocar a lógica da troca de acessórios lá;
- Adicionar outros slots de acessórios além dos óculos, sendo eles roupa, pescoço, sapato e chapéu;
