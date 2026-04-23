import Foundation

struct Tarefa: Identifiable, Codable, Equatable {
    let id: UUID
    var titulo: String
    var concluida: Bool
    let criadaEm: Date

    init(id: UUID = UUID(), titulo: String, concluida: Bool = false, criadaEm: Date = Date()) {
        self.id = id
        self.titulo = titulo
        self.concluida = concluida
        self.criadaEm = criadaEm
    }
}
