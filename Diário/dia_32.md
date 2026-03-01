# 📅 Relatório dia 32 - Hospital
- **Data:** 21-28/02/2026
- **Foco:** Desenvolvimento lógico do hospital e compra de remédios
- **Observação:** Foram vários dias com pouquíssimo tempo disponível, então os uni em apenas um documento;

--- 

### ✅ O que eu fiz:
#### 1. Novos sprites
- **Monitor cardíaco:** Para dar um ar a mais de hospital, por enquanto ele é apenas estático, mas futuramente quero colocá-lo para ter uma animação na tela mostrando os batimentos;
- **Estante com remédios:** Fiz a arte de uma estante quadrada com 2 andares, onde nela ficam expostas as opções de remédios para compra, sendo eles:
  - Remédios individuais que enchem algum status específico (fome, energia ou felicidade);
  - Kit completo, mais caro, mas enche todos os status ao máximo;
- **Ícone de saúde:** Usado no botão que leva ao hospital;
<img width="500" alt="image" src="https://github.com/user-attachments/assets/f1959916-1905-4915-b0ad-0e0d317f3c50" />
 

#### 2. Interface gráfica (UI):
- Fiz um painel que fica visível ao clicar na estante de remédios, onde dá pra comprar cada um;
- Lógica de compra semelhante a como foi feito com a comida;
- Botões que fazem a troca de visualização entre painel e cena, bem como botão para voltar para casa;
- Chamei a cena do exibidor de status, o mesmo utilizado na casa;
<img width="500" alt="image" src="https://github.com/user-attachments/assets/9b1bdba8-40aa-4ba5-ad42-b7498a9d3053" />

#### 3. Objetos
- **Cama e abajur:** Repliquei a mesma lógica usada na casa para dormir e acender ou apagar o abajur, através de um `PointLight2D` filho do abajur;
- **Monitor cardícado:** O monitor cardíaco tem um efeito sonoro de volume baixo e frequente, futuramente irei adicionar uma animação também;
- **Roupa hospitalar:** Enquanto o Ubby está exclusivamente neste local, ele estará vestindo a roupa hospitalar;
- **Estante de remédios:** Onde tem o acesso à loja de remédios do hospital;

#### 4. Áudio
- Escolha da música de fundo do hospital e escolha dos seguintes efeitos sonoros:
  - Monitor cardíaco;
  - Botão;
  - Compra;
  - Ronco do Ubby;
  - Abajur;

#### 5. Planejamento das emoções
- Estou fazendo animações para as emoções, começando pela de tristeza/fome que roda quando algum desses 2 status fique igual ou menor a 30;
- Se não estiver com fome e nem triste, mas estiver com sono, terá uma outra animação;
- Se todos chegarem a zero, será quando ele desmaia e vai parar no hospital;
- Caso ele esteja bem, roda a animação padrão;
   
---

### 🧠 Aprendizados e dificuldades:
- Antes de formatar o PC, tive problemas com o update do windows 11 que alterou alguns caminhos no meu computador no geral, incluindo os do projeto, então eu tive de fazer muitas correções após trocar para o Linux Mint;
- Dificuldade de planejamento da lógica de desmaio;

---

### 🚀 Próximos passos:
- Local e lógica de consumo dos remédios em casa, provavelmente na cena da cozinha;
- Lógica de desmaio e cobrança do hospital;
- Animações de sono, desmaio e vitória no minigame;
- Animação do monitor cardíaco e aumentar a animação da TV de casa com mais canais;
- Começar a aprender e implementar tradução para o inglês;
- Adaptações para mobile;
- Cutscene adotando o Ubby;
