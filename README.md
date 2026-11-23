# Redes, Cloud & Qualidade — Projeto Integrador (ADS)

Aplicação interativa desenvolvida em **Flutter** para o projeto integrador do curso de Análise e Desenvolvimento de Sistemas (**ADS**), integrando conceitos de **Redes de Computadores / Cloud** e **Qualidade de Software** sem necessidade de backend ou banco de dados.

- **Entrega prevista:** 05/12/2026
- **Tecnologias:** Flutter / Dart

---

## Módulos da aplicação

1. **Princípios Básicos de Redes (`lib/screens/principios_redes_screen.dart`)**
   - Exploração de fundamentos de redes e cloud com filtros interativos (`Todos`, `Fundamentos`, `Endereçamento`, `Cloud`).
2. **Caminho do Dado até o Destinatário (`lib/screens/caminho_dado_screen.dart`)**
   - Percurso passo a passo do tráfego de rede (encapsulamento, meio físico/sinal, roteador/NAT/gateway, ISP/backbone/nuvem e entrega final), com barra de progresso, seleção por etapa e verificação rápida.
3. **Qualidade de Software no App (`lib/screens/qualidade_screen.dart`)**
   - Aplicação prática de critérios de qualidade (usabilidade, modularização e confiabilidade) ao próprio projeto, acompanhada de um checklist interativo de verificação.

---

## Estrutura de pastas

```text
lib/
├── main.dart                         # Rotas centralizadas e HomeScreen
└── screens/
    ├── principios_redes_screen.dart  # Módulo 1: Princípios de Redes
    ├── caminho_dado_screen.dart      # Módulo 2: Caminho do Dado
    └── qualidade_screen.dart         # Módulo 3: Qualidade de Software