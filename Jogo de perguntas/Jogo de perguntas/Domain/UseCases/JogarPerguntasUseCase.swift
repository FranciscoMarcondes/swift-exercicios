import Foundation

final class JogarPerguntasUseCase {
    private let repository: PerguntasRepository

    init(repository: PerguntasRepository) {
        self.repository = repository
    }

    func carregarTemas() -> [Tema] {
        repository.carregarTemas()
    }

    func carregarPerguntas(para tema: Tema, dificuldade: Dificuldade) -> [Pergunta] {
        let todas = repository.carregarPerguntas(para: tema)
        let filtradas = todas.filter { $0.dificuldade == dificuldade }
        let base = filtradas.count >= 5 ? filtradas : todas
        return Array(base.shuffled().prefix(5))
    }

    func validarResposta(pergunta: Pergunta, indiceSelecionado: Int) -> Bool {
        pergunta.indiceCorreto == indiceSelecionado
    }
}
