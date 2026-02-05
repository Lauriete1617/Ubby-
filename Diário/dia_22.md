# 📆 Relatório dia 22 - Menu principal e configurações
- **Data:** 01/02/2026
- **Foco:** Criação do menu principal e menu de configurações

---

### ✅ O que eu fiz hoje:
#### 1. Acesso ao mercado pela cozinha
- Fiz com que quando você está na cena da cozinha também possa clicar na geladeira para ir ao mercado;

#### 2. Menu principal
Criei o menu principal do jogo, o coloquei como cena de inicialização padrão e tem os seguintes itens:
- **Letreiro:** O mesmo letreiro que fiz ontem escrito "Ubby!", ficou no topo da tela;
- **Botão iniciar:** Botão que leva à cena da casa, onde a maior parte das atvidades é possível;
- **Botão de opções:** Leva ao menu de configurações do jogo;
- **Botão para sair:** Ao apertar fecha o jogo;
- **Panel `Background`:** Coloquei para por um azul marinho de fundo, contrastando com o logo claro;

#### 3. Menu de configurações
Criei uma cena separada que pode ser chamada de mais de um local, aqui são feitos os ajustes técnicos com as preferências do jogador;
- **Panels:** Fiz um de fundo com a mesma cor do menu principal e um segundo menur centralizado rosa, dando contraste e destacando os itens;
- **Sliders:** Fiz dois sliders, um para controlar o volume dos efeitos sonoros e outro para controlar o volume da música de fundo;
- **`CheckButton` de tela cheia:** Quando marcado ele deixa o jogo em tela cheia, desmarcado fica no modo de janela;
- **Botão de resetar:** Botão para apagar o salvamento com o progresso do jogador, caso a pessoa queira recomeçar;
 - Fiz com que ao clicar nesse botão, o `VBoxContainer` com todos os elementos dentro do panel rosa fiquem invisíveis;
 - Mostra um aviso pedindo confirmação do jogador, para evitar acidentes, e um botão para "sim" e outro para "não";
 - Ao confirmar o arquivo de save é apagado e volta a visualizar as outras opções, mas agora o botão fica desabilitado. Se negar tudo volta ao normal;

#### 3. Design
- **Animações:** Corrigi as animações das comidas mais recentes, que antes só tinham o frame principal;
- **Ícones:** Fiz novos ícones para os seguintes botões:
 - Áudio/Efeitos sonoros;
 - Música;
 - Casa;
 - Menú;
 - Minijogo;
- **Cenário:** Adicionei uma janela, relógio e chaleira na cena da casa, pequenos detalhes que dão vida ao cenário;

---

### 🚀 Próximos passos
- Resolver o bug de ter a possibilidade do Ubby estar no sofá e na cama ao mesmo tempo;
- Fazer com que realmente apague o arquivo de salvamento ao confirmar;
- Planejar o minijogo;
