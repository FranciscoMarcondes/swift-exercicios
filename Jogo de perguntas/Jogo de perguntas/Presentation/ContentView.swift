import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: JogoPerguntasViewModel

    init() {
        let repository = PerguntasLocaisRepository()
        let useCase = JogarPerguntasUseCase(repository: repository)
        _viewModel = StateObject(wrappedValue: JogoPerguntasViewModel(useCase: useCase))
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                switch viewModel.faseAtual {
                case .selecaoTema:
                    Text("Escolha um tema")
                        .font(.title2)
                        .bold()

                    TextField("Nome do jogador", text: $viewModel.nomeJogador)
                        .textFieldStyle(.roundedBorder)

                    Picker("Dificuldade", selection: $viewModel.dificuldadeSelecionada) {
                        ForEach(Dificuldade.allCases) { dificuldade in
                            Text(dificuldade.rawValue).tag(dificuldade)
                        }
                    }
                    .pickerStyle(.segmented)

                    ForEach(viewModel.temas) { tema in
                        Button(tema.rawValue) {
                            viewModel.selecionarTema(tema)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(!viewModel.podeIniciar)
                    }

                case .pergunta:
                    if let pergunta = viewModel.perguntaAtual {
                        Text("Tema: \(viewModel.temaSelecionado?.rawValue ?? "-")")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text("Dificuldade: \(viewModel.dificuldadeSelecionada.rawValue)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text("Pergunta \(viewModel.numeroPerguntaAtual) de \(viewModel.totalPerguntas)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text("Pulos restantes: \(viewModel.pulosRestantes)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        Text(pergunta.enunciado)
                            .font(.title3)
                            .bold()

                        ForEach(Array(pergunta.opcoes.enumerated()), id: \.offset) { indice, opcao in
                            Button {
                                viewModel.responder(indice: indice)
                            } label: {
                                HStack {
                                    Text(opcao)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 12)
                                .background(corOpcao(indice: indice, pergunta: pergunta))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .buttonStyle(.plain)
                            .disabled(viewModel.indiceSelecionado != nil)
                        }

                        if viewModel.indiceSelecionado != nil {
                            Text(viewModel.feedbackResposta)
                                .font(.headline)
                                .foregroundStyle(viewModel.feedbackResposta.hasPrefix("Correto") ? .green : .red)

                            Button(
                                viewModel.numeroPerguntaAtual == viewModel.totalPerguntas
                                ? "Finalizar"
                                : "Proxima pergunta"
                            ) {
                                viewModel.proximaPergunta()
                            }
                            .buttonStyle(.borderedProminent)
                        } else {
                            Button("Pular pergunta") {
                                viewModel.pularPergunta()
                            }
                            .buttonStyle(.bordered)
                            .disabled(viewModel.pulosRestantes == 0)
                        }
                    }

                case .resultado:
                    Text("Resultado final")
                        .font(.title2)
                        .bold()

                    Text("Tema: \(viewModel.temaSelecionado?.rawValue ?? "-")")
                    Text("Jogador: \(viewModel.nomeJogadorExibicao)")
                    Text("Acertos: \(viewModel.acertos)")
                    Text("Incorretas: \(viewModel.erros)")
                    Text("Pulos usados: \(2 - viewModel.pulosRestantes)")

                    Button("Escolher tema novamente") {
                        viewModel.voltarParaTemas()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .navigationTitle("Jogo de perguntas")
            .alert("Ranking", isPresented: $viewModel.mostrarDialogRanking) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("\(viewModel.nomeJogadorExibicao) fez \(viewModel.acertos) acertos.")
            }
        }
    }

    private func corOpcao(indice: Int, pergunta: Pergunta) -> Color {
        guard let selecionado = viewModel.indiceSelecionado else {
            return Color(.secondarySystemBackground)
        }

        if indice == pergunta.indiceCorreto {
            return .green.opacity(0.2)
        }

        if indice == selecionado {
            return .red.opacity(0.2)
        }

        return Color(.secondarySystemBackground)
    }
}

#Preview {
    ContentView()
}
