//
//  main.swift
//  exercicios de nivelament 1
//
//  Created by Francisco Marcondes da Silva Junior on 27/03/26.
//

/*
------------  EXERCICIOS  ----------------------
 # **Nivelamento \- Lógica e Algoritmos**
 
 # Condicional e estrutura de escolha:
 
 1. Peça um nome, idade e cidade, concatene em uma frase.
 
 2. Peça dois números inteiros. Se forem iguais, exiba a soma, caso contrário, exiba a multiplicação.
 
 3. Informe um ano, retorne se é bisexto ou não.
 
 4. Deverá ser pedido três números inteiros distintos. Retorne qual deles é o menor.
 
 5. Peça um número inteiro. Retorne o sucessor e o antecessor.
 
 # Laços de repetição:
 
 6. Peça um número inteiro. Retorne a tabuada daquele valor.
 
 7. O usuário informa dois números. Percorre os números informados e exiba:
 1. Quantidade de números informados;
 2. Quantidade de pares;
 3. Quantidade de ímpares;
 4. Média geral dos valores informados.
 
 # ArrayList:
 
 8. Peça cinco números distintos. Exiba-os em ordem crescente.
 
 9. Haverá um vetor contendo cinco nomes. Percorra o vetor, e exiba a quantidade de vogais e consoantes que cada nome possui.
 
 10. Crie um vetor contendo dez números inteiros. Exiba o vetor em ordem contrária.
 
 */

// 1. Peça um nome, idade e cidade, concatene em uma frase.


//import Foundation


// 1. Peça um nome, idade e cidade, concatene em uma frase.

/*
 print("Digite seu nome:")
let nome = readLine() ?? ""

print("Digite sua idade:")
let idade = readLine() ?? ""

print("Digite sua cidade:")
let cidade = readLine() ?? ""

let frase = "Olá, meu nome é \(nome), tenho \(idade) anos e moro em \(cidade)."
print(frase)
*/

// 2. Peça dois números inteiros. Se forem iguais, exiba a soma, caso contrário, exiba a multiplicação.

/*
print("Digite o primeiro número:")
let num1 = Int(readLine() ?? "0") ?? 0

print("Digite o segundo número:")
let num2 = Int(readLine() ?? "0") ?? 0

if num1 == num2 {
    print("A soma é: \(num1 + num2)")
} else {
    print("A multiplicação é: \(num1 * num2)")
}
*/

// 3. Informe um ano, retorne se é bisexto ou não.

/*
print("Informe o ano para verificação de ano bisexto")
let ano = Int(readLine() ??  "0") ?? 0

if ano % 400 == 0 {
    print("O ano \(ano) é bissexto.")
}else if ano % 100 == 0 {
    print(" o Ano \(ano) não é bissexto")
} else if ano % 4 == 0 {
    print("O ano \(ano) é bissexto.")
} else {
    print( "O ano \(ano) não é bissexto.")
}
*/

// 4. Deverá ser pedido três números inteiros distintos. Retorne qual deles é o menor.

//print("informe 3 numeros inteiros, com isso vou retornar qual é o menor")
//
//print("Informe o primeiro número inteiro:")
//let n1 = Int(readLine() ?? "") ?? 0
//
//print("Informe o segundo número inteiro:")
//let n2 = Int(readLine() ?? "") ?? 0
//
//print("Informe o terceiro número inteiro:")
//let n3 = Int(readLine() ?? "") ?? 0
//
//if n1 == n2 || n1 == n3 || n2 == n3 {
//    print("Os números devem ser distintos.")
//} else {
//    var menor = n1
//    if n2 < menor {
//        menor = n2
//    }
//    if n3 < menor {
//        menor = n3
//    }
//    print( "O menor número é: \(menor)")
//}


// 5. Peça um número inteiro. Retorne o sucessor e o antecessor.

//print("informe um numero inteiro ...")
//var num1 = Int(readLine() ?? "") ?? 0
//
//var antecessor = num1 - 1
//var sucessor = num1 + 1
//
//print("O número informado foi: \(num1)")
//print("Antecessor: \(antecessor)")
//print("Sucessor: \(sucessor)")

