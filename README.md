# Jogo de perguntas

Projeto iOS em SwiftUI organizado em camadas para facilitar manutencao, testes e evolucao.

## Arquitetura

- Models/Tema.swift
- Models/Pergunta.swift
- Domain/PerguntasRepository.swift
- Domain/UseCases/JogarPerguntasUseCase.swift
- Data/PerguntasLocaisRepository.swift
- Presentation/JogoPerguntasViewModel.swift
- Presentation/ContentView.swift

## Funcionalidades

- Selecionar tema no inicio do jogo
- Fazer 5 perguntas do tema escolhido
- Exibir 4 opcoes por pergunta (1 correta)
- Informar se acertou ou errou
- Quando errar, mostrar a resposta correta
- Ao final mostrar acertos e incorretas
- Voltar para selecao de temas para reiniciar

## Opcionais implementados

- Perguntas aleatorias a cada rodada
- Banco com mais de 5 perguntas por tema
- Nome do jogador e dialog de ranking no final
- Niveis de dificuldade (facil, medio, dificil)
- Opcao de pular pergunta com limite de 2 pulos

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
- Dados desacoplados por protocolo de repository
- ViewModel como fonte de estado da tela
- UI simples e previsivel para estudo

## Publicacao no GitHub

Se quiser publicar este projeto como repositorio proprio, use:

1. cd "jogo-de-perguntas"
2. git init
3. git add .
4. git commit -m "feat: jogo de perguntas em camadas"
5. git branch -M main
6. git remote add origin <URL_DO_REPOSITORIO>
7. git push -u origin main
