//
//  ContentView.swift
//  GestorDespesas
//
//  Created by Francisco Marcondes da Silva Junior on 15/05/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // Busca o contexto do Core Data injetado pelo App
    @Environment(\.managedObjectContext) private var viewContext
    
    // Ano atual, usado para filtrar as despesas
    private let anoAtual = Calendar.current.component(.year, from: Date())
    
    // Lista com os nomes dos 12 meses
    private let meses = [
        "Janeiro", "Fevereiro", "Março", "Abril",
        "Maio", "Junho", "Julho", "Agosto",
        "Setembro", "Outubro", "Novembro", "Dezembro"
    ]
    
    // Buscamos TODAS as despesas do ano para calcular totais por mês.
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Despesa.mes, ascending: true)],
        animation: .default
    )
    private var todasDespesas: FetchedResults<Despesa>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(1 ... 12, id: \.self) { numeroMes in
                    NavigationLink(destination: MesView(mes: numeroMes, ano: anoAtual)) {
                        LinhaDoMes(
                            nomeMes: meses[numeroMes - 1],
                            numeroMes: numeroMes,
                            totalGasto: totalDoMes(mes: numeroMes)
                        )
                    } // fechando naviationLinl
                } //fechando foreach
            }// fechando List
            .navigationTitle("💰 Despesas \(anoAtual)")
        }// fechando NavigationStack
    }// fechando body
    
    
    
    
    // Função auxiliar: soma o valor de todas as despesas de um determinado mês.
    // É como um SELECT SUM(valor) WHERE mes = X AND ano = Y
    private func totalDoMes(mes: Int) -> Double {
        todasDespesas
            .filter { Int($0.mes) == mes && Int($0.ano) == anoAtual }
            .reduce(0) { $0 + $1.valor }
        // $0 = acumulador, $1 = despesa atual — como um stream.reduce() em Java
    }
}

// MARK: - Componente Visual da Linha do Mês
struct LinhaDoMes: View {
    let nomeMes: String
    let numeroMes: Int
    let totalGasto: Double
    
    var body: some View {
        HStack {
            // circulo com o numero do mes
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 44, height: 44)
                Text("\(numeroMes)")
                    .font(.headline)
                    .foregroundColor(.blue)
            } // fechando zstack
            
            VStack(alignment: .leading, spacing: 2) {
                Text(nomeMes)
                    .font(.headline)
                // mostra "nenhuma despesa" ou o total formatado
                Text(totalGasto > 0 ? totalGasto.moeda : "Nenhuma despesa")
                    .font(.subheadline)
                    .foregroundColor(totalGasto > 0 ? .red : .secondary)
                
            } // fecho Vstack
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Extensão para formatar Double como moeda brasileira (R$)
// Em Java seria um NumberFormat.getCurrencyInstance(new Locale("pt", "BR"))
extension Double {
    var moeda: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: self)) ?? "R$ 0,00"
    }
}

#Preview {
    ContentView()
    .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