// 6. Peça um número inteiro. Retorne a tabuada daquele valor.
//
//print("Informe um número inteiro:")
//let numero = Int(readLine() ?? "") ?? 0
//
//for i in 1...10 {
//    let resultado = numero * i
//    print("\(numero) x \(i) = \(resultado)")
//}
//
//7. O usuário informa dois números. Percorre os números informados e exiba:
//   1. Quantidade de números informados;
//   2. Quantidade de pares;
//   3. Quantidade de ímpares;
//   4. Média geral dos valores informados.
//
//print("Informe o primeiro número:")
//let n1 = Int(readLine() ?? "") ?? 0
//
//print("Informe o segundo número:")
//let n2 = Int(readLine() ?? "") ?? 0
//
//var quantidade = 0
//var pares = 0
//var impares = 0
//var soma = 0
//
//// Percorre de n1 até n2
//for i in n1...n2 {
//    quantidade += 1
//    soma += i
//    
//    if i % 2 == 0 {
//        pares += 1
//    } else {
//        impares += 1
//    }
//}
//
//let media = Double(soma) / Double(quantidade)
//
//print("Quantidade de números: \(quantidade)")
//print("Quantidade de pares: \(pares)")
//print("Quantidade de ímpares: \(impares)")
//print("Média geral: \(media)")

//8. Peça cinco números distintos. Exiba-os em ordem crescente.
//var numeros = [Int]() // array vazio
//print("Informe 5 numeros")
//
//for i in 1 ... 5{
//    print("Informe o \(i)º número:")
//    let num = Int(readLine() ?? "") ?? 0
//        numeros.append(num)
//}
//
//numeros.sort()
//
//print("Numeros em ordem crescente: ")
//for num in numeros{
//    print(num)
//}

//9. Haverá um vetor contendo cinco nomes. Percorra o vetor, e exiba a quantidade de vogais e consoantes que cada nome possui.

//let nomes: [String] = ["Maria", "Joao", "Ana", "Pedro", "Lucas"]
//
//for nome in nomes {
//    var vogais = 0
//    var consoantes = 0
//
//    for letra in nome.lowercased() {
//        if letra == "a" || letra == "e" || letra == "i" || letra == "o" || letra == "u" {
//            vogais += 1
//        } else {
//            consoantes += 1
//        }
//    }
//
//    print("Nome: \(nome)")
//    print("Vogais: \(vogais)")
//    print("Consoantes: \(consoantes)")
//}


//10. Crie um vetor contendo dez números inteiros. Exiba o vetor em ordem contrária./

//let numeros : [Int] = [1, 2, 4, 6, 10, 15, 20, 30, 40, 50]
//
//for num in numeros.reversed(){
//    print(num)
//}
        

//  ------------------------------------------------ Classes -------------------------------------------------------- //

//class Pessoa {
//    var nome: String = ""
//    var idade: Int = 0
//    
//    func apresentar() -> Void {
//        print("Bomd dia \(nome), você tem \(idade) anos")
//    }
//}
//
//let p = Pessoa()
//p.nome = "Francisco"
//p.idade = 35
//p.apresentar()


/*
 Modificadores de acesso
    1. Public ( atributos e métodos disponiveis para acesso de qualquer local)
    2. INTERNAL ( acesso a atributos e métodos no mesmo módulo/pacote )
    3. FILEPRIVATE (Atributos e métodos disponiveis apenas no mesmo arquivo)
    4. Private ( disponivel apenas na mesma classe )
 
 Padrão é Internal quando voce nao declara o tipo de modificador de acesso.
 
*/

//// 1 - maneira
//var nome : String {
//    get { return _nome }
//    set (valor) { _nome = valor }
//}
//
//// 2 - maneira
//var idade: Int {
//    get { return _idade }
//    set { _idade = newValue }
//}
//
//// 3 - maneira readonly fora da classe - GET
//private(set) var cidade: String = "Rio de Janeiro"


//class Pessoa {
//    
//    init() {
//        print("construtor criado")
//    }
//    
//    
//}


// HERANÇA

