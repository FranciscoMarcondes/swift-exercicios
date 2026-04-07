import UIKit
import Foundation


// Protocol, Generics e Structs - Lista 04
// Desenvolva um sistema para gerenciamento de contas bancárias, utilizando conceitos de structs, protocolos e generics.

// 1. Crie um protocolo chamado Conta contendo:
//●    id: Int
//●    nome: String
//●    saldo:

// Isso é uma interface
protocol Conta {
    var id: Int { get }
    var nome: String { get }
    var saldo: Double { get set }
}

// Utilizo struc para objetos mais simples.
// 2. Tipos de conta:
struct ContaPF: Conta {
    var id: Int
    var nome: String
    var saldo: Double
    let cpf: String
}

struct ContaPJ: Conta {
    var id: Int
    var nome: String
    var saldo: Double
    let cnpj: String
}

//3. CRUD Genérico:
//Crie uma estrutura genérica chamada ContaCRUD<T> onde T deve seguir o protocolo Conta.

struct ContaCRUD<T: Conta> {
    private var contas: [T] = []

    mutating func cadastrar(conta: T) {
        contas.append(conta)
        print("Conta cadastrada: \(conta.nome) (ID: \(conta.id))")
    }

    func listar() -> [T] {
        return contas
    }

    mutating func alterar(id: Int, novaConta: T) {
        guard let indice = contas.firstIndex(where: { $0.id == id }) else {
            print("Conta com ID \(id) não encontrada para alteração.")
            return
        }

        contas[indice] = novaConta
        print("Conta com ID \(id) alterada com sucesso.")
    }

    mutating func remover(id: Int) {
        guard let indice = contas.firstIndex(where: { $0.id == id }) else {
            print("Conta com ID \(id) não encontrada para remoção.")
            return
        }

        let removida = contas.remove(at: indice)
        print("Conta removida: \(removida.nome) (ID: \(removida.id))")
    }
}

var crudPF = ContaCRUD<ContaPF>()

let pf1 = ContaPF(id: 1, nome: "Francisco", saldo: 1500.0, cpf: "123.456.789-00")

// Cadastro
crudPF.cadastrar(conta: pf1)

// listar
print("Listar PF:", crudPF.listar())
print("----------------------------------------")


let pfAlterada = ContaPF(id: 1, nome: "Francisco Silva", saldo: 2000.0, cpf: "123.456.789-00")
crudPF.alterar(id: 1, novaConta: pfAlterada)

print("Listar PF após alterar:", crudPF.listar())
print("----------------------------------------")


crudPF.remover(id: 1)

print("Listar PF após remover:", crudPF.listar())

print("----------------------------------------")

// 4) Execução PJ
var crudPJ = ContaCRUD<ContaPJ>()

let pj1 = ContaPJ(id: 10, nome: "Empresa XPTO", saldo: 10000.0, cnpj: "12.345.678/0001-99")
crudPJ.cadastrar(conta: pj1)
print("----------------------------------------")

print("Listar PJ:", crudPJ.listar())
print("----------------------------------------")

let pjAlterada = ContaPJ(id: 10, nome: "Empresa XPTO LTDA", saldo: 12000.0, cnpj: "12.345.678/0001-99")
crudPJ.alterar(id: 10, novaConta: pjAlterada)

print("Listar PJ após alterar:", crudPJ.listar())
print("----------------------------------------")


crudPJ.remover(id: 10)
print("Listar PJ após remover:", crudPJ.listar())
