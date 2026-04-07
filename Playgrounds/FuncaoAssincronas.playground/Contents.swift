
import Foundation

//func tarefa1() async {
//    //Thread.sleap(forTimeInternval: 2) //<- funciona sem o async
//    
//    try? await Task.sleep(for:.seconds(2))
//    print("Tarefa 1")
//}
//
//
//func tarefa2() async{
//   // Thread.sleep(forTimeInterval: 5)
//    try? await Task.sleep(for:.seconds(5))
//    print("Tarefa 2")
//}
//
//
//func tarefa3() async {
//  //  Thread.sleep(forTimeInterval: 3)
//    try? await Task.sleep(for:.seconds(3))
//    print("Tarefa 3")
//}
//
//
//Task {
//    // executar cada tarefa e amazenar
//    async let t1:() = tarefa1()
//    async let t2:() = tarefa2()
//    async let t3:() = tarefa3()
//    
//    // exibir prints
//    await t1
//    await t2
//    await t3
//    
//}


//func somar(numero : Int, numero2 : Int) async -> Int {
//    try? await Task.sleep(for: .seconds(3))
//    print("soma finalizada")
//    return numero + numero2
//}
//
//func dobraValor(numero: Int) async -> Int{
//    try? await Task.sleep(for: .seconds(5))
//    print("dobrar valor finalizado")
//    return numero * 2
//}
//    
//Task {
//    let somarValores = await somar(numero: 7, numero2: 3)
//    let dobraValor = await dobraValor(numero: somarValores)
//
//    print(dobraValor)
//}

//func tarefa1() async {
//    //Thread.sleap(forTimeInternval: 2) //<- funciona sem o async
//
//    try? await Task.sleep(for:.seconds(2))
//    print("Tarefa 1")
//}
//
//
//func tarefa2() async{
//   // Thread.sleep(forTimeInterval: 5)
//    try? await Task.sleep(for:.seconds(5))
//    print("Tarefa 2")
//}
//
//
//func tarefa3() async {
//  //  Thread.sleep(forTimeInterval: 3)
//    try? await Task.sleep(for:.seconds(3))
//    print("Tarefa 3")
//}
//
//Task {
//    
//    await withTaskGroup(of: Void.self) { grupo in
//        
//        grupo.addTask { await tarefa1() }
//        grupo.addTask { await tarefa2() }
//        grupo.addTask { await tarefa3() }
//        
//        }
//    }


// ----------------------------------------------------------------- Implementar o protocols (interface) -------------------

//protocol Entidade {
//    var id: Int { get }
//    var nome: String { get }
//}
//
//// Strunct de pessoa
//struct Pessoa: Entidade{
//    var id: Int
//    var nome: String
//    var cidade: String
//}


// 3 - Struct de ações (cadastrar e listar )
// dentro do struct para realizar alteraçoes em um objeto deve-se usar o mutating
// No caso, a alteraçao seria adicionar um novo elemento ao vetor (array)
//struct Acoes{
//    
//    // vetor para armazenar pessoas
//    private var  vetor : [Pessoa] = []
//    
//    // funcao para cadastrar
//   mutating func cadastrar (p: Pessoa){
//        vetor.append(p)
//    }
//    
//    // funcao para selecionar
//    func listar() {
//        for p in vetor {
//            print("Id: \(p.id)")
//            print("Nome: \(p.nome)")
//            print("Cidade: \(p.cidade)")
//            print("----------------------------------")
//        }
//    }
//}
//
//
//// 4 - testar
//
//let pessoa1 = Pessoa(id: 1, nome: "Arthur", cidade: "São Paulo")
//let pessoa2 = Pessoa(id: 2, nome: "Pedro", cidade: "Teresina")
//
//var acoes = Acoes()
//acoes.cadastrar(p: pessoa1)
//acoes.cadastrar(p: pessoa2)
//
//acoes.listar()


// ------------------ GENERICS ---------------------------------------------------------------------

protocol Entidade {
    var id: Int { get }
    var nome: String { get }
}

// Strunct de pessoa
struct Pessoa: Entidade{
    var id: Int
    var nome: String
    var cidade: String
}

struct Produto: Entidade{
    var id: Int
    var nome: String
    var valor: Double
}


struct Acoes<T: Entidade>{
    
    // vetor generico
    private var  vetor : [T] = []
    
    // funcao para cadastrar genericos
   mutating func cadastrar (valor: T){
        vetor.append(valor)
    }
    
    // funcao para selecionar
    func listar() -> [T] {
        return vetor
    }
}



// 4 - testar
// Criar objetos da Struc Acoes
//var pessoas = Acoes<Pessoa>()
//var produtos = Acoes<Produto>()
//
//// Criar objetos da strunct pessoa
//let pessoa1 = Pessoa(id: 1, nome: "Arthur", cidade: "São Paulo")
//let pessoa2 = Pessoa(id: 2, nome: "Pedro", cidade: "Teresina")
//
//// Criar Objetos do struct produto
//let produto1 = Produto(id: 10, nome: "Iphone", valor: 999.99)
//let produto2 = Produto(id: 20, nome: "notebook", valor: 1200.00)
//
//// cadastrar e listar pessoas e produtos
//pessoas.cadastrar(valor: pessoa1)
//pessoas.cadastrar(valor: pessoa2)
//print(pessoas.listar())
//
//produtos.cadastrar(valor: produto1)
//produtos.cadastrar(valor: produto2)
//print(produtos.listar())
//


