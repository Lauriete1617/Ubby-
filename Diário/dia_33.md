# 📅 Relatório dia 33 - Desmaio e encenação
- **Data:** 02-04/03/2026
- **Foco:** Lógica do desmaio e atuação do Ubby

---

### ✅ O que eu fiz
#### 1. Atuação do Ubby
- **Animação:** Fiz uma animação dele passando mal que roda logo antes da tela escurecer e ele desmaiar;
- **Efeito sonoro:** Coloquei um efeito sonoro que toca quando a tela escurece, dando a entender que o ubby caiu no chão;

#### 2. Lógica global
- **Variável de permissão:** Criei uma variável para dar permissão (ou não) em certos locais, já que nem todos vai dar pra desmaiar. Além disso, essa variável impede que o desmaio entre em loop;
- **Lógica de problemas:** No `_process`, eu coloquei pra verificar quando algum dos status zera, e se isso acontece, soma a variável `problemas`, quando a variável chega a 2 ou mais, chama a função desmaio. Fiz isso para equilibrar a dificuldade, pois queria que o desmaio ocorresse a cada vez que 2 ou mais status zerem;
- **`emit_signal` + `desmaio()`:**  Criei uma função chamada `desmaio()`, que quando chamada emite o sinal de `"ubby_desmaiou"`;
- **Função `aplicar_penalidade_desmaio()`:** Essa função é chamada após o desmaio, aplicando as consequências da chegada ao hospital, sendo elas:
  - Coloca todos os status como 20, para que ele não desmaie depois e pra mostrar que ele recebeu algum tratamento lá;
  - Cobra 200 moedas (ou menos se o player não tiver o suficiente, zerando a carteira), pra pagar o tratamento no hospital. No final já chamo a função `salvar_jogo()`;

#### 3. Lógica na casa e tela preta
- **Tela preta:** Fiz um `ColorRect` preto cobrindo toda a câmera, mas que deixo invisível no editor para não me atrapalhar a editar as outras coisas. Coloquei algumas configurações no `_ready` da casa, sendo elas:
  - A tela preta fica visível, porque senão não adiantariam as próximas configurações;
  - Usei `modulate` para deixar essa tela transparente inicialmente;
  - Fiz com que o mouse ignore essa tela inicialmente, usando `tela_preta.mouse_filter = Control.MOUSE_FILTER_IGNORE`;
- **Conectando o sinal do global:** Também no `_ready`, conectei a função `iniciar_desmaio` ao sinal emitido no global que mencionei anteriormente, então quando esse sinal é disparado, a função é chamada. Além disso, a variável `pode_desmaiar` aqui é marcada como true;
- **Função `iniciar_desmaio`:** Nessa função tudo relacionado ao desmaio ocorre, e ela é dividida em etapas, sendo elas:
  - **Travar tudo:** Travar cliques para evitar conflitos de animação, bugs ou que o desmaio seja interrompido. Faço isso através dos seguintes comandos:
    - `tela_preta.mouse_filter = Control.MOUSE_FILTER_STOP`: Faz com que o mouse pare de ignorá-la;
    - `set_process(false)`: Faz com que o resto do script pare de funcionar, impedindo que as outras funções ocorram;
    - `ubby.set_process(false)`: Interrompe os processos da cena do Ubby também;
  - **Ubby faz seu drama:** Toca a animação do Ubby de passando mal e espera ela terminar para a próxima etapa;
  - **Tela preta e som de queda:** Tiro a música de fundo, faço a tela ir escurecendo até ficar completamente preta e depois toca o efeito sonoro do desmaio, através dos seguintes comandos:
    - `AudioManager.fade_out()`;
    - `var tween = create_tween()`;
    - `tween.tween_property(tela_preta, "modulate:a", 1.0, 2.0)`;
    - `await tween.finished`;
    - `if ubby.sfx_desmaio: `;
    - `	ubby.sfx_desmaio.play()`;
    - `	await ubby.animation.animation_finished`;
  - **Vai pro hospital:** Chama a função do `global` `aplicar_penalidade_desmaio()` e depois leva à cena do hospital;
- **Função `_exit_tree`:** Tira a permissão de desmaiar pra garantir, além de desconectar o sinal do global de desmaio, já que não é mais necessário e poderia gerar loops;
---

### 🧠 Aprendizados e dificuldades
- Eu não conhecia o comando `emit_signal`, muito menos como usá-lo;
- Também não conhecia a função `_exit_tree`, que ocorre toda vez que o player sai daquela cena;
- Tem dois bugs que ainda não consegui resolver, um deles é que, depois que a tela fica preta, não tá indo pro hospital. E o outro é toca a animação de idle do Ubby antes da tela ficar completamente preta. Vou trabalhar nisso assim que puder;

---

### 🚀 Próximos passos
- Resolver bug de não trocar pro hospital ao desmaiar;
- Animação de sono e de alguns objetos para dar mais vida ao mundo;
- Consumo dos remédios comprados na cozinha;
- Permitir que o desmaio possa ocorrer na cozinha também, replicando a mesma lógica da casa;
- Fazer o efeito contrário da tela preta no hospital;
