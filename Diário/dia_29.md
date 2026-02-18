# 📆 Relatório dia 29 - Engenharia de áudio
- **Data:** 16/02/2026
- **Foco:** Gestão das músicas de fundo

---

### ✅ O que eu fiz hoje:
- **Arquitetura:** Criação de um `AudioManager global (Autoload)` para persistir a música entre cenas;
- **Transições:** Implementação de Crossfade (Fade Out / Fade In) usando `Tweens` para evitar cortes bruscos;
- **Importação:** Configuração de `Loop Mode (Forward)` diretamente nas flags de importação dos arquivos .wav;

---

### 🧠 Aprendizados e dificuldades
- Aprendi a fazer fade in e fade out;
- Me dei conta que é melhor ter vários `autoloads` especializados do que um geral;
- Descobri como configurar para áudios serem loops na própria importação deles;

---

### 🚀 Próximos passos
- Planejamento de features extras;
- Adaptações para Android;
