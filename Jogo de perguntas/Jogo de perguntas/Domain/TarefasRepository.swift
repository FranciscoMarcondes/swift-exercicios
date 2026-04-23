import Foundation

protocol TarefasRepository {
    func carregar() throws -> [Tarefa]
    func salvar(_ tarefas: [Tarefa]) throws
}
