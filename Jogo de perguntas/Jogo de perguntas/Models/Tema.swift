import Foundation

enum Tema: String, CaseIterable, Identifiable, Codable {
    case historia = "Historia"
    case fisica = "Fisica"
    case geografia = "Geografia"
    case matematica = "Matematica"

    var id: String { rawValue }
}
