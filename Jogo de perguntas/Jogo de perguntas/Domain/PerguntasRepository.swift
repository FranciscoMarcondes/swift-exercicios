import Foundation

protocol PerguntasRepository {
    func carregarTemas() -> [Tema]
    func carregarPerguntas(para tema: Tema) -> [Pergunta]
}