//class Pessoa {
//    var nome: String = ""
//    var idade: Int = 0
//
//    init(nome: String, idade: Int) {
//        self.nome = nome
//        self.idade = idade
//    }
//}
//
//class Colaborador: Pessoa {
//    var salario: Double = 0.0
//    var cargo: String = ""
//
//    init(nome: String, idade: Int, salario: Double, cargo: String) {
//        self.salario = salario
//        self.cargo = cargo
//        super.init(nome: nome, idade: idade)
//
//        exibirDadosPessoa()
//        exibirDadosColaborador()
//    }
//
//    func exibirDadosColaborador() {
//        print("\(nome) trabalha como \(cargo) e recebe R$ \(salario)")
//    }
//
//    func exibirDadosPessoa() {
//        print("\(nome) tem \(idade) anos")
//    }
//}
//
//let obj = Colaborador(nome: "Francisco", idade: 35, salario: 3000.0, cargo: "Desenvolvedor")


// EXERCICIO

//
//class Aluno {
//    var nome: String
//    var nota1: Double
//    var nota2: Double
//
//    init(nome: String, nota1: Double, nota2: Double) {
//        self.nome = nome
//        self.nota1 = nota1
//        self.nota2 = nota2
//    }
//
//    func media() -> Double {
//        return (nota1 + nota2) / 2
//    }
//
//    func situacao() -> String {
//        if media() >= 7 {
//            return "Aprovado"
//        } else {
//            return "Reprovado"
//        }
//    }
//}
//
//let aluno1 = Aluno(nome: "Francisco", nota1: 8.5, nota2: 7.0)
//print("Aluno: \(aluno1.nome)")
//print("Média: \(aluno1.media())")
//print("Situação: \(aluno1.situacao())")
//
//
//// 2º Crie uma classe chamada Produto, onde teremos a seguinte estrutura:
//
//class Produto {
//    var nome: String
//    var valor: Double
//    
//    init(nome: String, valor: Double) {
//        self.nome = nome
//        self.valor = valor
//    }
//    
//    
//// ⚡Método para retornar um desconto, caso o valor da compra seja de pelo menos R$1.000,00.
//  func desconto() -> Double {
//        if valor >= 1000 {
//          return valor * 0.1
//      } else {
//          return 0.0
//      }
//    }
//}
//
//class Descontos {
//    var salarioBruto : Double
//    var faltas: Int
//    
//    init(salarioBruto: Double, faltas: Int) {
//        self.salarioBruto = salarioBruto
//        self.faltas = faltas
//    }
// 
//    func descontoValeTransporte() -> Double {
//        return salarioBruto * 0.06
//    }
//    
//    func calcularIR() -> Double {
//        if salarioBruto <= 1560.0 {
//            return 0.0  // sem desconto
//        } else if salarioBruto <= 3120.0 {
//            return salarioBruto * 0.04  // 4%
//        } else if salarioBruto <= 6240.0 {
//            return salarioBruto * 0.07  // 7%
//        } else if salarioBruto <= 12480.0 {
//            return salarioBruto * 0.12  // 12%
//        } else {
//            return salarioBruto * 0.15  // 15%
//        }
//    }
//    
//    func bonificacao() -> Double{
//        if(faltas == 0){
//            return salarioBruto + 400
//        }else {
//            print("Sem bonificacao")
//           return 0
//        }
//    }
//}
//
//let desconto = Descontos(salarioBruto: 5000, faltas: 0)
//  print("descontos aplicados do vale transporte: \(desconto.descontoValeTransporte())")
//  print("descontos aplicados de IR: \(desconto.calcularIR())")
//  print("bonificação: \(desconto.bonificacao())")
//
//// ----------------------------------------------
//
//// exericio 4
//class Media {
//    // Função auxiliar para evitar repetir lógica
//    private static func resultado(media: Double) -> (Double, String) {
//        let situacao = media >= 7.0 ? "Aprovado" : "Reprovado"
//        return (media, situacao)
//    }
//
//    // Recebe 2 notas
//    static func calcular(_ n1: Double, _ n2: Double) -> (Double, String) {
//        let media = (n1 + n2) / 2.0
//        return resultado(media: media)
//    }
//
//    // Recebe 3 notas
//    static func calcular(_ n1: Double, _ n2: Double, _ n3: Double) -> (Double, String) {
//        let media = (n1 + n2 + n3) / 3.0
//        return resultado(media: media)
//    }
//
//    // Recebe 4 notas
//    static func calcular(_ n1: Double, _ n2: Double, _ n3: Double, _ n4: Double) -> (Double, String) {
//        let media = (n1 + n2 + n3 + n4) / 4.0
//        return resultado(media: media)
//    }
//}
//
//
//
//// exericio 5
//class Cliente {
//    var nome: String?
//    var idade: Int?
//    var cidade: String?
//
//    // 1) Sem parâmetro
//    init() { }
//
//    // 2) Apenas nome
//    init(nome: String) {
//        self.nome = nome
//    }
//
//    // 3) Nome e idade
//    init(nome: String, idade: Int) {
//        self.nome = nome
//        self.idade = idade
//    }
//
//    // 4) Nome, idade e cidade
//    init(nome: String, idade: Int, cidade: String) {
//        self.nome = nome
//        self.idade = idade
//        self.cidade = cidade
//    }
//
//    func saudacao() -> String {
//        if let nome = nome, let idade = idade, let cidade = cidade {
//            return "Bom dia \(nome), você tem \(idade) anos e mora em \(cidade)."
//        } else if let nome = nome, let idade = idade {
//            return "Bom dia \(nome), você tem \(idade) anos."
//        } else if let nome = nome {
//            return "Bom dia \(nome)!"
//        } else {
//            return "Bom dia!"
//        }
//    }
//}
//let c1 = Cliente()
//print(c1.saudacao()) // Bom dia!
//
//let c2 = Cliente(nome: "Ricardo")
//print(c2.saudacao()) // Bom dia Ricardo!
//
//let c3 = Cliente(nome: "Júlia", idade: 32)
//print(c3.saudacao()) // Bom dia Júlia, você tem 32 anos.
//
//let c4 = Cliente(nome: "Rebeca", idade: 28, cidade: "São Paulo")
//print(c4.saudacao()) // Bom dia Rebeca, você tem 28 anos e mora em São Paulo.
//
//
//// exercicio 6
//
//struct Animal {
//    var tipoAnimal: String
//    var peso: Double
//}
//
//var animal1 = Animal(tipoAnimal: "Leão", peso: 150)
//var animal2 = animal1
//
//animal2.tipoAnimal = "Urso"
//animal2.peso = 400
//
//print("Animal 1: \(animal1.tipoAnimal) - \(animal1.peso)")
//print("Animal 2: \(animal2.tipoAnimal) - \(animal2.peso)")


