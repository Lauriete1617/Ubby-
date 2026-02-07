# 📆 Relatório dia 24 - Início do minijogo
- **Data:** 04/02/2026
- **Foco:** Criando a base do minijogo e resolver mini bugs

---

### ✅ O que eu fiz hoje:
#### 1. Correção de pequenos bugs
- **Comer Vs Carinho:** Impedi de que o Ubby possa receber carinho com clique enquanto come, porque isso dava conflito na animação. Fiz isso criando uma variável para sinalizar quando está na sala, bloqueando o carinho se a variável for falsa;
- **Comida duplicada:** Quando o player comprava a comida uma vez, ela ficava se repetindo até que a cena da cozinha fosse fechada, o que deixava aquela comida infinita naquele momento, agora o sistema verifica o inventário toda vez que come, e não apenas quando a cena inicia;

#### 2. Cena do minijogo
- **Cenário:** Fiz um fundo simples, apenas um panel rosa pro fundo e um marrom para o chão;
- **Animação Ubby:** Criei uma animação simples dele andando de lado;
- **Cesto de moedas:** Um chapéu que não pode ser comprado, um cesto de palha que fica na cabeça do Ubby, onde as moedas vão cair no minijogo. Talvez no futuro dê pra ganhar esse chapéu para utilizar em qualquer local ao completar uma conquista relacionada ao minijogo;
- **Asset de bomba:** Fiz uma bomba para cair junto com as moedas, o que tira vidas do jogador, ao gastar 3 vidas perde;

#### 3. Menu de jogos
- Criei um menu inicial, como futuramente vou colocar mais alguns minijogos, esse seria o local de seleção, mas ao mesmo tempo vai ser onde ao selecionar o jogo vai desaparecer as outras opções e mostrar título do minijogo e como jogá-lo;
- Por enquanto aparece só essa parte informacional, já que só tem um minijogo, depois adicionarei a parte de opções;

---

### 🧠 Aprendizados e dificuldades
Passei a maior parte do dia sem luz, consegui fazer artes de manhã pelo celular e o resto fiz à noite;

---

### 🚀 Próximos passos
- Focar na lógica do minijogo;
