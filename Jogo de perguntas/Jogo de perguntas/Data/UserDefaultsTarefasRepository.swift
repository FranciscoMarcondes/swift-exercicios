import Foundation

final class UserDefaultsTarefasRepository: TarefasRepository {
    private let userDefaults: UserDefaults
    private let key = "tarefas_storage_v1"

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func carregar() throws -> [Tarefa] {
        guard let data = userDefaults.data(forKey: key) else {
            return []
        }
        return try JSONDecoder().decode([Tarefa].self, from: data)
    }

    func salvar(_ tarefas: [Tarefa]) throws {
        let data = try JSONEncoder().encode(tarefas)
        userDefaults.set(data, forKey: key)
    }
}