// EXERCICI 3

import Foundation

// 1º Crie uma função que peça o valor de um saque e o valor em conta. Caso o saque seja maior que o valor em conta, deverá lançar uma exceção saldoInsuficiente.

// Define os tipos de erro que nossa função pode lançar

enum ErroSaque: Error {
    case saldoInsuficiente  // caso o saque seja maior que o saldo
}

// throws indica que essa função pode lançar um erro
// -> Double retorna o novo saldo se tudo der certo
func realizarSaque(valorSaque: Double, saldoConta: Double) throws -> Double {
    
    // Verifica se o saque pedido é maior que o saldo disponível
    if valorSaque > saldoConta {
        
        // Lança o erro, interrompendo a execução da função
        throw ErroSaque.saldoInsuficiente
    }
    
    // Se chegou aqui, saque é válido: retorna o saldo atualizado
    return saldoConta - valorSaque
}

// Lê o saldo em conta digitado pelo usuário
// readLine() lê o texto, ?? "0" garante que não seja nil
// Double() tenta converter para número decimal, ?? 0 evita nil

print("Digite o saldo em conta:")
let saldoConta = Double(readLine() ?? "0") ?? 0

// Lê o valor do saque digitado pelo usuário
print("Digite o valor do saque:")
let valorSaque = Double(readLine() ?? "0") ?? 0

// do { } é o bloco onde tentamos executar algo que pode dar erro
do {
    
    // try é obrigatório ao chamar função com throws
    let novoSaldo = try realizarSaque(valorSaque: valorSaque, saldoConta: saldoConta)
    
    // Só chega aqui se o saque foi realizado com sucesso
    print("Saque realizado com sucesso! Novo saldo: R$ \(novoSaldo)")

// catch captura o erro lançado dentro da função
} catch ErroSaque.saldoInsuficiente {
    
    // Exibe mensagem amigável ao usuário
    print("Erro: Saldo insuficiente. Saldo disponível: R$ \(saldoConta)")
}
//  ------------------------------------------------------------------------------------------------------------------- //

