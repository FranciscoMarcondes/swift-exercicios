//
//  main.swift
//  DesafioNivelamento
//
//  Created by Francisco Marcondes da Silva Junior on 09/04/26.
//

import Foundation

// Crie um sistema para gerenciar contatos. Neste sistema, teremos as seguintes funcionalidades:

struct Contato {
    let id: UUID
    var nome: String
    var telefone: String
    var idade: Int
    var email: String
}

class GerenciadorContatos {
    
    // Array para armazenar todos os contatos
    private var contatos: [Contato] = []
    
    // Metodo - Cadastrar
    func cadastrarContato(nome: String, telefone: String, idade: Int, email: String) {
        
        //Validaçao 1 - verificar se todos os campos foram preenchidos
        if  nome.trimmingCharacters(in: .whitespaces).isEmpty ||
                telefone.trimmingCharacters(in: .whitespaces).isEmpty ||
                email.trimmingCharacters(in: .whitespaces).isEmpty {
            
            print("Atenção, Todos os campos devem ser preenchidos!")
            
            return
        }
        
        // VALIDAÇÃO 2: Verificar se a idade é válida (maior que 0)
        if idade <= 0 {
            print("A idade deve ser maior que 0")
            return
        }
        
        // VALIDAÇÃO 3: Verificar se já existe um contato com EXATAMENTE este nome
        if contatos.contains(where: { $0.nome.lowercased() == nome.lowercased()}){
            print( "Error: Ja existe um contato com esse nome!")
            return
        }
        
        let novoContato = Contato(
            id: UUID(),
            nome: nome,
            telefone: telefone,
            idade : idade,
            email: email )
        
        contatos.append(novoContato)
        print("✅ Contato '\(nome)' cadastrado com sucesso! (ID: \(novoContato.id.uuidString))")
        
    }
    
    
    // MÉTODO 2: LISTAR TODOS OS CONTATOS
    func listarContatos()  {
        
        if contatos.isEmpty {
            print("❌ Nenhum contato cadastrado!")
            return
        }
        
        print(" -----------------------------------------------------------")
        print("📋 LISTA DE CONTATOS")
        print(" -----------------------------------------------------------")
        
        contatos.enumerated().forEach { (index, contato) in
            print("\n[#\(index + 1)] \(contato.nome) (ID: \(contato.id.uuidString))")
            print("   Idade: \(contato.idade) anos")
            print("   Telefone: \(contato.telefone)")
            print("   Email: \(contato.email)")
        }
        print(" -----------------------------------------------------------")
    }
    
    // MÉTODO 3: ENCONTRAR CONTATO POR ID
    private func encontrarContatoPorId(_ id: UUID) -> Contato? {
        return contatos.first(where: { $0.id == id })
    }
    
    
    // MÉTODO 4: ALTERAR UM CONTATO
    func alterarContato(_ novoContato: Contato)  {
        
        // verificando se todos os campos estão preenchidos
        if novoContato.nome.trimmingCharacters(in: .whitespaces).isEmpty ||
            novoContato.email.trimmingCharacters(in: .whitespaces).isEmpty ||
            novoContato.email.trimmingCharacters(in: .whitespaces).isEmpty {
            
            print ("ERROR : TODOS OS CAMPOS PRECISAM SER PREENCHIDOS ! " )
            return
        }
        
        if novoContato.idade <= 0 {
            print(" ERROR: A IDADE DEVE SER MAIOR QUE 0")
            return
        }
        
        guard let index = contatos.firstIndex(where: { $0.id == novoContato.id}) else {
            print("❌ ERRO: Contato com ID: \(novoContato.id.uuidString) não encontrado!")
            listarNomesComIDs()
            return
        }
        
        let contatoAntigo = contatos[index].nome
        
        if contatos.contains(where: {
            $0.nome.lowercased() == novoContato.nome.lowercased() && $0.id != novoContato.id }) {
            print("ERROR: Já existe outro contato com o nome '\(novoContato.nome)")
            return
        }
        
        contatos[index] = novoContato
        print("✅ Contato alterado com sucesso!")
        print("   De: \(contatoAntigo) → Para: \(novoContato.nome)")
    }
    
    
    // MÉTODO 5: REMOVER UM CONTATO
    func removerContato(id: UUID){
        guard let index = contatos.firstIndex(where: { $0.id == id }) else {
            print("❌ ERRO: Contato com ID: \(id.uuidString) não encontrado!")
            listarNomesComIDs()
            return
        }
        
        let nomeRemovido = contatos[index].nome
        contatos.remove(at: index)
        print("✅ Contato '\(nomeRemovido)' removido com sucesso!")
    }
    

