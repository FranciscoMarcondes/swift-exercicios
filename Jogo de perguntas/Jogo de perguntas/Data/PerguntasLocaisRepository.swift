import Foundation

private func makePergunta(
    _ enunciado: String,
    _ opcoes: [String],
    _ indiceCorreto: Int,
    _ dificuldade: Dificuldade
) -> Pergunta {
    Pergunta(
        enunciado: enunciado,
        opcoes: opcoes,
        indiceCorreto: indiceCorreto,
        dificuldade: dificuldade
    )
}

final class PerguntasLocaisRepository: PerguntasRepository {
    func carregarTemas() -> [Tema] {
        Tema.allCases
    }

    func carregarPerguntas(para tema: Tema) -> [Pergunta] {
        bancoPorTema[tema] ?? []
    }

    private let bancoPorTema: [Tema: [Pergunta]] = [
        .historia: [
            makePergunta("Em que ano o Brasil declarou independencia?", ["1822", "1889", "1500", "1922"], 0, .facil),
            makePergunta("Quem foi o primeiro imperador do Brasil?", ["Dom Pedro I", "Dom Pedro II", "Getulio Vargas", "Tiradentes"], 0, .facil),
            makePergunta("A Revolucao Francesa comecou em qual ano?", ["1789", "1815", "1776", "1914"], 0, .facil),
            makePergunta("Qual civilizacao construiu Machu Picchu?", ["Inca", "Maia", "Asteca", "Egipcia"], 0, .medio),
            makePergunta("A Proclamacao da Republica no Brasil ocorreu em:", ["1889", "1822", "1930", "1964"], 0, .medio),
            makePergunta("Qual tratado marcou o fim da Primeira Guerra Mundial?", ["Tratado de Versalhes", "Tratado de Tordesilhas", "Pacto de Varsovia", "Acordo de Bretton Woods"], 0, .dificil),
            makePergunta("Quem liderou a unificacao alemã no seculo XIX?", ["Otto von Bismarck", "Napoleao", "Lenin", "Churchill"], 0, .dificil),
            makePergunta("Em que periodo ocorreu o Renascimento?", ["Entre seculos XIV e XVI", "Entre seculos XI e XII", "No seculo XX", "Na Antiguidade"], 0, .medio)
        ],
        .fisica: [
            makePergunta("Qual e a unidade de forca no SI?", ["Newton", "Joule", "Watt", "Pascal"], 0, .facil),
            makePergunta("A velocidade da luz no vacuo e aproximadamente:", ["300.000 km/s", "150.000 km/s", "30.000 km/s", "3.000 km/s"], 0, .facil),
            makePergunta("Qual lei relaciona tensao, corrente e resistencia?", ["Lei de Ohm", "Lei de Newton", "Lei de Kepler", "Lei de Coulomb"], 0, .facil),
            makePergunta("Quando a aceleracao e zero, o movimento pode ser:", ["Uniforme", "Uniformemente variado", "Circular uniforme", "Parabolico"], 0, .medio),
            makePergunta("Energia armazenada por movimento chama-se:", ["Cinetica", "Potencial", "Termica", "Eletrica"], 0, .medio),
            makePergunta("Qual particula tem carga negativa?", ["Eletron", "Proton", "Neutron", "Positron"], 0, .medio),
            makePergunta("A segunda lei de Newton e expressa por:", ["F = m.a", "E = m.c²", "V = R.I", "p = m/v"], 0, .dificil),
            makePergunta("No MRU, a funcao horaria da posicao e:", ["s = s0 + vt", "s = s0 + at²", "v = v0 + at", "a = dv/dt"], 0, .dificil)
        ],
        .geografia: [
            makePergunta("Qual e o maior oceano da Terra?", ["Pacifico", "Atlantico", "Indico", "Artico"], 0, .facil),
            makePergunta("Qual e o maior pais em area territorial?", ["Russia", "China", "Canada", "Brasil"], 0, .facil),
            makePergunta("O rio Nilo fica principalmente em qual continente?", ["Africa", "Asia", "Europa", "America"], 0, .facil),
            makePergunta("Brasilia fica em qual regiao do Brasil?", ["Centro-Oeste", "Sudeste", "Sul", "Nordeste"], 0, .medio),
            makePergunta("Qual linha divide a Terra em hemisferio norte e sul?", ["Equador", "Greenwich", "Cancer", "Capricornio"], 0, .medio),
            makePergunta("Qual e o menor continente em area?", ["Oceania", "Europa", "Antartida", "America do Sul"], 0, .medio),
            makePergunta("A Cordilheira dos Andes fica em qual continente?", ["America do Sul", "Asia", "Europa", "Africa"], 0, .dificil),
            makePergunta("Qual pais possui maior parte da floresta amazonica?", ["Brasil", "Peru", "Colombia", "Bolivia"], 0, .dificil)
        ],
        .matematica: [
            makePergunta("Quanto e 7 x 8?", ["56", "54", "48", "64"], 0, .facil),
            makePergunta("A raiz quadrada de 81 e:", ["9", "8", "7", "6"], 0, .facil),
            makePergunta("Qual fracao representa 50%?", ["1/2", "1/3", "2/3", "3/4"], 0, .facil),
            makePergunta("Quanto e 15 + 27?", ["42", "41", "43", "44"], 0, .medio),
            makePergunta("Qual e o resultado de 100 dividido por 4?", ["25", "20", "40", "10"], 0, .medio),
            makePergunta("Quanto e 12²?", ["144", "124", "132", "112"], 0, .medio),
            makePergunta("Resolva: 3x + 6 = 21. x = ?", ["5", "6", "7", "4"], 0, .dificil),
            makePergunta("Qual e o valor de pi aproximado em duas casas?", ["3,14", "2,17", "1,41", "4,13"], 0, .dificil)
        ]
    ]
}