//  -------------------- FUNCOES ASSICRONAS --------------------------

// 1.    Crie uma função assíncrona que recebe um número inteiro e, após 3 segundos de delay, retorna esse valor com 10% de desconto.

//func desconto10(valor: Int) async -> Double {
//    try? await Task.sleep(nanoseconds: 3_000_000_000)
//    return Double(valor) * 0.9
//}
//
//Task {
//    let resultado = await desconto10(valor: 200)
//    print("Resultado : \(resultado)")
//}

// 2.  Crie uma segunda função assíncrona que recebe o resultado da primeira função e, após 5 segundos, aplica 20% de desconto adicional.

//func desconto10(valor: Int) async -> Double {
//    try? await Task.sleep(nanoseconds: 3_000_000_000)
//    return Double(valor) * 0.9
//}
//
//func desconto20(valor: Double) async -> Double {
//    try? await Task.sleep(nanoseconds: 5_000_000_000)
//    return valor * 0.8
//}
//
//Task {
//    let resultado1 = await desconto10(valor: 200)
//    print("Após 10% de desconto: \(resultado1)")
//
//    let resultado2 = await desconto20(valor: resultado1)
//    print("Após mais 20% de desconto: \(resultado2)")
//}


// 3.    Crie uma terceira função assíncrona que recebe o resultado da segunda e, após 2 segundos, adiciona 10 unidades ao valor

//func desconto10(valor: Int) async -> Double {
//    try? await Task.sleep(nanoseconds: 3_000_000_000)
//    return Double(valor) * 0.9
//}
//
//func desconto20(valor: Double) async -> Double {
//    try? await Task.sleep(nanoseconds: 5_000_000_000)
//    return valor * 0.8
//}
//
//func adicionar10(valor : Double) async -> Double{
//    try? await Task.sleep(nanoseconds: 2_000_000_000)
//    return valor + 10
//}
//
//
//Task {
//    let resultado1 = await desconto10(valor: 200)
//    print("Após 10% de desconto: \(resultado1)")
//    
//    let resultado2 = await desconto20(valor: resultado1)
//    print("Após mais 20% de desconto: \(resultado2)")
//    
//    let resultado3 = await adicionar10(valor: resultado2)
//    print("Acresentando 10 ao valor final \(resultado3)")
//    
//}


// --------------------------------------------------------
// Atividade 2 - Verificando nomes em um array
//--------------------------------------------------------


/*
// 1.    Crie um array com 10 nomes.

var nomes : [String] = ["Francisco", "Maria", "Eloa", "Pedro", "Ana", "João", "Isabela", "Carlos", "Fernanda", "Luís"]

// 2.    Crie uma função assíncrona que recebe um nome e, após 4 segundos, retorna true se o nome estiver no array ou false caso contrário

func verificarNome(_ nome: String,  lista: [String]) async -> Bool {
    try? await Task.sleep(for: .seconds(4))
    return lista.contains(nome)
}

//Task {
//    let existe = await verificarNome("Ana", lista: nomes)
//    print(existe)
//}

// 3.    Crie uma segunda função assíncrona que recebe esse resultado lógico e retorna uma mensagem de texto, por exemplo: “O nome informado existe no vetor” ou “O nome não existe no vetor”.

func retornoVerificacao(_ resultado: Bool) -> String {
    return resultado ? "O nome informado existe no vetor" : "O nome informado não existe no vetor"
}

Task {
    let existe = await verificarNome("Pedro", lista: nomes)
    let mensagem = retornoVerificacao(existe)
    print(mensagem)
}

*/

// --------------------------------------------------------
// Atividade 3 - Contando pares/ímpares e positivos/negativos
//----------------------------------------------------------

// 1.    Crie um array com 20 números inteiros distintos (positivos e negativos).

let numeros : [Int] = [1, -2, 3, -4, 5, -6, 7, -8, 9, -10, 11, -12, 13, -14, 15, -16, 17, -18, 19, -20]

// 2.    Crie uma função assíncrona que, após 5 segundos, retorna a quantidade de números pares e ímpares.
func contarParesEImpares(_ numeros: [Int]) async -> (pares: Int, impares: Int) {
    try? await Task.sleep(for: .seconds(5))
    let pares = numeros.filter { $0.isMultiple(of: 2)}.count
    let impares = numeros.filter { !$0.isMultiple(of: 2)}.count
    return (pares, impares)
}

// Função 2 - positivos e negativos (7 segundos)
func contarPositivosENegativos(_ lista: [Int]) async -> (positivos: Int, negativos: Int) {
    try? await Task.sleep(for: .seconds(7))
    let positivos = lista.filter { $0 > 0}.count
    let negativos = lista.filter { $0 < 0 }.count
    return (positivos, negativos)
}

Task {
  async let resultado1 = await contarParesEImpares(numeros)
  async let resultado2 = await contarPositivosENegativos(numeros)
    
    let paresImpares = await resultado1
        print("Pares: \(paresImpares.pares), Ímpares: \(paresImpares.impares)")

        let positivosNegativos = await resultado2
        print("Positivos: \(positivosNegativos.positivos), Negativos: \(positivosNegativos.negativos)")
}
