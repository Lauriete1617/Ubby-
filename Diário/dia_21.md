# 📆 Relatório dia 21 - Status do Ubby e problemas técnicos
- **Data:** 31/01/2026
- **Foco:** Ajustes dos status, novas artes e comidas;

---

### ✅ O que eu fiz hoje:
#### 1. Status do Ubby
- **Interface gráfica:** Fiz 3 `TextureProgressBar` personalizzados para indicar os status do Ubby, sendo eles de fome (verde), sono/energia (roxo) e felicidadee (laranja);;
 - **Script:** A interface gráfica tem uma cena própria para ser aproveitada em locais diferentes, e dentro dela fiz um script para atribuir o valor do progresso às respectivas variáveis no script `Global`; 
 - **Implementação:** Adicionei essa cena dentro das cenas da casa e da cozinha;
- **Decaimento:** No script `Global` eu criei uma função `_process` onde todas as variáveis iriam diminuindo o valor na velocidade determinada pela variável `taxa_decaimento` multiplicada por `delta`, fazendo que com o passar do tempo os valores dos status vão diminuindo; 
- **Aumento:** Coloquei para que os respectivos status aumentem conforme atividades correspondentes, sendo elas:
 - **Dormir:** Quando deita na cama a energia vai aumentando com o dobro da velocidade que diminuiria se não estivesse na cama;
 - **Assistir TV:** Ao assistir TV, acontece a mesma coisa que ao dormir, mas ao invés de ser com sono, é com felicidade;
#### 2. Novas artes
- **Ícones UI:** Fiz ícones 14x14 para os `TextureProgressBar` de fome, sono e felicidade;
- **Novas comidas:** Mantive o padrão de 32x32, e adicionei as seguintes comidas no sistema;
 - Água;
 - Batata frita;
 - Suco de uva;
 - Suco de laranja;
 - Sorvete;
- **Letreiro:** Fiz um letreiro em 128x64 escrito "Ubby!" com uma arte no estilo do jogo para o menu principal e imagens promocionais;

---

### 🧠 Aprendizados e dificuldades
Eu fiquei por alguns dias afastada do projeto devido a problemas com o meu notebook, tive que levar para um técnico fazer manutenção e formatação e isso me tomou certo tempo. Além disso, vou ficar sem wi-fi por uma semana, o que pode acabar atrasando algumas coisas, além de ficar dias sem fazer upload pro githubb. Vou fazer o possível para que isso não atrase muito o projeto;

---

### 🚀 Próximos passos
- Corrigir animações de comidas mais recentes;
- Adicionar pontos de luz na casa para melhorar a estética e outros detalhes;
- Criar menu principal e de configurações;
