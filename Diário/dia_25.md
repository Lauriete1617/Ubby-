# 📆 Relatório dia 25 - Lógica do minijogo
- **Data:** 06/02/2026
- **Foco:** Cena dos itens do minijogo e lógica do spawner

---

### ✅ O que eu fiz hoje:
#### 1. Movimentação do Ubby
- Criei agora a possibilidade do Ubby se movimentar, mas apenas no eixo X (horizontalmente);
- Essa movimentação só é permitida na cena do minijogo, esse bloqueio ocorre por conta de uma variável boolean;
- Fiz uma animação simples dele andando de lado;
- O Ubby troca seu chapéu atual por um cestinho na cabeça, onde as moedas caem;

#### 2. Itens spawnados
- Criei cenas separadas que são chamadas na cena, cada uma com seu efeito e scripts separados, sendo elas:
  - **Moeda comum:** São convertidas em moedas do jogo principal ao concluir a partida;
  - **Saco de moedas:** Equivale a 10 moedas comuns;
  - **Bombinha:** Tira uma das vidas do personagem, ao perder 3 vidas a partida acaba;

#### 3. Lógica da cena do minijogo
- **Lógica do spawner com aleatoriedade:** Criei uma variável chamada sorteio, que recebe `randi()%100`, e ao sortear um valor de 1 a 100 é quando decide qual vai ser o item que cairá dessa vez, seguindo as seguintes probabilidades:
  - Moeda = 60% de chance;
  - Bomba = 30% de chance;
  - Saco de moedas = 10% de chance;
- **Timer de spawner:** Implementei um timer básico de 0.6 segundo que é o tempo para cada objeto ser sorteado e cair;

---

### 🧠 Aprendizados e dificuldades
- Ao reiniciar o PC, simplesmente alguns dos caminhos não funcionavam, eu não entendi o motivo para isso, mas eu apenas reescrevi a linha que redireciona pra próxima cena e funcionou, isso ocorreu com os botões do menu principal e alguns dos botões da casa, mas agora está resolvido;
- Eu inicialmente tentei criar um script único para os itens que iriam cair no minijogo, e depois percebi que funcionaria melhor como scripts separados. Só que eu fui apagar esse primeiro e sem querer apaguei o script `item_loja`, que é o script do botão padrão das lojas de roupas e comidas, então amanhã eu vou ter que reescrevê-lo do zero;

---

### 🚀 Próximos passos
- Reescrever o script `item_loja` do zero;
- Timer do fim da fase;
- UI do minijogo de pause e fim de jogo;
- Animação de explosão da bomba;
