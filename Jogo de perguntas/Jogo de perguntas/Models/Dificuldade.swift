import Foundation

enum Dificuldade: String, CaseIterable, Identifiable, Codable {
    case facil = "Facil"
    case medio = "Medio"
    case dificil = "Dificil"

    var id: String { rawValue }
}
