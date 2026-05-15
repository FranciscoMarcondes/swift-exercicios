//
//  AdicionarDespesaView.swift
//  GestorDespesas
//
//  Created by Francisco Marcondes da Silva Junior on 15/05/26.
//

// Formulário modal para adicionar uma nova despesa.

import SwiftUI
import CoreData

struct AdicionarDespesaView: View {
    
    let mes: Int
    let ano: Int
    
    // Acessa o contexto do Core Data e o dismiss (fechar modal)
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    // @State são variáveis locais da tela — quando mudam, a tela redesenha
    // Em Java seria como propriedades com setters que disparam um repaint()
    @State private var nome: String = ""
    @State private var valorTexto: String = ""
    @State private var categoriaSelecionada: Categoria = .energia
    
    // Controla se o alerta de validação está visível
    @State private var mostrarAlerta = false
    
    var body: some View {
        NavigationStack {
            Form {
                
                // Seção 1 — Dados básicos
                Section("Informações da despesa") {
                    
                    // Campo de texto para o nome
                    TextField("Nome (ex: Conta de Luz)", text: $nome)
                    
                    // Campo de texto para o valor — teclado numérico
                    TextField("Valor (ex: 150.00)", text: $valorTexto)
                        .keyboardType(.decimalPad)
                }
                
                // Seção 2 — Seleção de categoria
                Section("Categoria") {
                    // Picker = dropdown/combo box
                    Picker("Categoria", selection: $categoriaSelecionada) {
                        // Itera por TODOS os casos do enum Categoria
                        ForEach(Categoria.allCases) { cat in
                            Label(cat.rawValue, systemImage: cat.icone)
                                .tag(cat) // tag identifica cada opção no Picker
                        }
                    }
                    .pickerStyle(.menu) // Estilo dropdown
                }
                
                // Seção 3 — Preview visual da categoria
                Section("Preview") {
                    HStack {
                        Image(systemName: categoriaSelecionada.icone)
                            .foregroundColor(categoriaSelecionada.cor)
                        Text(categoriaSelecionada.rawValue)
                        Spacer()
                        // Mostra o valor em tempo real conforme o usuário digita
                        Text((Double(valorTexto) ?? 0).moeda)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Nova Despesa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Botão Cancelar
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss() // Fecha o modal
                    }
                }
                // Botão Salvar
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        salvarDespesa()
                    }
                    .fontWeight(.bold)
                }
            }
            // Alerta de validação
            .alert("Campos inválidos", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Preencha o nome e um valor válido (número maior que zero).")
            }
        }
    }
    
    // Função principal: valida e salva a despesa no Core Data
    private func salvarDespesa() {
        
        // --- Validação ---
        let nomeValido = !nome.trimmingCharacters(in: .whitespaces).isEmpty
        let valor = Double(valorTexto.replacingOccurrences(of: ",", with: ".")) ?? 0
        let valorValido = valor > 0
        
        guard nomeValido && valorValido else {
            mostrarAlerta = true
            return
        }
        
        // --- Criação do objeto Core Data ---
        // Despesa() cria uma nova instância gerenciada pelo contexto.
        // É como chamar new Despesa() e depois em.persist(despesa) no JPA.
        let novaDespesa = Despesa(context: viewContext)
        
        // Popula os campos
        novaDespesa.id        = UUID()        // Gera um ID único
        novaDespesa.nome      = nome.trimmingCharacters(in: .whitespaces)
        novaDespesa.valor     = valor
        novaDespesa.categoria = categoriaSelecionada.rawValue
        novaDespesa.mes       = Int16(mes)
        novaDespesa.ano       = Int16(ano)
        novaDespesa.data      = Date()         // Data e hora atual
        
        // --- Salva no banco ---
        do {
            try viewContext.save() // Equivalente ao em.flush() do JPA
            dismiss()              // Fecha o formulário após salvar
        } catch {
            print("Erro ao salvar despesa: \(error.localizedDescription)")
        }
    }
}
