# 📆 Registro dia 20 - Sistema de alimentação
- **Data:** 25/01/2026
- **Foco:** Mecânica de alimentação e consumo de itens

---

### ✅ O que eu fiz hoje:
#### 1. Sistema de Drag & Drop (Arrastar e soltar)
- **Detecção de clique:** Configuração do `InputEventMouseButton` na `Area2D` do prato pra detectar o clique do mouse;
- **`global_position`:** Usei uma lógica envolvendo o `global_position` para que o prato acompanhasse a posição do mouse enquanto o clique esquerdo estivesse pressionado;
- **Detecção de colisão:** Criei um `Marker2D` na posição da boca para poder usar como ponto de referência ao programar;
  - **Prato Vs Boca:** Usei o comparador `distance_to` para comparar a distância entre o prato e a boca, e se estivesse dentro da distância mínima, a comida seria consumida;
  - **Efeito elástico:** Caso não estivesse na distância mínima ao soltar o botão do mouse, o prato volta à posição inicial na mesa;
    - Utilizei o comando `Tween` para fazer isso através de um movimento suave, ao invés de simplesmente teletransportar;
#### 2. Gestão de inventário na cozinha
- **Script atualizado:** Tirei a versão de teste que ele lia o cardápio inteiro e agora só aparecem as comidas que estão no inventário do jogador;
- **Visualizador de quantidade:** Adicionei um label ao lado da comida para o jogador saber quantas daquela ele tem no inventário no momento;
#### 3. Polimento visual
- **Dicionário de escalas:** Agora tem um dicionário de escalas no script da cozinha, como eu tinha feito todas os assets das comidas do mesmo tamanho, visualmente fica estranho já que deveriam ter diferença, mas agora tem um ajuste de escala via script para as que neessitam, as que não precisam se mantém em 1.0 por 1.0;

---

### 🧠 Aprendizados e dificuldades
- Conheci a existência do comando `tween`, que faz uma transição bem mais suave;
- Demorei pra entender como fazer o dicionário de escalas;
- Quando atualizei para verificar o inventário de comidas ao invés do cardápio inteiro, por algum motivo sempre aparecia um Xis, mesmo que o inventário estivesse vazio, ainda não resolvi esse peoblema;

---

#### 🚀 Próximos passos
- Resolver o problema do Xis no inventário vazio;
- Pensar em como vai funcionar a diminuição dos status naturalmente de fome, energia e felicidade;
- Fazer com quen o Ubby fique cheio, quando a saciedade chega a 100 ele não aceita mais comidas;
