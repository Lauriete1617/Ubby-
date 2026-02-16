# 📆 Relatório dia 17 - UI do minijogo
- **Data:** 10/02/2026
- **Foco:** Lógica e UI de game over e timer da partida

---

### ✅ O que eu fiz hoje:
#### 1. Timer da partida
- **`Timer`:** Criei um timer que inicia automaticamente ao abrir a cena e dura 45 segundos;
- **`TextureProgressBar`:** Usei os mesmos arquivos que usei para as barras de progresso dos status do Ubby, mas a forma de preenchimento segue o sentido horário, dando uma estética de relógio e colocando mais "pressão" no jogo;
- **`Label`:** Coloquei um label no centro mostrando quantos segundos faltam para acabar, usando `ceil()` e `int()` para transformar uma variável float em inteira ao ser exibida;
- **Script:** Quando esse tempo acaba o dinheiro da partida é convertido em dinheiro fora do minijogo, se acabarem as vidas antes do tempo acabar não recebe as moedas;

#### 2. Vidas
- Você começa com 3, se perde todas é game over;
- Aproveitei o asset de coração usado nas partículas de carinho para a UI das vidas;
- Uso de `modulate.a` (transparência) para manter o layout fixo quando se perde vida, em vez de destruir o objeto;

#### 3. Tela de Game Over
- Criação do layout com um panel, e label mostrando moedas, vidas e score da partida com ícone do lado. No final tem 2 botões, um para jogar novamente e outro para voltar para a cena da casa;
- Lógica no script de deixar invisível até que dê game over;

<img width="400" alt="image" src="https://github.com/user-attachments/assets/e7fc2797-4211-4607-ba7d-bbb647ce4514" />

---

### 🚀 Próximos passos
- Lógica de pause;
- Revisão de bugs ao longo do jogo todo;
