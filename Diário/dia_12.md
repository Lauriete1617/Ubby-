# 📆 Relatório dia 12 - Móveis e mercado
- **Data:** 15/01/2026
- **Foco:** Lógica dos móveis, correção de bugs e início do mercado;

---

### ✅ O que eu fiz hoje:
#### 1. Resolução de bugs
- **Escala:** Ajeitei a escala do Ubby e de todos os slots de acessórios e roupas;
- **Bug do "fantasma":** Resolvi o problema do sprite não acompanhar o resto da cena trocando os `Nodes` por `Node2Ds`, removi o `AnimationPlayer` e corrigi os caminhos e nomes no script;

#### 2. Lógica das interações na casa
- **TV e sofá:** Ao clicar na TV você liga ela, toca uma animação trocando os canais e o Ubby fica sentadinho no sofá, fiz uma animação no sofá dele sentado enquanto a cena original some, e quando a TV desliga o Ubby volta pro meio da sala;
- **Armário:** Ao clicar no armário, rola uma animação da porta dele abrindo e então a cena muda para a central de estilo;
- **Cama e Abajur:** Criei a função `atualizar_visual()` que gerencia 4 estados combinados (Luz Acesa/Apagada + Cama Vazia/Ocupada). Agora o Ubby deita, dorme e a luz pode ser acesa ou apagada independentemente;
- **Geladeira:** Criei a animação da porta abrindo quando clica, futuramente será onde acessa o mercado, para comprar as comidas;

#### 3. Sistema de comida - Arte e design
- **Planejamento da UI:** Defini a estrutura da Loja de Comida e da Cena da Mesa (separada para dar zoom). O painel da loja terá detalhes ricos (Fome, Felicidade, Bônus);
- **Cardápio:** Defini uma lista de comidas típicas gaúchas e brasileiras (Xis, La Minuta, Churrasco, Açaí, Chimarrão...);
- **Pixel art:** Fiz arte do pão de queijo e do chimarrão;

---

### 🧠 Aprendizados e dificuldades
Lidar com bugs é sempre uma luta com grandes aprendizados, e a gente sempre encontra os motivos mais improváveis kkkk. Hoje o que me leveou mais tempo foi o bug do fantasma. Outra função que foi complicada de achar a lógica perfeita foi a cama com abajur, e a sacada de mudar a animação ao invés de mexer na cena original do Ubby melhorou muito a dinâmica pra mim sem afetar para o jogador;

---

### 🚀 Próximos passos
- Replicar a lógica que usei na central de estilo para o mercado, mas com adaptações;
- Fazer as artes das comidas que estarão no cardápio;
- Cena o Ubby sentado na mesa com zoom e sua UI mostrando o inventário das comidas;
