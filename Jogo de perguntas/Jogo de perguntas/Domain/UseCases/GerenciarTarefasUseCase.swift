import Foundation

final class GerenciarTarefasUseCase {
    private let repository: TarefasRepository

    init(repository: TarefasRepository) {
        self.repository = repository
    }

    func carregarTarefas() -> [Tarefa] {
        (try? repository.carregar()) ?? []
    }

    func adicionar(titulo: String, em tarefas: [Tarefa]) -> [Tarefa] {
        let tituloLimpo = titulo.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !tituloLimpo.isEmpty else { return tarefas }

        var atualizadas = tarefas
        atualizadas.insert(Tarefa(titulo: tituloLimpo), at: 0)
        persistir(atualizadas)
        return atualizadas
    }

    func alternarConclusao(id: UUID, em tarefas: [Tarefa]) -> [Tarefa] {
        var atualizadas = tarefas

        guard let indice = atualizadas.firstIndex(where: { $0.id == id }) else {
            return tarefas
        }

        atualizadas[indice].concluida.toggle()
        persistir(atualizadas)
        return atualizadas
    }

    func remover(at offsets: IndexSet, em tarefas: [Tarefa]) -> [Tarefa] {
        var atualizadas = tarefas
        for index in offsets.sorted(by: >) {
            guard atualizadas.indices.contains(index) else { continue }
            atualizadas.remove(at: index)
        }
        persistir(atualizadas)
        return atualizadas
    }

    private func persistir(_ tarefas: [Tarefa]) {
        try? repository.salvar(tarefas)
    }
}
