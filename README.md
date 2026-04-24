# Swift Exercicios

Repositorio com exercicios de Swift organizados por assunto.

## Estrutura

- `Playgrounds/01-Fundamentos/`: logica, condicionais, repeticao e arrays
- `Playgrounds/02-Concorrencia/`: funcoes assincronas e paralelismo
- `Playgrounds/03-Protocolos-E-Generics/`: protocolos, structs e CRUD generico
- `Jogo de perguntas/`: app iOS em SwiftUI com arquitetura em camadas e quiz por tema

## Como abrir

- Abra qualquer arquivo `.playground` no Xcode
- Cada pasta representa um assunto especifico para facilitar estudo e revisao

## Projeto SwiftUI

O projeto `Jogo de perguntas` implementa um quiz com:

- selecao de tema
- 5 perguntas por rodada
- dificuldade facil, media e dificil
- nome do jogador
- opcao de pular pergunta
- resultado final com ranking

### Arquitetura

- `Models/`
- `Domain/`
- `Data/`
- `Presentation/`

### Como executar

1. Abra `Jogo de perguntas/Jogo de perguntas.xcodeproj`
2. Selecione um simulador iOS
3. Rode com Cmd + R
