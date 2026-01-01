# 📑 Documentação Técnica — Ubby

Este documento detalha os requisitos e as especificações técnicas do projeto Ubby, aplicando conceitos de **Engenharia de Software**.

## 🎯 Requisitos Funcionais (RF)
Estes descrevem o que o sistema deve fazer:

| ID | Nome | Descrição |
|:---:|:---|:---|
| **RF01** | Personalização de Cor | O usuário deve poder escolher a cor base do pet através de uma interface. |
| **RF02** | Ciclo de Necessidades | O sistema deve decrementar os níveis de fome, energia e felicidade do Ubby com o passar do tempo. |
| **RF03** | Persistência de Dados | O jogo deve salvar automaticamente o estado do pet (nome, cor, atributos) ao fechar. |
| **RF04** | Minijogo de coleta    | O sistema deve possuir um minijogo onde itens caem do topo da tela e o pet deve coletá-los para gerar moedas virtuais.
| **RF05** | Central de estilo     | O sistema deve possuir uma interface única para aquisição e gerenciamento de itens cosméticos.
| **RF06** | Visualização em tempo real | Ao selecionar ou comprar um item na Central de Estilo, o sprite do pet deve ser atualizado imediatamente na cena principal para refletir a mudança.

## ⚙️ Requisitos Não Funcionais (RNF)
Estes descrevem as qualidades e restrições do sistema:

| ID | Nome | Descrição |
|:---:|:---|:---|
| **RNF01** | Desempenho | O jogo deve ser leve o suficiente para rodar em hardware básico (ex: dispositivos Android de entrada). |
| **RNF02** | Interface | A interface deve seguir a estética Pixel Art com resolução nativa de 64x64 para o personagem. |
| **RNF03** | Escalabilidade | O código deve ser modular para facilitar a adição de novos acessórios futuramente. |
| **RNF04** | Multiplataforma | O sistema deve ser compatível e funcional tanto em ambiente Desktop (Windows/Linux) quanto Mobile (Android) utilizando a engine Godot 4.5. |
| **RNF05** | Design de interface | O jogo deve utilizar uma Cena Única Centralizada (a Minicasa) para as interações de descanso, alimentação e lazer, visando reduzir o tempo de carregamento e simplificar a navegação. |
| **RFN06** | Arquitetura de transição | A mudança entre o menu principal, estado estático da casa e o minijogo de coleta deve ser fluida, sem a necessidade de telas de carregamento (loading screens) perceptíveis. |
| **RFN07** | Persistência e estrutura de dados | O sistema de salvamento deve diferenciar claramente na base de dados (ou arquivo de save) quais itens do inventário estão "Apenas Disponíveis", "Adquiridos" e "Equipados". |

## 🛢️ Estrutura de Dados (Planejamento)
Baseado em conceitos de **Banco de Dados**, os dados do Ubby serão estruturados em um objeto:
- `nome`: String
- `cor_base`: Color (RGBA)
- `fome`: Float (0-100)
- `energia`: Float (0-100)
