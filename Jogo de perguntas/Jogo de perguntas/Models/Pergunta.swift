import Foundation

struct Pergunta: Identifiable, Codable, Equatable {
    let id: UUID
    let enunciado: String
    let opcoes: [String]
    let indiceCorreto: Int
    let dificuldade: Dificuldade

    init(
        id: UUID = UUID(),
        enunciado: String,
        opcoes: [String],
        indiceCorreto: Int,
        dificuldade: Dificuldade
    ) {
        self.id = id
        self.enunciado = enunciado
        self.opcoes = opcoes
        self.indiceCorreto = indiceCorreto
        self.dificuldade = dificuldade
    }
}
