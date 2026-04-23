import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: TarefasViewModel

    init() {
        let repository = UserDefaultsTarefasRepository()
        let useCase = GerenciarTarefasUseCase(repository: repository)
        _viewModel = StateObject(wrappedValue: TarefasViewModel(useCase: useCase))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                HStack {
                    TextField("Nova tarefa", text: $viewModel.textoNovaTarefa)
                        .textFieldStyle(.roundedBorder)

                    Button("Adicionar") {
                        viewModel.adicionarTarefa()
                    }
                    .buttonStyle(.borderedProminent)
                }

                Picker("Filtro", selection: $viewModel.filtroSelecionado) {
                    ForEach(TarefasViewModel.Filtro.allCases) { filtro in
                        Text(filtro.rawValue).tag(filtro)
                    }
                }
                .pickerStyle(.segmented)

                List {
                    ForEach(viewModel.tarefasFiltradas) { tarefa in
                        HStack(spacing: 12) {
                            Button {
                                viewModel.alternarConclusao(id: tarefa.id)
                            } label: {
                                Image(systemName: tarefa.concluida ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(tarefa.concluida ? .green : .gray)
                            }
                            .buttonStyle(.plain)

                            Text(tarefa.titulo)
                                .strikethrough(tarefa.concluida)
                                .foregroundStyle(tarefa.concluida ? .secondary : .primary)
                        }
                    }
                    .onDelete(perform: viewModel.removerTarefa)
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("Jogo de perguntas")
        }
    }
}

#Preview {
    ContentView()
}