    @discardableResult
    func listarNomesComIDs() -> Bool {
        
        if contatos.isEmpty {
            print("🔍 Nenhum contato cadastrado.")
            return false
        }
        
        print("📋 CONTATOS DISPONÍVEIS:")
        
        contatos.enumerated().forEach { (index, contato) in
            print( "\(index + 1). \(contato.nome) (ID: \(contato.id.uuidString))")
            
        }

        return true
    }

    func obterContatoEmPosicao(_ index: Int) -> Contato? {
        guard index >= 0 && index < contatos.count else {
            return nil
        }
        return contatos[index]
    }
}

// ---------------------------- FUNCOES UTEIS ----------------------------

func lerTexto(_ mensagem: String) -> String {
    print(mensagem, terminator: "")
    return (readLine() ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
}

func lerInt(_ mensagem: String) -> Int? {
    let valorTexto = lerTexto(mensagem)
    return Int(valorTexto)
}

func lerUUID(_ mensagem: String) -> UUID? {
    let valorTexto = lerTexto(mensagem)
    return UUID(uuidString: valorTexto)
}
// ----------------------------------------------------------------------------



// ================================
// MENU INTERATIVO COM LOOP
// ================================


print("🎯 INICIANDO SISTEMA DE GERENCIAMENTO DE CONTATOS \n")

// Criando uma instancia da minha classe
let gerenciador = GerenciadorContatos()

while true {
    
    print("📌 MENU DE OPÇÕES")
    print("--------------------------------------------------")
    print("1. Cadastrar contato")
    print("2. Listar contatos")
    print("3. Alterar contato")
    print("4. Remover contato")
    print("0. Sair")
    
    let opcao = lerTexto("Escolha uma opção: ")
    
    switch opcao {
    case "1":
        
        print("\n ------ Cadastro ------")
        let nome = lerTexto("Nome: ")
        let telefone = lerTexto("Telefone: ")
        
        // força a digitar somente numeros
        guard let idade = lerInt("idade: ") else {
            print("ERROR: idade inválida. Digite apenas números.")
            continue
        }
        
        let email = lerTexto("Email: ")
        
        gerenciador.cadastrarContato(nome: nome, telefone: telefone, idade: idade, email: email)
        
    case "2":
        print("\n--- LISTAGEM ---")
        gerenciador.listarContatos()
        
    case "3":
        print("\n--- ALTERAÇÃO ---")
        guard gerenciador.listarNomesComIDs() else {
            continue
        }
        
        guard let id = lerUUID("Digite o ID do contato que deseja alterar: ") else {
            print("ERROR: ID inválido.")
            continue
        }
        
        let nome = lerTexto("Novo Nome: ")
        let telefone = lerTexto("Novo Telefone: ")
        
        guard let idade = lerInt("Nova Idade: ") else {
            print("ERROR: Idade inválida. Digite apenas números.")
            continue
        }
        
        let email = lerTexto("Novo Email: ")
        
        let contatoAtualizado = Contato(id: id, nome: nome, telefone: telefone, idade: idade, email: email)
        gerenciador.alterarContato(contatoAtualizado)
    
    case "4":
        print("\n--- REMOÇÃO ---")
        guard gerenciador.listarNomesComIDs() else {
            continue
        }
        
        guard let id = lerUUID("Digite o ID do contato que deseja remover: ") else {
            print("ERROR: ID inválido.")
            continue
        }
    
        gerenciador.removerContato(id: id)
    
    case "0":
        print("\n👋 Encerrando sistema. Até mais!")
        break
        
    default :
        print("\n Opção inválida. Tente novamente.")
        continue
    }

    if opcao == "0" {
           break
       }
    }


