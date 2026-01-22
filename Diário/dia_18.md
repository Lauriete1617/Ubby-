# 📆 Relatório dia 18 - Edição de áudio
- **Data:** 21/01/2026
- **Foco:** Edição dos áudios presentes no projeto

---

### ✅ O que eu fiz hoje:
#### 1. Edição dos áudios
Editei todos os áudios que escolhi anteriormente no `Audacity`, melhorando qualidade do som, cortando momentos de silêncio e convertendo todos esses efeitos sonoros para `.wav`, para manter um padrão otimizado;
- Mudei no script para que ele aceite tanto `.mp3` quanto `.wav`;

  <img width="400" alt="image" src="https://github.com/user-attachments/assets/0452f0d8-aaf2-4f19-ac6b-ea41cc1e6076" />


#### 2. Correção das partículas
Quando eu mexi na escala do Ubby e seus acessórios, me esqueci de fazer o mesmo com as partículas de corações e de estrelas, então elas estavam ficando gigantes. Para resolver isso eu mexi nas seguintes propriedades do `CPUParticles2D`:
- `Scale Amount Max`: Mudei de 1.0 para 0.4, o mínimo mantive como estava (0.1);
- `Sphere Radius`: Mudei de 45px para 25px;

<img width="500" alt="image" src="https://github.com/user-attachments/assets/79731789-1faf-42aa-9494-bc08f9181844" />

---

### 🚀 Próximos passsos
- Continuar a lógica da cozinha e alimentação em geral;
- Planejar como vão funcionar os estados de fome, energia e felicidade;
