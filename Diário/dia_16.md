# 📆 Relatório dia 16 - Montando a cozinha
- **Data:** 19/01/2026
- **Foco:** Criação da cena e artes da cozinha;

---

### ✅ O que eu fiz hoje:
#### 1. Cena da cozinha
- **Criação da cena:** Criei uma cena separada para a lógica do Ubby comer, mesmo que ela já apareça na casa, é aqui que reamente ela funciona. Tem o zoom na camera para ele sentadinho atrás da mesa;
- **Composição:** Fiz uma arte aproveitando os assets de balcão, geladeira e fogão para o background, e na frente o Ubby está sentadinho esperando sua comida;
  - Para garantir que tudo aparecesse direitinho, mexi no `z-index`, colocando background em 0, Ubby em 2 e mesa em 10 (tive problemas quando coloquei valores menores);

#### 2. Artes e design
- **Background:** Aproveitei as mesmas texturas usadas na cena da casa e editei para que a perspectiva fizesse sentido em uma cena mais próxima e menor;
- **Ubby:** Fiz a animação dele comendo com garfo e faca na mão, mas na verdade a gente dá comida na boquinha dele(a);
- **Mesa:** Não pude aproveitar o mesmo asset, mas usei as mesmas cores, ficaria estranho por causa da diferença de ângulo;

#### 3. Efeitos sonoros
Implementei os sons de botões das lojas e o som de compra, também escolhi mais alguns para quando tiver a mecânica de comer;

---

### 🚀 Próximos passos
- Implementar a lógica de comer;
- Adicionar ao código os outros sons escolhidos;
- Linkar essa cena com a da casa;
