//
//  Categoria.swift
//  GestorDespesas
//
//  Created by Francisco Marcondes da Silva Junior on 15/05/26.
//

import SwiftUI

enum Categoria: String, CaseIterable, Identifiable {
   
    // rawValue é o texto salvo no Core Data (String)
        case energia      = "Energia"
        case internet     = "Internet"
        case agua         = "Água"
        case assinaturas  = "Assinaturas"
        case aluguel      = "Aluguel"
        case mercado      = "Mercado"
        case cursos       = "Cursos"
        case lazer        = "Lazer"
        
        // aqui eu faço o meu valor ser o meu ID
        var id: String { rawValue }
        
        // Ícone visual para cada categoria (aparece na lista)
        var icone: String {
            switch self {
            case .energia:     return "bolt.fill"
            case .internet:    return "wifi"
            case .agua:        return "drop.fill"
            case .assinaturas: return "play.rectangle.fill"
            case .aluguel:     return "house.fill"
            case .mercado:     return "cart.fill"
            case .cursos:      return "book.fill"
            case .lazer:       return "gamecontroller.fill"
            }
        }
        
        // Cor associada a cada categoria (para deixar o app mais visual)
        var cor: Color {
            switch self {
            case .energia:     return .yellow
            case .internet:    return .blue
            case .agua:        return .cyan
            case .assinaturas: return .purple
            case .aluguel:     return .orange
            case .mercado:     return .green
            case .cursos:      return .indigo
            case .lazer:       return .pink
            }
        }
}
