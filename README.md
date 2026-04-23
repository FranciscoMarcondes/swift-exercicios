# Jogo de perguntas

Projeto iOS em SwiftUI organizado em camadas para facilitar manutencao, testes e evolucao.

## Arquitetura

- Models/Tarefa.swift
- Domain/TarefasRepository.swift
- Domain/UseCases/GerenciarTarefasUseCase.swift
- Data/UserDefaultsTarefasRepository.swift
- Presentation/TarefasViewModel.swift
- Presentation/ContentView.swift

## Funcionalidades

- Adicionar tarefa
- Marcar como concluida
- Remover tarefa
- Filtrar por status (todas, pendentes, concluidas)
- Persistencia local com UserDefaults

## Requisitos

- Xcode 15+
- iOS 17+

## Como executar

1. Abra o projeto:
   - Jogo de perguntas/Jogo de perguntas.xcodeproj
2. Selecione um simulador iOS
3. Rode com Cmd + R

## Boas praticas aplicadas

- Separacao de responsabilidades
- Regra de negocio isolada em UseCase
- Persistencia desacoplada por protocolo
- ViewModel como fonte de estado da UI
- Codigo preparado para testes unitarios

## Publicacao no GitHub

Se quiser publicar este projeto como repositorio proprio, use:

1. cd "jogo-de-perguntas"
2. git init
3. git add .
4. git commit -m "feat: estrutura inicial em camadas"
5. git branch -M main
6. git remote add origin <URL_DO_REPOSITORIO>
7. git push -u origin main
