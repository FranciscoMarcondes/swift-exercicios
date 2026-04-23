import Foundation
import Combine

@MainActor
final class JogoPerguntasViewModel: ObservableObject {
    enum FaseJogo {
        case selecaoTema
        case pergunta
        case resultado
    }

    @Published private(set) var faseAtual: FaseJogo = .selecaoTema
    @Published private(set) var temas: [Tema] = []
    @Published private(set) var temaSelecionado: Tema?
    @Published var nomeJogador = ""
    @Published var dificuldadeSelecionada: Dificuldade = .medio
    @Published private(set) var perguntas: [Pergunta] = []
    @Published private(set) var indiceAtual = 0
    @Published private(set) var acertos = 0
    @Published private(set) var erros = 0
    @Published private(set) var pulosRestantes = 2
    @Published private(set) var indiceSelecionado: Int?
    @Published private(set) var feedbackResposta = ""
    @Published var mostrarDialogRanking = false

    private let useCase: JogarPerguntasUseCase

    init(useCase: JogarPerguntasUseCase) {
        self.useCase = useCase
        temas = useCase.carregarTemas()
    }

    var perguntaAtual: Pergunta? {
        guard perguntas.indices.contains(indiceAtual) else { return nil }
        return perguntas[indiceAtual]
    }

    var numeroPerguntaAtual: Int {
        indiceAtual + 1
    }

    var totalPerguntas: Int {
        perguntas.count
    }

    var podeIniciar: Bool {
        !nomeJogador.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var nomeJogadorExibicao: String {
        let nome = nomeJogador.trimmingCharacters(in: .whitespacesAndNewlines)
        return nome.isEmpty ? "Jogador" : nome
    }

    func selecionarTema(_ tema: Tema) {
        guard podeIniciar else { return }

        temaSelecionado = tema
        perguntas = useCase.carregarPerguntas(para: tema, dificuldade: dificuldadeSelecionada)
        indiceAtual = 0
        acertos = 0
        erros = 0
        pulosRestantes = 2
        indiceSelecionado = nil
        feedbackResposta = ""
        faseAtual = perguntas.isEmpty ? .selecaoTema : .pergunta
    }

    func responder(indice: Int) {
        guard let perguntaAtual else { return }
        guard indiceSelecionado == nil else { return }

        indiceSelecionado = indice
        let acertou = useCase.validarResposta(pergunta: perguntaAtual, indiceSelecionado: indice)

        if acertou {
            acertos += 1
            feedbackResposta = "Correto!"
        } else {
            erros += 1
            let correta = perguntaAtual.opcoes[perguntaAtual.indiceCorreto]
            feedbackResposta = "Incorreto. Resposta correta: \(correta)"
        }
    }

    func proximaPergunta() {
        guard indiceSelecionado != nil else { return }

        if indiceAtual + 1 < perguntas.count {
            indiceAtual += 1
            indiceSelecionado = nil
            feedbackResposta = ""
            return
        }

        faseAtual = .resultado
        mostrarDialogRanking = true
    }

    func pularPergunta() {
        guard faseAtual == .pergunta else { return }
        guard pulosRestantes > 0 else { return }
        guard indiceSelecionado == nil else { return }

        pulosRestantes -= 1

        if indiceAtual + 1 < perguntas.count {
            indiceAtual += 1
            return
        }

        faseAtual = .resultado
        mostrarDialogRanking = true
    }

    func voltarParaTemas() {
        faseAtual = .selecaoTema
        temaSelecionado = nil
        perguntas = []
        indiceAtual = 0
        acertos = 0
        erros = 0
        pulosRestantes = 2
        indiceSelecionado = nil
        feedbackResposta = ""
        mostrarDialogRanking = false
    }
}
