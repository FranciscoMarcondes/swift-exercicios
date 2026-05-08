//
//  Product.swift
//  ShoppingMVVM
//
//  Created by Francisco Marcondes da Silva Junior on 07/05/26.
//

import Foundation

// Minhas categorias
enum ProductCategory: String, CaseIterable, Identifiable {
    
    case electronics = "Eletrônicos"
    case clothing = "Roupas"
    case home = "casa"
    var id: String { rawValue }
}

// Entidade principal de produto que vem da camada de dados.
struct Product: Identifiable, Hashable {
    let id: UUID               // ID unico para cada produto.
    let name: String           // Nome exibido na tela.
    let price: Decimal         // Preco com precisao monetaria.
    let category: ProductCategory // Secao do produto.
}