//Exercicio 2
// 2º Crie uma função que o usuário informa uma idade. Se a idade for inferior a 0 ou maior que 130, lance a exceção idadeInvalida.

enum IdadeInvalida: Error {
    case idadeInvalida
}

func verificarIdade(_ idade: Int) throws {
    if idade < 0 || idade > 130 {
        throw IdadeInvalida.idadeInvalida
    }
}

print("Digite a sua idade:")
let idade = Int(readLine() ?? "") ?? -1

do {
    try verificarIdade(idade)
    print("Idade válida")
} catch IdadeInvalida.idadeInvalida {
    print("Erro: idade inválida")
} catch {
    print("Erro inesperado")
}

// ----------------------------------------------------------------------------------------------------
// Exercicio 3
// 3º Crie uma função genérica <T> que receba um array de qualquer tipo e retorne o mesmo array invertido.


func inverterArray<T>(_ array: [T]) -> [T] {
    return Array(array.reversed())
}

// Teste com Int
let numeros = [1, 2, 3, 4, 5]
print(inverterArray(numeros)) // [5, 4, 3, 2, 1]

// Teste com String
let nomes = ["Ana", "Bruno", "Carlos"]
print(inverterArray(nomes)) // ["Carlos", "Bruno", "Ana"]

// Teste com Double
let valores = [1.5, 2.7, 3.9]
print(inverterArray(valores)) // [3.9, 2.7, 1.5]

//----------------------------------------------------------------------------------------------------------

// 4º Crie duas classes ou structs e instancie um objeto de cada classe. Implemente uma função genérica que receba um objeto e retorne sua classe.

class Pessoa {
    let nome: String
    
    init(nome: String){
        self.nome = nome
    }
}

struct Produto {
    let codigo: Int
}

func retornaTipo<T>( de objeto: T) -> Any.Type {
    return type(of: objeto)
}

func retornarTipoComoTexto<T>(de objeto: T) -> String {
    return String(describing: type(of: objeto))
}

let pessoa = Pessoa(nome: "Maria")
let produto = Produto(codigo: 456)

print(retornaTipo(de: pessoa))
print(retornaTipo(de: produto)) 

// 5º  Crie uma extensão para dobrar um valor inteiro.

extension Int {
    func dobrar() -> Int {
        return self * 2
    }
}

// Teste
let numero = 7
print(numero.dobrar) // 14


// 6º Crie uma extensão para receber um String e contabilizar a quantidade de vogais e consoantes.

extension String {
    func contarVogaisEConsoantes() -> (vogais: Int, consoantes: Int) {
        let vogaisSet = Set("aeiouáàâãéèêíìîóòôõúùûAEIOUÁÀÂÃÉÈÊÍÌÎÓÒÔÕÚÙÛ".unicodeScalars)
        var vogais = 0
        var consoantes = 0
        
        for caractere in self.unicodeScalars {
            if CharacterSet.letters.contains(caractere) {
                if vogaisSet.contains(caractere){
                    vogais += 1
                }else {
                    consoantes += 1
                }
            }
        }
        return (vogais, consoantes)
    }
}
    // Teste
    let texto = "Olá, Mundo Swift 123"
    let resultado = texto.contarVogaisEConsoantes()
    print("Vogais: (resultado.vogais), Consoantes: (resultado.consoantes)")
// --------------------------------------------------------------------------------------

// 7 Desenvolva uma Classe ou um Struct, contendo os atributos: código, nome e cargo. Crie três objetos, informando apenas nome e cargo, o código deverá ser gerado dinamicamente. Exiba os atributos contidos nos três objetos.

struct Colaborador {
    
    let codigo: UUID
    let nome: String
    let cargo: String
    
    init(nome: String, cargo: String) {
        self.codigo = UUID()
        self.nome = nome
        self.cargo = cargo
    }
}

let colaborador1 = Colaborador(nome: "Ana", cargo: "Desenvolvedora")
let colaborador2 = Colaborador(nome: "Carlos", cargo: "Analista de Sistemas")
let colaborador3 = Colaborador(nome: "Beatriz", cargo: "Gerente de Projetos")

let lista = [colaborador1, colaborador2, colaborador3]

for colaborador in lista {
    print("Codigo: \(colaborador.codigo.uuidString), Nome: \(colaborador.nome), Cargo: \(colaborador.cargo)")
}
