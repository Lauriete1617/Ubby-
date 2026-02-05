# 📆 Relatório dia 23 - Correção de bugs e estética
- **Data:** 03/01/2026
- **Foco:** Corrigir bugs visuais e edição de iluminação na casa

---

### ✅ O que eu fiz hoje:
#### 1. Bug do Ubby duplicado
- **Explicação do problema:** Fiz a kógica dos móveis de cama+tv separados do resto da casa, bem como cama+abajur, para o Ubby interagir eu fazia com que a cena original desaparecesse e abrisse uyma animação no nó do móvel em questão. O problema é que como os scripts eram independentes, eles podiam ser acuionados ao mesmo tempo;
- **Solução:** Criei variáveis no script `Global` para sinalizar quando está dormindo ou assistindo TV, e se uma das variáveis for verdadeira, o script dá `return`;

#### 2. Pontos de luz
- Eu conheci o nó `PointLight2D`, que serve como um ponto de luz personalizado dentro da cena, criei um novo `GradientTexture2D` e o editei para que tivesse forma arredondada e luz suave, depois adicionei como filhos dos seguintes locais:
 - **TV:** Criei uma luz azulada como filho da TV, que é acionada apenas quando a TV está ligada;
 - **Abajur:** Uma luz amarelada que pode ser ligada com o clique do mouse, independentemente se o Ubby está deitado(a) ou não;
 - **Geladeira:** Uma luz branca que aparece quando a geladeira é aberta, ainda precisa de ajustes para parecer mais natural;

#### 3. Tempo de decaimento
- Antes enquanto eu estava fazendo testes, fiz com que os status do Ubby decaíssem bem rápido, mas agora que sei que esta parte está funcionando, diminuí a taxa de decaimento (variável para ajustar o tempo de decaimento) o suficiente para que começe o dia com 100% e termine zerado, justamente com o objetivo de que o jogador faça visitas regulares ao seu pet; Amanhã irei verificar se esse tempo realmente diminuiu;

---

### 🧠 Aprendizados e dificuldades
- Conhecim o `PointLight2D` e aprendi o básico de como ele funciona;
- Tive muita dificuldade para ajustar o tempo de decaimento, até calcular a quantidade de segundos para 24 horas como taxa de decaimento, criar uma variável para guardar quantos segundos se passaram desde a última vez que o jogo foi aberto através dos horários registrados no sistema do dispositivo para assim saber quantos pontos foram perdidos naquele meio tempo offline;
- Demorei pra me acertar com alguns ajustes do ponto de luz, especialmente para deixar arredondado, mas agora que aprendi parece ser super fácil;

---

### 🚀 Próximos passos
- Focar em fazer o minijogo de andar para os lados enquanto moedas (ou bombas) caem do céu, será o primeiro de vários para ganhar moedas dentro do jogo;
- Fazer mais artes de roupas e animações do Ubby, bem como cenário e bomba pro minijogo;
