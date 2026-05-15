//
//  MesView.swift
//  GestorDespesas
//
//  Created by GitHub Copilot on 15/05/26.
//

import SwiftUI
import CoreData

struct MesView: View {
    let mes: Int
    let ano: Int
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Controla se o formulário de nova despesa está visível
    @State private var mostrarFormulario = false
    
    // Lista com os nomes dos meses (para exibir no título)
    private let nomesMeses = [
        "Janeiro", "Fevereiro", "Março", "Abril",
        "Maio", "Junho", "Julho", "Agosto",
        "Setembro", "Outubro", "Novembro", "Dezembro"
    ]
    
    // FetchRequest com predicado — filtra só as despesas do mês e ano escolhidos.
    // Em SQL seria: SELECT * FROM Despesa WHERE mes = ? AND ano = ? ORDER BY data DESC
    var fetchRequest: FetchRequest<Despesa>
    var despesas: FetchedResults<Despesa> { fetchRequest.wrappedValue }
    
    init(mes: Int, ano: Int) {
        self.mes = mes
        self.ano = ano
        
        // NSPredicate é como a cláusula WHERE do SQL
        let predicado = NSPredicate(
            format: "mes == %d AND ano == %d",
            Int16(mes), Int16(ano)
        )
        
        fetchRequest = FetchRequest<Despesa>(
            sortDescriptors: [NSSortDescriptor(keyPath: \Despesa.data, ascending: false)],
            predicate: predicado,
            animation: .default
        )
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Card com o total do mês
            TotalDoMesCard(total: totalDoMes)
                .padding()
            
            // Lista de despesas
            if despesas.isEmpty {
                // Estado vazio — boa prática de UX
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .font(.system(size: 50))
                        .foregroundColor(.secondary)
                    Text("Nenhuma despesa neste mês")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(despesas) { despesa in
                        LinhaDaDespesa(despesa: despesa)
                    }
                    // Swipe para deletar — .onDelete chama deletarDespesas()
                    .onDelete(perform: deletarDespesas)
                }
            }
        }
        .navigationTitle(nomesMeses[mes - 1])
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            // Botão "+" no canto superior direito
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    mostrarFormulario = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        // sheet apresenta uma tela modal (como um dialog em Java Swing/FX)
        .sheet(isPresented: $mostrarFormulario) {
            AdicionarDespesaView(mes: mes, ano: ano)
        }
    }
    
    // Soma o valor de todas as despesas listadas
    private var totalDoMes: Double {
        despesas.reduce(0) { $0 + $1.valor }
    }
    
    // Função chamada ao deslizar para deletar.
    // indexSet contém a posição do item na lista.
    private func deletarDespesas(offsets: IndexSet) {
        withAnimation {
            offsets.map { despesas[$0] }.forEach { despesa in
                // context.delete() marca o objeto para remoção
                viewContext.delete(despesa)
            }
            // context.save() efetivamente grava no banco — como em.flush() no JPA
            salvarContexto()
        }
    }
    
    // Salva o contexto e trata erros
    private func salvarContexto() {
        do {
            try viewContext.save()
        } catch {
            print("Erro ao salvar: \(error.localizedDescription)")
        }
    }
}

// MARK: - Card do Total
struct TotalDoMesCard: View {
    let total: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Total do mês")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                Text(total.moeda)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "chart.bar.fill")
                .font(.system(size: 40))
                .foregroundColor(.white.opacity(0.4))
        }
        .padding()
        .background(
            // Gradiente do card — vermelho escuro para laranja
            LinearGradient(
                colors: [Color.red.opacity(0.8), Color.orange],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(16)
    }
}

// MARK: - Linha de uma despesa na lista
struct LinhaDaDespesa: View {
    let despesa: Despesa
    
    var body: some View {
        HStack(spacing: 12) {
            
            // Ícone colorido da categoria
            if let categoria = Categoria(rawValue: despesa.categoria ?? "") {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(categoria.cor.opacity(0.2))
                        .frame(width: 44, height: 44)
                    Image(systemName: categoria.icone)
                        .foregroundColor(categoria.cor)
                }
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(despesa.nome ?? "Sem nome")
                    .font(.headline)
                Text(despesa.categoria ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(despesa.valor.moeda)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    MesView(mes: 1, ano: 2026)
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
