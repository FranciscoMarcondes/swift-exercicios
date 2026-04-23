import Foundation
import Combine

@MainActor
final class TarefasViewModel: ObservableObject {
    enum Filtro: String, CaseIterable, Identifiable {
        case todas = "Todas"
        case pendentes = "Pendentes"
        case concluidas = "Concluidas"

        var id: String { rawValue }
    }

    @Published var textoNovaTarefa = ""
    @Published private(set) var tarefas: [Tarefa] = []
    @Published var filtroSelecionado: Filtro = .todas

    private let useCase: GerenciarTarefasUseCase

    init(useCase: GerenciarTarefasUseCase) {
        self.useCase = useCase
        self.tarefas = useCase.carregarTarefas()
    }

    var tarefasFiltradas: [Tarefa] {
        switch filtroSelecionado {
        case .todas:
            return tarefas
        case .pendentes:
            return tarefas.filter { !$0.concluida }
        case .concluidas:
            return tarefas.filter { $0.concluida }
        }
    }

    func adicionarTarefa() {
        tarefas = useCase.adicionar(titulo: textoNovaTarefa, em: tarefas)
        textoNovaTarefa = ""
    }

    func alternarConclusao(id: UUID) {
        tarefas = useCase.alternarConclusao(id: id, em: tarefas)
    }

    func removerTarefa(at offsets: IndexSet) {
        let idsFiltrados = offsets.compactMap { tarefasFiltradas[safe: $0]?.id }
        let offsetsOriginais = IndexSet(
            idsFiltrados.compactMap { id in tarefas.firstIndex(where: { $0.id == id }) }
        )
        tarefas = useCase.remover(at: offsetsOriginais, em: tarefas)
    }
}

private extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
