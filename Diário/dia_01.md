# 📅 Relato do Dia 01 — Planejamento e Estruturação do Ubby

- **Data:** 01/01/2026
- **Foco do dia:** Definição de escopo, documentação técnica (ADS) e design de sistemas.

---

### ✅ O que eu fiz hoje:

#### 1. Concepção e Design de Produto
- **Nome do Projeto:** Definição do nome **Ubby** para o pet e para o aplicativo.
- **Identidade Visual:** Decisão de utilizar **Pixel Art** (64x64) com uma abordagem de **Grayscale** (tons de cinza) no sprite base para permitir a troca dinâmica de cores via código na Godot.
- **Arquitetura de Cenário:** Consolidação do ambiente em uma **"Minicasa" centralizada**. Esta decisão visa otimizar o desempenho (RNF) e simplificar a navegação do usuário (UX).

#### 2. Engenharia de Requisitos (Princípios de ADS)
- **Requisitos Funcionais (RF):**
    - Mapeamento do sistema de **Personalização de Cores**.
    - Planejamento do **Ciclo de Necessidades** (Fome e Sono).
    - Design da **Central de Estilo**: unificação da Loja e do Vestuário em uma única interface para reduzir a carga cognitiva e simplificar o gerenciamento de estados.
    - Inclusão de um **Minijogo de Coleta** como mecânica principal para ganho de moedas virtuais.
- **Requisitos Não Funcionais (RNF):**
    - Definição de metas de **Portabilidade** (Android/PC) e **Desempenho** para hardware limitado.

#### 3. Gestão de Configuração e Ambiente
- **Versionamento:** Criação do repositório oficial no GitHub com licença **MIT**.
- **Estruturação de Diretórios:** Organização profissional seguindo padrões de desenvolvimento:
    - `/assets`: Recursos de arte e som.
    - `/docs`: Documentação de requisitos (`DOCS.md`).
    - `/logs`: Relatórios diários de progresso.
    - `/src`: Código-fonte e cenas da Godot.

---

### 🧠 Desafios e Aprendizados:
- **Gestão de Escopo:** O maior desafio foi equilibrar o desejo de adicionar muitas funcionalidades com o tempo limitado das férias. A aplicação do conceito de **MVP (Produto Mínimo Viável)** foi essencial para definir o que é prioritário.
- **Refatoração Mental:** Ao analisar projetos anteriores, identifiquei erros de sintaxe e lógica (como o uso de `=+` em vez de `+=` no `game_manager.gd`), o que me ajudou a planejar uma base de código mais limpa para o Ubby.
- **Aprendizados no GitHub:** Não estou familiarizada ainda com a ferramenta, mas fiz grande progresso hoje.
- **Sketchs do Ubby:** Primeiras versões do design do pet, primeiramente no papel e depois em pixel art.
- **Revisão de conceitos de estrutura de requisitos:** Fazia tempo que eu não estudava a respeito de requisitos funcionais e não funcionais, então pôr em prática aqui foi uma boa retomada dos estudos.

---

### 🚀 Próximo Passo:
- Finalizar o sprite base do Ubby e iniciar a criação dos primeiros acessórios (chapéu e laço).
- Configurar o ambiente local clonando o repositório no Linux Mint.
